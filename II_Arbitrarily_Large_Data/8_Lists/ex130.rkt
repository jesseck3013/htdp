;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex130) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(cons "Alice"
      (cons "Ben"
            (cons "George"
                  (cons "Alan"
                        (cons "Alex" '())))))


;; (cons "1" (cons "2" '()))
;; in this example both "1" and "2" are String type
;; which fullfills the definition of List-of-names

;; 2 is not a String, so (cons 2 '()) is not List-of-names
