//
//  ViewController.m
//  OLTextViewDemo
//
//  Created by ctkj108-xx on 16/3/16.
//  Copyright © 2016年 ctkj108-xx. All rights reserved.
//

#import "ViewController.h"
#import "OLTextView.h"

@interface ViewController ()
{
    OLTextView *_textInput;
}
@property (nonatomic, strong) NSLayoutConstraint *btmLayout;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _textInput = [[OLTextView alloc] init];
    _textInput.translatesAutoresizingMaskIntoConstraints = NO;
    [_textInput.heightAnchor constraintEqualToConstant:48].active = YES;
    self.btmLayout = [_textInput.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor];
    self.btmLayout.active = YES;
    [_textInput.leftAnchor constraintEqualToAnchor:self.view.leftAnchor].active = YES;
    [_textInput.rightAnchor constraintEqualToAnchor:self.view.rightAnchor].active = YES;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyFrameChange:) name:UIKeyboardWillChangeFrameNotification object:nil];
}

- (void)keyFrameChange:(NSNotification *)notify
{
    //    UIKeyboardFrameEndUserInfoKey
    //    UIKeyboardFrameBeginUserInfoKey
    //    UIKeyboardAnimationCurveUserInfoKey
    //    UIKeyboardAnimationDurationUserInfoKey
    CGRect beginFra = [notify.userInfo[UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    CGRect endFra = notify.userInfo[UIKeyboardFrameEndUserInfoKey];
    
}

@end
