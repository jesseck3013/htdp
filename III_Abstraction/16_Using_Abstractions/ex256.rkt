;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex256) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; [X] [X -> Number] [NEList-of X] -> X 
; finds the (first) item in lx that maximizes f
; if (argmax f (list x-1 ... x-n)) == x-i, 
; then (>= (f x-i) (f x-1)), (>= (f x-i) (f x-2)), ...
(define (argmax f lx) ...)

;; example

(argmax (add1 (list 2 7 0 1)) 7)


; [X] [X -> Number] [NEList-of X] -> X 
; finds the (first) item in lx that minimize f
; if (argmin f (list x-1 ... x-n)) == x-i, 
; then (<= (f x-i) (f x-1)), (<= (f x-i) (f x-2)), ...
(define (argmin f lx) ...)

;; example
(argmax (sub1 (list 2 7 0 1)) 0)