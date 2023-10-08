;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex9) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; given 10, expect 10
;; given -10, expect 10
;; given "wow", expect 3
;; given "", expect 0
;; given #true, expect 10
;; given #false, expect 20
(define in "")

(cond
  [(number? in) (abs in)]
  [(string? in) (string-length in)]
  [(boolean? in) (if in 10 20)]
  [else "invalid data type"])