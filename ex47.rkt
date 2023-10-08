;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex47) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define MAX-HAPPINESS 100)
(define MIN-HAPPINESS 0)

; happiness is a number between 0 and 100 (inclusive)
(define (gauge-prog happiness)
  (big-bang happiness
    [on-tick tick-handler]
    [on-key key-handler]
    [to-draw render]))

; number -> number
; each clock tick, happiness - 1, hapiness always > 0
(define (tick-handler happiness)
  (cond
    [(> (- happiness 0.1) MIN-HAPPINESS) (- happiness 0.1)]
    [else happiness]))

(check-expect (tick-handler 1) 0.9)
(check-expect (tick-handler 0.1) 0.1)

; number->number
; increase happiness by x
; hapiness should be within the range of [0, 100]
(define (increase-happiness origin increment)
  (cond
    [(> (+ origin increment) MAX-HAPPINESS) MAX-HAPPINESS]
    [else (+ origin increment)]))

; number->number
; decrease happiness by x
; hapiness should be within the range of [0, 100]
(define (decrease-happiness origin decrement)
  (cond
    [(<= (- origin decrement) MIN-HAPPINESS) origin]
    [else (- origin decrement)]))

(check-expect (decrease-happiness 10 1) 9)
(check-expect (decrease-happiness 0.1 0.1) 0.1)

; number -> nubmer
; press the down arrow key, happiness decreases by 1/5

(define (key-handler happiness key)
  (cond    
    [(string=? key "down")
     (decrease-happiness
      happiness
      (* happiness (/ 1 5)))]
    [(string=? key "up") (increase-happiness
                          happiness
                          (* happiness (/ 1 3)))]
    [else happiness]))

(check-expect (key-handler 9 "up") 12)
(check-expect (key-handler 99 "up") 100)
(check-expect (key-handler 10 "down") 8)
(check-expect (key-handler 10 "enter") 10)

; frame
; black border
(define box
  (rectangle 100 20 "outline" "black"))

; place a red rectangle, of which width is happiness,
; into the frame
(define (render happiness)
  (overlay/xy
   box
   0 0
   (rectangle happiness 20 "solid" "red")))

(gauge-prog 50)