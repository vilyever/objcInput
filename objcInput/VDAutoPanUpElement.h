//
//  VDAutoPanUpElement.h
//  objcTemp
//
//  Created by Deng on 16/7/8.
//  Copyright © Deng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class VDAutoPanUpElement;


@interface VDAutoPanUpElement : NSObject

#pragma mark Public Method
+ (instancetype)elementWithTargetView:(UIView *)targetView withPanUpView:(UIView *)panUpView withOffset:(CGFloat)panUpOffset;

#pragma mark Properties
@property (nonatomic, weak) UIView *targetView;
@property (nonatomic, weak) UIView *panUpView;
@property (nonatomic, assign) CGFloat panUpOffset;
@property (nonatomic, assign) CGFloat panUpViewOriginalY;
@end
