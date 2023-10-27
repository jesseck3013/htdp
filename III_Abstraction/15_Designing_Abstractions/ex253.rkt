;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex253) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; [Number -> Boolean]
(define (is-even? x)
  (= (modulo x) 2))

; [Boolean String -> Boolean]
(define (f b s)
  (and b (string=? s "hey")))

; [Number Number Number -> Number]
(define (add a b c)
  (+ a b c))

; [Number -> [List-of Number]]
(define (n-to-zero n)
  (cond
    [(= n 0) (cons 0 '())]
    [else
     (cons n
           (n-to-zero (- n 1)))]))

; [[List-of Number] -> Boolean]
(define (has-zero l)
  (cond
    [(empty? l) #false]
    (else
     (if (= (first l) 0)
         #true
         (has-zero (rest l))))))


