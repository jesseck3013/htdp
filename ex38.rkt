;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex38) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; String -> String
; produce a new string which is based on a string with
; the last character removed
; given hello, expect hell
; given world, epxect worl
(define (string-remove-last str)
  (substring str
             0
             (- (string-length str) 1)))

(string-remove-last "hello")
(string-remove-last "world")