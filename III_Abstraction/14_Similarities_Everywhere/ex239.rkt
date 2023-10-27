;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex239) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; A [List X Y] is a list: 
;   (cons X (cons Y '()))

; A pair of Numbers is 
; - [List Number Number]
(cons 1
      (cons 2 '()))

; A pair of Number and 1String is 
; - [List Number 1String]
(cons 1
      (cons "a" '()))


; A pair of String and Boolean is 
; - [List String Boolean]
(cons "hello"
      (cons #true '()))
