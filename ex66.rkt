;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex66) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; constructor: make-movie
; selector:
; - movie-title
; - movie-producer
; - movie-year
; predicate: movie?
; value types: String, String, number
(make-movie ("A Movie" "Movie Producer" 2023))
(define-struct movie [title producer year])

; constructor: make-person
; selector:
; - person-name
; - person-hair
; - person-eyes
; - person-phone
; predicate: person?
; value types: String, String, String, Number
(make-person "Bob" "Black" "Black" "111")
(define-struct person [name hair eyes phone])

; constructor: make-pet
; selector:
; - pet-name
; - pet-number
; predicate: pet?
; value types: String, Number
(make-pet "Candy" "1")
(define-struct pet [name number])

; constructor: make-CD
; selector:
; - CD-artist
; - CD-title
; - CD-price
; predicate: CD?
; value types: String, String, Number
(make-CD "Someone who sings" "Good Music" 100)
(define-struct CD [artist title price])

; constructor: make-sweater
; selector:
; - sweater-material
; - sweater-size
; - sweater-producer
; predicate: sweater?
; value types: String, String, String
(make-sweater "cotton" "L" "Nike")
(define-struct sweater [material size producer])