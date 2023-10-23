;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex59) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; A TrafficLight is one of the following Strings:
; – "red"
; – "green"
; – "yellow"
; interpretation the three strings represent the three 
; possible states that a traffic light may assume 

; TrafficLight -> TraffictLight
; yields the next state, given current state cs
(check-expect (tl-next "red") "green")
(check-expect (tl-next "green") "yellow")
(check-expect (tl-next "yellow") "red")
(define (tl-next cs)
  (cond
    [(string=? cs "red") "green"]
    [(string=? cs "green") "yellow"]
    [(string=? cs "yellow") "red"]))

; String, String -> Image
; given color and shape, render a bulb
(check-expect (bulb-render "red" "solid") (circle 10 "solid" "red"))
(check-expect (bulb-render "red" "outline") (circle 10 "outline" "red"))
(check-expect (bulb-render "yellow" "outline") (circle 10 "outline" "yellow"))
(define (bulb-render color shape)
  (circle 10 shape color))

(define RED-ON (bulb-render "red" "solid"))
(define RED-OFF (bulb-render "red" "outline"))
(define GREEN-ON (bulb-render "green" "solid"))
(define GREEN-OFF (bulb-render "green" "outline"))
(define YELLOW-ON (bulb-render "yellow" "solid"))
(define YELLOW-OFF (bulb-render "yellow" "outline"))

; render 3 bulbs horizontally
(define (3bulbs-render l m r)
 (overlay/offset
  l
  40 0
  (overlay/offset
   m
   25  0
   r)))

; state -> Image
; based on current state, render 3 bulbs horizontally
(check-expect (3bulbs-state-render "red") (3bulbs-render RED-ON YELLOW-OFF GREEN-OFF))
(check-expect (3bulbs-state-render "green") (3bulbs-render RED-OFF YELLOW-OFF GREEN-ON))
(check-expect (3bulbs-state-render "yellow") (3bulbs-render RED-OFF YELLOW-ON GREEN-OFF))
(define (3bulbs-state-render s)
  (cond
    [(string=? s "red") (3bulbs-render RED-ON YELLOW-OFF GREEN-OFF)]
    [(string=? s "green") (3bulbs-render RED-OFF YELLOW-OFF GREEN-ON)]
    [(string=? s "yellow") (3bulbs-render RED-OFF YELLOW-ON GREEN-OFF)]))

(place-image
 (3bulbs-render RED-ON RED-ON RED-ON)
 45 15
 (empty-scene 90 30))

; TrafficLight -> Image
; renders the current state cs as an image
(define (tl-render current-state)
  (place-image
   (3bulbs-state-render current-state)
   45 15
   (empty-scene 90 30)
   ))

; TrafficLight -> TrafficLight
; simulates a clock-based American traffic light
(define (traffic-light-simulation initial-state)
  (big-bang initial-state
    [to-draw tl-render]
    [on-tick tl-next 1]))

(traffic-light-simulation "red")