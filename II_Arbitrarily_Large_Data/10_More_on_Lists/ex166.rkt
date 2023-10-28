;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname ex166) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define-struct work [employee rate hours])
; A (piece of) Work is a structure: 
;   (make-work String Number Number)
; interpretation (make-work n r h) combines the name 
; with the pay rate r and the number of hours h

(define-struct paycheck [name amount])
; paycheck is a structure:
; (make-paycheck String Number)
; interpretation (make-paycheck n a)
; combines an employee's name and an amount


; Low -> List-of-numbers
; computes the weekly wages for all weekly work records 
(check-expect
  (wage*.v3 (cons (make-work "Robby" 11.95 39) '()))
  (cons (paycheck-by-work (make-work "Robby" 11.95 39)) '()))
 
(define (wage*.v3 an-low)
  (cond
    [(empty? an-low) '()]
    [(cons? an-low) (cons (paycheck-by-work (first an-low))
                          (wage*.v3 (rest an-low)))]))
 
; Work -> Number
; computes the wage for the given work record w
(define (wage.v3 w)
  (* (work-rate w) (work-hours w)))

; Work -> paycheck
; compute wage of a given work record
; combine wage and name of employee to create a paycheck
(check-expect (paycheck-by-work (make-work "Robby" 11.95 39))
              (make-paycheck "Robby" (* 11.95 39)))

(define (paycheck-by-work w)
  (make-paycheck (work-employee w)
                 (wage.v3 w)))