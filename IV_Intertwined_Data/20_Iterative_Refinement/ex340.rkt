;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname ex340) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "dir.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "dir.rkt" "teachpack" "htdp")) #f)))
; Dir -> list of String
; given a Dir, list the names of all files and dir inside it
(define (ls d)
  (local (
          ;; dir* -> list of string
          ; put all dir names and files name into a list
          (define (ls-dir* d*)
            (cond
              [(empty? d*) '()]
              [else (append (ls (first d*))
                            (ls-dir* (rest d*)))]))              
          ;; files* -> list of string
          ; put all file names into a list
          (define (ls-files* f*)
            (cond
              [(empty? f*) '()]
              [else
               (append (list (file-name (first f*)))
                   (ls-files* (rest f*)))])))
    (append
     (list (dir-name d))
     (ls-dir* (dir-dirs d))
     (ls-files* (dir-files d)))))

(define L (create-dir "../"))
(ls L)