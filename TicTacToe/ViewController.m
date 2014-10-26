//
//  ViewController.m
//  TicTacToe
//
//  Created by Jonathan Chou on 10/23/14.
//  Copyright (c) 2014 Jonathan Chou. All rights reserved.
//

#import "ViewController.h"
#define kCountDownTime (int)100;


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
@property (weak, nonatomic) IBOutlet UILabel *timerLabel;
@property NSTimer *timerCountdown;
@property int countdown;
@property int round;
@property NSArray *array;
@property UILabel *buttonCurrentlyPressed;

@end

@implementation ViewController

- (void)viewDidLoad {
    self.isPlayerO = NO;
    self.array = [[NSArray alloc]initWithObjects:self.labelOne, self.labelTwo, self.labelThree, self.labelFour, self.labelFive, self.labelSix, self.labelSeven, self.labelEight, self.labelNine, nil];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.round = 2;
    UIPanGestureRecognizer *xPan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(xPanHandler:)];
    UIPanGestureRecognizer *oPan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(oPanHandler:)];
    self.originalXCenter = self.xLabel.center;
    self.originalOCenter = self.oLabel.center;
    [self.xLabel addGestureRecognizer:xPan];
    self.xLabel.userInteractionEnabled = YES;
    [self.oLabel addGestureRecognizer:oPan];
    self.oLabel.userInteractionEnabled = YES;
    
    self.timerCountdown = [NSTimer scheduledTimerWithTimeInterval:.1
                                                           target:self
                                                         selector:@selector(countDown)
                                                         userInfo:nil
                                                          repeats:YES];
    self.countdown = kCountDownTime;
}

- (void)countDown{
    self.countdown--;
    self.timerLabel.text = [NSString stringWithFormat:@"%0.1f",self.countdown*.1];
    if (self.countdown <= 0){
        self.countdown = kCountDownTime;
        self.isPlayerO = YES;
        [self skipTurnHandler];
    }
}

//reset the timer
- (void)skipTurnHandler{
    if(self.isComputer){
        for(UILabel *selectLabel in self.array){
            if(selectLabel.userInteractionEnabled == NO){
                if([self computerSelectsLabel:selectLabel]){
                    break;}
            }
        }
        if( [self hasPlayerWon:self.buttonCurrentlyPressed]){
            NSString *playerWon = @"O";
            [self whoWon:playerWon];}
    }
    
    if(!self.isComputer){
        
        self.isPlayerO = !self.isPlayerO;

    }
    
    
    
    
}

-(void)timerHandler:(id)sender{
    //@"Your Move Sir: " stringByAppendingString:
    self.isPlayerO = !self.isPlayerO;
    if(!self.isPlayerO && self.countdown <= 0){
        self.whichPlayerLabel.text = @"Your Move Sir: X";
    }else if(self.isPlayerO && self.countdown <= 0)
        self.whichPlayerLabel.text = @"Your Move Sir: O";
    else
        
        if(self.whichPlayerLabel)
            //self.whichPlayerLabel.text = [self.whichPlayerLabel.text stringByAppendingString: @"hi"];
            self.countdown = 58
            ;
    
}

-(BOOL)checkXPresent:(UILabel *)checkLabel{
    if([checkLabel.text isEqualToString:@"X"]){
        return YES;}
    else
        return NO;
}

-(BOOL)checkOPresent:(UILabel *)checkLabel{
    if([checkLabel.text isEqualToString:@"O"]){
        return YES;}
    else
        return NO;
}

-(BOOL)checkAllOPresent{
    if ([self checkTwoLabels:self.labelOne Label2:self.labelSeven emptyLabel:self.labelFour])
        return [self computerSelectsLabel:self.labelFour];
    else if([self checkTwoLabels:self.labelOne Label2:self.labelThree emptyLabel:self.labelTwo])
        return [self computerSelectsLabel:self.labelTwo];
    else if([self checkTwoLabels:self.labelOne Label2:self.labelTwo emptyLabel:self.labelThree])
        return [self computerSelectsLabel:self.labelThree];
    else if([self checkTwoLabels:self.labelOne Label2:self.labelFive emptyLabel:self.labelNine])
        return [self computerSelectsLabel:self.labelNine];
    else if([self checkTwoLabels:self.labelOne Label2:self.labelNine emptyLabel:self.labelFive])
        return [self computerSelectsLabel:self.labelFive];
    else if([self checkTwoLabels:self.labelTwo Label2:self.labelThree emptyLabel:self.labelOne])
        return [self computerSelectsLabel:self.labelOne];
    else if([self checkTwoLabels:self.labelTwo Label2:self.labelFive emptyLabel:self.labelEight])
        return [self computerSelectsLabel:self.labelEight];
    else if([self checkTwoLabels:self.labelTwo Label2:self.labelEight emptyLabel:self.labelFive])
        return [self computerSelectsLabel:self.labelFive];
    else if([self checkTwoLabels:self.labelThree Label2:self.labelNine emptyLabel:self.labelSix])
        return [self computerSelectsLabel:self.labelSix];
    else if([self checkTwoLabels:self.labelThree Label2:self.labelFive emptyLabel:self.labelSeven])
        return [self computerSelectsLabel:self.labelSeven];
    else if([self checkTwoLabels:self.labelThree Label2:self.labelSeven emptyLabel:self.labelFive])
        return [self computerSelectsLabel:self.labelFive];
    else if ([self checkTwoLabels:self.labelOne Label2:self.labelFour emptyLabel:self.labelSeven])
        return [self computerSelectsLabel:self.labelSeven];
    else if([self checkTwoLabels:self.labelFour Label2:self.labelSeven emptyLabel:self.labelOne])
        return [self computerSelectsLabel:self.labelOne];
    else if([self checkTwoLabels:self.labelFour Label2:self.labelFive emptyLabel:self.labelSix])
        return [self computerSelectsLabel:self.labelSix];
    else if([self checkTwoLabels:self.labelFour Label2:self.labelSix emptyLabel:self.labelFive])
        return [self computerSelectsLabel:self.labelFive];
    else if([self checkTwoLabels:self.labelThree Label2:self.labelSix emptyLabel:self.labelNine])
        return [self computerSelectsLabel:self.labelNine];
    else if([self checkTwoLabels:self.labelSix Label2:self.labelNine emptyLabel:self.labelOne])
        return [self computerSelectsLabel:self.labelOne];
    else if([self checkTwoLabels:self.labelFour Label2:self.labelSix emptyLabel:self.labelFive])
        return [self computerSelectsLabel:self.labelFive];
    else if([self checkTwoLabels:self.labelSix Label2:self.labelFive emptyLabel:self.labelFour])
        return [self computerSelectsLabel:self.labelFour];
    else if([self checkTwoLabels:self.labelOne Label2:self.labelSeven emptyLabel:self.labelFour]){
        return [self computerSelectsLabel:self.labelFour];}
    else if([self checkTwoLabels:self.labelFour Label2:self.labelSeven emptyLabel:self.labelOne])
        return [self computerSelectsLabel:self.labelOne];
    else if([self checkTwoLabels:self.labelSeven Label2:self.labelNine emptyLabel:self.labelEight])
        return [self computerSelectsLabel:self.labelEight];
    else if([self checkTwoLabels:self.labelSeven Label2:self.labelEight emptyLabel:self.labelNine])
        return [self computerSelectsLabel:self.labelNine];
    else if([self checkTwoLabels:self.labelSeven Label2:self.labelFive emptyLabel:self.labelThree])
        return [self computerSelectsLabel:self.labelThree];
    else if([self checkTwoLabels:self.labelThree Label2:self.labelSeven emptyLabel:self.labelFive])
        return [self computerSelectsLabel:self.labelFive];
    else if([self checkTwoLabels:self.labelSeven Label2:self.labelEight emptyLabel:self.labelNine])
        return [self computerSelectsLabel:self.labelNine];
    else if([self checkTwoLabels:self.labelEight Label2:self.labelNine emptyLabel:self.labelSeven])
        return [self computerSelectsLabel:self.labelSeven];
    else if([self checkTwoLabels:self.labelEight Label2:self.labelFive emptyLabel:self.labelTwo])
        return [self computerSelectsLabel:self.labelTwo];
    else if([self checkTwoLabels:self.labelTwo Label2:self.labelEight emptyLabel:self.labelFive])
        return [self computerSelectsLabel:self.labelFive];
    else if([self checkTwoLabels:self.labelEight Label2:self.labelNine emptyLabel:self.labelSeven])
        return [self computerSelectsLabel:self.labelSeven];
    else if([self checkTwoLabels:self.labelNine Label2:self.labelThree emptyLabel:self.labelSix])
        return [self computerSelectsLabel:self.labelSix];
    else if([self checkTwoLabels:self.labelNine Label2:self.labelSix emptyLabel:self.labelThree])
        return [self computerSelectsLabel:self.labelThree];
    else if([self checkTwoLabels:self.labelNine Label2:self.labelSeven emptyLabel:self.labelEight])
        return [self computerSelectsLabel:self.labelEight];
    else if([self checkTwoLabels:self.labelNine Label2:self.labelFive emptyLabel:self.labelOne])
        return [self computerSelectsLabel:self.labelOne];
    else if([self checkTwoLabels:self.labelOne Label2:self.labelNine emptyLabel:self.labelFive])
        return [self computerSelectsLabel:self.labelFive];
    else if([self checkTwoLabels:self.labelFive Label2:self.labelNine emptyLabel:self.labelSeven])
        return [self computerSelectsLabel:self.labelSeven];
    else return NO;
}


-(BOOL)checkOneThree{
    //check opposite players code only -> X?
    if([self checkXPresent:self.labelOne]  && [self checkXPresent:self.labelThree]
       && self.labelTwo.userInteractionEnabled == NO)
        return YES;
    else
        return NO;
}

-(BOOL)checkOneTwo{
    //check opposite players code only -> X?
    if([self checkXPresent:self.labelOne]  && [self checkXPresent:self.labelTwo]
       && self.labelThree.userInteractionEnabled == NO)
        return YES;
    else
        return NO;}

-(BOOL)checkOneSeven{
    if([self checkXPresent:self.labelOne] && [self checkXPresent:self.labelSeven] && self.labelFour.userInteractionEnabled == NO)
        return YES;
    
    else
        return NO;}

-(BOOL)checkFourSeven{
    if([self checkXPresent:self.labelFour] && [self checkXPresent:self.labelSeven] && self.labelOne.userInteractionEnabled == NO)
        return YES;
    else
        return NO;
}

-(BOOL)checkSevenEight{
    if([self checkXPresent:self.labelSeven] && [self checkXPresent:self.labelEight] && self.labelNine.userInteractionEnabled ==NO)
        return YES;
    else
        return NO;
}

-(BOOL)checkSevenNine{
    if([self checkXPresent:self.labelSeven] && [self checkXPresent:self.labelNine] && self.labelEight.userInteractionEnabled == NO)
        return YES;
    else
        return NO;
}


-(BOOL)checkTwoThree{
    if([self checkXPresent:self.labelTwo] && [self checkXPresent:self.labelThree] && self.labelOne.userInteractionEnabled == NO)
        return YES;
    else
        return NO;
}

-(BOOL)checkOneFour{
    if([self checkXPresent:self.labelOne] && [self checkXPresent:self.labelFour] && self.labelSeven.userInteractionEnabled == NO)
        return YES;
    else
        return NO;
}

-(BOOL)checkThreeSix{
    if([self checkXPresent:self.labelThree] && [self checkXPresent:self.labelSix] && self.labelNine.userInteractionEnabled == NO)
        return YES;
    else
        return NO;
}

-(BOOL)checkThreeNine{
    if([self checkXPresent:self.labelThree] && [self checkXPresent:self.labelNine] && self.labelSix.userInteractionEnabled == NO)
        return YES;
    else
        return NO;
}

-(BOOL)checkTwoLabels:(UILabel *)label1 Label2:(UILabel *)label2 emptyLabel:(UILabel *)label3{
    if([self checkXPresent:label1] && [self checkXPresent:label2] && label3.userInteractionEnabled == NO)
        return YES;
    else if([self checkOPresent:label1] && [self checkOPresent:label2] && label3.userInteractionEnabled == NO)
        return YES;
    else
        return NO;
}


-(BOOL)computerSelectsLabel: (UILabel *)selectedLabel{
    selectedLabel.text = @"O";
    selectedLabel.textColor = [UIColor redColor];
    selectedLabel.userInteractionEnabled = YES;
    self.whichPlayerLabel.text = @"Your Move Sir: X";
    self.buttonCurrentlyPressed = selectedLabel;
    return YES;
}

-(BOOL)computerSelectsLabelOffense: (UILabel *)selectedLabel{
    selectedLabel.text = @"X";
    
    selectedLabel.userInteractionEnabled = YES;
    self.whichPlayerLabel.text = @"Your Move Sir: X";
    self.buttonCurrentlyPressed = selectedLabel;
    return YES;
}



-(BOOL)skyNet:(UILabel *)usersLastMove{ //COMPUTER MODE
    self.isPlayerO = NO;
    
    //COMPUTER AUTOMATICALLY TAKES CENTER SPOT IF AVAIL
    if(self.labelFive.userInteractionEnabled == NO){
        self.labelFive.text = @"O";
        self.labelFive.textColor = [UIColor redColor];
        self.labelFive.userInteractionEnabled = YES;
        return YES;
    }
    else{
        if ([self checkAllOPresent])
            return YES;
        
        else if(usersLastMove == self.labelOne){ //IF ONE IS PRESSED, COMPUTER RESPONDS.
            
            
            if([self checkOneSeven])
                return [self computerSelectsLabel:self.labelFour];
            else if([self checkOneFour])
                return [self computerSelectsLabel:self.labelSeven];
            else if([self checkOneThree])
                return [self computerSelectsLabel:self.labelTwo];
            else if([self checkOneTwo])
                return [self computerSelectsLabel:self.labelThree];
            else if([self checkTwoLabels:self.labelOne Label2:self.labelFive emptyLabel:self.labelNine])
                return [self computerSelectsLabel:self.labelNine];
            else if([self checkTwoLabels:self.labelOne Label2:self.labelNine emptyLabel:self.labelFive])
                return [self computerSelectsLabel:self.labelFive];
            else return NO;}
        
        
        else if(usersLastMove == self.labelTwo){ //TWO FOR COMPUTER
            if([self checkOneTwo])
                return [self computerSelectsLabel:self.labelThree];
            else if([self checkTwoThree])
                return [self computerSelectsLabel:self.labelOne];
            else if([self checkTwoLabels:self.labelTwo Label2:self.labelFive emptyLabel:self.labelEight])
                return [self computerSelectsLabel:self.labelEight];
            else if([self checkTwoLabels:self.labelTwo Label2:self.labelEight emptyLabel:self.labelFive])
                return [self computerSelectsLabel:self.labelFive];
            else return NO;
        }
        
        else if(usersLastMove == self.labelThree){ //THREE FOR COMPUTER
            if([self checkOneThree])
                return [self computerSelectsLabel:self.labelTwo];
            else if([self checkTwoThree])
                return [self computerSelectsLabel:self.labelOne];
            else if([self checkThreeSix])
                return [self computerSelectsLabel:self.labelNine];
            else if([self checkThreeNine])
                return [self computerSelectsLabel:self.labelSix];
            else if([self checkTwoLabels:self.labelThree Label2:self.labelFive emptyLabel:self.labelSeven])
                return [self computerSelectsLabel:self.labelSeven];
            else if([self checkTwoLabels:self.labelThree Label2:self.labelSeven emptyLabel:self.labelFive])
                return [self computerSelectsLabel:self.labelFive];
            else return NO;
        }
        
        else if(usersLastMove == self.labelFour){
            if ([self checkTwoLabels:self.labelOne Label2:self.labelFour emptyLabel:self.labelSeven])
                return [self computerSelectsLabel:self.labelSeven];
            else if([self checkTwoLabels:self.labelFour Label2:self.labelSeven emptyLabel:self.labelOne])
                return [self computerSelectsLabel:self.labelOne];
            else if([self checkTwoLabels:self.labelFour Label2:self.labelFive emptyLabel:self.labelSix])
                return [self computerSelectsLabel:self.labelSix];
            else if([self checkTwoLabels:self.labelFour Label2:self.labelSix emptyLabel:self.labelFive])
                return [self computerSelectsLabel:self.labelFive];
            else return NO;
        } //FOUR FOR COMPUTER
        
        else if(usersLastMove == self.labelSix){
            if([self checkTwoLabels:self.labelThree Label2:self.labelSix emptyLabel:self.labelNine])
                return [self computerSelectsLabel:self.labelNine];
            else if([self checkTwoLabels:self.labelSix Label2:self.labelNine emptyLabel:self.labelOne])
                return [self computerSelectsLabel:self.labelOne];
            else if([self checkTwoLabels:self.labelFour Label2:self.labelSix emptyLabel:self.labelFive])
                return [self computerSelectsLabel:self.labelFive];
            else if([self checkTwoLabels:self.labelSix Label2:self.labelFive emptyLabel:self.labelFour])
                return [self computerSelectsLabel:self.labelFour];
            else return NO;
        }
        
        else if(usersLastMove == self.labelSeven){
            if([self checkOneSeven]){
                //self.labelFour.text = @"O";
                return [self computerSelectsLabel:self.labelFour];}
            else if([self checkFourSeven])
                return [self computerSelectsLabel:self.labelOne];
            else if([self checkSevenNine])
                return [self computerSelectsLabel:self.labelEight];
            else if([self checkSevenEight])
                return [self computerSelectsLabel:self.labelNine];
            else if([self checkTwoLabels:self.labelSeven Label2:self.labelFive emptyLabel:self.labelThree])
                return [self computerSelectsLabel:self.labelThree];
            else if([self checkTwoLabels:self.labelThree Label2:self.labelSeven emptyLabel:self.labelFive])
                return [self computerSelectsLabel:self.labelFive];
            else return NO;
        }
        else if(usersLastMove == self.labelEight){
            if([self checkTwoLabels:self.labelSeven Label2:self.labelEight emptyLabel:self.labelNine])
                return [self computerSelectsLabel:self.labelNine];
            else if([self checkTwoLabels:self.labelEight Label2:self.labelNine emptyLabel:self.labelSeven])
                return [self computerSelectsLabel:self.labelSeven];
            else if([self checkTwoLabels:self.labelEight Label2:self.labelFive emptyLabel:self.labelTwo])
                return [self computerSelectsLabel:self.labelTwo];
            else if([self checkTwoLabels:self.labelTwo Label2:self.labelEight emptyLabel:self.labelFive])
                return [self computerSelectsLabel:self.labelFive];
            else return NO;
        }
        else if(usersLastMove == self.labelNine){
            if([self checkTwoLabels:self.labelEight Label2:self.labelNine emptyLabel:self.labelSeven])
                return [self computerSelectsLabel:self.labelSeven];
            else if([self checkTwoLabels:self.labelNine Label2:self.labelThree emptyLabel:self.labelSix])
                return [self computerSelectsLabel:self.labelSix];
            else if([self checkTwoLabels:self.labelNine Label2:self.labelSix emptyLabel:self.labelThree])
                return [self computerSelectsLabel:self.labelThree];
            else if([self checkTwoLabels:self.labelNine Label2:self.labelSeven emptyLabel:self.labelEight])
                return [self computerSelectsLabel:self.labelEight];
            else if([self checkTwoLabels:self.labelNine Label2:self.labelFive emptyLabel:self.labelOne])
                return [self computerSelectsLabel:self.labelOne];
            else if([self checkTwoLabels:self.labelOne Label2:self.labelNine emptyLabel:self.labelFive])
                return [self computerSelectsLabel:self.labelFive];
            else return NO;
        }
        
        else{
            return NO;
            
        }
    }
}

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

-(void)whoTied{
    [self.timerCountdown invalidate];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"BORING......." message: [NSString stringWithFormat:@"THERE IS NO WINNER....."] preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *restartButton = [UIAlertAction actionWithTitle:@"RESTART?" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self resetAllValues];
    }];
    //    UIAlertAction *hi = [UIAlertAction action]
    [alert addAction:restartButton];
    [self presentViewController:alert animated:YES completion:nil];
    
}

- (void)whoWon:(NSString *)winner{//REFACTOR INTO CONSTANTS AND UPDATE AS WINNNER
    [self.timerCountdown invalidate];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"CONGRATULATIONS!!!!DINGDINGDING" message: [NSString stringWithFormat:@"%@ IS THE SUPREME OVERLORD!! AKA... THE WINNERRRRRRR",winner] preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *restartButton = [UIAlertAction actionWithTitle:@"RESTART?" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self resetAllValues];
    }];
    //    UIAlertAction *hi = [UIAlertAction action]
    [alert addAction:restartButton];
    [self presentViewController:alert animated:YES completion:nil];
    
    
}

- (void)resetAllValues{ //RESETS TO DEFAULT
    self.whichPlayerLabel.text = [NSString stringWithFormat:@"Round: %d....Begin!!", self.round];
    self.round++;
    for(UILabel *label in self.array){
        label.text = @"Label";
        label.textColor = [UIColor blackColor];
        label.userInteractionEnabled = NO;}
    self.timerCountdown = [NSTimer scheduledTimerWithTimeInterval:.1
                                                           target:self
                                                         selector:@selector(countDown)
                                                         userInfo:nil
                                                          repeats:YES];
    
}

- (void)labelPressed:(UILabel *)labelPressed{
    //if label 1-9 countains cgpoint(mouse) - change to x or o
    //if already x or o do nothing.
    //change bool value
    
    //BOOL isPlayerX = YES;
    if(self.isComputer){
        if(!labelPressed.userInteractionEnabled){//check if label has been pressed before
            self.countdown = kCountDownTime;
            if(!self.isPlayerO){
                labelPressed.text = @"X";
                labelPressed.textColor = [UIColor blueColor];
                
                
                
                //self.whichPlayerLabel.text = @"Your Move Sir: O";
                self.isPlayerO = !(self.isPlayerO);
                labelPressed.userInteractionEnabled = YES;//disable label
                
                self.buttonCurrentlyPressed = labelPressed;
                if( [self hasPlayerTied]){[self whoTied];}
                if( [self hasPlayerWon:self.buttonCurrentlyPressed]){
                    NSString *playerWon = @"X";
                    [self whoWon:playerWon];}
                
                if([self skyNet:labelPressed]){}
                else{
                    for(UILabel *selectLabel in self.array){
                        if(selectLabel.userInteractionEnabled == NO){
                            if([self computerSelectsLabel:selectLabel]){
                                break;}
                        }
                        
                    }
                }
                if( [self hasPlayerTied]){[self whoTied];}
                if( [self hasPlayerWon:self.buttonCurrentlyPressed]){
                    NSString *playerWon = @"O";
                    [self whoWon:playerWon];}
            }
        }
    }
    
    if(!self.isComputer){
        if(!labelPressed.userInteractionEnabled){//check if label has been pressed before
            self.countdown = kCountDownTime;
            if(!self.isPlayerO){
                labelPressed.text = @"X";
                labelPressed.textColor = [UIColor blueColor];
                self.whichPlayerLabel.text = @"Your Move Sir: O";
                labelPressed.userInteractionEnabled = YES;
                self.isPlayerO = !self.isPlayerO;
                self.buttonCurrentlyPressed = labelPressed;
                if( [self hasPlayerTied]){[self whoTied];}
                if( [self hasPlayerWon:self.buttonCurrentlyPressed]){
                    NSString *playerWon = @"X";
                    [self whoWon:playerWon];}}
            else if(self.isPlayerO){
                
                labelPressed.text = @"O";
                labelPressed.textColor = [UIColor redColor];
                self.whichPlayerLabel.text = @"Your Move Sir: X";
                labelPressed.userInteractionEnabled = YES;
                self.isPlayerO = !self.isPlayerO;
                self.buttonCurrentlyPressed = labelPressed;
                if( [self hasPlayerTied]){[self whoTied];}
                if( [self hasPlayerWon:self.buttonCurrentlyPressed]){
                    NSString *playerWon = @"O";
                    [self whoWon:playerWon];}
            }
        }
        if( [self hasPlayerTied]){[self whoTied];}
        if( [self hasPlayerWon:self.buttonCurrentlyPressed]){
            NSString *playerWon = @"O";
            [self whoWon:playerWon];}
    }
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

- (BOOL)hasPlayerTied{
    for(UILabel *label in self.array){
        if(label.userInteractionEnabled == NO)
            return NO;
    }
    return YES;
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

}
- (IBAction)computerDecision:(UIButton *)sender {
    [self skyNet:self.labelThree];
    //    [self skyNet];
}

- (IBAction)onLabelTapped:(UIGestureRecognizer *)sender {
    CGPoint point = [sender locationInView:self.view];
    [self findLabelUsingPoint:point];
}

@end
