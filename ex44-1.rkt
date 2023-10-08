;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex44-1) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;; tree scene
(define tree
  (underlay/xy (circle 10 "solid" "green")
               9 15
               (rectangle 2 20 "solid" "brown")))

(define BACKGROUND-WIDTH 500)
(define BACKGROUND-HEIGHT 100)
(define BACKGROUND
  (overlay/offset tree
                  0 -30
  (empty-scene BACKGROUND-WIDTH BACKGROUND-HEIGHT)))

(define WIDTH-OF-WORLD 200)
(define WHEEL-RADIUS 5)
(define WHEEL-DISTANCE (* WHEEL-RADIUS 5))

; draw the upper part of a car
(define CAR-TOP
  (rectangle
   (* WHEEL-RADIUS 5)
   (* WHEEL-RADIUS 2)
   "solid" "red"))

; draw the bottom part of a car
(define CAR-BOTTOM
  (rectangle
   (* WHEEL-RADIUS 15)
   (* WHEEL-RADIUS 3)
   "solid" "red"))

; draw a wheel
(define WHEEL
  (circle WHEEL-RADIUS "solid" "black"))

; draw two wheels horizotally
(define TWO-WHEELS
  (overlay/offset
   WHEEL
   WHEEL-DISTANCE
   0
   WHEEL))

; combine every component to draw a car
(define CAR
  (above
   CAR-TOP
   CAR-BOTTOM
   TWO-WHEELS))

; car's vertical position
(define Y-CAR (- 100
                 (* WHEEL-RADIUS 4)))

; WorldState -> Image
; place the car into the BACKGROUND scene
; according to the given world state
(define (render x)
  (place-image CAR x Y-CAR BACKGROUND))

; WorldState -> WorldState
; moves the car by 3 pixels for every clock tick
(define (tock ws)
  (+ ws 3))

;; number -> boolean
;; stop program when car has run into the right border
(define (stop? state)
  (>= state (+ BACKGROUND-WIDTH
               (image-width CAR))))

; WorldState Number Number String -> WorldState
; places the car at x-mouse
; if the given me is "button-down"
(define (hyper x-position-of-car x-mouse y-mouse me)
  x-position-of-car)

(check-expect (hyper 21 10 20 "enter") 21)
(check-expect (hyper 42 10 20 "button-down") 10)
(check-expect (hyper 42 10 20 "move") 42)

; main function
(define (main ws)
  (big-bang ws
    [on-tick tock]
    [on-mouse hyper]
    [to-draw render]
    [stop-when stop?]))

;(main 0)