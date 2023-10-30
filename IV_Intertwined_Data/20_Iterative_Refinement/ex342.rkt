;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname ex342) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "dir.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "dir.rkt" "teachpack" "htdp")) #f)))
; A Path is [List-of String].
; interpretation directions into a directory tree

; Dir, String -> Boolean
; given a Dir and file-name
; produce #true if a file with this name is in the Dir tree
(define (find? d target-name)
  (local (
          ;; dir* -> Boolean
          ; produce #true if a file with this name is in d*
          (define (find?-dir* d*)
            (cond
              [(empty? d*) #false]
              [else (or (find? (first  d*) target-name)
                       (find?-dir* (rest d*)))]))
          ;; files* -> Number
          ; produce #true if a file with this name is in f*
          (define (find?-files* f*)
            (cond
              [(empty? f*) #false]
              [else
               (or (string=? (file-name (first f*)) target-name)
                   (find?-files* (rest f*)))])))
    (or (find?-dir* (dir-dirs d))
        (find?-files* (dir-files d)))))

(define L (create-dir "."))
(check-expect (find? L "ex339.rkt") #true)
(check-expect (find? L "not_exist.txt") #false)

; Dir, String -> Path
; given a Dir and file-name
; produce a Path from root to the file
; if a file with this name is in the Dir tree
(define (find d target-name)
  (local (
          ; dirs -> Path
          (define (find-dirs d*)
            (cond
              [(empty? d*) '()]
              [else (if (find? (first d*) target-name)                        
                         (find (first d*) target-name)
                         (find-dirs (rest d*)))]))
          ; files -> Path
          (define (find-files f*)
            (cond
              [(empty? f*) '()]
              [else (if (string=? (file-name (first f*)) target-name)
                        (list (file-name (first f*)))
                        (find-files (rest f*)))])))
    (cond
      [(find? d target-name)
       (cons (dir-name d)
             (append (find-dirs (dir-dirs d))
                     (find-files (dir-files d))))]
      [else #false])))
  
(check-expect (find L "ex339.rkt") (list "same" "ex339.rkt"))
(check-expect (find L "not_exist.txt") #false)

(define UP (create-dir ".."))
(find UP "ex339.rkt")
