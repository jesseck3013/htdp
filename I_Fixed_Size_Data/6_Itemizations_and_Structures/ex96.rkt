;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |96|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;; background
(define WIDTH 200)
(define HEIGHT 200)
(define BACKGROUND (empty-scene WIDTH HEIGHT))

;; tank
(define TANK-UPPER-WIDTH 10)
(define TANK-UPPER-HEIGHT 8)
(define TANK-BOTTOM-WIDTH 25)
(define TANK-BOTTOM-HEIGHT 10)
(define TANK (above
              (rectangle TANK-UPPER-WIDTH TANK-UPPER-HEIGHT "solid" "red")
              (rectangle TANK-BOTTOM-WIDTH TANK-BOTTOM-HEIGHT "solid" "red")))

;; missile
(define MISSILE
  (rectangle 5 10 "solid" "black"))

;; ufo
(define UFO (ellipse 35 20 "solid" "purple"))

;; render SIGS as
;; (make-aim (make-posn 20 10) (make-tank 28 -3))
(overlay/xy
 UFO
 -20 -10
 (overlay/xy TANK -28 (- (image-height TANK) HEIGHT) BACKGROUND))

;; render SIGS as
;(make-fired (make-posn 20 10)
;            (make-tank 28 -3)
;            (make-posn 28 (- HEIGHT TANK-HEIGHT)))
(overlay/xy
 MISSILE
 -28 (- (image-height TANK) HEIGHT)
 (overlay/xy
 UFO
 -20 -10
 (overlay/xy TANK
             (- (/ (image-width TANK) 2) 28)
             (- (image-height TANK) HEIGHT)
             BACKGROUND)))

;; render SIGS as
;(make-fired (make-posn 20 100)
;            (make-tank 100 3)
;            (make-posn 22 103))
(overlay/xy
 MISSILE
 (- (/ (image-width MISSILE) 2) 28)
 (- (/ (image-height MISSILE) 2) 103)
 (overlay/xy
 UFO
 (- (/ (image-width UFO) 2) 20) (- (/ (image-height UFO) 2) 100)
 (overlay/xy TANK
             (- (/ (image-width TANK) 2) 100)
             (- (image-height TANK) HEIGHT)
             BACKGROUND)))
