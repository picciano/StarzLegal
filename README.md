# StarzLegal

This is the legal framework for the Starz tvOS app. It iwll contain FAQ, terms and conditions, privacy policy, and account management.

[Carthage](https://github.com/picciano/StarzLegal) is the recommended way to install StarzLegal. Add the following to your cart file:

``` ruby
github "picciano/StarzLegal"
```

For manual installation. I recommend adding the project as a subproject to your project or workspace and adding the framework as a target dependency.

## Usage

```swift
import FAQ

let faq = FAQ().getFAQ()
```

Enjoy.
