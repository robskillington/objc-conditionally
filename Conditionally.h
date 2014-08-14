//
//  Conditionally.h
//  MIT License: https://github.com/robskillington/objc-conditionally/blob/master/LICENSE
//  Rob Skillington
// 

static const NSTimeInterval ConditionalExecuteBlockTestInterval = 0.01;
static const NSTimeInterval ConditionalExecuteBlockTimeout = 2.0;
typedef BOOL (^ConditionalTestBlock)();
typedef void (^ExecuteBlock)();
typedef ExecuteBlock (^ConditionalExecuteBlock)(ConditionalTestBlock tester, ExecuteBlock exec, id next);
