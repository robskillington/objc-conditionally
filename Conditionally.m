//
//  Conditionally.m
//  MIT License: https://github.com/robskillington/objc-conditionally/blob/master/LICENSE
//  Rob Skillington
// 

#import "Conditionally.h"

ExecuteBlock conditionallyNext(ConditionalTestBlock tester, ExecuteBlock exec, ExecuteBlock next) {
    ExecuteBlock inner = ^{
        NSDate *start = [NSDate date];
        __block ExecuteBlock block = ^{
            if (!tester()) {
                if ([[NSDate date] timeIntervalSinceDate:start] > ConditionalExecuteBlockTimeout) {
                    // Timeout
                } else {
                    dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(ConditionalExecuteBlockTestInterval * NSEC_PER_SEC));
                    dispatch_after(time, dispatch_get_main_queue(), block);
                }
            } else {
                exec();
                if (next) {
                    next();
                }
            }
        };
        block();
    };
    return inner;
}

ExecuteBlock conditionally(ConditionalTestBlock tester, ExecuteBlock exec) {
    return conditionallyNext(tester, exec, nil);
}

void conditionallyChain(ExecuteBlock first) {
    first();
}
