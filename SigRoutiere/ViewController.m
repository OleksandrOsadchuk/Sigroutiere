//
//  ViewController.m
//  SigRoutiere
//
//  Created by Pear on 2015-12-07.
//  Copyright (c) 2015 Pear. All rights reserved.
//

#import "ViewController.h"
#import "QuizViewController.h"
#import "Quizz.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()
//@property (strong,nonatomic)IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet UIButton *testBtn;

@property (weak, nonatomic) IBOutlet UIButton *preBtn;
@property (weak, nonatomic) IBOutlet UIButton *dangerBtn;
@property (weak, nonatomic) IBOutlet UIButton *travoBtn;
@property (weak, nonatomic) IBOutlet UIButton *indBtn;

@end

@implementation ViewController
@synthesize preBtn,dangerBtn,travoBtn,indBtn,testBtn;


- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    for(UIButton *btn in self.view.subviews) {
        if ([btn isKindOfClass:[UIButton class]]) {
          
       // NSLog(@"btn name: %@", btn);
        
        btn.layer.cornerRadius = 6.0f;
        
        btn.layer.borderWidth = 1.0f;
        btn.layer.borderColor = c040.CGColor;
        btn.backgroundColor = c040;
        btn.clipsToBounds = YES;
        
        //doesn't work
        // btn.titleLabel.textColor = [UIColor whiteColor];
         
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:40];
        btn.titleLabel.adjustsFontSizeToFitWidth = true;
        btn.titleLabel.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
        btn.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        
        }
    }
    
    testBtn.layer.borderColor = [UIColor orangeColor].CGColor;
    testBtn.backgroundColor = [UIColor orangeColor];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
