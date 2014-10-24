//
//  ViewController.m
//  TicTacToe
//
//  Created by Jonathan Chou on 10/23/14.
//  Copyright (c) 2014 Jonathan Chou. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *labelOne;
@property (weak, nonatomic) IBOutlet UILabel *labelTwo;
@property (weak, nonatomic) IBOutlet UILabel *labelThree;
@property (weak, nonatomic) IBOutlet UILabel *labelFour;
@property (weak, nonatomic) IBOutlet UILabel *labelFive;
@property (weak, nonatomic) IBOutlet UILabel *labelSix;
@property (weak, nonatomic) IBOutlet UILabel *labelSeven;
@property (weak, nonatomic) IBOutlet UILabel *labelEight;
@property (weak, nonatomic) IBOutlet UILabel *labelNine;
@property (weak, nonatomic) IBOutlet UILabel *whichPlayerLabel;
@property (nonatomic) BOOL isPlayerX;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)findLabelUsingPoint: (CGPoint)point{
    if(CGRectContainsPoint(self.labelOne.frame, point)){
        [self labelPressed:self.labelOne];}
    if(CGRectContainsPoint(self.labelTwo.frame, point)){
        [self labelPressed:self.labelTwo];}
    if(CGRectContainsPoint(self.labelThree.frame, point)){
        [self labelPressed:self.labelThree];}
    if(CGRectContainsPoint(self.labelFour.frame, point)){
        [self labelPressed:self.labelFour];}
    if(CGRectContainsPoint(self.labelFive.frame, point)){
        [self labelPressed:self.labelFive];}
    if(CGRectContainsPoint(self.labelSix.frame, point)){
        [self labelPressed:self.labelSix];}
    if(CGRectContainsPoint(self.labelSeven.frame, point)){
        [self labelPressed:self.labelSeven];}
    if(CGRectContainsPoint(self.labelEight.frame, point)){
        [self labelPressed:self.labelEight];}
    if(CGRectContainsPoint(self.labelNine.frame, point)){
        [self labelPressed:self.labelNine];}
}

- (void)labelPressed:(UILabel *)labelPressed{
//if label 1-9 countains cgpoint(mouse) - change to x or o
//if already x or o do nothing.
//change bool value
    
    //BOOL isPlayerX = YES;
    //if([self buttonPressed]){
    if(self.isPlayerX){
        labelPressed.text = @"X";}
    else{labelPressed.text = @"O";}
    self.isPlayerX = !(self.isPlayerX);
    }

    


- (IBAction)onLabelTapped:(id)sender {
    CGPoint point = [sender locationInView:self.view];
    [self findLabelUsingPoint:point];
}

@end
