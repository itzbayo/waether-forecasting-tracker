# Contributing to Weather Forecasting Tracker

Thank you for your interest in contributing to the Weather Forecasting Tracker project! This document provides guidelines and instructions for contributing.

## Code of Conduct

Please be respectful and considerate of others when contributing to this project.

## How to Contribute

### Reporting Bugs

If you find a bug, please create an issue with the following information:
- A clear, descriptive title
- Steps to reproduce the bug
- Expected behavior
- Actual behavior
- Any relevant logs or screenshots

### Suggesting Enhancements

If you have ideas for enhancements, please create an issue with:
- A clear, descriptive title
- A detailed description of the enhancement
- Any relevant examples or mockups

### Pull Requests

1. Fork the repository
2. Create a new branch (`git checkout -b feature/your-feature-name`)
3. Make your changes
4. Run tests to ensure your changes don't break existing functionality
5. Commit your changes (`git commit -m 'Add some feature'`)
6. Push to the branch (`git push origin feature/your-feature-name`)
7. Open a Pull Request

## Development Setup

1. Clone the repository:
   ```
   git clone https://github.com/itzbayo/waether-forecasting-tracker.git
   cd waether-forecasting-tracker
   ```

2. Install dependencies:
   ```
   npm install
   ```

3. Make sure Clarinet is installed for smart contract development and testing.

## Testing

Before submitting a pull request, please run the tests:
```
clarinet check
npm test
```

## Coding Standards

- Follow the existing code style
- Write clear, descriptive commit messages
- Include comments for complex logic
- Update documentation when necessary

## Smart Contract Development Guidelines

When working with Clarity smart contracts:

1. Always check for potential security vulnerabilities
2. Use proper error handling with meaningful error codes
3. Optimize for gas efficiency
4. Include thorough test coverage for all functions
5. Document public functions with clear descriptions of parameters and return values

## License

By contributing to this project, you agree that your contributions will be licensed under the project's license.

Thank you for contributing to the Weather Forecasting Tracker project!
