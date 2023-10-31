;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex354) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define-struct add [left right])
; An add is a structure
; (make-add Number Number)

(define-struct mul [left right])
; An mul is a structure
; (make-mul Number Number)

; BSL-var-expr -> boolean
; determine whether a BSL-var-expr is also a BSL-expr
(check-expect (numeric? 100) #true)
(check-expect (numeric? 'x) #false)
(check-expect (numeric? (make-add 5 3)) #true)
(check-expect (numeric? (make-add 'x 3)) #false)
(check-expect (numeric? (make-mul 1/2 (make-mul 5 3))) #true)
(check-expect (numeric? (make-mul 1/2 (make-mul 'x 3))) #false)
(check-expect (numeric? (make-add (make-mul 1 2) (make-add 10 2))) #true)
(check-expect (numeric? (make-add (make-mul 'x 'x) (make-add 'y 'y))) #false)

(define ERROR-NOT-NUMERIC "cannot eval to numeric")
(define (numeric? expr)
  (cond 
    [(number? expr) #true]
    [(symbol? expr) #false]
    [(add? expr) (and (numeric? (add-left expr))
                      (numeric? (add-right expr)))]
    [(mul? expr) (and (numeric? (mul-left expr))
                      (numeric? (mul-right expr)))]))

(define (eval-variable expr)
  (if (numeric? expr)
      #true
      (error ERROR-NOT-NUMERIC)))

(check-error (eval-variable 'x) ERROR-NOT-NUMERIC)

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

; BSL-expr -> Number
; evaluate a representation of a BSL expression
(check-expect (eval-expression 3) 3)
(check-expect (eval-expression (make-add 1 1)) 2)
(check-expect (eval-expression (make-mul 3 10)) 30)
(check-expect (eval-expression (make-add (make-mul 1 1) 10)) 11)
(define (eval-expression expr)
  (cond
    [(number? expr) expr]
    [(add? expr) (+ (eval-expression (add-left expr))
                    (eval-expression (add-right expr)))]
    [else (* (eval-expression (mul-left expr))
             (eval-expression (mul-right expr)))]))

; An AL (short for association list) is [List-of Association].
; An Association is a list of two items:
;   (cons Symbol (cons Number '())).

; BSL-var-expr, AL -> Number || Error
(define symbol-map (list 'x 10))
(check-expect (eval-variable* 100 symbol-map) 100)
(check-expect (eval-variable* (make-add 'x 20) symbol-map) 30)
(check-expect (eval-variable* (make-mul 'x 20) symbol-map) 200)
(check-expect (eval-variable* (make-mul 'x (make-add 'x 10)) symbol-map) 200)
(check-expect (eval-variable* (make-add 'x (make-mul 'x 10)) symbol-map) 110)
(check-error (eval-variable* (make-add 'y (make-mul 'x 10)) symbol-map) ERROR-NOT-NUMERIC)
(define (eval-variable* ex da)
  (local ((define expr (subst ex (first da) (second da))))
    (cond
      [(numeric? expr) (eval-expression expr)]
      [else (error ERROR-NOT-NUMERIC)])))