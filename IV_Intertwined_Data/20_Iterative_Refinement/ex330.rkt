;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname ex330) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; A Dir.v1 (short for directory) is one of: 
; – '()
; – (cons File.v1 Dir.v1)
; – (cons Dir.v1 Dir.v1)
 
; A File.v1 is a String.

(define hand "hang")
(define draw "draw")

(define Code (cons hand (cons draw '())))

(define read19 "read19")
(define Docs (cons read19 '()))

(define Libs (cons read19 Docs))

(define part1 "part1")
(define part2 "part2")
(define part3 "part3")
(define Text (cons part1
                   (cons part2
                         (cons part3 '()))))

(define read10 "read10")
(define TS (cons read10
                 (cons Text
                       (cons Libs '()))))