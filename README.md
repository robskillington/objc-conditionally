objc-conditionally
==================

Objective-C conditionally chaining and execution, mainly useful for testing

```objc
  conditionallyChain(conditionallyNext(^BOOL() {
      return someVariable == someResult;
  }, ^{
      // Perform some action

  }, conditionallyNext(^BOOL() {
      return someLocalBooleanVariable;
  }, ^{
      // Perform further action

  }, conditionally(^BOOL() {
      return [SomeClass sharedInstance].someVariable == someOtherResult;
  }, ^{
      // Perform final action

  }))));
```
