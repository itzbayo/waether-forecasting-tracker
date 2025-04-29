;; Module 1: Weather data storage

(define-map weather-data
  { reporter: principal, timestamp: uint }
  { location: (buff 32), temperature: int, condition: (string-ascii 32) })

(define-public (save-weather (reporter principal) (timestamp uint)
                             (location (buff 32)) (temperature int)
                             (condition (string-ascii 32)))
  (let (
        (key { reporter: reporter, timestamp: timestamp })
        (value { location: location, temperature: temperature, condition: condition })
       )
    (begin
      (map-set weather-data key value)
      (ok true)
    )
  )
)

(define-read-only (weather-exists? (reporter principal) (timestamp uint))
  (is-some (map-get? weather-data { reporter: reporter, timestamp: timestamp }))
)
