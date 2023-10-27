;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex240) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; An LStr is one of: 
; – String
; – (make-layer LStr)
    

; An LNum is one of: 
; – Number
; – (make-layer LNum)

;; LStr example:
(make-layer "x")

;; LNum example:
(make-layer 1)

;; abstraction
;; An LItem is one of:
;; - Item
;; -(make-layer Item)

;; An LStr is
;; [LItem String]

;; An LNum is
;; [LItem Number]