//
//  quiz.h
//  SigRoutiere
//
//  Created by Pear on 2015-12-11.
//  Copyright (c) 2015 Pear. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface quiz : NSObject

@property (strong,nonatomic) NSString *questionLabel, *offer1, *offer2, *offer3;
@property (strong,nonatomic) NSMutableArray *offers;
@property (strong,nonatomic) NSString *questionSign;
@property (strong,nonatomic) NSMutableArray *signs;

-(void)makeQuestion;





@end
