//
//  IATimer.m
//  IAModules
//
//  Created by Alter on 2018/5/16.
//  Copyright © 2018年 Netease. All rights reserved.
//

#import "IATimer.h"

@interface IATimer () {
    NSTimer *_timer;
    id<IATimerDelegate> _delegate;
}

@property (nonatomic, strong) id userInfo;

@end

@implementation IATimer

- (void)dealloc {
    [self stopTimer];
}

- (void)startTimer:(NSTimeInterval)second delegate:(id<IATimerDelegate>)delegate repeat:(BOOL)repeat {
    [self startTimer:second delegate:delegate userInfo:nil repeat:repeat];
}

- (void)startTimer:(NSTimeInterval)second delegate:(id<IATimerDelegate>)delegate userInfo:(id)userInfo repeat:(BOOL)repeat {
    [self stopTimer];
    _delegate = delegate;
    _userInfo = userInfo;
    _timer = [NSTimer scheduledTimerWithTimeInterval:second
                                              target:self
                                            selector:@selector(onTimerDone:)
                                            userInfo:userInfo
                                             repeats:repeat];
}

- (void)stopTimer {
    if (_timer) {
        [_timer invalidate];
        _timer = nil;
    }
    _userInfo = nil;
    _delegate = nil;
}

#pragma mark - tt

- (void)onTimerDone:(NSTimer *)timer {
    if (_delegate && [_delegate conformsToProtocol:@protocol(IATimerDelegate)] && [_delegate respondsToSelector:@selector(onTimer:)]) {
        [_delegate onTimer:self];
    }
}

@end
