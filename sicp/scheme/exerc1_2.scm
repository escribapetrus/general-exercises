; Procedures and the processes they generate
(define (recursive-factorial n)
    (if (= n 1)
        1
        (* n (factorial (- n 1)))
    )
)

(define (iterative-factorial n)
    (define (fact-iter product counter max-count)
        (if (> counter max-count)
            product
            (fact-iter
                (* counter product)
                (+ counter 1)
                max-count
            )
        )
    )
    (fact-iter 1 1 n)
)

; exerc 1.9
(define (inc x) (+ x 1))
(define (dec x) (- x 1))
(define (new-add a b)
    (if (= a 0) b (inc (new-add (dec a) b))))
(define (new-add-2 a b) 
    (if (= a 0) b (new-add-2 (dec a) (inc b))))
; in example a, the operation is recursive because it generates a new function (new-add) every time a decreases, and all these operations will be later applied to b.
; in example b, the operation is iterative because it does not grow in size, it is always the same operation (new-add-2 a b), applied to new values every time -- fixed number of state variables, fixed rule to update state and condition to end process.

; fibonacci
(define (fib x) 
  (cond 
    ((= x 0) 0)
    ((= x 1) 1)
    (else (+ (fib (- x 1)) (fib (- x 2))))
  )
)

; exerc 1.10 -- ACKERMANN

; exerc 1.11
(define (f n)
    (cond ((< n 3) n)        
        ((>= n 3) (+  (f (- n 1)) (* 2 (f (- n 2))) (* 3 (f (- n 3))))
    )
)