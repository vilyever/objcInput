//
//  UIView+VDInputManager.h
//  objcInput
//
//  Created by Deng on 16/7/13.
//  Copyright © Deng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VDInputManager.h"


@interface UIView (VDInputManager)

#pragma mark Public Method
- (void)vd_addInputView:(id)inputView;
- (void)vd_addInputView:(id)inputView atIndex:(NSUInteger)index;

- (void)vd_clearInputViews;

- (void)vd_resignCurrentInputView;
- (void)vd_signUpFirstResponder:(id)inputView;

#pragma mark Properties
@property (nonatomic, strong) VDInputManager *vd_inputManager;

@property (nonatomic, assign) BOOL vd_inputManagerDisableJumpToPrev;
@property (nonatomic, assign) BOOL vd_inputManagerDisableJumpToNext;
@property (nonatomic, assign) BOOL vd_inputManagerDisableClear;
@property (nonatomic, assign) BOOL vd_inputManagerDisableDone;

@end
