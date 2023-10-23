;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex97) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; A UFO is a Posn. 
; interpretation (make-posn x y) is the UFO's location 
; (using the top-down, left-to-right convention)
 
(define-struct tank [loc vel])
; A Tank is a structure:
;   (make-tank Number Number). 
; interpretation (make-tank x dx) specifies the position:
; (x, HEIGHT) and the tank's speed: dx pixels/tick 
 
; A Missile is a Posn. 
; interpretation (make-posn x y) is the missile's place

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

; Tank Image -> Image 
; adds t to the given image im
(define (tank-render t im)
  (overlay/xy
   TANK
   (- (/ (image-width TANK) 2) (tank-loc t)) ;; x position
   (- (/ (image-height TANK) 2) HEIGHT) ;; y position
   im))
 
; UFO Image -> Image 
; adds u to the given image im
(define (ufo-render u im)  
  (overlay/xy
   UFO
   (- (/ (image-width UFO) 2) (posn-x u)) ;; x position
   (- (/ (image-height UFO) 2) (posn-y u)) ;; y position
   im))

; Missile Image -> Image 
; adds m to the given image im
(define (missile-render m im)
   (overlay/xy
   UFO
   (- (/ (image-width MISSILE) 2) (posn-x m)) ;; x position
   (- (/ (image-height MISSILE) 2) (posn-y m)) ;; y position
   im))

;; they are always the same