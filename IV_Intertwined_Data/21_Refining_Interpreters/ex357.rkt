;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex357) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define-struct add [left right])
; An add is a structure
; (make-add Number Number)

(define-struct mul [left right])
; An mul is a structure
; (make-mul Number Number)

(define-struct fun [name arg])
; An fun is a structure
; (make-fun symbol BSL-fun-expr)

; A BSL-fun-expr is one of: 
; – Number
; – Symbol
; – (make-add BSL-fun-expr BSL-fun-expr)
; – (make-mul BSL-fun-expr BSL-fun-expr)
; - (make-fun Symbol BSL-fun-expr)

;(k (+ 1 1))
;(make-fun 'k (make-add 1 1))

;(* 5 (k (+ 1 1)))
;(make-mul 5 (make-fun 'k (make-add 1 1)))

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
                  (subst (mul-right ex) x v))]))

(define ERROR-NOT-NUMERIC "cannot eval to numeric")

; BSL-fun-expr, Symbol, Symbol, BSL-fun-expr -> Number
(check-expect
 (eval-definition1
  (make-fun 'sq 3)
  'sq
  'x
  (make-mul 'x 'x))
 9)

(check-expect
 (eval-definition1
  (make-fun 'add-10 3)
  'add-10
  'x
  (make-add 'x '10))
 13)

(check-error
 (eval-definition1
  (make-fun 'add-10 'x)
  'add-10
  'x
  (make-add 'x '10))
 ERROR-NOT-NUMERIC)

(define (eval-definition1 ex f x b)
  (cond
    [(number? ex) ex]
    [(symbol? ex) (error ERROR-NOT-NUMERIC)]
    [(add? ex) (+ (eval-definition1 (add-left ex) f x b)
                  (eval-definition1 (add-right ex) f x b))]
    [(mul? ex) (* (eval-definition1 (mul-left ex) f x b)
                  (eval-definition1 (mul-right ex) f x b))]
    [(fun? ex) (if (symbol=? (fun-name ex) f)
                   (eval-definition1 (subst b x
                                             (eval-definition1 (fun-arg ex) f x b))
                                     f x b)
                   (error ERROR-NOT-NUMERIC))]))