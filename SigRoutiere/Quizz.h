//
//  Quiz.h
//  SigRoutiere
//
//  Created by Pear on 2015-12-11.
//  Copyright (c) 2015 Pear. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Quizz : NSObject

@property (strong,nonatomic) NSString *questionText, *offerGood, *offerNot1, *offerNot2, *imgShow, *choosen;
@property (strong,nonatomic) NSMutableArray *questions,*answers, *images, *last3idx;
@property  int score, percentage;
@property int questionNumber;
@property BOOL isCorrect;

-(void)makeQuestion;
-(void)finish;
-(BOOL)checkAnswer;

@end
