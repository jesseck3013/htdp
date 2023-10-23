;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex72) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define-struct phone [area number])
; A Phone is a structure:
; (make-phone Number Number)
; interpretation
; - area code
; - phone number

(define-struct phone# [area switch num])
; A Phone# is a structure:
; (make-phone# Number Number Number)
; interpretation
; - area code [000, 999]
; - switch code [000, 999]
; - neighborhood code [0000, 9999]