//
//  VDAutoPanUpManager.h
//  objcInput
//
//  Created by Deng on 16/7/8.
//  Copyright © Deng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "UIView+VDAutoPanUp.h"

typedef NS_ENUM(NSInteger, VDAutoPanUpState) {
    VDAutoPanUpStateOriginal,
    VDAutoPanUpStateDoingPanUp,
    VDAutoPanUpStateDonePanUp,
    VDAutoPanUpStateDoingPanBack,
};

@class VDAutoPanUpManager;


@interface VDAutoPanUpManager : NSObject

#pragma mark Constructor
+ (VDAutoPanUpManager *)sharedManager;

#pragma mark Public Method
+ (void)triggerOn;
+ (void)triggerOnWithDefaultOffset:(CGFloat)offset;

#pragma mark Properties
@property (nonatomic, assign) CGFloat defalutPanUpOffset;
@property (nonatomic, assign) CGFloat originalWindowY;
@property (nonatomic, assign) VDAutoPanUpState state;

@end
