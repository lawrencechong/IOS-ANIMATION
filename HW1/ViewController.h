//
//  ViewController.h
//  HW1
//
//  Created by Lawrence Chong on 3/3/14.
//  Copyright (c) 2014 Lawrence Chong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVAudioPlayer.h>


@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *Aladdin;
@property (nonatomic, strong) NSMutableArray *soundPlayers;
@property (strong, nonatomic) IBOutlet UIImageView *Jafar;
@property (strong, nonatomic) IBOutlet UIImageView *Bird;

-(IBAction)playMusic:(id)sender;
-(IBAction)hide:(id)sender;
-(IBAction)unhide:(id)sender;

@end
