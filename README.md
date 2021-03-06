# StarzLegal.framework

[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

This is the legal framework for the Starz tvOS app. It will contain FAQ, terms and conditions, privacy policy, and account management.

[Carthage](https://github.com/picciano/StarzLegal) is the recommended way to install StarzLegal. Add the following to your cart file:

``` ruby
github "picciano/StarzLegal"
```

For manual installation. I recommend adding the project as a subproject to your project or workspace and adding the framework as a target dependency.

## Usage

```swift
import FAQ

FAQ.sharedInstance.loadFAQs { (result, error) -> Void in
  if let result = result {
      for section in result {
          debugPrint("Section name: \(section.name!)")
          
          for question in section.questions! {
              debugPrint("Question: \(question.question!)")
              debugPrint("Answer: \(question.answer!)")
          }
      }
  }

  if (error != nil) {
    debugPrint(error)
  }
}
```

### Register for notifications (optional)

```swift
NSNotificationCenter.defaultCenter().addObserver(self, selector: "faqsDidLoadHandler:", name: FAQsDidLoadNotification, object: nil)
```

Enjoy.
