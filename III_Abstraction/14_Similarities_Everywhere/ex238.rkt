;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex238) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;; function, Nelon -> number
;; produce a number from a list
;; based on a compare function
(define (compare fn l)
  (cond
    [(empty? (rest l))
     (first l)]
    [else
     (if (fn (first l)
             (compare fn (rest l)))
         (first l)
         (compare fn (rest l)))]))


(define example1 (list 25 24 23 22 21 20 19 18 17 16 15 14 13
      12 11 10 9 8 7 6 5 4 3 2 1))
 
(define example2 (list 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
      17 18 19 20 21 22 23 24 25))

(check-expect (inf-1 example1) 1)
(check-expect (inf-1 example2) 1)
(define (inf-1 l)
  (compare < l))

;;(check-expect (sup-1 example1) 25)
;;(check-expect (sup-1 example2) 25)
(define (sup-1 l)
  (compare > l))


;; these two functions are slow because each each item has to
;; be compared with the all of the rest items of the list

;; function, Nelon -> number
;; produce a number from a list
;; based on a compare function
(define (compare2 fn l)
  (cond
    [(empty? (rest l))
     (first l)]
    [else
     (fn (first l)
         (compare2 fn (rest l)))]))

(check-expect (inf-2 example1) 1)
(check-expect (inf-2 example2) 1)
(define (inf-2 l)
  (compare2 min l))

(check-expect (sup-2 example1) 25)
(check-expect (sup-2 example2) 25)
(define (sup-2 l)
  (compare2 max l))

