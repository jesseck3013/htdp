;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex82) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; 3l-word is a structure
; (make-3l-word 1String 1String 1String)
(define-struct word [first second thrid])

; word word -> word
; when two words agree, return the content
; else return #false
(check-expect (compare-word
               (make-word "a" "b" "c")
               (make-word "a" "b" "c"))
              (make-word "a" "b" "c"))

(check-expect (compare-word
               (make-word "a" "b" "d")
               (make-word "a" "b" "c"))
              #false)

(define (compare-word word1 word2)
  (cond
    [(and
  (equal? (word-first word1) (word-first word2))
  (equal? (word-second word1) (word-second word2))
  (equal? (word-thrid word1) (word-thrid word2))
  ) word1]
    [else #false]))
