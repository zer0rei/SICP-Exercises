; Procedure for counting change of given amount in cents
(define (count-change amount) 
  (define (cc amount kind-of-coin)
	(cond ((= amount 0) 1)
		  ((< amount 0) 0)
  		  ((= kind-of-coin 0) 0)
		  (else (+ (cc amount (- kind-of-coin 1))
				   (cc (- amount (denomination kind-of-coin)) kind-of-coin)))))
  (define (denomination kind-of-coin)
	(cond ((= kind-of-coin 1) 1)
		  ((= kind-of-coin 2) 5)
		  ((= kind-of-coin 3) 10)
		  ((= kind-of-coin 4) 25)
		  ((= kind-of-coin 5) 50)))
  (cc amount 5))
