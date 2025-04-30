# Real-Time Weather Forecasting Tracker

A decentralized application built on Stacks blockchain for tracking and rewarding real-time weather data submissions.

## Overview

This project implements a set of smart contracts that allow users to submit weather data to the blockchain and receive rewards for their contributions. The system is designed to incentivize accurate weather reporting from various locations.

## Smart Contracts Architecture

The project is organized into several modular contracts, each with a specific responsibility:

```
┌─────────────────┐     ┌─────────────────┐     ┌─────────────────┐
│                 │     │                 │     │                 │
│  weather.clar   │◄────┤weather-submit.clar├────►user-reward.clar │
│  (Data Storage) │     │(Submission Logic)│     │ (Reward Tracking)│
│                 │     │                 │     │                 │
└────────┬────────┘     └────────┬────────┘     └────────┬────────┘
         │                       │                       │
         │                       │                       │
         ▼                       ▼                       ▼
┌─────────────────┐     ┌─────────────────┐     ┌─────────────────┐
│                 │     │                 │     │                 │
│weather-query.clar│     │reward-transfer.clar│     │reward-query.clar│
│  (Data Queries) │     │ (Token Transfer) │     │ (Reward Queries)│
│                 │     │                 │     │                 │
└─────────────────┘     └─────────────────┘     └─────────────────┘
                                │
                                │
                                ▼
                        ┌─────────────────┐
                        │                 │
                        │   admin.clar    │
                        │(Admin Controls) │
                        │                 │
                        └─────────────────┘
```

The `real_time_forecast.clar` contract is a simplified version that combines the core functionality of several of these contracts.

### 1. Weather Data Storage (`weather.clar`)
- Stores weather data submitted by users
- Maps reporter and timestamp to location, temperature, and condition
- Provides functions to save weather data and check if data exists

### 2. User Rewards (`user-reward.clar`)
- Tracks rewards earned by users for submitting weather data
- Provides functions to add rewards and query earned rewards

### 3. Reward Transfer (`reward-transfer.clar`)
- Handles the transfer of STX tokens as rewards to users
- Defines the reward amount and admin account

### 4. Weather Submission (`weather-submit.clar`)
- Coordinates the complete submission process
- Saves weather data, adds rewards to the user's ledger, and transfers STX

### 5. Weather Queries (`weather-query.clar`)
- Provides read-only functions to query weather data
- Checks if a user has submitted data for a specific timestamp

### 6. Reward Queries (`reward-query.clar`)
- Provides read-only functions to query reward information
- Gets user rewards and reward amounts

### 7. Admin Controls (`admin.clar`)
- Defines administrative functions and access control
- Allows updating reward parameters by the contract owner

### 8. Consolidated Contract (`real_time_forecast.clar`)
- A simplified version that combines core functionality
- Includes weather data storage, user rewards, and submission logic

## Getting Started

### Prerequisites

- [Clarinet](https://github.com/hirosystems/clarinet) - A Clarity development tool
- [Node.js](https://nodejs.org/) - For running tests

### Installation

1. Clone the repository:
   ```
   git clone https://github.com/itzbayo/waether-forecasting-tracker.git
   cd waether-forecasting-tracker
   ```

2. Install dependencies:
   ```
   npm install
   ```

### Testing

Run the tests using Clarinet:
```
clarinet check
```

For more comprehensive testing with the test suite:
```
npm test
```

## Usage

### Submitting Weather Data

Users can submit weather data by calling the `submit-weather` function with the following parameters:
- `location`: A buffer representing the location (up to 32 bytes)
- `temperature`: An integer representing the temperature
- `condition`: A string describing the weather condition (up to 32 ASCII characters)

Example:
```clarity
(contract-call? .weather-submit submit-weather 0x0123456789ABCDEF 72 "Sunny")
```

### Querying Weather Data

To query weather data for a specific reporter and timestamp:
```clarity
(contract-call? .weather-query get-weather 'ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM u12345)
```

### Checking Rewards

Users can check their earned rewards:
```clarity
(contract-call? .reward-query my-rewards)
```

## Reward System

- Users receive 1,000,000 microSTX (1 STX) for each weather data submission
- Rewards are tracked in a user rewards map and transferred immediately
- The admin account is responsible for funding the rewards

## Security Considerations

### Data Validation
- All user inputs are validated before processing
- Temperature values have no specific range restrictions but could be implemented
- Location data is limited to 32 bytes
- Weather condition descriptions are limited to 32 ASCII characters

### Access Control
- Admin functions are protected by principal checks
- Only the contract owner can update reward parameters
- Anyone can submit weather data, but each submission is tied to their principal

### Potential Improvements
- Implement a verification mechanism for weather data accuracy
- Add rate limiting to prevent spam submissions
- Implement a more sophisticated reward system based on data quality

## License

This project is licensed under the ISC License - see the LICENSE file for details.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request
