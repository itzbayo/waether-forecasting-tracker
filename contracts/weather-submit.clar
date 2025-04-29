;; Module 4: Handles complete submission logic

(define-public (submit-weather (location (buff 32)) (temperature int)
                               (condition (string-ascii 32)))
  (let (
        (sender tx-sender)
        (timestamp u0) ;; Using a fixed timestamp for now
       )
    (begin
      ;; Save weather
      (unwrap! (contract-call? .weather save-weather sender timestamp location temperature condition) (err u500))

      ;; Add reward to ledger
      (unwrap! (contract-call? .user-reward add-reward sender u1000000) (err u501))

      ;; Transfer STX
      (unwrap! (contract-call? .reward-transfer send-reward sender) (err u502))

      (ok true)
    )
  )
)
