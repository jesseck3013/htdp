;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex250) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; [Number -> Number], Number -> [List-of Number]
; tabulates fn between n and 0 in a list
(define (tabulate fn n)
  (cond
    [(= n 0) (list (fn 0))]
    [else
     (cons
      (fn n)
      (tabulate fn (sub1 n)))]))

(define (tab-sqr n)
  (tabulate sqr n))

(define (tab-tan n)
  (tabulate tan n))