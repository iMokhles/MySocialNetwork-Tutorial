//
//  ViewController.m
//  MySocialNetwork
//
//  Created by iMokhles on 12/08/2017.
//  Copyright © 2017 iMokhles. All rights reserved.
//

#import "ViewController.h"
#import "MSNHelper.h"

#import "MSNLoginVC.h"
#import "MSNSignupVC.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIButton *signupBtn;
@property (strong, nonatomic) IBOutlet UIButton *loginBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loginBtnClicked:) name:@"MSNLoginVCNotification" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(signupBtnClicked:) name:@"MSNSignupVCNotification" object:nil];
    
    [MSNHelper setShadowForView:self.signupBtn color:[UIColor blackColor] offset:CGSizeMake(1, 1) radius:5.0 opacity:0.4];
    [MSNHelper setShadowForView:self.loginBtn color:[UIColor blackColor] offset:CGSizeMake(1, 1) radius:5.0 opacity:0.4];
}

- (IBAction)loginBtnClicked:(id)sender {
    MSNLoginVC *loginVC = [self.storyboard instantiateViewControllerWithIdentifier:@"loginVC"];
    [self presentViewController:loginVC animated:YES completion:nil];
}
- (IBAction)signupBtnClicked:(id)sender {
    MSNSignupVC *signupVC = [self.storyboard instantiateViewControllerWithIdentifier:@"signupVC"];
    [self presentViewController:signupVC animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
