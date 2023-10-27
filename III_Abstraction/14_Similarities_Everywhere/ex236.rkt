;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex236) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Lon -> Lon
; adds 1 to each item on l
(check-expect (add1* '()) '())
(check-expect (add1* (list 1 2 3)) (list 2 3 4))
(define (add1* l)
  (cond
    [(empty? l) '()]
    [else
     (cons
       (add1 (first l))
       (add1* (rest l)))]))

; Lon -> Lon
; adds 5 to each item on l
(check-expect (plus5 '()) '())
(check-expect (plus5 (list 1 2 3)) (list 6 7 8))
(define (plus5 l)
  (cond
    [(empty? l) '()]
    [else
     (cons
       (+ (first l) 5)
       (plus5 (rest l)))]))

; function, list -> list
; apply function on each element and produce a new list
(define (my-apply fn l)
  (cond
    [(empty? l) '()]
    [else
     (cons
      (fn (first l))
      (my-apply fn (rest l)))]))

; list -> list
; adds 1 to each item on l
(check-expect (my-add1 '()) '())
(check-expect (my-add1 (list 1 2 3)) (list 2 3 4))
(define (my-add1 l)
  (my-apply add1 l))

; list -> list
; adds 5 to each item on l
(check-expect (my-plus5 '()) '())
(check-expect (my-plus5 (list 1 2 3)) (list 6 7 8))
(define (p5 x)
  (+ x 5))
(define (my-plus5 l)
  (my-apply p5 l))

; list -> list
; subtrack 2 to each item on l
(check-expect (my-sub2 '()) '())
(check-expect (my-sub2 (list 1 2 3)) (list -1 0 1))
(define (sub2 x)
  (- x 2))
(define (my-sub2 l)
  (my-apply sub2 l))