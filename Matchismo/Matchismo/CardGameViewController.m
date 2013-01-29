//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Rollin Morris on 1/27/13.
//  Copyright (c) 2013 appwerkz. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "PlayingCard.h"



@interface CardGameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
 @property (nonatomic) PlayingCardDeck *myDeck;
@end

@implementation CardGameViewController

-(void) setFlipCount:(int)flipCount {
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d",self.flipCount];
    
}

- (IBAction)flipCard:(UIButton *)sender {
    sender.selected = !sender.isSelected;
    
    
    if (!self.myDeck) {
        self.myDeck =  [[PlayingCardDeck alloc]init];
    }
    
    if (sender.isSelected) {
        
        Card *card = [self.myDeck drawRandomCard];
        if (card) {
            self.flipCount++;
            NSLog(@"card = %@",[card contents]);
            [sender setTitle:[card contents] forState:UIControlStateSelected];
        }
    }
    
    

    
}


@end
