;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex79) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; A Color is one of: 
; — "white"
; — "yellow"
; — "orange"
; — "green"
; — "red"
; — "blue"
; — "black"
 
(define WHITE "white")

; H is a Number between 0 and 100.
; interpretation represents a happiness value
(define happiness20 20)

(define-struct person [fstname lstname male?])
; A Person is a structure:
;   (make-person String String Boolean)
(define personA (make-person "fst" "lst" #true)) 
; predicate-like field name causes confusion
; replacing male? with gender is more clear in this case

(define-struct dog [owner name age happiness])
; A Dog is a structure:
;   (make-dog Person String PositiveInteger H)
; interpretation
; - owner: a person structure represents the owner of the dog
; - name: a string represents dog's name
; - age: a number represents the age of this dog
; - happiness: a nonnegative number that represents dog's happiness
(make-dog personA "Candy" 15 happiness20)

; A Weapon is one of: 
; — #false
; — Posn
; interpretation #false means the missile hasn't 
; been fired yet; a Posn means it is in flight
 