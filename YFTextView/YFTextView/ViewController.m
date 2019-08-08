//
//  ViewController.m
//  YFTextView
//
//  Created by yf on 2019/8/8.
//  Copyright © 2019 yf. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextViewDelegate>
@property (nonatomic,strong) UITextView *textView;
@end

@implementation ViewController

#define Main_Screen_Width      [[UIScreen mainScreen] bounds].size.width
#define Main_Screen_Height       [[UIScreen mainScreen] bounds].size.height
#define PFFont(F) [UIFont fontWithName:@"PingFangSC-Regular" size:F]



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.textView];
}


#pragma UITextView协议--------------------
- (void)textViewDidChange:(UITextView *)textView
{
    CGRect textViewFrame =  textView.frame;
    float height = textView.contentSize.height;
    if (height >= 120){
        height = 120;
    }
    if (height <= 32) {
        height = 32;
    }
    textViewFrame.size.height = height;
    [UIView animateWithDuration:0.35 animations:^{
        textView.frame = textViewFrame;
    } completion:nil];
}

- (void)scrollViewDidScroll:(UIScrollView*)scrollView {
    if (self.textView.frame.size.height <= 120 - 1    ) {
         scrollView.contentOffset = CGPointZero;
    }
}


-(UITextView *)textView
{
    if (!_textView) {
        _textView = [[UITextView alloc] initWithFrame:CGRectMake((Main_Screen_Width - 250) / 2.0, 200, 250, 32)];
        _textView.layer.cornerRadius = 4;
        _textView.layer.edgeAntialiasingMask = true;
        _textView.delegate = self;
        _textView.layer.borderWidth = 1;
        _textView.font = PFFont(14);
        _textView.bounces = false;
        self.textView.layer.borderColor = [UIColor blackColor].CGColor;
        // 适配光标 --上左下右
        _textView.contentInset = UIEdgeInsetsMake(10.0f, 0, 10.0f, 0);
    }
    return _textView;
}

@end
