;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex138) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; A List-of-amounts is one of: 
; – '()
; – (cons PositiveNumber List-of-amounts)

;; List-of-amounts -> Number
;; count the sum of the amounts
(check-expect (sum  '()) 0)
(check-expect (sum (cons 10 '())) 10)
(check-expect (sum (cons 10
                         (cons 11
                               (cons 23 '())))) 44)
(define (sum amounts-list)
  (cond
    [(empty? amounts-list) 0]
    [else
     (+ (first amounts-list)
        (sum (rest amounts-list)))]))