//
//  QuizViewController.h
//  SigRoutiere
//
//  Created by Pear on 2016-03-13.
//  Copyright (c) 2016 OsadchukO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Quizz.h"

#define aqua [UIColor colorWithRed:0.0 green:30.0/255.0 blue:1.0 alpha:1.0]
#define c040    [UIColor colorWithRed:40.0/255.0 green:128.0/255.0 blue:1.0 alpha:1.0]

@interface QuizViewController : UIViewController <UIAlertViewDelegate>

{
    int score;
    Quizz *myQuiz;
    
}
@property (weak, nonatomic) IBOutlet UIImageView *imgDisplay;
@property (weak, nonatomic) IBOutlet UILabel *resultDisplay;
@property (weak, nonatomic) IBOutlet UILabel *scoreDisplay;
@property (weak, nonatomic) IBOutlet UIView *downBtnView;

@property (weak, nonatomic) IBOutlet UIButton *aBtn;
@property (weak, nonatomic) IBOutlet UIButton *bBtn;
@property (weak, nonatomic) IBOutlet UIButton *cBtn;
@property (weak, nonatomic) IBOutlet UIButton *endBtn;



- (IBAction)touchEndBtn:(id)sender;
- (IBAction)touchOfferBtn:(UIButton *)sender;
//- (IBAction)touchNextBtn:(UIButton *)sender;

- (void)doAlertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex;


@end
