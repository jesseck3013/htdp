;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname ex348) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "dir.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "dir.rkt" "teachpack" "htdp")) #f)))
(define-struct bsl-and [left right])
; a bsl-and is a structure
; (make-bsl-and Boolean Boolean)

(define-struct bsl-or [left right])
; a bsl-or is a structure
; (make-bsl-or Boolean Boolean)

(define-struct bsl-not [value])
; a bsl-or is a structure
; (make-bsl-not Boolean)

; BSL-bool-expr -> boolean
(check-expect (eval-bool-expression #true) #true)
(check-expect (eval-bool-expression #false) #false)
(check-expect (eval-bool-expression (make-bsl-and #true #false)) #false)
(check-expect (eval-bool-expression (make-bsl-and #true #true)) #true)
(check-expect (eval-bool-expression (make-bsl-or #false #false)) #false)
(check-expect (eval-bool-expression (make-bsl-or #false #true)) #true)
(check-expect (eval-bool-expression (make-bsl-not #false)) #true)
(check-expect (eval-bool-expression (make-bsl-not #true)) #false)
(define (eval-bool-expression expr)
  (cond
    [(boolean? expr) expr]
    [(bsl-and? expr) (and (eval-bool-expression (bsl-and-left expr))
                          (eval-bool-expression (bsl-and-right expr)))]
    [(bsl-or? expr) (or (eval-bool-expression (bsl-or-left expr))
                          (eval-bool-expression (bsl-or-right expr)))]
    [(bsl-not? expr) (not (eval-bool-expression (bsl-not-value expr)))]))