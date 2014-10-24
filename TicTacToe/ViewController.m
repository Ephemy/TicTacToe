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
@property (nonatomic) BOOL isPlayerO;
@property (weak, nonatomic) IBOutlet UILabel *xLabel;
@property CGPoint originalXCenter;
@property CGPoint originalOCenter;
@property (weak, nonatomic) IBOutlet UILabel *oLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIPanGestureRecognizer *xPan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(xPanHandler:)];
    UIPanGestureRecognizer *oPan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(oPanHandler:)];
    self.originalXCenter = self.xLabel.center;
    self.originalOCenter = self.oLabel.center;
    [self.xLabel addGestureRecognizer:xPan];
    self.xLabel.userInteractionEnabled = YES;
    [self.oLabel addGestureRecognizer:oPan];
    self.oLabel.userInteractionEnabled = YES;

    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:3.0
                                     target:self
                                   selector:@selector(timerHandler:)
                                   userInfo:nil
                                    repeats:NO];
    if(!timer){

    }
}
-(void)



-(void)xPanHandler:(UIPanGestureRecognizer *)xGesture{
    CGPoint xCenter = [xGesture locationInView:self.view];
    CGPoint xEndCenter;
    self.xLabel.center  = xCenter;
    if(xGesture.state == UIGestureRecognizerStateEnded){
        xEndCenter = xCenter;
        self.isPlayerO = NO;
        self.xLabel.center = self.originalXCenter;}
    [self findLabelUsingPoint:xEndCenter];}

-(void)oPanHandler:(UIPanGestureRecognizer *)oGesture{
    CGPoint oCenter = [oGesture locationInView:self.view];
    CGPoint oEndCenter;
    self.oLabel.center = oCenter;
    if(oGesture.state == UIGestureRecognizerStateEnded){
         oEndCenter = oCenter;
         self.isPlayerO = YES;
         self.oLabel.center = self.originalOCenter;}
    [self findLabelUsingPoint:oEndCenter];
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

- (void)whoWon:(NSString *)loser{//REFACTOR INTO CONSTANTS AND UPDATE AS WINNNER
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"CONGRATULATIONS!!!!DINGDINGDING" message: [NSString stringWithFormat:@"%@ IS THE ANTI-SUPREME OVERLORD!! AKA... THE LOSERRRRRRR",loser] preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *restartButton = [UIAlertAction actionWithTitle:@"RESTART?" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self resetAllValues];
    }];
//    UIAlertAction *hi = [UIAlertAction action]
    [alert addAction:restartButton];
    [self presentViewController:alert animated:YES completion:nil];


}

- (void)resetAllValues{
    self.whichPlayerLabel.text = @"Round 2";
    self.labelOne.text = @"Label";
    self.labelTwo.text = @"Label";
    self.labelThree.text = @"Label";
    self.labelFour.text = @"Label";
    self.labelFive.text = @"Label";
    self.labelSix.text = @"Label";
    self.labelSeven.text = @"Label";
    self.labelEight.text = @"Label";
    self.labelNine.text = @"Label";
    self.labelOne.textColor = [UIColor blackColor];
    self.labelTwo.textColor = [UIColor blackColor];
    self.labelThree.textColor = [UIColor blackColor];
    self.labelFour.textColor = [UIColor blackColor];
    self.labelFive.textColor = [UIColor blackColor];
    self.labelSix.textColor = [UIColor blackColor];
    self.labelSeven.textColor = [UIColor blackColor];
    self.labelEight.textColor = [UIColor blackColor];
    self.labelNine.textColor = [UIColor blackColor];
    self.labelOne.userInteractionEnabled = NO;
    self.labelTwo.userInteractionEnabled = NO;
    self.labelThree.userInteractionEnabled = NO;
    self.labelFour.userInteractionEnabled = NO;
    self.labelFive.userInteractionEnabled = NO;
    self.labelSix.userInteractionEnabled = NO;
    self.labelSeven.userInteractionEnabled = NO;
    self.labelEight.userInteractionEnabled = NO;
    self.labelNine.userInteractionEnabled = NO;

}

- (void)labelPressed:(UILabel *)labelPressed{
//if label 1-9 countains cgpoint(mouse) - change to x or o
//if already x or o do nothing.
//change bool value
    
    //BOOL isPlayerX = YES;
    if(!labelPressed.userInteractionEnabled){//check if label has been pressed before
        if(!self.isPlayerO){
            labelPressed.text = @"X";
            labelPressed.textColor = [UIColor blueColor];
            self.whichPlayerLabel.text = @"O";}
        else{labelPressed.text = @"O";
            labelPressed.textColor = [UIColor redColor];
            self.whichPlayerLabel.text = @"X";}
        self.isPlayerO = !(self.isPlayerO);
        if( [self hasPlayerWon:labelPressed]){
            NSString *playerWon = self.whichPlayerLabel.text;
            //self.whichPlayerLabel.text = [self.whichPlayerLabel.text stringByAppendingString:@" LOSESSSSSSSSS!"];
            [self whoWon:playerWon];
        }
    }//taking turns
    labelPressed.userInteractionEnabled = YES;//disable label
    //}
}

- (BOOL)checkOneTwoThree{
    if([self.labelOne.text isEqualToString:self.labelTwo.text] && [self.labelOne.text isEqualToString:self.labelThree.text]){
        return YES;}
    else
        return NO;
}

- (BOOL)checkOneFourSeven{
    if([self.labelOne.text isEqualToString:self.labelFour.text] && [self.labelOne.text isEqualToString:self.labelSeven.text]){
        return YES;}
    else
        return NO;
}

- (BOOL)checkOneFiveNine{
    if([self.labelOne.text isEqualToString:self.labelFive.text] && [self.labelOne.text isEqualToString:self.labelNine.text]){
        return YES;}
    else
        return NO;}

- (BOOL)checkFourFiveSix{
    if([self.labelFour.text isEqualToString:self.labelFive.text] && [self.labelFour.text isEqualToString:self.labelSix.text]){
        return YES;}
    else
        return NO;
}
- (BOOL)checkSevenEightNine {
    if([self.labelSeven.text isEqualToString:self.labelEight.text] && [self.labelSeven.text isEqualToString:self.labelNine.text]){
        return YES;}
    else
        return NO;

}



- (BOOL)checkTwoFiveEight{
    if([self.labelTwo.text isEqualToString:self.labelFive.text] && [self.labelTwo.text isEqualToString:self.labelEight.text]){
        return YES;}
    else
        return NO;}

- (BOOL)checkThreeSixNine{
    if([self.labelThree.text isEqualToString:self.labelSix.text] && [self.labelThree.text isEqualToString:self.labelNine.text]){
        return YES;}
    else
        return NO;
}



- (BOOL)checkThreeFiveSeven{
    if([self.labelThree.text isEqualToString:self.labelFive.text] && [self.labelThree.text isEqualToString:self.labelSeven.text]){
        return YES;}
    else
        return NO;
}


- (BOOL)hasPlayerWon:(UILabel *)labelPressed{
        
    
    //123 456 789 147 258 369 159 357
    
    //123 147 159 #1
    //123
    if(labelPressed == self.labelOne){
        return ([self checkOneTwoThree] || [self checkOneFourSeven] || [self checkOneFiveNine]);}
    else if(labelPressed == self.labelTwo){
        return ([self checkTwoFiveEight] || [self checkOneTwoThree]);}
    else if(labelPressed == self.labelThree){
        return ([self checkThreeFiveSeven] || [self checkThreeSixNine] || [self checkOneTwoThree]);}
    else if(labelPressed == self.labelFour){
        return ([self checkFourFiveSix] || [self checkOneFourSeven]);}
    else if(labelPressed == self.labelFive){
        return ([self checkFourFiveSix] || [self checkOneFiveNine] || [self checkTwoFiveEight] || [self checkThreeFiveSeven]);
    }
    else if(labelPressed == self.labelSix){
        return ([self checkThreeSixNine] || [self checkFourFiveSix]);}
    else if(labelPressed == self.labelSeven){
        return ([self checkOneFourSeven] || [self checkThreeFiveSeven] || [self checkSevenEightNine]);}
    else if(labelPressed == self.labelEight){
        return([self checkTwoFiveEight] || [self checkSevenEightNine]);}
    else if(labelPressed == self.labelNine){
        return([self checkOneFiveNine] || [self checkThreeSixNine] || [self checkSevenEightNine]);}
    else
        return NO;
//
//    else if (labelPressed == self.labelFour || labelPressed == self.labelFive || labelPressed == self.labelSix){
//        return [self checkFourFiveSix];}
//
//    else if (labelPressed == self.labelSeven || labelPressed == self.labelEight || labelPressed == self.labelNine){
//        return [self checkSevenEightNine];}
//    
//    else if (labelPressed == self.labelOne || labelPressed == self.labelFour || labelPressed == self.labelSeven){
//        return [self checkOneFourSeven];}
//    
//    else if (labelPressed == self.labelTwo || labelPressed == self.labelFive || labelPressed == self.labelEight){
//        return [self checkTwoFiveEight];}
//    
//    else if (labelPressed == self.labelThree || labelPressed == self.labelSix || labelPressed == self.labelNine){
//        return [self checkThreeSixNine];}
//    
//    else if (labelPressed == self.labelOne || labelPressed == self.labelFive || labelPressed == self.labelNine){
//        return [self checkOneFiveNine];}
//    
//    else if (labelPressed == self.labelThree || labelPressed == self.labelFive || labelPressed == self.labelSeven){
//        return [self checkThreeFiveSeven];}
    
    
    
    

//        if([self.labelOne.text isEqualToString:self.labelFour.text] && [self.labelOne.text isEqualToString:self.labelSeven.text]){
//            return YES;}
//        else if([self.labelOne.text isEqualToString:self.labelFive.text] && [self.labelOne.text isEqualToString:self.labelNine.text]){
//            return YES;}
//    else{
//        return NO;}
}

- (IBAction)onLabelTapped:(id)sender {
    CGPoint point = [sender locationInView:self.view];
    [self findLabelUsingPoint:point];
}

@end
