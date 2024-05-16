;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Universe) (read-case-sensitive #t) (teachpacks ((lib "abstraction.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "abstraction.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;Universo Pong:

(define INICIAL (list))

(define (ONNEW e w) (cons w e))
(define (ONMSG e w s) (make-bundle e (enviar e w s) (list)))

;(list (make-mail (if (iworld=? w (list-ref e 0)) (list-ref e 1) (list-ref e 0)) s))
(define (enviar l w s) (
if (null? l)
(list)
(if (iworld=? w (car l))
(enviar (cdr l) w s)
(cons (make-mail (car l) s) (enviar (cdr l) w s))
)
)
)


(define (mostrar e) e)

(universe INICIAL
[on-new ONNEW]
[on-msg ONMSG]
[to-string mostrar]
)