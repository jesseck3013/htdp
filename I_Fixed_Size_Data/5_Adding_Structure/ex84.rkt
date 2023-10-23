;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex84) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define-struct editor [pre post])
; An Editor is a structure:
; (make-editor String String)
; interpretation (make-editor s t) describes an editor
; whose visible text is (string-append s t) with
; the cursor displayed between s and t

(define BACKGROUND (empty-scene 200 20))
(define CURSOR (rectangle 1 20 "solid" "red"))

; String -> Image
; render black text of size 11
(define (render-text str)
  (text str 11 "black"))

; Image Image -> Image
; put a cursor between two images
(define (put-cursor img1 img2)
  (beside img1 CURSOR img2))

; Editor -> Image
; render editor as an image
(define (render editor)
  (overlay/align "left" "center"
               (put-cursor
                (render-text (editor-pre editor))
                (render-text (editor-post editor)))
               BACKGROUND))

;; Example is the image of an Editor displaying
;; a string "hello wrold"
(define EXAMPLE
  (overlay/align "left" "center"
               (put-cursor
                (render-text "hello")
                (render-text "world"))
               (empty-scene 200 20)))

(check-expect (render (make-editor "hello" "world"))
              EXAMPLE)

; String -> String
; return the first letter of a string
(check-expect (string-first "hello") "h")
(define (string-first str)
  (string-ith str 0))

; String -> String
; return the last letter of a string
(check-expect (string-last "hello") "o")
(define (string-last str)
  (string-ith str
              (- (string-length str) 1)))

; String -> String
; remove the last character of a string
(check-expect (string-remove-last "hello") "hell")
(define (string-remove-last str)
  (substring str 0 (- (string-length str) 1)))

; String -> String
; return a string with the first character removed;
(check-expect (string-rest "hello") "ello")
(define (string-rest str)
  (substring str 1))

; Editor -> Editor
; move editor 1 character right
(check-expect (cursor-forward (make-editor "hello" "wolrd"))
              (make-editor "hellow" "olrd"))
(check-expect (cursor-forward (make-editor "helloworld" ""))
              (make-editor "helloworld" ""))
(check-expect (cursor-forward (make-editor "" "helloworld"))
              (make-editor "h" "elloworld"))
(define (cursor-forward ed)
  (cond
    [(string=? (editor-post ed) "") ed]
    [else (make-editor
           (string-append (editor-pre ed)
                          (string-first (editor-post ed)))
           (string-rest (editor-post ed)))]))

; Editor -> Editor
; move editor 1 character left
(check-expect (cursor-backward (make-editor "hello" "wolrd"))
              (make-editor "hell" "owolrd"))
(check-expect (cursor-backward (make-editor "helloworld" ""))
              (make-editor "helloworl" "d"))
(check-expect (cursor-backward (make-editor "" "helloworld"))
              (make-editor "" "helloworld"))
(define (cursor-backward ed)
  (cond
    [(string=? (editor-pre ed) "") ed]
    (else (make-editor
           (string-remove-last (editor-pre ed))
           (string-append (string-last (editor-pre ed))
                          (editor-post ed))))))

; Editor -> Editor
; insert a character at the left of the cursor
(check-expect (insert (make-editor "hello" "world") "1")
              (make-editor "hello1" "world"))
(define (insert ed char)
  (make-editor
   (string-append (editor-pre ed) char)
   (editor-post ed)))

; Editor -> Editor
; delete the character to the left of the cursor
(check-expect (delete (make-editor "hello" "world"))
              (make-editor "hell" "world"))
(check-expect (delete (make-editor "" "world"))
              (make-editor "" "world"))
(define (delete ed)
  (cond
    [(string=? (editor-pre ed) "") ed]
    [else (make-editor
           (string-remove-last
            (editor-pre ed))
           (editor-post ed))]))

; Editor, String -> Editor
; consumes two inputs ed and ke to produce another editor

; insert
(check-expect (edit (make-editor "hello" "world") "a")
              (make-editor "helloa" "world"))

; delete
(check-expect (edit (make-editor "hello" "world") "\b")
              (make-editor "hell" "world"))

(check-expect (edit (make-editor "" "world") "\b")
              (make-editor "" "world"))

; move cursor left
(check-expect (edit (make-editor "hello" "world") "left")
              (make-editor "hell" "oworld"))
(check-expect (edit (make-editor "" "world") "left")
              (make-editor "" "world"))

; move cursor right
(check-expect (edit (make-editor "hello" "world") "right")
              (make-editor "hellow" "orld"))
(check-expect (edit (make-editor "hello" "") "right")
              (make-editor "hello" ""))

; ignore key
; tab
(check-expect (edit (make-editor "hello" "world") "\t")
              (make-editor "hello" "world"))
; enter
(check-expect (edit (make-editor "hello" "world") "\r")
              (make-editor "hello" "world"))

(define (edit ed ke)
  (cond
    [(string=? ke "\b") (delete ed)]
    [(string=? ke "left") (cursor-backward ed)]
    [(string=? ke "right") (cursor-forward ed)]
    [(or (string=? ke "\t")
         (string=? ke "\r")) ed]
    [else (insert ed ke)]))
