A comprehensive iOS app for tracking your Pet's health, wellness, and daily activities.

## Features

### 🏥 Health Monitoring
- **Vet Appointments**: Schedule and track veterinary visits
- **Medications**: Manage medication schedules and reminders
- **Vaccinations**: Keep vaccination records up to date
- **Weight Tracking**: Monitor weight changes over time
- **Symptoms Log**: Record and track health symptoms

### 🎾 Activity & Wellness
- **Daily Walks**: Track walk duration, distance, and routes
- **Exercise Log**: Record various activities and play sessions
- **Sleep Tracking**: Monitor rest and sleep patterns
- **Mood Tracking**: Log your dog's mood and behavior

### 🍖 Nutrition
- **Feeding Schedule**: Track meal times and portions
- **Food Diary**: Log treats and special foods
- **Water Intake**: Monitor daily hydration
- **Weight Management**: Connect nutrition to weight goals

### 📊 Analytics & Insights
- **Health Dashboard**: Visual overview of all metrics
- **Progress Reports**: Weekly and monthly summaries
- **Trend Analysis**: Identify patterns in health and behavior
- **Export Data**: Share reports with your veterinarian

## Tech Stack

- **Platform**: iOS 16.0+
- **Language**: Swift 5.9
- **UI Framework**: SwiftUI
- **Data Persistence**: Core Data
- **Architecture**: MVVM
- **Location Services**: Core Location
- **Health Integration**: HealthKit (future)
- **Cloud Sync**: CloudKit (future)

## Getting Started

### Prerequisites
- Xcode 15.0 or later
- iOS 16.0+ deployment target
- Apple Developer Account (for device testing)

### Installation

1. Clone the repository:
```bash
git clone https://github.com/wilmarino1/PawTracker-iOS.git
cd PawTracker-iOS
```

2. Open the project in Xcode:
```bash
open PawTracker.xcodeproj
```

3. Build and run the project (⌘+R)

## Project Structure

```
PawTracker/
├── App/
│   ├── PawTrackerApp.swift
│   └── ContentView.swift
├── Models/
│   ├── Dog.swift
│   ├── HealthRecord.swift
│   ├── Activity.swift
│   └── Nutrition.swift
├── Views/
│   ├── Dashboard/
│   ├── Health/
│   ├── Activity/
│   ├── Nutrition/
│   └── Profile/
├── ViewModels/
├── Services/
│   ├── DataManager.swift
│   ├── LocationManager.swift
│   └── NotificationManager.swift
├── Utils/
└── Resources/
    ├── Assets.xcassets
    └── PawTracker.xcdatamodeld
```

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## Roadmap

- [ ] Core Data model implementation
- [ ] Basic CRUD operations for dogs
- [ ] Health tracking features
- [ ] Activity logging with GPS (uber future)
- [ ] Nutrition tracking
- [ ] Dashboard with charts
- [ ] Reminder notifications
- [ ] Photo attachments
- [ ] Friend and Activity challenges
- [ ] Data export functionality
- [ ] CloudKit synchronization
- [ ] Apple Watch companion app
- [ ] Widget support
- [ ] HealthKit integration

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Support

If you have any questions or suggestions, please open an issue or contact the development team.

---

**Made with ❤️ for pet lovers everywhere**`


Copyright (c) 2025 PawTracker iOS

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the \"Software\"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.`

Thank you for your interest in contributing to PawTracker! This document provides guidelines and information for contributors.

## Code of Conduct

By participating in this project, you agree to abide by our Code of Conduct. Please treat all contributors and users with respect.

## How to Contribute

### Reporting Bugs

1. Check if the bug has already been reported in [Issues](https://github.com/wilmarino1/PawTracker-iOS/issues)
2. If not, create a new issue with:
   - Clear title and description
   - Steps to reproduce
   - Expected vs actual behavior
   - iOS version and device information
   - Screenshots if applicable

### Suggesting Features

1. Check existing [Issues](https://github.com/wilmarino1/PawTracker-iOS/issues) for similar suggestions
2. Create a new issue with:
   - Clear feature description
   - Use case and benefits
   - Possible implementation approach

### Code Contributions

#### Setup Development Environment

1. Fork the repository
2. Clone your fork: `git clone https://github.com/YOUR_USERNAME/PawTracker-iOS.git`
3. Create a new branch: `git checkout -b feature/your-feature-name`
4. Open the project in Xcode 15.0+

#### Coding Guidelines

**Swift Style Guide**
- Follow [Swift API Design Guidelines](https://swift.org/documentation/api-design-guidelines/)
- Use meaningful variable and function names
- Keep functions small and focused
- Add documentation comments for public APIs

**SwiftUI Best Practices**
- Use `@State` for local view state
- Use `@ObservedObject` or `@StateObject` for external data
- Keep views small and composable
- Extract complex layouts into separate view components

**Code Organization**
- Follow the established folder structure
- Group related functionality together
- Use extensions to organize protocol conformance
- Keep imports minimal and organized

#### Commit Guidelines

Use conventional commit messages:
- `feat:` new features
- `fix:` bug fixes
- `docs:` documentation changes
- `style:` code style changes
- `refactor:` code refactoring
- `test:` adding tests
- `chore:` maintenance tasks

Example: `feat: add medication reminder notifications`

#### Pull Request Process

1. Ensure your code follows the style guidelines
2. Add or update tests as needed
3. Update documentation if required
4. Make sure all tests pass
5. Create a pull request with:
   - Clear title and description
   - Reference related issues
   - List of changes made
   - Screenshots for UI changes

#### Testing

- Write unit tests for new functionality
- Ensure existing tests continue to pass
- Test on multiple iOS versions and devices when possible
- Include UI tests for critical user flows

## Development Workflow

### Branch Strategy

- `main`: Production-ready code
- `develop`: Integration branch for features
- `feature/*`: New features
- `fix/*`: Bug fixes
- `release/*`: Release preparation

### Architecture Guidelines

**MVVM Pattern**
- Models: Data structures and Core Data entities
- Views: SwiftUI views (minimal logic)
- ViewModels: Business logic and data binding

**Services**
- DataManager: Core Data operations
- LocationManager: GPS and location services
- NotificationManager: Local notifications

### Core Data Guidelines

- Use meaningful entity and attribute names
- Set up proper relationships
- Handle migration when changing the model
- Use NSFetchedResultsController for efficient data fetching

## Project Priorities

### High Priority
- Core functionality (CRUD operations)
- Data persistence
- User experience
- Performance optimization

### Medium Priority
- Advanced features
- Integrations (HealthKit, CloudKit)
- Accessibility improvements

### Low Priority
- UI polish
- Additional customization options
- Nice-to-have features

## Getting Help

- Check the [README](README.md) for basic setup
- Review existing code for patterns and examples
- Ask questions in issues or discussions
- Reach out to maintainers if needed

## Recognition

Contributors will be recognized in:
- README contributors section
- Release notes
- App credits (for significant contributions)

Thank you for helping make PawTracker better for pet owners!
