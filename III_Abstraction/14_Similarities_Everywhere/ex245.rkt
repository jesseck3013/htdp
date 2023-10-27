;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex245) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define (function=at-1.2-3-and-5.775? func1 func2)
  (and
   (= (func1 1.2) (func2 1.2))
   (= (func1 3) (func2 3))
   (= (func1 -5.775) (func2 -5.775))))

;; no
;; for example if the inputs are real number,
;; then there are infinite number of inputs to test
