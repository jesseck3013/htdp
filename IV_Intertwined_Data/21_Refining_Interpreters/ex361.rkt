;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex361) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define-struct add [left right])
; An add is a structure
; (make-add Number Number)

(define-struct mul [left right])
; An mul is a structure
; (make-mul Number Number)

(define-struct fun [name expr])
; An fun is a structure
; (make-fun symbol BSL-fun-expr)

(define-struct constant [name])
; An constant is a structure
; (make-constant symbol)

(define-struct BSL-fun-def [name arg body])
; BSL-fun-def is a structure
; (make-BSL-fun-def Symbol Symbol BSL-var-expr)

(define-struct BSL-constant-def [name value])
; BSL-constant-def is a structure
; (make-BSL-constant-def Symbol Number)

; BSL-da is one of:
; - BSL-fun-def
; - BSL-constant-def

; BSL-da-all is [list-of BSL-da]

(define ERROR-NOT-FOUND "definition not found")

(define constant-def-1 (make-BSL-constant-def 'close-to-pi 3.14))
(define function-def-1 (make-BSL-fun-def 'area-of-circle
                                         'r
                                         (make-mul (make-constant 'close-to-pi)
                                                   (make-mul 'r 'r))))
(define function-def-2 (make-BSL-fun-def 'volume-of-10-cylinder 'r (make-mul 10 (make-fun 'area-of-circle 'r))))

;; definition area
(define da (list constant-def-1 function-def-1 function-def-2))

; BSL-da-all Symbol -> BSL-constant-def
(check-expect (lookup-con-def da 'close-to-pi) constant-def-1)
(check-error (lookup-con-def da 'inexist) ERROR-NOT-FOUND)
(define (lookup-con-def da-all x)  
  (cond
    [(empty? da-all) (error ERROR-NOT-FOUND)]
    [(and (BSL-constant-def? (first da-all))
          (symbol=? (BSL-constant-def-name (first da-all)) x))
     (first da-all)]
    [else (lookup-con-def (rest da-all) x)]))

; BSL-da-all Symbol -> BSL-constant-def
(check-expect (lookup-fun-def da 'area-of-circle) function-def-1)
(check-error (lookup-fun-def da 'inexist) ERROR-NOT-FOUND)
(define (lookup-fun-def da-all x)
  (cond
    [(empty? da-all) (error ERROR-NOT-FOUND)]
    [(and (BSL-fun-def? (first da-all))
          (symbol=? (BSL-fun-def-name (first da-all)) x))
     (first da-all)]
    [else (lookup-fun-def (rest da-all) x)]))

; BSL-var-expr, Symbol, Number -> BSL-var-expr
(check-expect (subst 1 'x 10) 1)
(check-expect (subst 'x 'x 10) 10)
(check-expect (subst 'y 'x 10) 'y)
(check-expect (subst (make-add 10 'x) 'x 10) (make-add 10 10))
(check-expect (subst (make-mul 'x 10) 'x 20) (make-mul 20 10))
(check-expect (subst (BSL-fun-def-body function-def-1) (BSL-fun-def-arg function-def-1) 20)
              (make-mul (make-constant 'close-to-pi) (make-mul 20 20)))
(define (subst ex x v)
  (cond
    [(number? ex) ex]
    [(symbol? ex) (if (symbol=? ex x)
                      v
                      ex)]
    [(add? ex) (make-add (subst (add-left ex) x v)
                  (subst (add-right ex) x v))]
    [(mul? ex) (make-mul (subst (mul-left ex) x v)
                  (subst (mul-right ex) x v))]
    [(fun? ex) (make-fun (fun-name ex) (subst (fun-expr ex) x v))]
    [(constant? ex) (make-constant (subst (constant-name ex) x v))]))

; BSL-expr , BSL-da-all -> Number
(check-error (eval-all 'x da) ERROR-NOT-FOUND)
(check-expect (eval-all 100 da) 100)
(check-expect (eval-all (make-add 10 10) da) 20)
(check-expect (eval-all (make-mul 10 10) da) 100)
(check-expect (eval-all (make-mul 3 'close-to-pi) da) 9.42)
(check-expect (eval-all (make-fun 'area-of-circle 10) da) 314)
(check-expect (eval-all (make-mul 10 (make-fun 'area-of-circle 10)) da) 3140)
(check-expect (eval-all (make-fun 'volume-of-10-cylinder 1) da) 31.4)

(define (eval-all ex da)
  (cond
    [(number? ex) ex]
    [(symbol? ex) (eval-all (BSL-constant-def-value (lookup-con-def da ex)) da)]
    [(add? ex) (+ (eval-all (add-left ex) da)
                  (eval-all (add-right ex) da))]
    [(mul? ex) (* (eval-all (mul-left ex) da)
                  (eval-all (mul-right ex) da))]
    [(constant? ex) (eval-all (BSL-constant-def-value (lookup-con-def da (constant-name ex))) da)]
    [(fun? ex) 
     (local ((define function-def (lookup-fun-def da (fun-name ex)))
             (define function-name (BSL-fun-def-name function-def))
             (define function-arg (BSL-fun-def-arg function-def))
             (define function-body (BSL-fun-def-body function-def))
             (define input-value (eval-all (fun-expr ex) da)))
       (eval-all (subst function-body function-arg input-value) da))]))