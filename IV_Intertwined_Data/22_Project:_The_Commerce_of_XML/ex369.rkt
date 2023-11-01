;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex369) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; string-or-false is one of
; - String
; - #false

; [list-of attributes] symbol -> [string-or-false]
(define a0 '((initial "X") (hi "xxx")))
(check-expect (find-attr a0 'initial) "X")
(check-expect (find-attr a0 'hi) "xxx")
(check-expect (find-attr a0 'inexist) #false)

(define (find-attr la s)
  (cond
    [(empty? la) #false]
    [else 
     (local ((define attr (first la))
             (define attr-name (first attr))
             (define attr-value (second attr)))
       (if (symbol=? attr-name s)
           attr-value
           (find-attr (rest la) s)))]))

;; assq version
(check-expect (find-attr-assq a0 'initial) "X")
(check-expect (find-attr-assq a0 'hi) "xxx")
(check-expect (find-attr-assq a0 'inexist) #false)
(define (find-attr-assq la s)
  (local ((define res (assq s la)))
    (if (boolean? res)
        #false
        (second res))))