;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex139) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; A List-of-numbers is one of: 
; – '()
; – (cons Number List-of-numbers)

; List-of-numbers -> Boolean
; determines weather all numbers are positive number
(check-expect (pos? (cons -1 '())) #false)
(check-expect (pos? (cons 1 '())) #true)
(check-expect (pos? (cons 1
                          (cons 1
                                (cons -1 '())))) #false)
(define (pos? number-list)
  (cond
    [(empty? number-list) #true]
    [else (and (positive? (first number-list))
               (pos? (rest number-list)))]))

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

; number-list -> Number
; produce sum of nubmer-list when all the element are valid
; otherwise signal error
(define (checked-sum number-list)
  (cond
    [(pos? number-list) (sum number-list)]
    [else (error "numbers of number-lsit should be positive")]))
