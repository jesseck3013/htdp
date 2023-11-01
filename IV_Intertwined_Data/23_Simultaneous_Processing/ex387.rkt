;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname ex387) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "dir.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "dir.rkt" "teachpack" "htdp")) #f)))
; a pair is (cons symbol (cons number '()))

; [list-of symbol] [list-of number] -> [list-of pair]
(define (cross list-s list-n)
  (local (
          ; Symbol, list -> [list-of pair]
          (define (build-pair s l)
            (cond
              [(empty? l) '()]
              [else (cons (list s (first l))
                          (build-pair s (rest l)))])))
  (cond
    [(empty? list-s) '()]
    [else (append (build-pair (first list-s) list-n)
                  (cross (rest list-s) list-n))])))

(check-expect (cross '(a b c) '(1 2)) '((a 1) (a 2) (b 1) (b 2) (c 1) (c 2)))