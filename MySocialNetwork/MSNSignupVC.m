//
//  MSNSignupVC.m
//  MySocialNetwork
//
//  Created by iMokhles on 12/08/2017.
//  Copyright © 2017 iMokhles. All rights reserved.
//

#import "MSNSignupVC.h"
#import "MSNHelper.h"

@interface MSNSignupVC ()
@property (strong, nonatomic) IBOutlet UITextField *usernameTF;
@property (strong, nonatomic) IBOutlet UITextField *emailTF;
@property (strong, nonatomic) IBOutlet UITextField *passwordTF;
@property (strong, nonatomic) IBOutlet UITextField *confirmPasswordTF;
@property (strong, nonatomic) IBOutlet UIButton *signupBtn;
@property (strong, nonatomic) IBOutlet UIView *centerView;

@end

@implementation MSNSignupVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [MSNHelper setShadowForView:self.signupBtn color:[UIColor blackColor] offset:CGSizeMake(1, 1) radius:5.0 opacity:0.4];
    [MSNHelper setShadowForView:self.centerView color:[UIColor blackColor] offset:CGSizeMake(1, 1) radius:5.0 opacity:0.4];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backBtnClicked:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)signUpBtnClicked:(id)sender {
    
    if ([self checkFields]) {
        [MSNHelper showWarningAlertWithCancelButtonFromTarget:self withMessage:@"Everything is Okey, you are signed up now :)"];
    }
}
- (IBAction)loginBtnClicked:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        [[NSNotificationCenter defaultCenter] postNotificationName:@"MSNLoginVCNotification" object:nil];
    }];
}

- (BOOL)checkFields {
    
    // username check
    if (![MSNHelper isCorrectUserName:self.usernameTF.text]) {
        // something wrong
        [MSNHelper showWarningAlertWithCancelButtonFromTarget:self withMessage:@"Username is incorrect"];
        return NO;
    }
    
    // email check
    if (![MSNHelper isCorrectEmail:self.emailTF.text]) {
        // something wrong
        [MSNHelper showWarningAlertWithCancelButtonFromTarget:self withMessage:@"Email is incorrect"];
        return NO;
    }
    // password check
    if (![MSNHelper isCorrectPassword:self.passwordTF.text]) {
        // something wrong
        [MSNHelper showWarningAlertWithCancelButtonFromTarget:self withMessage:@"Password is incorrect"];
        return NO;
    }
    
    // password confirmation check
    if (![MSNHelper isPasswordsMatchs:self.passwordTF.text andConfirmation:self.confirmPasswordTF.text]) {
        // something wrong
        [MSNHelper showWarningAlertWithCancelButtonFromTarget:self withMessage:@"Passwords aren't match"];
        return NO;
    }
    
    
    return YES;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
