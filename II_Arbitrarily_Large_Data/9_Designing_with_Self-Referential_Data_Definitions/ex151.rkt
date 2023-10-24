;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex151) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Number, Number -> Number
; return n*x
(check-expect (multiply 3 4) 12)
(check-expect (multiply 1 4) 4)
(check-expect (multiply 0 4) 0)
(define (multiply n x)
  (cond
    [(zero? n) 0]
    [else (+ x (multiply (sub1 n) x))]))