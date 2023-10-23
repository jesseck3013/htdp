;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex70) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define-struct centry [name home office cell])
;(define centry1 (make-centry n h o c))
;(check-expect (centry-name centry1) n)
;(check-expect (centry-home centry1) h)
;(check-expect (centry-office centry1) o)
;(check-expect (centry-cell centry1) c)

(define-struct phone [area number])s
;(define phone1 (make-phone a n))
;(check-expect (phone-name phone1) a)
;(check-expect (phone-n phone1) n)
