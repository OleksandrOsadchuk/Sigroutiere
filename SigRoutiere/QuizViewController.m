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
@property (nonatomic, retain) UILabel *scoreLbl, *rLbl;
@property (nonatomic, retain) NSString *testTitleStr, *scoreStr;
@end

@implementation QuizViewController
@synthesize imgDisplay, resultDisplay,scoreDisplay,aBtn,bBtn,cBtn, btnTemp, nextBtn, scoreLbl, rLbl, containerA, containerB,containerC;

char posLetter;
bool answered=NO;

-(void)setMyNavBackBtn{
    UIButton *bb = [[UIButton alloc] initWithFrame:CGRectMake(0,0,64,32)];
    [bb setBackgroundColor:c040];
    [bb setTitle:@"finir!" forState:UIControlStateNormal];
    [bb setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [bb.titleLabel setFont:[UIFont boldSystemFontOfSize:14.0]];
    [bb.layer setCornerRadius:6.0f];
    [bb.layer setMasksToBounds:YES];
    [bb.layer setBorderWidth:2.0f];
    [bb.layer setBorderColor: [[UIColor whiteColor] CGColor]];
    
    [bb addTarget:self action:@selector(touchEndBtn:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backBarButton = [[UIBarButtonItem alloc] initWithCustomView:bb];
    self.navigationItem.leftBarButtonItem=backBarButton;
}

-(void)setScoreLbl{
    scoreLbl = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 116, 32)];
    [scoreLbl setBackgroundColor:[UIColor clearColor]];
    [scoreLbl setFont:[UIFont systemFontOfSize:15.0]];
    [scoreLbl setText:@"TEST"];
    scoreLbl.textAlignment=NSTextAlignmentCenter;
    [scoreLbl.layer setCornerRadius:6.0f];
    [scoreLbl.layer setMasksToBounds:YES];
    [scoreLbl.layer setBorderWidth:2.0f];
    [scoreLbl.layer setBorderColor:[UIColor clearColor].CGColor];
    
    //UIBarButtonItem *rightLblItm = [[UIBarButtonItem alloc]initWithCustomView:scoreLbl];
    //self.navigationItem.rightBarButtonItem=rightLblItm;
    self.navigationItem.titleView = scoreLbl;
}

-(void)setRightLbl{
    rLbl = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 64, 32)];
    [rLbl setBackgroundColor:[UIColor clearColor]];
    [rLbl setFont:[UIFont systemFontOfSize:15.0]];
    [rLbl setText:@"RIGHT"];
    rLbl.textAlignment=NSTextAlignmentCenter;
    [rLbl.layer setCornerRadius:6.0f];
    [rLbl.layer setMasksToBounds:YES];
    [rLbl.layer setBorderWidth:2.0f];
    [rLbl.layer setBorderColor:[UIColor blackColor].CGColor];
    UIBarButtonItem *rItem = [[UIBarButtonItem alloc]initWithCustomView:rLbl];
    //UIBarButtonItem *rightLblItm = [[UIBarButtonItem alloc]initWithCustomView:scoreLbl];
    self.navigationItem.rightBarButtonItem=rItem;
   
    
}//???

-(void)setColorsAndButtons{
    
    for(UIButton *b in @[aBtn,bBtn,cBtn]) {
        if ([b isKindOfClass:[UIButton class]]) {
            b.layer.cornerRadius = 6.0f;
            //b.layer.borderWidth = 2.0f;
            //b.layer.borderColor = c040.CGColor;
            //[b setBackgroundColor:[UIColor clearColor]];
            //b.clipsToBounds = YES;
            //[b setTitleColor:c040 forState: normal ];
       
        }
    }
    for (UIView *v in @[containerA,containerB,containerC]){
        v.layer.cornerRadius = 7.0f;
        v.layer.borderWidth = 2.0f;
        v.layer.borderColor = c040.CGColor;
        v.clipsToBounds=YES;
        //v.layer.backgroundColor = [UIColor clearColor].CGColor;
    }
    
    [self resetBtnViews];
    
    nextBtn.layer.cornerRadius = 6.0f;
    nextBtn.layer.borderWidth = 2.0f;
    nextBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    nextBtn.clipsToBounds = YES;
    [nextBtn setTitleColor:[UIColor whiteColor] forState: normal ];

    
    resultDisplay.text = @" Veuillez choisir parmis a,b,c ... ";
    resultDisplay.backgroundColor = [UIColor clearColor];
    scoreDisplay.backgroundColor = [UIColor whiteColor];
}

-(void)resetBtnViews{
    
    for(UIButton *b in @[aBtn,bBtn,cBtn]) {
        if ([b isKindOfClass:[UIButton class]]) {
            [b setBackgroundColor:[UIColor whiteColor]];
            b.enabled=YES;
        }
    }
    for (UIView *v in @[containerA,containerB,containerC]){
        v.layer.backgroundColor = c040.CGColor;
        v.alpha=1.0f;
    }
}

-(void)doBtnFonts{
    
    for(UIButton *b in @[aBtn,bBtn,cBtn]) {
        if ([b isKindOfClass:[UIButton class]]) {
            
            b.titleLabel.minimumScaleFactor=0.2f;
            b.titleLabel.adjustsFontSizeToFitWidth=YES	;
            b.titleLabel.numberOfLines=2;
            //[b layoutIfNeeded];
            
            b.titleEdgeInsets = UIEdgeInsetsMake(1.0, 1.0, 1.0, 1.0);
            UILabel *titleLabel = b.titleLabel;
            NSDictionary *views = NSDictionaryOfVariableBindings(titleLabel);
            [b addConstraints:[NSLayoutConstraint constraintsWithVisualFormat: @"V:|[titleLabel]|" options:kNilOptions metrics:nil views:views]];

        }
    }
}

-(void)refreshNavBar{
    
    if(myQuiz.questionNumber<=1) {
        scoreLbl.layer.borderColor=[UIColor whiteColor].CGColor;
        scoreLbl.font=[UIFont systemFontOfSize:14.0];
    }
    scoreLbl.text = [NSString stringWithFormat:@"Score: %d/%d",myQuiz.score,myQuiz.questionNumber];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setMyNavBackBtn];
    [self setScoreLbl];
  
    
    self.navigationController.navigationBar.barStyle=UIBarStyleDefault;
    //self.navigationController.navigationBar.barTintColor=[UIColor lightGrayColor];
    [self setColorsAndButtons];
    //[self doBtnFonts];
    
    myQuiz = [Quizz new];
    [self showNewQuestion];
    
    
    // Do any additional setup after loading the view.
}

/*
-(void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
}
 */

-(void)showNewQuestion{
    
    [myQuiz makeQuestion];
    [self resetBtnViews];
    
//    aBtn.enabled = true; aBtn.alpha=1.0; aBtn.backgroundColor=[UIColor clearColor];
//    bBtn.enabled = true; bBtn.alpha=1.0; bBtn.backgroundColor=[UIColor clearColor];
//    cBtn.enabled = true; cBtn.alpha=1.0; cBtn.backgroundColor=[UIColor clearColor];
    // <<< in (void)resetBtnViews >>>
    

   
    //where put good offer
    int pos;
    NSString *putA, *putB, *putC;
    pos = arc4random_uniform(4);
    
    if (pos==1)         { putA = myQuiz.offerGood; putB = myQuiz.offerNot1; putC = myQuiz.offerNot2; posLetter = 'A';}
    else if (pos==2)    { putA = myQuiz.offerNot1; putB = myQuiz.offerGood; putC = myQuiz.offerNot2; posLetter = 'B';}
    else                { putA = myQuiz.offerNot1; putB = myQuiz.offerNot2; putC = myQuiz.offerGood; posLetter = 'C';}
    
    [aBtn setTitle:[NSString stringWithFormat: @"%@",putA] forState:UIControlStateNormal];
    [bBtn setTitle:[NSString stringWithFormat: @"%@",putB] forState:UIControlStateNormal];
    [cBtn setTitle:[NSString stringWithFormat: @"%@",putC] forState:UIControlStateNormal];
    
    [self doBtnFonts];

    imgDisplay.image = [UIImage imageNamed:myQuiz.imgShow];
    resultDisplay.text = @"Ce panneau indique: ";
    answered=NO;
}


- (IBAction)touchOfferBtn:(UIButton *)sender {
    
    aBtn.enabled = false;
    bBtn.enabled = false;
    cBtn.enabled = false;
    nextBtn.enabled = false;
    self.nextBtn.alpha=0.50;
    
    
    myQuiz.choosen=sender.titleLabel.text;
    
    if([myQuiz checkAnswer]){
        [sender setBackgroundColor:[UIColor greenColor]];
        //[sender.superview setBackgroundColor:[UIColor greenColor]];
        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1]];
        //[sender setBackgroundColor:[UIColor clearColor]];
        resultDisplay.text = @"Bonne réponse!";
    }else{
        [sender setBackgroundColor:[UIColor redColor]];
        //[sender.superview setBackgroundColor:[UIColor redColor]];
        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1]];
        //[sender setBackgroundColor:[UIColor clearColor]];
        resultDisplay.text = [NSString stringWithFormat: @"Incorrect! \n Bonne réponse: %c. %@",
                              posLetter,myQuiz.offerGood];
    }
    answered=YES;
    //aBtn.alpha=0.50;bBtn.alpha=0.50;cBtn.alpha=0.50;
    containerA.alpha=0.50;containerB.alpha=0.50;containerC.alpha=0.50;

    [self refreshNavBar];
    nextBtn.enabled=true;
    self.nextBtn.alpha=1.0;
    
    //[[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:2]];
}

- (IBAction)touchNextBtn:(UIButton *)sender{
    if (!answered) {
        myQuiz.questionNumber+=1;
    }
    [self refreshNavBar];
    [self showNewQuestion];
}

-(void)touchEndBtn:(id)sender {
    
    float percent = (myQuiz.questionNumber==0)?0:(myQuiz.score*100/myQuiz.questionNumber) ; //float
    
    NSString *message = [NSString stringWithFormat:@"Bonnes réponses: %d sur %d questions\n (%2.0f %%)",myQuiz.score, myQuiz.questionNumber, percent];
    UIAlertView *testEndAlert = [[UIAlertView alloc] initWithTitle:@"Finir ?"
                                                            message:message
                                                            delegate:self
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles:@"Non", nil];
    [testEndAlert show];
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:2]];
    //[self alertView:testEndAlert didDismissWithButtonIndex:(0)]; user should do it, not controller...
  }

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    // the user clicked OK
    if (buttonIndex == 0) {
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
    if (buttonIndex==1) {
        //cancel just dismiss
    }
}

//////////////////////////////////////////////////////////////

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
