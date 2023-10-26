;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname ex234) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; List-of-numbers -> ... nested list ...
; creates a row for an HTML table from l
(define (make-row l)
  (cond
    [(empty? l) '()]
    [else (cons (make-cell (first l))
                (make-row (rest l)))]))
 
; Number -> ... nested list ...
; creates a cell for an HTML table from a number 
(define (make-cell n)
  `(td ,(number->string n)))


; list -> ...nested list...
; create a ranked html table
(define (make-ranking l)
  `(table
    (tr ,@(make-entries l))))

(define (make-entries l)
  (cond
    [(empty? l) '()]
    [else (cons `(li ,(first l))
                (make-entries (rest l)))]))

(define one-list
  '("Asia: Heat of the Moment"
    "U2: One"
    "The White Stripes: Seven Nation Army"))

(make-ranking one-list)