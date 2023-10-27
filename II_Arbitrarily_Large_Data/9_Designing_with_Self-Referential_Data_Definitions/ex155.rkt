;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname ex155) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define-struct layer [color doll])
; An RD (short for Russian doll) is one of:
; - String
; - (make-layer String RD)

(define example (make-layer "yellow" (make-layer "green" "red")))

; RD -> String
; consumes an RD and produces the (color of the) innermost doll
(check-expect (inner example) "red")
(define (inner rd)
  (cond
    [(string? rd) rd]
    [else (inner (layer-doll rd))]))