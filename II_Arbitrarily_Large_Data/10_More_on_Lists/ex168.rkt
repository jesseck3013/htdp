;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname ex168) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define p1 (make-posn 3 4))
(define p2 (make-posn 4 5))

; list of posn -> list of posn
(check-expect (translate (list p1 p2)) (list (make-posn 3 5)
                                             (make-posn 4 6)))
(define (translate lofp)
  (cond
    [(empty? lofp) '()]
    [else (cons
           (make-posn (posn-x (first lofp))
                      (+ (posn-y (first lofp)) 1))
           (translate (rest lofp)))]))