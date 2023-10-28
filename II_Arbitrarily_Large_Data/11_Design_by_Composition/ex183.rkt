;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname ex183) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; 1.
(define example-1 (cons "a" (list 0 #false)))

(define answer-1
  (cons "a"        
         (cons 0
               (cons #false '()))))

(check-expect example-1 answer-1)

; 2.
(define example-2 (list (cons 1 (cons 13 '()))))

(define answer-2
  (list (list 1 13)))
(check-expect example-2 answer-2)

; 3
(define example-3 (cons (list 1 (list 13 '())) '()))

(define answer-3
  (list (list 1 (list 13 '()))))

(check-expect example-3 answer-3)

; 4
(define example-4 (list '() '() (cons 1 '())))
(define answer-4 (list '() '() (list 1)))

(check-expect example-4 answer-4)

; 5
(define example-5 (cons "a" (cons (list 1) (list #false '()))))

(define answer-5
  (cons "a"
        (cons
         (cons 1 '())
         (cons #false
               (cons '()
                     '())))))

(check-expect example-4 answer-4)