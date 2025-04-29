;; Module 3: Transfers rewards to users

(define-constant reward-amount u1000000)
(define-constant admin 'ST000000000000000000002AMW42H) ;; Placeholder

(define-public (send-reward (recipient principal))
  (begin
    (stx-transfer? reward-amount admin recipient)
  )
)

(define-read-only (get-reward-amount)
  reward-amount
)
