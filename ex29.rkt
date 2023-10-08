;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex29) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define default-attendees 120)
(define default-price 5.0)
(define change-people 15)
(define change-price 0.1)
(define default-cost 0)
(define change-cost 1.5)

(define (attendees ticket-price)
  (- default-attendees (* (- ticket-price default-price)
                          (/ change-people change-price))))

(define (revenue ticket-price)
  (* ticket-price (attendees ticket-price)))

(define (cost ticket-price)
  (+ default-cost (* change-cost (attendees ticket-price))))

(define (profit ticket-price)
  (- (revenue ticket-price)
     (cost ticket-price)))


(profit 3)
(profit 4)
(profit 5)