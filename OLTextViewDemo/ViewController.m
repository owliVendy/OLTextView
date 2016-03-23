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
    UIView *_barContainer;
}
@property (nonatomic, strong) NSLayoutConstraint *btmLayout;
@end

@implementation ViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    _barContainer = [[UIView alloc] init];
    _barContainer.backgroundColor = [UIColor lightGrayColor];
    _barContainer.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:_barContainer];
    
    _textInput = [[OLTextView alloc] init];
    _textInput.layer.cornerRadius = 7;
    _textInput.layer.borderWidth = 1.f;
    _textInput.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _textInput.font = [UIFont systemFontOfSize:17];
    [_barContainer addSubview:_textInput];
    _textInput.translatesAutoresizingMaskIntoConstraints = NO;
    
    [_barContainer.heightAnchor constraintGreaterThanOrEqualToConstant:48].active = YES;
    [_barContainer.leftAnchor constraintEqualToAnchor:self.view.leftAnchor].active = YES;
    [_barContainer.rightAnchor constraintEqualToAnchor:self.view.rightAnchor].active = YES;
    self.btmLayout = [self.view.bottomAnchor constraintEqualToAnchor:_barContainer.bottomAnchor];
    self.btmLayout.active = YES;
    
    [_textInput.leftAnchor constraintEqualToAnchor:_barContainer.leftAnchor constant:10].active = YES;
    [_textInput.rightAnchor constraintEqualToAnchor:_barContainer.rightAnchor constant:-10].active = YES;
    [_textInput.topAnchor constraintEqualToAnchor:_barContainer.topAnchor constant:5].active = YES;
    [_textInput.bottomAnchor constraintEqualToAnchor:_barContainer.bottomAnchor constant:-5].active = YES;
    
    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapBg:)]];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyFrameChange:) name:UIKeyboardWillChangeFrameNotification object:nil];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - action
- (void)tapBg:(id)sender
{
    [self.view endEditing:YES];
}

#pragma mark - noti
- (void)keyFrameChange:(NSNotification *)notify
{
    CGRect beginFra = [notify.userInfo[UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    CGRect endFra = [notify.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat duration = [notify.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];
    int curve = [notify.userInfo[UIKeyboardAnimationCurveUserInfoKey] intValue];
    
    CGFloat offsety = beginFra.origin.y - endFra.origin.y;
    if (offsety > 0) {
        //键盘往上
    } else {
        
    }
    
    [self.view removeGestureRecognizer:self.view.gestureRecognizers.firstObject];
    [UIView animateWithDuration:duration delay:0 options:curve animations:^{
        self.btmLayout.constant += offsety;
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapBg:)]];
    }];
}

@end
