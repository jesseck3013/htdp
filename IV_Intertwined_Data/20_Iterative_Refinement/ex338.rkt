;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname ex338) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "dir.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "dir.rkt" "teachpack" "htdp")) #f)))
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
    (+ (how-many-dir* (dir-dirs d))
       (how-many-files* (dir-files d)))))

(define L (create-dir "."))
(how-many L)