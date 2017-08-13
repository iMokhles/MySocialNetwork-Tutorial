//
//  MSNHelper.h
//  MySocialNetwork
//
//  Created by iMokhles on 12/08/2017.
//  Copyright © 2017 iMokhles. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MSNHelper : NSObject

+ (void)showWarningAlertWithCancelButtonFromTarget:(UIViewController *)target;
+ (void)showWarningAlertWithCancelButtonFromTarget:(UIViewController *)target withMessage:(NSString *)message;

// theme methods
+ (void)setShadowForView:(UIView *)view color:(UIColor *)color offset:(CGSize)offset radius:(CGFloat)radius opacity:(CGFloat)opacity;

// checks methods
+ (BOOL)isCorrectUserName:(NSString *)username;
+ (BOOL)isCorrectEmail:(NSString *)email;
+ (BOOL)isCorrectPassword:(NSString *)password;
+ (BOOL)isPasswordsMatchs:(NSString *)password1 andConfirmation:(NSString *)password2;
@end
