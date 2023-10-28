;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname ex181) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define list1-a (cons "a" (cons "b" (cons "c" (cons "d" '())))))
(define list1-b (list "a" "b" "c" "d"))
(check-expect list1-a list1-b)

(define list2-a (cons (cons 1 (cons 2 '())) '()))
(define list2-b (list (list 1 2)))
(check-expect list2-a list2-b)

(define list3-a (cons "a"
                      (cons
                       (cons 1 '())
                       (cons #false '()))))
(define list3-b (list "a" (list 1) #false))
(check-expect list3-a list3-b)

;(cons (cons "a" (cons 2 '())) (cons "hello" '()))
;(list (list "a" 2) (list "hello")`π)