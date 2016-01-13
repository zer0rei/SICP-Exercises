; Searching roots using half interval method
(define (search f neg pos)
  (let ((mid ((lambda (a b) (/ (+ a b) 2)) neg pos)))
	(if ((lambda (a b) (< (abs (- a b)) 1E-10)) neg pos)
	  mid
	  (let ((mid-value (f mid)))
		(cond ((positive? mid-value) (search f neg mid))
			  ((negative? mid-value) (search f mid pos))
			  (else mid))))))

(define (search-roots f a b)
  (cond ((and (negative? (f a)) (positive? (f b))) (search f a b))
		((and (negative? (f b)) (positive? (f a))) (search f b a))
		(else (error "Values are not of opposite sign:" a b))))
