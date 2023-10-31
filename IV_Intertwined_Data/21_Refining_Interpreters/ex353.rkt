;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex353) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
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

(define (numeric? expr)
  (cond 
    [(number? expr) #true]
    [(symbol? expr) #false]
    [(add? expr) (and (numeric? (add-left expr))
                      (numeric? (add-right expr)))]
    [(mul? expr) (and (numeric? (mul-left expr))
                      (numeric? (mul-right expr)))]))