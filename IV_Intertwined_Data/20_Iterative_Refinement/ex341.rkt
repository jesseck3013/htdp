;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname ex341) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "dir.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "dir.rkt" "teachpack" "htdp")) #f)))
; Dir -> Number
; given a Dir, compute its size
(define (du d)
  (local (
          ;; dir* -> Number
          ;; compute size of all dir in d*
          (define (du-dir* d*)
            (cond
              [(empty? d*) 0]
              [else (+ (du (first d*))
                       (du-dir* (rest d*)))]))
          ;; files* -> Number
          ; compute size of all file in f*
          (define (du-files* f*)
            (cond
              [(empty? f*) 0]
              [else
               (+ (file-size (first f*))
                  (du-files* (rest f*)))])))
    (+
     1
     (du-dir* (dir-dirs d))
     (du-files* (dir-files d)))))

(define L (create-dir "./"))
(du L)