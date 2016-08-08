//
//  UIView+VDInputManager.m
//  objcInput
//
//  Created by Deng on 16/7/13.
//  Copyright © Deng. All rights reserved.
//

#import "UIView+VDInputManager.h"

#import <objc/runtime.h>


@implementation UIView (VDInputManager)

@dynamic vd_inputManager;
@dynamic vd_inputManagerDisableJumpToPrev;
@dynamic vd_inputManagerDisableJumpToNext;
@dynamic vd_inputManagerDisableClear;
@dynamic vd_inputManagerDisableDone;

#pragma mark Public Method
- (void)vd_addInputView:(id)inputView {
    [self.vd_inputManager addInputView:inputView];
}

- (void)vd_addInputView:(id)inputView atIndex:(NSUInteger)index {
    [self.vd_inputManager addInputView:inputView atIndex:index];
}

- (void)vd_clearInputViews {
    [self.vd_inputManager clearInputViews];
}

- (void)vd_resignCurrentInputView {
    [self.vd_inputManager resignCurrentInputView];
}

- (void)vd_signUpFirstResponder:(id)inputView {
    [self.vd_inputManager signUpFirstResponder:inputView];
}

#pragma mark Properties
- (VDInputManager *)vd_inputManager {
    VDInputManager *inputManager = objc_getAssociatedObject(self, @selector(vd_inputManager));
    if (!inputManager) {
        inputManager = [[VDInputManager alloc] init];
        objc_setAssociatedObject(self, @selector(vd_inputManager), inputManager, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    return inputManager;
}

- (void)setVd_inputManagerDisableJumpToPrev:(BOOL)vd_inputManagerDisableJumpToPrev {
    objc_setAssociatedObject(self, @selector(vd_inputManagerDisableJumpToPrev), @(vd_inputManagerDisableJumpToPrev), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)vd_inputManagerDisableJumpToPrev {
    return [objc_getAssociatedObject(self, @selector(vd_inputManagerDisableJumpToPrev)) boolValue];
}

- (void)setVd_inputManagerDisableJumpToNext:(BOOL)vd_inputManagerDisableJumpToNext {
    objc_setAssociatedObject(self, @selector(vd_inputManagerDisableJumpToNext), @(vd_inputManagerDisableJumpToNext), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)vd_inputManagerDisableJumpToNext {
    return [objc_getAssociatedObject(self, @selector(vd_inputManagerDisableJumpToNext)) boolValue];
}

- (void)setVd_inputManagerDisableClear:(BOOL)vd_inputManagerDisableClear {
    objc_setAssociatedObject(self, @selector(vd_inputManagerDisableClear), @(vd_inputManagerDisableClear), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)vd_inputManagerDisableClear {
    return [objc_getAssociatedObject(self, @selector(vd_inputManagerDisableClear)) boolValue];
}

- (void)setVd_inputManagerDisableDone:(BOOL)vd_inputManagerDisableDone {
    objc_setAssociatedObject(self, @selector(vd_inputManagerDisableDone), @(vd_inputManagerDisableDone), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)vd_inputManagerDisableDone {
    return [objc_getAssociatedObject(self, @selector(vd_inputManagerDisableDone)) boolValue];
}


#pragma mark Private Method


@end
