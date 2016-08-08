//
//  UIView+VDAutoPanUp.m
//  objcInput
//
//  Created by Deng on 16/7/8.
//  Copyright © Deng. All rights reserved.
//

#import "UIView+VDAutoPanUp.h"

#import <objc/runtime.h>


@implementation UIView (VDAutoPanUp)

@dynamic vd_autoPanUpElement;

#pragma mark Public Method


#pragma mark Properties
- (void)setVd_autoPanUpElement:(VDAutoPanUpElement *)vd_autoPanUpElement {
    objc_setAssociatedObject(self, @selector(vd_autoPanUpElement), vd_autoPanUpElement, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (VDAutoPanUpElement *)vd_autoPanUpElement {
    return objc_getAssociatedObject(self, @selector(vd_autoPanUpElement));
}

#pragma mark Private Method


@end
