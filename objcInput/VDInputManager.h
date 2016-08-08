//
//  VDInputManager.h
//  objcInput
//
//  Created by Deng on 16/7/13.
//  Copyright © Deng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class VDInputManager;


@interface VDInputManager : NSObject

#pragma mark Public Method
- (void)addInputView:(id)inputView;
- (void)addInputView:(id)inputView atIndex:(NSUInteger)index;

- (void)clearInputViews;

- (void)resignCurrentInputView;
- (void)signUpFirstResponder:(id)inputView;

#pragma mark Properties
@property (nonatomic, strong) UIToolbar *inputAccessoryToolBar;

@property (nonatomic, strong) UIBarButtonItem *prevBarButtonItem;
@property (nonatomic, strong) UIBarButtonItem *nextBarButtonItem;
@property (nonatomic, strong) UIBarButtonItem *clearBarButtonItem;
@property (nonatomic, strong) UIBarButtonItem *doneBarButtonItem;

@property (nonatomic, strong) NSMutableArray *inputViews;

@property (nonatomic, weak) id currentInputView;
@property (nonatomic, weak) id prevInputView;
@property (nonatomic, weak) id nextInputView;

@property (nonatomic, assign) BOOL disablePrev;
@property (nonatomic, assign) BOOL disableNext;
@property (nonatomic, assign) BOOL disableClear;
@property (nonatomic, assign) BOOL disableDone;

#pragma mark Private Method


@end
