//
//  GameViewController.m
//  TicTacToe
//
//  Created by Nicholas Naudé on 16/01/2016.
//  Copyright © 2016 Nicholas Naudé. All rights reserved.
//

#import "GameViewController.h"

@interface GameViewController () <NSObject>

// IBOutket UIImage *olmg; IBOutlet UIImage * xlmg; NSInteger playerToken;
@property (weak, nonatomic) IBOutlet UILabel *statusUpdates;
@property (weak, nonatomic) IBOutlet UIImageView *a1;

@property (weak, nonatomic) IBOutlet UIImageView *a2;

@property (weak, nonatomic) IBOutlet UIImageView *a3;

@property (weak, nonatomic) IBOutlet UIImageView *b1;

@property (weak, nonatomic) IBOutlet UIImageView *b2;

@property (weak, nonatomic) IBOutlet UIImageView *b3;

@property (weak, nonatomic) IBOutlet UIImageView *c1;

@property (weak, nonatomic) IBOutlet UIImageView *c2;

@property (weak, nonatomic) IBOutlet UIImageView *c3;

@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // set the value of the images
    self.noughtImg = [UIImage imageNamed:@"noughtImg.png"];
    self.crossImg = [UIImage imageNamed:@"crossImg.png"];
    
    //set the first player
    self.playerToken = 1;
    self.statusUpdates.text = @"X plays first";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    self.playerToken == 1;
    // Dispose of any resources that can be recreated.
}

// update player number to allow the next person to play.
- (void) updatePlayerInfo {
    if (self.playerToken == 1)
    {
        self.playerToken = 2;
        self.statusUpdates.text = @"It's O's turn to play!";
        NSLog(@"playerToken = %i", self.playerToken);
    }
    else if (self.playerToken == 2)
    {
        self.playerToken = 1;
        self.statusUpdates.text = @"X plays next...";
        NSLog(@"playerToken = %i", self.playerToken);
    }
}


- (void) resetBoard {
    // clear all the images on the board to have nothing in them.
    self.a1.image = NULL;
    self.a2.image = NULL;
    self.a3.image = NULL;
    self.b1.image = NULL;
    self.b2.image = NULL;
    self.b3.image = NULL;
    self.c1.image = NULL;
    self.c2.image = NULL;
    self.c3.image = NULL;
    
    // reset the player and update the label text.
    
    self.playerToken = 1;
    self.statusUpdates.text = @"X starts again.";
}

-(BOOL) checkForWin {
    //HORIZONTAL WINS
    // row A
    if((self.a1.image == self.a2.image) && (self.a2.image == self.a3.image) && (self.a1.image != NULL)){
        return YES;
    }
    // row B
    if((self.b1.image == self.b2.image) && (self.b2.image == self.b3.image) && (self.b1.image != NULL)){
        return YES;
    }
    // row C
    if((self.c1.image == self.c2.image) && (self.c2.image == self.c3.image) && (self.c1.image != NULL)){
        return YES;
    }
    // VERTICAL WINS
    // col 1
    if((self.a1.image == self.b1.image) && (self.b1.image == self.c1.image) && (self.a1.image != NULL)){
        return YES;
    }
    // col 2
    if((self.a2.image == self.b2.image) && (self.b2.image == self.c2.image) && (self.a2.image != NULL)){
        return YES;
    }
    // col 3
    if((self.a3.image == self.b3.image) && (self.b3.image == self.c3.image) && (self.a3.image != NULL)){
        return YES;
    }
    // DIAGONAL WINS
    // a1, b2, c3
    if((self.a1.image == self.b2.image) && (self.b2.image == self.c3.image) && (self.a1.image != NULL)){
        return YES;
    }
    // a3, b2, c1
    if((self.a3.image == self.b2.image) && (self.b2.image == self.c1.image) && (self.a3.image != NULL)){
        return YES;
    }
    return NO;
}


// set the values of the UIImages to X or O.
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [[event allTouches] anyObject];
    
    if(CGRectContainsPoint([self.a1 frame], [touch locationInView:self.view]))
    {
        if (self.playerToken == 1)
        {self.a1.image = self.crossImg;
            NSLog(@"This statement did not run?");
        }
        if (self.playerToken == 2) {self.a1.image = self.noughtImg;}
    }
    
    if(CGRectContainsPoint([self.a2 frame], [touch locationInView:self.view]))
    {
        if (self.playerToken == 1) {self.a2.image = self.crossImg;}
        if (self.playerToken == 2) {self.a2.image = self.noughtImg;}
    }
    
    if(CGRectContainsPoint([self.a3 frame], [touch locationInView:self.view]))
    {
        if (self.playerToken == 1) {self.a3.image = self.crossImg;}
        if (self.playerToken == 2) {self.a3.image = self.noughtImg;}
    }
    [self updatePlayerInfo];
    [self checkForWin];
}


- (IBAction)resetButton:(UIBarButtonItem *)sender {
    [self resetBoard];
}

@end
