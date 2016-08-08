//
//  VDAutoPanUpElement.m
//  objcTemp
//
//  Created by Deng on 16/7/8.
//  Copyright © Deng. All rights reserved.
//

#import "VDAutoPanUpElement.h"
//#import "objcTemp.h"


@interface VDAutoPanUpElement ()


@end


@implementation VDAutoPanUpElement

#pragma mark Public Method
+ (instancetype)elementWithTargetView:(UIView *)targetView withPanUpView:(UIView *)panUpView withOffset:(CGFloat)panUpOffset {
    VDAutoPanUpElement *element = [[self alloc] init];
    element.targetView = targetView;
    element.panUpView = panUpView;
    element.panUpOffset = panUpOffset;
    
    return element;
}

#pragma mark Properties

#pragma mark Overrides
- (instancetype)init {
    self = [super init];
    
    return self;
}

- (void)dealloc {
    
}


#pragma mark Delegates


#pragma mark Private Method


@end
