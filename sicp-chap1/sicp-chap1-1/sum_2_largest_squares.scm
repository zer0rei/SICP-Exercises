; Procedure for summing the squares of 2 largest numbers out of 3
(define (sum_2_largest_squares x y z)
  (define (larger a b) (if (> a b) a b))
  (define (sum_of_squares a b) (+ (* a a) (* b b)))
  (if (= x (larger x y))
	(sum_of_squares x (larger y z))
	(sum_of_squares y (larger x z)))
)
