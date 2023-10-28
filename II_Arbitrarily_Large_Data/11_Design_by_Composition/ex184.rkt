;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname ex184) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
(define example-1 (list (string=? "a" "b") #false))
(define answer-1 (list #false #false))
(check-expect example-1 answer-1)

(define example-2 (list (+ 10 20) (* 10 20) (/ 10 20)))
(define answer-2 (list 30 200 0.5))

(define example-3 (list "dana" "jane" "mary" "laura"))
(define answer-3 (list "dana" "jane" "mary" "laura"))
(check-expect example-3 answer-3)