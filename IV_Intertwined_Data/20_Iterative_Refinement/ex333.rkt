;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname ex333) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
(define-struct dir [name content])

; A Dir.v2 is a structure: 
;   (make-dir String LOFD)
 
; An LOFD (short for list of files and directories) is one of:
; – '()
; – (cons File.v2 LOFD)
; – (cons Dir.v2 LOFD)
 
; A File.v2 is a String.

(define hang8 "hang8")
(define draw2 "draw2")
(define Code (make-dir "Code" (cons hang8
                                    (cons draw2 '()))))

(define read19 "read19")
(define Docs (make-dir "Docs" (cons read19 '())))

(define Libs (make-dir "Libs" (cons Docs
                                    (cons Code '()))))

(define part1 "part1")
(define part2 "part2")
(define part3 "part3")
(define Text (make-dir "Text" (cons part1
                                    (cons part2
                                          (cons part3 '())))))

(define read10 "read10")
(define TS (make-dir "TS" (cons read10
                                (cons Text
                                      (cons Libs '())))))
; Dir.v2 -> Number
; computes the number of files a given Dir.v2 contains
(check-expect (how-many (make-dir "mt" '())) 0)
(check-expect (how-many Code) 2)
(check-expect (how-many Libs) 3)
(check-expect (how-many Text) 3)
(check-expect (how-many TS) 7)
(define (how-many d)
  (local (
          (define (how-many-lofd lofd)
            (cond
              [(empty? lofd) 0]
              [(string? (first lofd)) (+ 1 (how-many-lofd (rest lofd)))]
              [(dir? (first lofd)) (+ (how-many (first lofd))
                                      (how-many-lofd (rest lofd)))])))
    
    (how-many-lofd (dir-content d))))
    