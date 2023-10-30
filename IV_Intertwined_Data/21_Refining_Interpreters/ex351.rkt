;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex351) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define WRONG "invalid bsl expressions")

(define-struct add [left right])
; An add is a structure
; (make-add Number Number)

(define-struct mul [left right])
; An mul is a structure
; (make-mul Number Number)

; S-expr -> BSL-expr
(check-expect (parse 1) 1)
(check-expect (parse '(+ 1 1)) (make-add 1 1))
(check-expect (parse '(* 1 1)) (make-mul 1 1))
(check-expect (parse '(* 1 (+ 10 10))) (make-mul 1 (make-add 10 10)))

(define (parse s)
  (cond
    [(atom? s) (parse-atom s)]
    [else (parse-sl s)]))
 
; SL -> BSL-expr 
(define (parse-sl s)
  (cond
    [(and (consists-of-3 s) (symbol? (first s)))
     (cond
       [(symbol=? (first s) '+)
        (make-add (parse (second s)) (parse (third s)))]
       [(symbol=? (first s) '*)
        (make-mul (parse (second s)) (parse (third s)))]
       [else (error WRONG)])]
    [else (error WRONG)]))
 
; Atom -> BSL-expr 
(define (parse-atom s)
  (cond
    [(number? s) s]
    [(string? s) (error WRONG)]
    [(symbol? s) (error WRONG)]))
 
; SL -> Boolean
(define (consists-of-3 s)
  (and (cons? s) (cons? (rest s)) (cons? (rest (rest s)))
       (empty? (rest (rest (rest s))))))

;; Any -> Boolean
(define (atom? s)
  (or (number? s) (string? s) (symbol? s)))

; S-expr -> Number
(check-expect (interpreter-expr 1) 1)
(check-expect (interpreter-expr '(+ 1 1)) 2)
(check-expect (interpreter-expr '(* 1 1)) 1)
(check-expect (interpreter-expr '(* 1 (+ 10 10))) 20)
(define (interpreter-expr s)
  (local ((define (interpret expr)            
            (cond
              [(number? expr) expr]
              [(add? expr) (+ (interpret (add-left expr))
                              (interpret (add-right expr)))]
              [(mul? expr) (* (interpret (mul-left expr))
                              (interpret (mul-right expr)))])))
    (interpret (parse s))))