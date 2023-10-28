;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname ex164) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Number -> Number
; convert usd to euro
(check-expect (us-to-euro 1) 0.95)
(define (us-to-euro usd)
  (* 0.95 usd))

; list of number -> list of number
(check-expect (convert-euro (list 1 2 3)) (list 0.95 (* 2 0.95) (* 3 0.95)))
(define (convert-euro lusd)
  (cond
    [(empty? lusd) '()]
    [else (cons (us-to-euro (first lusd))
                (convert-euro (rest lusd)))]))

; Number -> list of number
; given a rate, convert a list of usd according to this rate
(check-expect (convert-euro* 0.95 (list 1 2 3)) (list 0.95 (* 2 0.95) (* 3 0.95)))
(define (convert-euro* rate lusd)
  (cond
    [(empty? lusd) '()]
    [else (cons (* rate (first lusd))
                (convert-euro (rest lusd)))]))
