;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname ex232) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define Quasiquote-1 `(1 "a" 2 #false 3 "c"))
(define List-1 (list 1 "a" 2 #false 3 "c"))
(check-expect Quasiquote-1 List-1)

(define Quasiquote-2 `(("alan" ,(* 2 500))
                       ("barb" 2000)
                       (,(string-append "carl" " , the great") 1500)
                       ("dawn" 2300)))
(define List-2 (list (list "alan" (* 2 500))
                     (list "barb" 2000)
                     (list (string-append "carl" " , the great") 1500)
                     (list "dawn" 2300)))
(check-expect Quasiquote-2 List-2)

;; (define title "ratings")
`(html
   (head
     (title ,title))
   (body
     (h1 ,title)
     (p "A second web page")))

(list 'html
      (list 'head
            (list 'title title))
      (list 'body
            (list 'h1 title)
            (list 'p "A second web page")))

