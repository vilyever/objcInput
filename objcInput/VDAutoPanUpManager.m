//
//  VDAutoPanUpManager.m
//  objcInput
//
//  Created by Deng on 16/7/8.
//  Copyright © Deng. All rights reserved.
//

#import "VDAutoPanUpManager.h"
#import <objcWindow/objcWindow.h>
#import <objcView/objcView.h>


@interface VDAutoPanUpManager ()

- (void)__i__onTextFieldDidBeginEditing:(NSNotification *)notification;
- (void)__i__onTextFieldDidEndEditing:(NSNotification *)notification;
- (void)__i__onTextViewDidBeginEditing:(NSNotification *)notification;
- (void)__i__onTextViewDidEndEditing:(NSNotification *)notification;

- (void)__i__onKeyboardWillShow:(NSNotification *)notification;
- (void)__i__onKeyboardDidShow:(NSNotification *)notification;;
- (void)__i__onKeyboardWillHide:(NSNotification *)notification;
- (void)__i__onKeyboardDidHide:(NSNotification *)notification;
- (void)__i__onKeyboardWillChangeFrame:(NSNotification *)notification;
- (void)__i__onKeyboardDidChangeFrame:(NSNotification *)notification;

@property (nonatomic, weak) UIView *currentResponder;

@end


@implementation VDAutoPanUpManager

#pragma mark Constructor
+ (VDAutoPanUpManager *)sharedManager {
    static id _sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc] init];
    } );
    
    return _sharedInstance;
}

#pragma mark Public Method
+ (void)triggerOn {
    [self triggerOnWithDefaultOffset:0.0f];
}

+ (void)triggerOnWithDefaultOffset:(CGFloat)offset {
    [VDAutoPanUpManager sharedManager].defalutPanUpOffset = offset;
}

#pragma mark Properties


#pragma mark Overrides
- (instancetype)init {
    self = [super init];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(__i__onTextFieldDidBeginEditing:) name:UITextFieldTextDidBeginEditingNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(__i__onTextFieldDidEndEditing:) name:UITextFieldTextDidEndEditingNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(__i__onTextViewDidBeginEditing:) name:UITextViewTextDidBeginEditingNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(__i__onTextFieldDidEndEditing:) name:UITextViewTextDidEndEditingNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(__i__onKeyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(__i__onKeyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(__i__onKeyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(__i__onKeyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(__i__onKeyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(__i__onKeyboardDidChangeFrame:) name:UIKeyboardDidChangeFrameNotification object:nil];
    
    return self;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


#pragma mark Delegates


#pragma mark Private Method
- (void)__i__onTextFieldDidBeginEditing:(NSNotification *)notification {
    self.currentResponder = notification.object;
}

- (void)__i__onTextFieldDidEndEditing:(NSNotification *)notification {
    self.currentResponder = nil;
}

- (void)__i__onTextViewDidBeginEditing:(NSNotification *)notification {
    self.currentResponder = notification.object;
}

- (void)__i__onTextViewDidEndEditing:(NSNotification *)notification {
//    self.currentResponder = nil;
}

- (void)__i__onKeyboardWillShow:(NSNotification *)notification {

}

- (void)__i__onKeyboardDidShow:(NSNotification *)notification {
    
}

- (void)__i__onKeyboardWillHide:(NSNotification *)notification {
    
}

- (void)__i__onKeyboardDidHide:(NSNotification *)notification {
}

- (void)__i__onKeyboardWillChangeFrame:(NSNotification *)notification {
    if (!self.currentResponder) {
        return;
    }
    
    CGFloat duration = [[[notification userInfo] objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    CGRect beginFrame = [[[notification userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    CGRect endFrame = [[[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    UIView *panUpView = VDWindow;
    CGFloat panUpOffset = self.defalutPanUpOffset;
    if (self.currentResponder.vd_autoPanUpElement) {
        panUpView = self.currentResponder.vd_autoPanUpElement.panUpView;
        panUpOffset = self.currentResponder.vd_autoPanUpElement.panUpOffset;
    }
    
    if (beginFrame.origin.y > endFrame.origin.y) {
        // show
        if (self.state == VDAutoPanUpStateOriginal) {
            // TODO: save original position
            if (self.currentResponder.vd_autoPanUpElement) {
                self.currentResponder.vd_autoPanUpElement.panUpViewOriginalY = panUpView.frame.origin.y;
            }
            else {
                self.originalWindowY = VDWindow.frame.origin.y;
            }
        }
        
        CGFloat responderViewYInWindow = [self.currentResponder convertPoint:CGPointZero toView:nil].y;
        CGFloat targetY = endFrame.origin.y - (self.currentResponder.vd_frameHeight + panUpOffset);
        
        if (targetY >= responderViewYInWindow) {
            return;
        }
        
        CGFloat panUpViewOriginalY = self.originalWindowY;
        if (self.currentResponder.vd_autoPanUpElement) {
            panUpViewOriginalY = self.currentResponder.vd_autoPanUpElement.panUpViewOriginalY;
        }
        
        [self.currentResponder.layer removeAllAnimations];
        self.state = VDAutoPanUpStateDoingPanUp;
        [UIView animateWithDuration:duration delay:0 options:(UIViewAnimationOptionBeginFromCurrentState) animations:^{
            panUpView.vd_frameY = panUpViewOriginalY - (responderViewYInWindow - targetY);
        } completion:^(BOOL finished) {
            if (finished) {
                self.state = VDAutoPanUpStateDonePanUp;
            }
        }];
    }
    else {
        // hide
        if (self.state == VDAutoPanUpStateOriginal) {
            return;
        }
        
        CGFloat panUpViewOriginalY = self.originalWindowY;
        if (self.currentResponder.vd_autoPanUpElement) {
            panUpViewOriginalY = self.currentResponder.vd_autoPanUpElement.panUpViewOriginalY;
        }
        
        [self.currentResponder.layer removeAllAnimations];
        self.state = VDAutoPanUpStateDoingPanBack;
        [UIView animateWithDuration:duration delay:0 options:(UIViewAnimationOptionBeginFromCurrentState) animations:^{
            panUpView.vd_frameY = panUpViewOriginalY;
        } completion:^(BOOL finished) {
            if (finished) {
                self.state = VDAutoPanUpStateOriginal;
            }
        }];
    }
    
}

- (void)__i__onKeyboardDidChangeFrame:(NSNotification *)notification {
}

@end
