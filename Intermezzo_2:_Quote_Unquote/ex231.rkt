;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname ex231) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define QUOTE-1 '(1 "a" 2 #false 3 "c"))
(define LIST-1 (list 1 "a" 2 #false 3 "c"))
(define CONS-1 (cons 1
                     (cons "a"
                           (cons 2
                                 (cons #false
                                       (cons 3
                                             (cons "c" '())))))))
(check-expect QUOTE-1 LIST-1)
(check-expect LIST-1 CONS-1)

(define QUOTE-2 '())
(define LIST-2 (list))
(check-expect QUOTE-2 LIST-2)

(define QUOTE-3 '(("alan" 1000)
                  ("barb" 2000)
                  ("carl" 1500)))
(define LIST-3 (list (list "alan" 1000)
                     (list "barb" 2000)
                     (list "carl" 1500)))
(define CONS-3 (cons
                (cons "alan"
                      (cons 1000 '()))
                (cons
                 (cons "barb"
                       (cons 2000 '()))
                 (cons
                  (cons "carl"
                        (cons 1500 '()))
                  '()))))

(check-expect QUOTE-3 LIST-3)
(check-expect LIST-3 CONS-3)