//
//  MSNHelper.m
//  MySocialNetwork
//
//  Created by iMokhles on 12/08/2017.
//  Copyright © 2017 iMokhles. All rights reserved.
//

#import "MSNHelper.h"

@implementation MSNHelper

+ (void)showWarningAlertWithCancelButtonFromTarget:(UIViewController *)target {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Warning" message:@"Something Went Wrong :(" preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    [target presentViewController:alert animated:YES completion:nil];
}
+ (void)showWarningAlertWithCancelButtonFromTarget:(UIViewController *)target withMessage:(NSString *)message {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Warning" message:message preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    [target presentViewController:alert animated:YES completion:nil];
}
+ (void)setShadowForView:(UIView *)view color:(UIColor *)color offset:(CGSize)offset radius:(CGFloat)radius opacity:(CGFloat)opacity {
    
    view.layer.shadowColor = [color CGColor];
    view.layer.shadowOffset = offset;
    view.layer.shadowRadius = radius;
    view.layer.shadowOpacity = opacity;
}

// checks
+ (BOOL)isCorrectUserName:(NSString *)username {
    
    if (username.length > 10) {
        return NO;
    }
    if (username.length == 0) {
        return NO;
    }
    if ([username containsString:@" "]) {
        return NO;
    }
    return YES;
}
+ (BOOL)isCorrectEmail:(NSString *)email {
    BOOL strictFilter = NO;
    NSString *strictFilterString = @"[A-Z0-9a-z\\._%+-]+@([A-Az-z0-9-]+\\.)+[A-Za-z]{2,4})";
    NSString *lastString = @".+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*";
    
    NSString *emailRegax = strictFilter ? strictFilterString : lastString;
    NSPredicate *emailPred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegax];
    return [emailPred evaluateWithObject:email];
}
+ (BOOL)isCorrectPassword:(NSString *)password {
    if (password.length < 6) {
        return NO;
    }
    if (password.length == 0) {
        return NO;
    }
    
    return YES;
}
+ (BOOL)isPasswordsMatchs:(NSString *)password1 andConfirmation:(NSString *)password2 {
    return [password2 isEqualToString:password1];
}
@end
