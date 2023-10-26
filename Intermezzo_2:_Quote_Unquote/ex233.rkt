;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname ex233) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; 1.
(check-expect `(0 ,@'(1 2 3) 4) (list 0 1 2 3 4))

; 2.
(define example-2 `(("alan" ,(* 2 500))
                    ("barb" 2000)
                    (,@'("carl" " , the great")   1500)
                    ("dawn" 2300)))
(define answer-2 (list (list "alan" (* 2 500))
                       (list "barb" 2000)
                       (list "carl" " , the great" 1500)
                       (list "dawn" 2300)))
(check-expect example-2 answer-2)

; 3.

; List-of-numbers -> ... nested list ...
; creates a row for an HTML table from l
(define (make-row l)
  (cond
    [(empty? l) '()]
    [else (cons (make-cell (first l))
                (make-row (rest l)))]))
; Number -> ... nested list ...
; creates a cell for an HTML table from a number 
(define (make-cell n)
  `(td ,(number->string n)))

(define example-3 `(html
   (body
     (table ((border "1"))
       (tr ((width "200"))
         ,@(make-row '( 1  2)))
       (tr ((width "200"))
         ,@(make-row '(99 65)))))))

(define answer-3 (list 'html
                       (list 'body
                             (list 'table (list (list 'border "1"))
                                   (cons 'tr (cons (list (list 'width "200"))
                                         (make-row '(1 2))))
                                   (cons 'tr (cons (list (list 'width "200"))
                                         (make-row '(99 65))))))))
(check-expect example-3 answer-3)
