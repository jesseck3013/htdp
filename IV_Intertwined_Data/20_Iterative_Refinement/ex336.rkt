;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname ex336) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
(define-struct file [name size content])

; A File.v3 is a structure: 
;   (make-file String N String)

(define-struct dir.v3 [name dirs files])

; A Dir.v3 is a structure: 
;   (make-dir.v3 String Dir* File*)
 
; A Dir* is one of: 
; – '()
; – (cons Dir.v3 Dir*)
 
; A File* is one of: 
; – '()
; – (cons File.v3 File*)

(define hang (make-file "hang" 8 ""))
(define draw (make-file "draw" 2 ""))
(define Code (make-dir.v3 "Code" '() (cons hang
                                           (cons draw '()))))

(define read1 (make-file "read!" 19 ""))
(define Docs (make-dir.v3 "Docs" '() (cons read1 '())))

(define Libs (make-dir.v3 "Libs" (cons Code
                                       (cons Docs '())) '()))

(define part1 (make-file "part1" 99 ""))
(define part2 (make-file "part2" 52 ""))
(define part3 (make-file "part3" 17 ""))
(define Text (make-dir.v3 "Text" '() (cons part1
                                           (cons part2
                                                 (cons part3 '())))))

(define read2 (make-file "read!" 10 ""))
(define TS (make-dir.v3 "TS" (cons Text
                                   (cons Libs '())) (cons read2 '())))

; Dir.v3 -> Number
; give a Dir.v3, produces the number of files inside it
(check-expect (how-many (make-dir.v3 "mt" '() '())) 0)
(check-expect (how-many Code) 2)
(check-expect (how-many Libs) 3)
(check-expect (how-many Text) 3)
(check-expect (how-many TS) 7)
(define (how-many d)
  (local (
          ;; dir* -> Number
          ;; count files in dir*
          (define (how-many-dir* d*)
            (cond
              [(empty? d*) 0]
              [else (+ (how-many (first  d*))
                       (how-many-dir* (rest d*)))]))
          ;; files* -> Number
          ;; count files in files*
          (define (how-many-files* f*)
            (cond
              [(empty? f*) 0]
              [else (+ 1
                       (how-many-files* (rest f*)))])))
    (+ (how-many-dir* (dir.v3-dirs d))
       (how-many-files* (dir.v3-files d)))))