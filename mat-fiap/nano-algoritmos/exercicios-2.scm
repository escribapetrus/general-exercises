; EX. 1
(define (istwo x) (if (= x 2) '#t '#f))

; EX. 2
(define (iscomputable a b c)
    (define (square x) (* x x))
    (let  ((delta (- (square b) (* 4 a c)))) 
      (if (>= delta 0) '#t '#f)
    )
)
(iscomputable -2 4 -3)

; EX. 3
(define (greater x y)
    (if (>= x y) x y))

(print (greater 3 55))

; EX. 4
(define greaterofthree
    (lambda (x y z)
        (cond 
            ((and (>= x y) (>= x z)) x)
            ((and (>= y x) (>= y z)) y)
            ((and (>= z x) (>= z y)) z)
        )
    )
)

(print (greaterofthree 2 6 66))

; EX. 5
(define twogreaterofthree 
  (lambda (x y z)
    (cond
      ((and (<= x y) (<= x z)) (cons y z))
      ((and (<= y x) (<= y z)) (cons x z))
      ((and (<= z x) (<= z y)) (cons x y))
    )
  )  
)

(print (twogreaterofthree 222 144 6))