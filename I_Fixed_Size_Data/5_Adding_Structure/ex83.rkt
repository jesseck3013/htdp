;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex83) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
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