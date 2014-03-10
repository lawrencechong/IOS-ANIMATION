//
//  UIView+Category.h
//  HW1
//
//  Created by Lawrence Chong on 3/3/14.
//  Copyright (c) 2014 Lawrence Chong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Category)

@property float x;
@property float y;
@property float width;
@property float height;
@property CGPoint origin;

-(void)storeLayout;
-(void)restoreLayout;
-(void)roundEdges:(float)radius;

@end
