;; Module 6: Read-only reward-related info

(define-read-only (user-reward (user principal))
  (contract-call? .user-reward get-earned user)
)

(define-read-only (reward-amount)
  (contract-call? .reward-transfer get-reward-amount)
)

(define-read-only (my-rewards)
  (contract-call? .user-reward get-earned tx-sender)
)
