//
//  SRCustomSegue.m
//  SigRoutiere
//
//  Created by Pear on 2016-02-13.
//  Copyright (c) 2016 OsadchukO. All rights reserved.
//

#import "SRCustomSegue.h"

@implementation SRCustomSegue

- (void)perform {
    // added (github)  animation

    UIViewController* source = (UIViewController *)self.sourceViewController;
    UIViewController* destination = (UIViewController *)self.destinationViewController;
    
    CGRect sourceFrame = source.view.frame;
    sourceFrame.origin.x = -sourceFrame.size.width;
    
    CGRect destFrame = destination.view.frame;
    destFrame.origin.x = destination.view.frame.size.width;
    destination.view.frame = destFrame;
    
    destFrame.origin.x = 0;
    
    [source.view.superview addSubview:destination.view];
    
    [UIView animateWithDuration:0.2
                     animations:^{
                         source.view.frame = sourceFrame;
                         destination.view.frame = destFrame;
                     }
                     completion:^(BOOL finished) {
                         UIWindow *window = source.view.window;
                         [window setRootViewController:destination];
                     }];
    
    //apple simple no anim
   // [[self sourceViewController] presentViewController:[self destinationViewController] animated:NO completion:nil];
}

@end
