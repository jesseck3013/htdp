;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex62) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; A DoorState is one of:
; - LOCKED
; - CLOSED
; - OPEN

(define LOCKED "locked")
(define CLOSED "closed")
(define OPEN "open")

; DoorState -> DoorState
; close the door during one clock tick
(check-expect (door-closer OPEN) CLOSED)
(define (door-closer ds)
  (cond
    [(string=? LOCKED ds) LOCKED]
    [(string=? CLOSED ds) CLOSED]
    [(string=? OPEN ds) CLOSED]))

; DoorState -> DoorState
; change DoorState by keystroke
(check-expect (door-action LOCKED "u") CLOSED)
(check-expect (door-action LOCKED "l") LOCKED)
(check-expect (door-action LOCKED " ") LOCKED)

(check-expect (door-action CLOSED "l") LOCKED)
(check-expect (door-action CLOSED "u") CLOSED)
(check-expect (door-action CLOSED " ") OPEN)

(check-expect (door-action OPEN "l") OPEN)
(check-expect (door-action OPEN "u") OPEN)
(check-expect (door-action OPEN " ") OPEN)

(define (door-action ds ke)
  (cond
    [(and (string=? ds LOCKED) (string=? ke "u")) CLOSED]
    [(and (string=? ds CLOSED) (string=? ke "l")) LOCKED]
    [(and (string=? ds CLOSED) (string=? ke " ")) OPEN]
    [else ds]))

; DoorState -> Image
; translates the state s into a large text image
(check-expect (door-render CLOSED)
              (text CLOSED 40 "red"))
(define (door-render s)
  (text s 40 "red"))

(define OPEN-DURATION 3)

; DoorState -> DoorState
; simulates a door with an automatic door closer
(define (door-simulation initial-state)
  (big-bang initial-state
    [on-tick door-closer OPEN-DURATION]
    [on-key door-action]
    [to-draw door-render]))

(door-simulation LOCKED)