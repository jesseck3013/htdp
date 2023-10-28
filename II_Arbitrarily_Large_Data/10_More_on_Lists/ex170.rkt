;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname ex170) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define-struct phone [area switch four])
; A Phone is a structure: 
;   (make-phone Three Three Four)
; A Three is a Number between 100 and 999. 
; A Four is a Number between 1000 and 9999. 

; phone, new code -> phone
; replace 713 with 281
; and produce a new phone sturct
(check-expect (change-area (make-phone 713 111 1111) 713 281)
              (make-phone 281 111 1111))
(check-expect (change-area (make-phone 000 111 1111) 713 281)
              (make-phone 000 111 1111))
(define (change-area p old-code new-code)
  (if
   (= (phone-area p) 713)
   (make-phone new-code (phone-switch p) (phone-four p))
   p))

; list of phones -> list of phones
; replace all area code 713 with 281 from the input
(check-expect (replace (list (make-phone 713 111 1111)
               (make-phone 000 111 1111)))
                       (list (make-phone 281 111 1111)
                             (make-phone 000 111 1111)))

(define (replace lofp)
  (cond
    [(empty? lofp) '()]
    [else
     (cons (change-area (first lofp) 713 281)
           (replace (rest lofp)))]))
     