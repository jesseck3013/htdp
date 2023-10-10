;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex58) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; A Price falls into one of three intervals:
; - 0 < price < 1000
; - 1000 <= price < 10000
; - 10000 < price
; interpretation: the price of an item

; tax rate for 1000 <= p < 10000
(define LOW-PRICE-TAX-RATE 0.05)
; tax rate for p >= 10000
(define LUXURY-PRICE-TAX-RATE 0.08)

; Price -> Number
; computes the amount of tax charged for p
(check-expect (price-to-tax 0) 0)
(check-expect (price-to-tax 200) 0)
(check-expect (price-to-tax 1000) (* 1000 LOW-PRICE-TAX-RATE))
(check-expect (price-to-tax 4000) (* 4000 LOW-PRICE-TAX-RATE))
(check-expect (price-to-tax 10000) (* 10000 LUXURY-PRICE-TAX-RATE))
(check-expect (price-to-tax 12000) (* 12000 LUXURY-PRICE-TAX-RATE))
(define (price-to-tax p)
  (cond
    [(< p 1000) 0]
    [(and (<= 1000 p) (< p 10000)) (* p LOW-PRICE-TAX-RATE)]
    [(>= p 10000) (* p LUXURY-PRICE-TAX-RATE)]))
