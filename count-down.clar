(define-constant contract-owner tx-sender)


(define-map counters principal uint)

;; Count down
(define-public (count-down)
    (ok (map-set counters tx-sender (- (get-count tx-sender) u1)))
)


(define-read-only (get-count (who principal))
    (default-to u0 (map-get? counters who))
)

(define-read-only (my-stx-balance)
  (stx-get-balance contract-caller)
)

(define-read-only (get-contract-owner)
    (print contract-owner)
)
;; private functions
;;
