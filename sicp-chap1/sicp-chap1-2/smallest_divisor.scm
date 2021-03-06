; Smallest divisor procedure
(define (smallest-divisor n)
  (define (devides? a b) (= (remainder b a) 0))
  (define (find-divisor n test)
	(cond ((> (* test test) n) n)
		  ((devides? test n) test)
		  (else (find-divisor n (+ test 1)))))
  (find-divisor n 2))
