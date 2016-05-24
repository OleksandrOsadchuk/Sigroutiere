//
//  QuizViewController.m
//  SigRoutiere
//
//  Created by Pear on 2016-03-13.
//  Copyright (c) 2016 OsadchukO. All rights reserved.
//

#import "QuizViewController.h"
#import <QuartzCore/QuartzCore.h>



@interface QuizViewController ()



@property (nonatomic, retain) UIButton *btnTemp;

@end

@implementation QuizViewController
@synthesize imgDisplay, resultDisplay,scoreDisplay,aBtn,bBtn,cBtn, btnTemp, endBtn, downBtnView;

char posLetter;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //colors makeup
    
    for(UIButton *b in @[aBtn,bBtn,cBtn]) {
       
        if ([b isKindOfClass:[UIButton class]]) {
            
            b.layer.cornerRadius = 6.0f;
            b.layer.borderWidth = 2.0f;
            b.layer.borderColor = c040.CGColor;
            b.backgroundColor = [UIColor clearColor];
            b.clipsToBounds = YES;
            [b setTitleColor:c040 forState: normal ];
        }
    }
    
    resultDisplay.text = @" Veuillez choisir parmis a,b,c ... ";
    resultDisplay.backgroundColor = [UIColor clearColor];
    
    scoreDisplay.backgroundColor = [UIColor whiteColor];

    
    downBtnView.layer.borderColor = c040.CGColor;
    downBtnView.layer.borderWidth = 2.0f;
    downBtnView.layer.cornerRadius = 6.0f;
    downBtnView.layer.backgroundColor = [UIColor greenColor].CGColor;
    downBtnView.clipsToBounds=true;
   
    
    
    myQuiz = [Quizz new];
    
    
    [self showNewQuestion];
    
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];   //it hides
}

-(void)showNewQuestion
{
    [myQuiz makeQuestion];
    
    
    aBtn.enabled = true;
    bBtn.enabled = true;
    [cBtn setEnabled:true]; // enabled:true];

    
   
    //where put good offer
    int pos;
    NSString *putA, *putB, *putC;
    
    pos = arc4random_uniform(4);
    
    if (pos==1)         { putA = myQuiz.offerGood; putB = myQuiz.offerNot1; putC = myQuiz.offerNot2; posLetter = 'A';}
    else if (pos==2)    { putA = myQuiz.offerNot1; putB = myQuiz.offerGood; putC = myQuiz.offerNot2; posLetter = 'B';}
    else                { putA = myQuiz.offerNot1; putB = myQuiz.offerNot2; putC = myQuiz.offerGood; posLetter = 'C';}
    
    
    [aBtn setTitle:[NSString stringWithFormat: @"A. %@",putA] forState:UIControlStateNormal];
    [bBtn setTitle:[NSString stringWithFormat: @"B. %@",putB] forState:UIControlStateNormal];
    [cBtn setTitle:[NSString stringWithFormat: @"C. %@",putC] forState:UIControlStateNormal];
    
    if (myQuiz.questionNumber<1) {
        scoreDisplay.text = [NSString stringWithFormat:@"score is: %d/%d      ",
                             myQuiz.score,myQuiz.questionNumber] ;
    } else {
    scoreDisplay.text = [NSString stringWithFormat:@"score is: %d/%d  (%d%%)  ",
                         myQuiz.score,myQuiz.questionNumber,(myQuiz.score*100/myQuiz.questionNumber)] ;
    }
    
    imgDisplay.image = [UIImage imageNamed:myQuiz.imgShow];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)doAlertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    // the user clicked OK
    if (buttonIndex == 0) {
        // do something here...
        UIViewController *mainVC = [self.storyboard instantiateViewControllerWithIdentifier:@"navVC"];
        [self presentViewController:mainVC animated:YES completion:nil];
    }
}

- (IBAction)touchEndBtn:(id)sender {
    
    NSString *message = [NSString stringWithFormat:@"Votre mark final: %d%%",myQuiz.percentage];
    UIAlertView *testEndAlert = [[UIAlertView alloc]   initWithTitle:@"Fini!"
                                                            message:message
                                                            delegate:nil
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles:nil, nil];
    
    [testEndAlert show];
    [self doAlertView:testEndAlert didDismissWithButtonIndex:(0)];
    
  //  UIViewController *mainVC = [self.storyboard instantiateViewControllerWithIdentifier:@"mainVC"];
  //  [self presentViewController:mainVC animated:YES completion:nil];



}

- (IBAction)touchOfferBtn:(UIButton *)sender {
    
    aBtn.enabled = false;
    bBtn.enabled = false;
    cBtn.enabled = false;
    
    myQuiz.choosen=sender.titleLabel.text;
    
    if([myQuiz checkAnswer])
        {
            [sender setBackgroundColor:[UIColor greenColor]];
            [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:2]];
            [sender setBackgroundColor:[UIColor clearColor]];
           
            resultDisplay.text = @"Bonne réponse!";
        }
    else
        {
            [sender setBackgroundColor:[UIColor redColor]];
            [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:2]];
            [sender setBackgroundColor:[UIColor clearColor]];
            
            resultDisplay.text = [NSString stringWithFormat: @"incorrect! \n Response est: %c. %@",
                                  posLetter,myQuiz.offerGood];
        }
    
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:2]];
    
    [self showNewQuestion];
}


@end
