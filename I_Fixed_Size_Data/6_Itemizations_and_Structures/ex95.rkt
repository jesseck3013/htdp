;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex95) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;; the world state does not contains missile
;; therefore, make-aim is the choice of data definition of the world state
(make-aim (make-posn 20 10) (make-tank 28 -3))

;; these two world states contains a flying missile
;; therefore, make-fired should be used as data definition of the world state
(make-fired (make-posn 20 10)
            (make-tank 28 -3)
            (make-posn 28 (- HEIGHT TANK-HEIGHT)))

(make-fired (make-posn 20 100)
            (make-tank 100 3)
            (make-posn 22 103))