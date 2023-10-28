;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname ex167) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; list of Posns -> number
(define p1 (make-posn 3 4))
(define p2 (make-posn 4 5))
(check-expect (sum (list p1 p2)) 7)
(define (sum l)
  (cond
    [(empty? (rest l)) (posn-x (first l))]
    [else (+
           (posn-x (first l))
           (sum (rest l)))]))s