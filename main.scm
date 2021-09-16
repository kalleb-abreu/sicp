; Exercise 1.1

10 ; 10
(+ 5 3 4) ; 12
(- 9 1) ; 8
(/ 6 2) ; 3
(+ (* 2 4) (- 4 6 )) ; 6
(define a 3) ;
(define b (+ a 1)) ;
(+ a b (* a b)) ; 19
(= a b) ; #f
(if (and (> b a) (< b (* a b ))) ; 4
    b
    a)

(cond ((= a 4) 6)         ; 16
      ((= b 4) (+ 6 7 a))
      (else 25))

(+ 2 (if (> b a) b a)) ; 6

(* (cond ((> a b) a) ; 16
         ((< a b) b)
         (else -1))
    (+ a 1))

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

; Exercise 1.4

(define (a-plus-abs-b a b)
  ((if (> b 0) + - ) a b))

; The procedure above evaluate first the if and retrieve the operand + or - depending on the value of 'b'. If 'b' is greater than 0, return + and apply it to 'a' and 'b'. Otherwise it applies the - operand to 'a' and 'b'.

; Exercise 1.5

; Since the applicative-order evaluates the arguments before the body, it'll produce a infinite loop because of the procedure 'p'. And the normal-order will never evaluate the 'p' procedure beacause it finishes without need to evaluate it.

; Exercise 1.6

; Scheme uses a applicative-order evaluation, that way when the sqrt is called, it'll evaluate new-if first and new-if'll evaluate sqrt-itr which will call new-if again. This causes a infinite loop.

; Exercise 1.7

; If the precision is fixed it'll fail for numbers smaller than the precision set and will always give true. And for large number the float precision won't be enough to calculate the difference.

(define (square x) (* x x))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqtr-iter (improve guess x)))

(sqrt-iter 1.0 9)