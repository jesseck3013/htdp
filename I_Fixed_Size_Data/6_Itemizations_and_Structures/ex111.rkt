;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex111) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Any -> Boolean
; return ture if n is a positive number
(check-expect (is-positive-number 10) #true)
(check-expect (is-positive-number -10) #false)
(check-expect (is-positive-number "e") #false)
(check-expect (is-positive-number #true) #false)
(define (is-positive-number n)
  (and (number? n) (> n 0)))

(define-struct vec [x y])
; A vec is
;   (make-vec PositiveNumber PositiveNumber)
; interpretation represents a velocity vector
(check-expect (checked-maked-vec 1 1) (make-vec 1 1))
(define (checked-maked-vec x y)
  (cond
    [(and
      (is-positive-number x)
      (is-positive-number y))
     (make-vec x y)]
    [else (error "arguments should be positive numbers")]))