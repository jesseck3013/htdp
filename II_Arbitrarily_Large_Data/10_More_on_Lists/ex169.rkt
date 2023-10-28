;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname ex169) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; posn -> boolean
(check-expect (in-range (make-posn -1 50)) #false)
(check-expect (in-range (make-posn 10 50)) #true)
(check-expect (in-range (make-posn 101 50)) #false)
(check-expect (in-range (make-posn 10 202)) #false)
(define (in-range p)
  (and (and (> (posn-x p) 0) (< (posn-x p) 100))
       (and (> (posn-y p) 0) (< (posn-y p) 200))))

; list of posn -> list of posn
; inclued all posn whose 0 < x < 100 and 0 < y < 200
(check-expect (legal (list
                      (make-posn 10 50)
                      (make-posn -1 50)
                      (make-posn 101 50)
                      (make-posn 10 202)))
              (list (make-posn 10 50)))

(define (legal lop)
  (cond
    [(empty? lop) '()]
    [else
     (if (in-range (first lop))
         (cons (first lop)
               (legal (rest lop)))
         (legal (rest lop)))]))