//
//  ViewController.m
//  HW1
//
//  Created by Lawrence Chong on 3/3/14.
//  Copyright (c) 2014 Lawrence Chong. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Category.h"


@implementation ViewController{
    
    int jafarWidth, jafarHeight, birdWidth , birdHeight, screenWidth, screenHeight;
}

-(void)viewDidLoad {
    [super viewDidLoad];
    [self loadSounds];
    screenWidth = self.view.frame.size.width;
    screenHeight = self.view.frame.size.height;
    
    jafarWidth = _Jafar.frame.size.width;
    jafarHeight = _Jafar.frame.size.height;
    birdWidth = _Bird.frame.size.width;
    birdHeight = _Bird.frame.size.height;
    
    _Aladdin.animationImages = [NSArray arrayWithObjects:
                                 [UIImage imageNamed:@"pic1"],
                                 [UIImage imageNamed:@"pic2"],
                                 [UIImage imageNamed:@"pic3"],
                                 [UIImage imageNamed:@"pic4"],
                                 [UIImage imageNamed:@"pic5"],
                                 [UIImage imageNamed:@"pic6"],
                                 [UIImage imageNamed:@"pic7"],
                                 [UIImage imageNamed:@"pic8"],
                                 [UIImage imageNamed:@"pic9"],
                                 [UIImage imageNamed:@"pic10"],

                                 nil];
    _Aladdin.animationDuration = 1.5;
    [_Aladdin startAnimating];
}

-(void)viewDidLayoutSubviews {
    [self move];
    [NSTimer scheduledTimerWithTimeInterval:9 target:self selector:@selector(move) userInfo:nil repeats:YES];
}

-(void)move {
    _Aladdin.x = -_Aladdin.width;
    [UIView animateWithDuration:10.0 animations:^{
        _Aladdin.x = [ViewController screenSize].width;
    }];
    
    
}

-(IBAction) playMusic : (id)sender{
    [self playSoundAtIndex: 0];
}

-(IBAction)hide:(id)sender{
    _Jafar.hidden = YES;
    _Bird.hidden = YES;
}

-(IBAction)unhide:(id)sender{
    int x = arc4random()%(screenWidth - jafarWidth);
    int y = arc4random()%(screenHeight - jafarHeight);
    int a = arc4random()%(screenWidth - birdWidth);
    int b = arc4random()%(screenHeight - birdHeight);
    
    [UIView animateWithDuration:1.0 animations:^{
        _Jafar.frame = CGRectMake(x, y, jafarWidth, jafarHeight);
        _Bird.frame = CGRectMake(a, b, birdWidth, birdHeight);
    }];
    
    _Jafar.hidden = NO;
    _Bird.hidden = NO;
}

-(void)loadSounds {
    self.soundPlayers = [[NSMutableArray alloc] initWithCapacity:1];
    for(int i=0; i<1; i++) {
        NSError *error = nil;
        NSString *filename = [NSString stringWithFormat:@"audio%d", (i+1)];
        NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:filename ofType:@"wav"]];
        AVAudioPlayer *player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
        
        if(error)
            NSLog(@"Error Initiating Player: %@", error.description);
        [_soundPlayers addObject:player];
    }
}

-(void)playSoundAtIndex:(int)i {
    AVAudioPlayer *player = _soundPlayers[i];
    
	if([player play])
        NSLog(@"sound played");
}

-(float)randomNumber0To1 {
    return (arc4random()%100) / 100.0;
}


+(CGSize)screenSize {
    CGSize size = [[UIScreen mainScreen] bounds].size;
    UIInterfaceOrientation or = [UIApplication sharedApplication].statusBarOrientation;
    if(UIDeviceOrientationIsLandscape(or)) {
        float w = size.width;
        size.width = size.height;
        size.height = w;
    }
    return size;
}

@end