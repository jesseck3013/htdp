;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex359) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define-struct add [left right])
; An add is a structure
; (make-add Number Number)

(define-struct mul [left right])
; An mul is a structure
; (make-mul Number Number)

(define-struct fun [name expr])
; An fun is a structure
; (make-fun symbol BSL-fun-expr)

(define-struct BSL-fun-def [name arg body])
; BSL-fun-def is a structure
; (make-BSL-fun-def Symbol Symbol BSL-var-expr)

; (define (f x) (+ 3 x))
(define f (make-BSL-fun-def 'f 'x (make-add 3 'x)))

; (define (g y) (f (* 2 y)))
(define g (make-BSL-fun-def 'g 'y
                            (make-fun 'f (make-mul 2 'y))))

; (define (h v) (+ (f v) (g v)))
(define h (make-BSL-fun-def 'h 'v
                            (make-add (make-fun 'f 'v)
                                      (make-fun 'g 'v))))

; BSL-fun-def* is one of:
; - Number
; - (cons Number (cons BSL-fun-def '())

(define da-fgh (list f g h))

; BSL-fun-def* Symbol -> BSL-fun-def
; retrieves the definition of f in da
; signals an error if there is none
(define ERROR-NOT-FOUND "definition not found")
(check-expect (lookup-def da-fgh 'g) g)
(check-error (lookup-def da-fgh 'z) ERROR-NOT-FOUND)
(define (lookup-def da f)
  (cond
    [(empty? da) (error ERROR-NOT-FOUND)]
    [(symbol=? (BSL-fun-def-name (first da)) f) (first da)]
    [else (lookup-def (rest da) f)]))

; BSL-var-expr, Symbol, Number -> BSL-var-expr
(check-expect (subst 1 'x 10) 1)
(check-expect (subst 'x 'x 10) 10)
(check-expect (subst 'y 'x 10) 'y)
(check-expect (subst (make-add 10 'x) 'x 10) (make-add 10 10))
(check-expect (subst (make-mul 'x 10) 'x 20) (make-mul 20 10))
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
    [(fun? ex) (make-fun (fun-name ex) (subst (fun-expr ex) x v))]))

; BSL-fun-expr BSL-fun-def* -> Number
; given data definition da, evaluate ex
; if encounter a variable, or function name without definition
; , signal error
(define ERROR-VARIABLE "cannot eval variable")
(check-expect (eval-function* (make-fun 'f 10) da-fgh) 13)
(check-expect (eval-function* (make-fun 'g 10) da-fgh) 23)
(check-expect (eval-function* (make-fun 'h 10) da-fgh) 36)
(check-error (eval-function* (make-add 'h 10) da-fgh) ERROR-VARIABLE)

(define (eval-function* ex da)
   (cond
    [(number? ex) ex]
    [(symbol? ex) (error ERROR-VARIABLE)]
    [(add? ex) (+ (eval-function* (add-left ex) da)
                  (eval-function* (add-right ex) da))]
    [(mul? ex) (* (eval-function* (mul-left ex) da)
                  (eval-function* (mul-right ex) da))]
    [(fun? ex)
     (local ((define function-def (lookup-def da (fun-name ex)))
             (define function-name (BSL-fun-def-name function-def))
             (define function-arg (BSL-fun-def-arg function-def))
             (define function-body (BSL-fun-def-body function-def))
             (define input-value (eval-function* (fun-expr ex) da)))
       (eval-function* (subst function-body function-arg input-value) da))]))