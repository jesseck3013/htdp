;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex81) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Time is a structure
; (make-time Number Number Number)
(define-struct time [hours minutes seconds])

(define SECOND 1)
; 1 minute in seconds
(define MINUTE (* SECOND 60))
; 1 hour in second
(define HOUR (* MINUTE 60))

; Time -> Number
; given current time, computes the number of seconds ellapsed
; since midnight
(check-expect (time->seconds (make-time 0 0 0)) 0)
(check-expect (time->seconds (make-time 0 0 10)) 10)
(check-expect (time->seconds (make-time 0 1 0)) 60)
(check-expect (time->seconds (make-time 1 0 0)) 3600)
(check-expect (time->seconds (make-time 1 1 1)) 3661)
(check-expect (time->seconds (make-time 12 30 2)) 45002)
(define (time->seconds t)
  (+ (* (time-hours t) HOUR)
     (* (time-minutes t) MINUTE)
     (time-seconds t)))