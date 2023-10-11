;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex64) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; the distance of two strategies is the same

; posn -> number
; compute the manhattan distance of a
; given posn to the origin
(check-expect (manhattan-distance  (make-posn 0 3)) 3)
(check-expect (manhattan-distance  (make-posn 4 0)) 4)
(check-expect (manhattan-distance  (make-posn 3 5)) 8)
(check-expect (manhattan-distance  (make-posn 0 0)) 0)
(define (manhattan-distance posn)
  (+ (posn-x posn)
     (posn-y posn)))