;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex152) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Number, Image -> Image
; produces a column—a vertical arrangement—of n copies of img.
(define (col n img)
  (cond
    [(zero? n) (empty-scene 0 0)]
    [else (beside img (col (sub1 n) img))]))

; Number, Image -> Image
; produces a row—a horizontal arrangement—of n copies of img.
(define (row n img)
  (cond
    [(zero? n) (empty-scene 0 0)]
    [else (above img (row (sub1 n) img))]))