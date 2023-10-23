;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex87) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define-struct editor [str i])
; An Editor is a structure:
; (make-editor String Number)
; interpretation (make-editor s t) describes an editor
; whose visible text is str with
; the cursor displayed at index i

(define BACKGROUND (empty-scene 200 20))
(define CURSOR (rectangle 1 20 "solid" "red"))

; String -> Image
; render black text of size 11
(define (render-text str)
  (text str 11 "black"))

; Editor -> Image
(define (put-cursor ed)
  (beside
   (render-text (substring (editor-str ed) 0 (editor-i ed)))
   CURSOR
   (render-text (substring (editor-str ed) (editor-i ed)))))

; Editor -> Image
; render editor as an image
(define (render editor)
  (overlay/align "left" "center"
               (put-cursor editor)
               BACKGROUND))

(define EXAMPLE
   (overlay/align "left" "center"
               (put-cursor (make-editor "helloworld" 5))
               BACKGROUND))
(check-expect
 (render (make-editor "helloworld" 5))
 EXAMPLE)

; String -> String
(check-expect (string-remove-ith "helloworld" 4) "hellworld")
(define (string-remove-ith str ith)
  (string-append
   (substring str 0 ith)
   (substring str (+ ith 1))))

; String, String, Number -> String
(check-expect (string-insert-ith "helloworld" "1" 4) "hell1oworld")
(define (string-insert-ith str char ith)
  (string-append
   (substring str 0 ith)
   char
   (substring str ith )))

; Editor -> Editor
; delete a character to the left of the cursor
(check-expect (delete (make-editor "helloworld" 5))
              (make-editor "hellworld" 4))
(check-expect (delete (make-editor "helloworld" 0))
              (make-editor "helloworld" 0))
(define (delete ed)
  (cond
    [(= (editor-i ed) 0) ed]
    [else
     (make-editor
      (string-remove-ith (editor-str ed) (- (editor-i ed) 1))
      (- (editor-i ed) 1))]))

; Editor -> Editor
; move cursor one character right
(check-expect (cursor-forward (make-editor "hello" 0))
              (make-editor "hello" 1))
(check-expect (cursor-forward (make-editor "hello" 5))
              (make-editor "hello" 5))
(define (cursor-forward ed)
  (cond
    [(= (string-length (editor-str ed))
        (editor-i ed)) ed]
    [else (make-editor (editor-str ed) (+ (editor-i ed) 1))]))

; Editor -> Editor
; move cursor one character left
(check-expect (cursor-backward (make-editor "hello" 0))
              (make-editor "hello" 0))
(check-expect (cursor-backward (make-editor "hello" 5))
              (make-editor "hello" 4))
(define (cursor-backward ed)
  (cond
    [( = (editor-i ed) 0) ed]
    [else (make-editor (editor-str ed) (- (editor-i ed) 1))]))


(define MAX-EDITOR-SIZE 33)

; Editor -> Number
; count characters of the editor
(check-expect (editor-size (make-editor "helloworld" 0)) 10)
(check-expect (editor-size (make-editor "" 0)) 0)
(define (editor-size ed)
  (string-length (editor-str ed)))

; Editor -> Editor
; insert a character to the left of the cursor
(check-expect (insert (make-editor "helloworld" 5) "1")
              (make-editor "hello1world" 6))
(define (insert ed char)
  (cond
    [(= (editor-size ed) MAX-EDITOR-SIZE) ed]
    [else (make-editor 
   (string-insert-ith
    (editor-str ed)
    char
    (editor-i ed))
   (+ (editor-i ed) 1))]))

; Editor, String -> Editor
; produce a new editor after a key press
(define (edit ed ke)
  (cond
    [(string=? ke "\b") (delete ed)]
    [(string=? ke "left") (cursor-backward ed)]
    [(string=? ke "right") (cursor-forward ed)]
    [(or (string=? ke "\t")
         (string=? ke "\r")) ed]
    [else (insert ed ke)]))

; Editor -> Editor
; render new editor when there is a key press
(define (run ed)
  (big-bang ed
    [to-draw render]
    [on-key edit]))

; An Editor with no input
(define EMPTY-EDITOR (make-editor "" 0))

(run EMPTY-EDITOR)
