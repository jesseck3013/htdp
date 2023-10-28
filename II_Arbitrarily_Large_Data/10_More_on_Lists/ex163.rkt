;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname ex163) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Number -> Number
; convert fahrenheit to celsius
(check-expect (fahrenheit-to-celsius 32) 0)
(check-expect (fahrenheit-to-celsius 50) 10)
(define (fahrenheit-to-celsius x)
  (* (- x 32) (/ 5 9)))

; list of number -> list of number
; convert a list of fahrenheit to a list of celsius
(check-expect (convertFC (list 32 50)) (list 0 10))
(define (convertFC l)
  (cond
    [(empty? l) '()]
    [else (cons (fahrenheit-to-celsius
                 (first l))
                (convertFC (rest l)))])) 