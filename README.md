objc-conditionally
==================

Objective-C conditionally chaining and execution, mainly useful for testing

```objc
  conditionallyChain(conditionallyNext(^BOOL() {
      return someVariable == someResult;
  }, ^{
      // Perform some action

  }, conditionallyNext(^BOOL() {
      return someOtherVariableAlteredByLastAction == someOtherResult;
  }, ^{
      // Perform further action

  }, conditionally(^BOOL() {
      return [SomeClass sharedInstance].someVariable == someFinalResult;
  }, ^{
      // Perform final action

  }))));
```
