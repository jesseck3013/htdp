;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex94) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;; tank speed

;; ufo velocity

;; missile speed
;;Here are some details concerning the three game objects and their movements. First, the tank moves a constant speed along the bottom of the canvas, though the player may use the left arrow key and the right arrow key to change directions. Second, the UFO descends at a constant velocity but makes small random jumps to the left or right. Third, once fired, the missile ascends along a straight vertical line at a constant speed at least twice as fast as the UFO descends. Finally, the UFO and the missile collide if their reference points are close enough, for whatever you think “close enough” means.


;; background
(define BACKGROUND-WIDTH 200)
(define BACKGROUND-HEIGHT 250)
(define BACKGROUND
  (empty-scene 200 250))

;; tank
(define TANK-UPPER-WIDTH 10)
(define TANK-UPPER-HEIGHT 8)
(define TANK-BOTTOM-WIDTH 25)
(define TANK-BOTTOM-HEIGHT 10)
(define TANK (above
              (rectangle TANK-UPPER-WIDTH TANK-UPPER-HEIGHT "solid" "red")
              (rectangle TANK-BOTTOM-WIDTH TANK-BOTTOM-HEIGHT "solid" "red")))

;; ufo
(define UFO (ellipse 35 20 "solid" "purple"))

;; initial state
(overlay/xy
 UFO
 0 0
 (overlay/xy
 TANK
 (+ (image-width TANK)  (- (image-width TANK)))
 -230
 BACKGROUND))

;; UFO descends state
(overlay/xy
 UFO
 -10 -100
 (overlay/xy
 TANK
 (+ (image-width TANK)  (- BACKGROUND-WIDTH))
 -230
 BACKGROUND))

;; TANK moves
(overlay/xy
 UFO
 -10 -100
 (overlay/xy
 TANK
 (+ (image-width TANK)  (+ (- BACKGROUND-WIDTH) 50))
 -230
 BACKGROUND))
