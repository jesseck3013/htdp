;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex94) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;; tank speed

;; ufo velocity

;; missile speed

;; background
(define BACKGROUND-WIDTH 200)
(define BACKGROUND-HEIGHT 250)
(define BACKGROUND
  (empty-scene 200 250))

;; tank
(define TANK (above
              (rectangle 10 8 "solid" "red")
              (rectangle 30 10 "solid" "red")))

;; ufo
(define UFO (ellipse 60 30 "solid" "purple"))

;; initial state
(overlay/xy
 UFO
 0 0
 (overlay/xy
 TANK
 (+ (/(image-width TANK) 2) (- BACKGROUND-WIDTH)) -230
 BACKGROUND))

