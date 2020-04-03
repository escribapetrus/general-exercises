;Building abstractions with procedures
; exer 1.2
(define 12c (- (+ 6 (/ 4 5))))
(define 12d (- (+ 3 12c)))
(define 12e (+ (+ 2 12d)))
(define 12upper (+ 9 12e))
(define 12k (+ 2 -7))
(define 12l (+ 6 -2))
(define 12lower (* 3 12k 12l))
(define exer1dot2 (/ 12upper 12lower))

; exer 1.3
(define (sqr x) (* x x))
(define (sqrsm x y) (+ (sqr x) (sqr y)))
(define (sqrsmlg x y z)
  (cond
    ((and (<= x y) (<= x z)) (sqrsm z y))
    ((and (<= y x) (<= y z)) (sqrsm x z))
    ((and (<= z x) (<= z y)) (sqrsm x y))
  )
)

; exer 1.4
(define (sumaabb a b) ((if (> b 0) + -) a b))

; exer 1.5
(define (p) (p))
(define (test x y) (if (= x 0) 0 y))

; 1.1.7 Square Roots
(define (average x y) (/ (+ x y) 2))
(define (improve x y) (average y (/ x y)))
(define (good-enough x y) (< (abs (- (sqr y) x)) 0.001))
(define (sqrt-iter x y)
  (if (good-enough x y)
    y
    (sqrt-iter x (improve x y))
  )
)
(define (square-root x) (sqrt-iter x 1.0))

; exer 1.6
; The function new-if causes a crash by memory overload. Reason being that new-if is constrained by special rules of evaluation on if. new-if evaluates the else clause every time the function is instantiated, therefore generating an infinite loop.
(define (new-if pred then-cl else-cl)
  (cond (pred then-cl) (else else-cl))
)
(define (new-sqrt-iter x y)
  (new-if (good-enough x y)
    y
    (new-sqrt-iter x (improve x y))
  )
)

; exer 1.7
; The current good-enough test should fail for small numbers because the criterium is too large to separate the correct and the incorrect. As for large numbers, the criterium is not precise enough and causes memory overload.
; Better solutions would be to modify the good-enough test as follows:
(define (good-enough x y) (< (abs (- (sqr y) x)) (* y 0.001)))
(define (good-enough x y) (= (improve x y) y))

;exer 1.8
(define (impr-upper x y) (+ (/ x (sqr y)) (* 2 y)))
(define (improve x y) (/ (impr-upper x y) 3))
(define (good-enough x y) (= (abs (expt y 3)) (expt (improve x y) 3)))
(define (cubert-iter x y) 
  (if (good-enough x y) 
    y 
    (cubert-iter x (improve x y))
  )
)
(define (cubert x) (cubert-iter x 1))
