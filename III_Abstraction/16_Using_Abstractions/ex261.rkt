;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex261) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Inventory -> Inventory
; creates an Inventory from an-inv for all
; those items that cost less than a dollar
(define (extract1 an-inv)
  (local ((define extract-rest (extract1 (rest an-inv))))
    (cond
      [(empty? an-inv) '()]
      [else
       (cond
         [(<= (IR-price (first an-inv)) 1.0)
          (cons (first an-inv) extract-rest)]
         [else extract-rest])])))

;; the speed shoulde be the same
;; because (extract1 (rest an-inv)) is called once
;; in the original conditional clause