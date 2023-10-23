;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex134) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; a list of string -> Boolean
; determine whether str is in str-list
(check-expect (contains? "x" '()) #false)
(check-expect (contains? "x" (cons "x" '())) #true)
(check-expect (contains? "x" (cons "y" '())) #false)
(check-expect (contains? "x" (cons "y" (cons "z" '()))) #false)
(check-expect (contains? "x" (cons "y" (cons "x" '()))) #true)

(define (contains? str str-list)
  (cond
    [(empty? str-list) #false]
    [(string=? (first str-list) str) #true]
    [else (contains? str (rest str-list))]))