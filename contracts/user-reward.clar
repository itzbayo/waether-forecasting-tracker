;; Module 2: User rewards storage

(define-map user-rewards
  { user: principal }
  { earned: uint })

(define-public (add-reward (user principal) (amount uint))
  (let (
        (key { user: user })
        (existing (default-to { earned: u0 } (map-get? user-rewards key)))
        (updated (+ (get earned existing) amount))
       )
    (begin
      (map-set user-rewards key { earned: updated })
      (ok true)
    )
  )
)

(define-read-only (get-earned (user principal))
  (map-get? user-rewards { user: user })
)
