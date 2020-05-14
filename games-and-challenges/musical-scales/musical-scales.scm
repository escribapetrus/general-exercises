;; scheme list guide: https://www.csee.umbc.edu/courses/undergraduate/331/fall17/park/notes/L13-scheme2-6x.pdf
;;get nth element from list with list-ref function (list-ref list idx)
;;get list length with length function(length list)
(define chromatic '("a" "a#" "b" "c" "c#" "d" "d#" "e" "f" "f#" "g" "g#"))
(define major '(0 2 4 5 7 9 11))
(define minor '(0 2 3 5 7 8 10))
(define major-harmonic '(0 2 4 5 7 8 11))
(define minor-harmonic '(0 2 3 5 7 8 11))
(define major-pentatonic '(0 2 4 7 9))
(define minor-pentatonic '(0 3 5 7 10))

;; reorder the list to start on idx
(define (reorder lis idx)
    (define (list-head ori l i)
    ;; gets the first elements from a list up to idx
        (if  (equal? (car l) (list-ref ori i)) 
                () 
                (cons (car l) (list-head ori (cdr l) i))))
    (append (list-tail lis idx) (list-head lis lis idx)))

;; make a new list of ordered numbers starting in idx w/ length of a list
(define (list-to-numbers lis idx) 
    (if (null? lis)
        ()
        (cons idx (list-to-numbers (cdr lis) (+ idx 1)))))

(define element-idx
    (lambda (lis el) 
        (cond   ((null? lis) -1)
            ((equal? (car lis) el) 0)
            (else 
                (cond 
                    ;; if the index of the cdr of the last element is -1, the procedure found no match, 
                    ;;therefore return -1
                    ((= (element-idx (cdr lis) el) -1) -1)
                    (else (+ 1 (element-idx (cdr lis) el))))))))

(define (get-scale scale pattern)
    (filter 
        (lambda (x) (if (member (element-idx scale x) pattern) #t #f))
        scale))

(define (main key scale)
    (get-scale (reorder chromatic (element-idx chromatic key)) scale)
)

;; to get the desired scale, run the main function with the key note and scale as parameters
;; example: (print (main "e" minor))
