//
//  IATimer.h
//  IAModules
//
//  Created by Alter on 2018/5/16.
//  Copyright © 2018年 Netease. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class IATimer;

@protocol IATimerDelegate <NSObject>

- (void)onTimer:(IATimer *)timer;

@end

@interface IATimer : NSObject

@property (nonatomic, strong, readonly, nullable) id userInfo;

- (void)startTimer:(NSTimeInterval)second
          delegate:(id<IATimerDelegate>)delegate
            repeat:(BOOL)repeat;

- (void)startTimer:(NSTimeInterval)second
          delegate:(id<IATimerDelegate>)delegate
          userInfo:(nullable id)userInfo
            repeat:(BOOL)repeat;

- (void)stopTimer;

@end

NS_ASSUME_NONNULL_END
