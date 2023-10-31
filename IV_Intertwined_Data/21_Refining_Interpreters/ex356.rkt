;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex356) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define-struct add [left right])
; An add is a structure
; (make-add Number Number)

(define-struct mul [left right])
; An mul is a structure
; (make-mul Number Number)

(define-struct fun [name expr])
; An fun is a structure
; (make-fun symbol BSL-fun-expr)

; A BSL-fun-expr is one of: 
; – Number
; – Symbol
; – (make-add BSL-fun-expr BSL-fun-expr)
; – (make-mul BSL-fun-expr BSL-fun-expr)
; - (make-fun Symbol BSL-fun-expr)

;(k (+ 1 1))
;(make-fun 'k (make-add 1 1))

;(* 5 (k (+ 1 1)))
;(make-mul 5 (make-fun 'k (make-add 1 1)))

(* (i 5) (k (+ 1 1)))
(make-mul (make-fun 'i 5) (make-fun 'k (make-add 1 1)))
