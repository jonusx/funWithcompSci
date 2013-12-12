//
//  MRCSortView.m
//  matSort
//
//  Created by Mathew Cruz on 12/11/13.
//  Copyright (c) 2013 mathew cruz. All rights reserved.
//

#import "MRCSortView.h"
#import "MRCSortObject.h"

@implementation MRCSortView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(context, 0.5);
    CGContextSetFillColorWithColor(context, [[UIColor greenColor] CGColor]);
    CGContextSetStrokeColorWithColor(context, [[UIColor whiteColor] CGColor]);

    float rectHeights = rect.size.height/[self.maxValue floatValue];
    CGRect __block elementRect;
    
    [self.values enumerateObjectsUsingBlock:^(MRCSortObject *number, NSUInteger idx, BOOL *stop) {
        @autoreleasepool {
        
            elementRect = CGRectMake(0, idx * rectHeights, (([number.value floatValue]/[self.maxValue floatValue])) * rect.size.width, rectHeights);
            
            if (number.active) {
                CGContextSetFillColorWithColor(context, [[UIColor redColor] CGColor]);
            }
            else
            {
                CGContextSetFillColorWithColor(context, [[UIColor greenColor] CGColor]);
            }
            CGContextFillRect(context, elementRect);
            CGContextStrokeRect(context, elementRect);
        }
    }];
    
    CGContextStrokePath(context);
}

@end
