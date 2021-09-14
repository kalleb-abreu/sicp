; Exercise 1.2

(/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5)))))
  (* 3 (- 6 2) (- 2 7)))

; Exercise 1.3

(define (square x) (* x x))

(define sum-square-2g
  (lambda (a b c)
    (if (> a b)
      (+ (square a) (if (> b c) (square b) (square c)))
      (+ (square b) (if (> a c) (square a) (square c))) 
    )
  )
)

(sum-square-2g 2 3 4)