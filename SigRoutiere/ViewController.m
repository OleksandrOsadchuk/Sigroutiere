//
//  ViewController.m
//  SigRoutiere
//
//  Created by Pear on 2015-12-07.
//  Copyright (c) 2015 Pear. All rights reserved.
//

#import "ViewController.h"
#import "quiz.h"

@interface ViewController ()
@property (strong,nonatomic)IBOutlet UIScrollView *scrollView;


@end

@implementation ViewController

- (void)viewDidLoad {

    self.scrollView.contentSize = CGSizeMake(400, 1000);
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (IBAction)danslaprochaineversion:(id)sender {
    UIAlertView *alertview = [[UIAlertView alloc]initWithTitle:@""
                                                     message:@"Dans une prochaine version"
                                                    delegate:nil
                                            cancelButtonTitle:@"OK"
                                            otherButtonTitles:nil, nil];
    [alertview show];
}
@end
