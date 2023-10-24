;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex146) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;; NEList-of-temperatures -> NUmber
;; count elemnts in NEList-of-temperatures
(check-expect (how-many (cons 10
                              (cons 20 '()))) 2)
(check-expect (how-many (cons 10 '()))
                               1)
(define (how-many ne-l)
  (cond
    [(empty? (rest ne-l)) 1]
    [else
     (+ 1 (how-many (rest ne-l)))]))