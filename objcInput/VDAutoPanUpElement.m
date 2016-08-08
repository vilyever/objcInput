//
//  VDAutoPanUpElement.m
//  objcInput
//
//  Created by Deng on 16/7/8.
//  Copyright © Deng. All rights reserved.
//

#import "VDAutoPanUpElement.h"


@interface VDAutoPanUpElement ()


@end


@implementation VDAutoPanUpElement

#pragma mark Constructor
+ (instancetype)elementWithTargetView:(UIView *)targetView panUpView:(UIView *)panUpView panUpOffset:(CGFloat)panUpOffset {
    return [[self alloc] initWithTargetView:targetView panUpView:panUpView panUpOffset:panUpOffset];
}

- (instancetype)initWithTargetView:(UIView *)targetView panUpView:(UIView *)panUpView panUpOffset:(CGFloat)panUpOffset {
    self = [super init];
    
    _targetView = targetView;
    _panUpView = panUpView;
    _panUpOffset = panUpOffset;
    
    return self;
}

#pragma mark Public Method


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
