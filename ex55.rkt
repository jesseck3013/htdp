;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex55) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define HEIGHT 300) ; distances in pixels 
(define WIDTH  100)
(define YDELTA 3)
 
(define BACKG  (empty-scene WIDTH HEIGHT))
(define ROCKET (rectangle 5 30 "solid" "red"))
 
(define CENTER (/ (image-height ROCKET) 2))

; height -> image
; place ROCKET at height
(define (place-rocket-at height)
  (place-image ROCKET 10 (- height CENTER) BACKG))

; Using a helper function is a good idea
; because it reduces duplicate code, which makes
; the code more readable and provide us with a
; single point of control.
(define (show x)
  (cond
    [(string? x)
     (place-rocket-at HEIGHT)]
    [(<= -3 x -1)
     (place-image (text (number->string x) 20 "red")
                  10 (* 3/4 WIDTH)
                  (place-rocket-at HEIGHT))]
    [(>= x 0)
     (place-rocket-at x)]))

(show "resting")
(show -2)
(show 100)
