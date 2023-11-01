;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex360) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define-struct add [left right])
; An add is a structure
; (make-add Number Number)

(define-struct mul [left right])
; An mul is a structure
; (make-mul Number Number)

(define-struct fun [name expr])
; An fun is a structure
; (make-fun symbol BSL-fun-expr)

(define-struct constant [name])
; An constant is a structure
; (make-cons symbol BSL-fun-expr)

(define-struct BSL-fun-def [name arg body])
; BSL-fun-def is a structure
; (make-BSL-fun-def Symbol Symbol BSL-var-expr)

(define-struct BSL-constant-def [name value])
; BSL-constant-def is a structure
; (make-BSL-constant-def Symbol Number)

; BSL-da is one of:
; - BSL-fun-def
; - BSL-constant-def

; BSL-da-all is [list-of BSL-da]

(define ERROR-NOT-FOUND "definition not found")

(define constant-def-1 (make-BSL-constant-def 'close-to-pi 3.14))
(define function-def-1 (make-BSL-fun-def 'area-of-circle
                                         'r
                                         (make-mul (make-constant 'close-to-pi) (make-mul 'r 'r))))
(define function-def-2 (make-BSL-fun-def 'volume-of-10-cylinder 'r (make-mul 10 (make-fun 'area-of-circle 'r))))

(define da (list constant-def-1 function-def-1 function-def-2))

; BSL-da-all Symbol -> BSL-constant-def
(check-expect (lookup-con-def da 'close-to-pi) constant-def-1)
(check-error (lookup-con-def da 'inexist) ERROR-NOT-FOUND)
(define (lookup-con-def da-all x)  
  (cond
    [(empty? da-all) (error ERROR-NOT-FOUND)]
    [(and (BSL-constant-def? (first da-all))
          (symbol=? (BSL-constant-def-name (first da-all)) x))
     (first da-all)]
    [else (lookup-con-def (rest da-all) x)]))

; BSL-da-all Symbol -> BSL-constant-def
(check-expect (lookup-fun-def da 'area-of-circle) function-def-1)
(check-error (lookup-fun-def da 'inexist) ERROR-NOT-FOUND)
(define (lookup-fun-def da-all x)
  (cond
    [(empty? da-all) (error ERROR-NOT-FOUND)]
    [(and (BSL-fun-def? (first da-all))
          (symbol=? (BSL-fun-def-name (first da-all)) x))
     (first da-all)]
    [else (lookup-fun-def (rest da-all) x)]))
