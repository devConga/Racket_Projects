;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Player2) (read-case-sensitive #t) (teachpacks ((lib "abstraction.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "abstraction.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;JugadorPong2:

(define FONDO (rectangle 1000 700 "solid" "black"))

(define INICIAL (list 384 384 700 500))

(define PALETA (rectangle 10 100 "solid" "white"))

(define PELOTA (regular-polygon 10 8 "solid" "white"))

(define (redibujar e) (place-image PALETA 100 (list-ref e 0)
(place-image PALETA 900 (list-ref e 1)
(place-image PELOTA (list-ref e 2) (list-ref e 3) FONDO))))

(define VELOCIDAD 30)

(define (mover e k)
(cond
[(key=? k "up") (if (<= (- (list-ref e 1) VELOCIDAD) 75)
e
(make-package (list (list-ref e 0) (- (list-ref e 1) VELOCIDAD) (list-ref e 2) (list-ref e 3))
(list (list-ref e 0) (- (list-ref e 1) VELOCIDAD) (list-ref e 2) (list-ref e 3))
)
)
]
[(key=? k "down") (if (>= (+ (list-ref e 1) VELOCIDAD) 625)
e
(make-package (list (list-ref e 0)  (+ (list-ref e 1) VELOCIDAD) (list-ref e 2) (list-ref e 3))
(list (list-ref e 0) (+ (list-ref e 1) VELOCIDAD) (list-ref e 2) (list-ref e 3))
)
)
]
[else e]
))

(define (recibe e m) (list (list-ref m 0) (list-ref m 1) (list-ref m 2) (list-ref m 3)))


(big-bang INICIAL
[to-draw redibujar]
[on-key mover]
;[state #t]
[register "127.0.0.1"]
[name "Jugador 2"]
[on-receive recibe]
)


;(define S (/ 1 200))
;(define (Inicio s) ((place-image (regular-polygon 10 8 "solid" "white") s 100 )))

;(define (pelota s) (cond [(not(= s ANCHO)) (+ s 1)]
;[else s]))

;(big-bang INICIAL
;[to-draw Inicio]
;[on-tick pelota S]
;[name "aquilia"]
;[state #t]
;)