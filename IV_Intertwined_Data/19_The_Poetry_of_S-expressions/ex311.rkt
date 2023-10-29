;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname ex311) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
(define-struct no-parent [])
(define-struct child [father mother name date eyes])
; An FT (short for family tree) is one of: 
; – (make-no-parent)
; – (make-child FT FT String N String)

(define NP (make-no-parent))

; Oldest Generation:
(define Carl (make-child NP NP "Carl" 1926 "green"))
(define Bettina (make-child NP NP "Bettina" 1926 "green"))
 
; Middle Generation:
(define Adam (make-child Carl Bettina "Adam" 1950 "hazel"))
(define Dave (make-child Carl Bettina "Dave" 1955 "black"))
(define Eva (make-child Carl Bettina "Eva" 1965 "blue"))
(define Fred (make-child NP NP "Fred" 1966 "pink"))
 
; Youngest Generation: 
(define Gustav (make-child Fred Eva "Gustav" 1988 "brown"))

(define CURRENT-YEAR 2023)
; FT, Number -> Number
; given a family tree, and current year, compute the
; average age of all child of the family
(check-expect (average-age Carl CURRENT-YEAR) 97)
(check-expect (average-age Bettina CURRENT-YEAR) 97)
(check-expect (average-age Adam CURRENT-YEAR) 89)

(define (average-age ft year)
  (local (
          (define (count ft)
            (cond
              [(no-parent? ft) 0]
              [else (+ 1
                       (count (child-father ft))
                       (count (child-mother ft)))]))

          (define (sum-age ft)
            (cond
              [(no-parent? ft) 0]
              [else (+
                     (- year (child-date ft))
                     (sum-age (child-father ft))
                     (sum-age (child-mother ft)))])))
    (/ (sum-age ft) (count ft))))
