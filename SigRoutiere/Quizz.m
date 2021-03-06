//
//  Quiz.m
//  SigRoutiere
//
//  Created by Pear on 2015-12-11.
//  Copyright (c) 2015 Pear. All rights reserved.
//

#import "Quizz.h"


@implementation Quizz
@synthesize images, questions, answers,last3idx;
@synthesize questionText, offerGood, offerNot1, offerNot2, imgShow, choosen, isCorrect,score,percentage, questionNumber;




//

-(Quizz*)init
{
    self=[super init];
    [self readCSV];
    last3idx = [NSMutableArray arrayWithArray:@[@0,@0,@0]];
   // images = [NSMutableArray arrayWithObjects:@"P-10", @"P-20-1", @"P-40",@"P-110-5",@"D-100-2-D",@"D-361", nil];
   // answers = [NSMutableArray arrayWithObjects:@"u have to stop", @"you must yield", @"forbidden enter", @"no u-turn",@"courbe prononce a droite",@"dos d'ane", nil];
    
    questions =[NSMutableArray arrayWithObjects:@"what this sign means?", @"this is ?", @"???", nil];
    choosen=@"";
    score=0,percentage=0,questionNumber=0;
    
    
    
    return self;
}


-(void)readCSV{
    NSMutableArray *coImgName = [NSMutableArray array];
    NSMutableArray *coDescr = [NSMutableArray array];
    NSString *fileName = [[NSBundle mainBundle] pathForResource:@"quest" ofType:@"csv"];
    NSString *fileContents = [NSString stringWithContentsOfFile:fileName encoding:NSUTF8StringEncoding error:nil];
    NSArray* rows = [fileContents componentsSeparatedByString:@"\n"];
    for (NSString *row in rows){
        NSArray* columns = [row componentsSeparatedByString:@":"];
        [coImgName addObject:columns[0]];
        [coDescr addObject:columns[1]];
    }
    images=coImgName;
    answers=coDescr;
}

-(void)makeQuestion{
    NSMutableArray *a = [self make3randomNumbers];
    while ([last3idx containsObject:a[0]]) {
        a = [self make3randomNumbers];
    }
    int idx = [a[0] intValue];
    int idx1 = [a[1] intValue];
    int idx2 = [a[2] intValue];
    
    imgShow = [self.images objectAtIndex:idx];
    offerGood = [self.answers objectAtIndex:idx];
    offerNot1 = [self.answers objectAtIndex:idx1];
    offerNot2 = [self.answers objectAtIndex:idx2];
    
    //shift last3 used numbers array entries with new idx:
    last3idx[0]=last3idx[1];
    last3idx[1]=last3idx[2];
    last3idx[2]=[NSNumber numberWithInt:idx];
}

-(NSMutableArray*)make3randomNumbers{

    NSMutableArray *arr = [NSMutableArray new];
    while([arr count]<3){
        int rn = arc4random_uniform((int)images.count);
        if(![arr containsObject:[NSNumber numberWithInt:rn]])
            [arr addObject:[NSNumber numberWithInt:rn]];
    }
    return arr;
}

-(BOOL)checkAnswer{
    if ([choosen containsString:self.offerGood]) {
        self.score+=1;
        isCorrect=YES;
    }
    else isCorrect = NO;
    
    questionNumber+=1;
    //percentage = (questionNumber==0)?0:(score*100/questionNumber) ; //int??
    
    return isCorrect;
}


-(void)finish{
    [self makeQuestion];
    self.score = 0;
    self.percentage=0;
}

@end
