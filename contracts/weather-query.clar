;; Module 5: Read-only weather queries

(define-read-only (get-weather (reporter principal) (timestamp uint))
  (contract-call? .weather weather-exists? reporter timestamp)
)

(define-read-only (has-submitted (reporter principal) (timestamp uint))
  (contract-call? .weather weather-exists? reporter timestamp)
)

(define-read-only (current-block)
  u0 ;; Using a fixed value for now
)
