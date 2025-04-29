(define-map weather-data
  { reporter: principal, timestamp: uint }
  { location: (buff 32), temperature: int, condition: (string-ascii 32) })

(define-map user-rewards
  { user: principal }
  { earned: uint })

(define-constant reward-amount u1000000) ;; 1 STX in micro-STX
(define-constant admin tx-sender)

(define-public (submit-weather (location (buff 32)) (temperature int) (condition (string-ascii 32)))
  (let (
        (user tx-sender)
        (timestamp u0) ;; Using a fixed timestamp for now
        (data-key { reporter: user, timestamp: timestamp })
        (data-value { location: location, temperature: temperature, condition: condition })
        (user-key { user: user })
        (prev-reward (default-to { earned: u0 } (map-get? user-rewards user-key)))
        (new-reward (+ (get earned prev-reward) reward-amount))
      )
    (begin
      ;; Save weather data
      (map-set weather-data data-key data-value)
      ;; Reward the user
      (map-set user-rewards user-key { earned: new-reward })
      ;; Transfer STX as gift
      (stx-transfer? reward-amount admin user)
    )
  )
)

(define-read-only (get-weather (reporter principal) (timestamp uint))
  (map-get? weather-data { reporter: reporter, timestamp: timestamp })
)

(define-read-only (get-user-reward (user principal))
  (map-get? user-rewards { user: user })
)
