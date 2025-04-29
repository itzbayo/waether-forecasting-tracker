;; Module 7: Admin config and controls

(define-constant contract-owner 'ST000000000000000000002AMW42H) ;; Replace with deployer

(define-read-only (is-admin (user principal))
  (is-eq user contract-owner)
)

(define-public (update-reward (new-amount uint))
  (begin
    (if (is-eq tx-sender contract-owner)
        (begin
          ;; Could simulate updating global reward (not stateful in this design)
          (ok new-amount)
        )
        (err u403)
    )
  )
)

(define-read-only (get-admin)
  contract-owner
)
