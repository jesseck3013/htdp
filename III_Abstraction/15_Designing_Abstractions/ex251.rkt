;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex251) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; [Number -> Number], List-of-Number, init -> Number
(define (fold1 fn l init)
  (cond
    [(empty? l) init]
    [else
     (fn (first l) (fold1 fn (rest l) init))]))

(check-expect (fold1 + (list 1 2 3) 0) 6)
(check-expect (fold1 + '() 0) 0)