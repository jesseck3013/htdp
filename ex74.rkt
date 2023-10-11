;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex74) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define MTS (empty-scene 100 100))
(define DOT (circle 3 "solid" "red"))

; Posn -> Image
; adds a red spot to MTS at p
(check-expect (scene+dot (make-posn 10 20))
              (place-image DOT 10 20 MTS))
(check-expect (scene+dot (make-posn 88 73))
              (place-image DOT 88 73 MTS))

(define (scene+dot p)
  (place-image DOT (posn-x p) (posn-y p) MTS))

; Posn, Number -> Posn
; consumes a Posn p and a Number n.
; produces a new Posn which has the same posn-y as p
; and the posn-x with value n.
(check-expect (posn-up-x (make-posn 3 4) 10) (make-posn 10 4))
(define (posn-up-x p n)
  (make-posn n (posn-y p)))

; Posn -> Posn
; increases the x-coordinate of p by 3
(check-expect (x+ (make-posn 3 4)) (make-posn 6 4))
(define (x+ p)
  (posn-up-x p (+ (posn-x p) 3)))

; Posn Number Number MouseEvt -> Posn 
; for mouse clicks, (make-posn x y); otherwise p
(check-expect (reset-dot (make-posn 3 4) 5 6 "button-down") (make-posn 5 6))
(check-expect (reset-dot (make-posn 3 4) 5 6 "button-up") (make-posn 3 4))
(define (reset-dot p x y me)
  (cond
    [(mouse=? "button-down" me) (make-posn x y)]
    [else p]))
 
; A Posn represents the state of the world.
 
; Posn -> Posn 
(define (main p0)
  (big-bang p0
    [on-tick x+]
    [on-mouse reset-dot]
    [to-draw scene+dot]))

(main (make-posn 0 0))