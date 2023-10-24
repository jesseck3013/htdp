;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex145) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;; NEList-of-temperatures -> Boolean
;; return #true if the temperatures are sorted in descending order
;; otherwise #false
(check-expect (sorted? (cons
                        10
                        (cons 20 '()))) #false)
(check-expect (sorted? (cons
                        20
                        (cons 10 '()))) #true)
(define (sorted? ne-l)
  (cond
    [(empty? (rest ne-l)) (first ne-l)]
    [else
     (>= (first ne-l)
         (sorted? (rest ne-l)))]))