;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex147) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; NEList-of-Booleans is one of
; - (cons Boolean '())
; - (cons Boolean NEList-of-Booleans)

; NEList-of-Booleans -> Boolean
; return #ture if all element is true
(check-expect (all-true (cons #true '())) #true)
(check-expect (all-true (cons #true
                              (cons #true '()))) #true)
(check-expect (all-true (cons #true
                              (cons #false '()))) #false)
(define (all-true ne-b)
  (cond
    [(empty? (rest ne-b)) (first ne-b)]
    [else (and (first ne-b) (all-true (rest ne-b)))]))


; NEList-of-Booleans -> Boolean
; return #true if at least one element is #true
(check-expect (one-true (cons #true '())) #true)
(check-expect (one-true (cons #false
                              (cons #false '()))) #false)
(check-expect (one-true (cons #true
                              (cons #false '()))) #true)
(define (one-true ne-b)
  (cond
    [(empty? (rest ne-b)) (first ne-b)]
    [else (or (first ne-b) (one-true (rest ne-b)))]))