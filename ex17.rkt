;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex17) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define (image-classify image)
  (cond
    [(> (image-height image) (image-width image)) "tall"]
    [(= (iamge-height image) (image-width image)) "square"]
    [else "wide"]))