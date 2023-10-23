;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex36) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define 10sq (square 10 "solid" "red"))
(define 25sq (square 25 "solid" "red"))
; image -> number
; compute the pixel of a given image
; given 10sq, expect 100
; given 25sq, expect 625
(define (image-area image)
  (* (image-width image)
     (image-height image)))

(image-area 10sq)
(image-area 25sq)
