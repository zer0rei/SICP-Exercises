; Finding the pascal coefficient for (row, col)
(define (pascal row col)
  (cond ((< row col) 0)
		((< col 0) 0)
		((= col 1) 1)
		((+ (pascal (- row 1) (- col 1)) (pascal (- row 1) col)))))
