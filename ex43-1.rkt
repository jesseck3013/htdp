;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex43-1) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
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

; number -> number
; convert ellapsed time to distance the car has moved
; given: 1, expect 3
; given: 2, expect 6
(define (ellapse-time-to-distance time)
  (* time 3))

; WorldState -> Image
; place the car into the BACKGROUND scene
; according to the given world state
(define (render ellapse)
  (place-image CAR
               (ellapse-time-to-distance ellapse)
               Y-CAR
               BACKGROUND))

; WorldState -> WorldState
; state change is equal to one clock tict
(define (tock ellapse)
  (+ ellapse 1))

;; number -> boolean
;; stop program when car has run into the right border
(define (stop? ellapse)
  (>= (ellapse-time-to-distance ellapse) (+ BACKGROUND-WIDTH
               (image-width CAR))))

; main function
(define (main ws)
  (big-bang ws
    [on-tick tock]
    [to-draw render]
    [stop-when stop?]))

(main 0)