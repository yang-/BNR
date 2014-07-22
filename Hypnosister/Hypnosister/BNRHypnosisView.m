//
//  BNRHypnosisView.m
//  Hypnosister
//
//  Created by Yang Chen on 7/21/14.
//  Copyright (c) 2014 Yang Chen. All rights reserved.
//

#import "BNRHypnosisView.h"

@implementation BNRHypnosisView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        // All BNRHypnosisViews start with a clear background color
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGRect bounds = self.bounds;
    
    // Figure out the center of the bounds rectangle
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    
//    // The circle will be the largest that will fit in the view
//    float radius = (MIN(bounds.size.width, bounds.size.height) / 2.0);

    // The largest circle will circumscribe the view
    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0;
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
//    // Add an arc to the path at center, with radius of radius,
//    // from 0 to 2*PI radians (a circle)
//    [path addArcWithCenter:center radius:radius startAngle:0.0 endAngle:M_PI * 2.0 clockwise:YES];

    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20) {
        [path moveToPoint:CGPointMake(center.x + currentRadius, center.y)];
        [path addArcWithCenter:center radius:currentRadius startAngle:0.0 endAngle:M_PI * 2.0 clockwise:YES];
    }
    
    // Configure line width to 10 points
    path.lineWidth = 10;
    
    // Configure the drawing color to light gray
    [[UIColor lightGrayColor] setStroke];
    
    // Draw the line!
    [path stroke];
    
    CGContextRef currentContext = UIGraphicsGetCurrentContext();

    // Draw gradient triangle
    UIBezierPath *tranglePath = [[UIBezierPath alloc] init];
    [tranglePath moveToPoint:CGPointMake(center.x, center.y - 140)];
    [tranglePath addLineToPoint:CGPointMake(center.x - 80, center.y + 140)];
    [tranglePath addLineToPoint:CGPointMake(center.x + 80, center.y + 140)];
    [tranglePath addLineToPoint:CGPointMake(center.x, center.y - 140)];
    CGContextSaveGState(currentContext);
    [tranglePath addClip];
    
    CGFloat locations[2] = { 0.0, 1.0 };
    CGFloat components[8] = { 1.0, 1.0, 0.0, 1.0,   // Start color is yellow
                              0.0, 1.0, 0.0, 1.0 }; // End color is green
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColorComponents(colorspace, components, locations, 2);
    CGPoint startPoint = CGPointMake(center.x, center.y + 140);
    CGPoint endPoint = CGPointMake(center.x, center.y - 140);
    CGContextDrawLinearGradient(currentContext, gradient, startPoint, endPoint, 0);
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorspace);
    
    
    CGContextRestoreGState(currentContext);
    
    // Set drop shadow through Core Graphics
//    CGContextSaveGState(currentContext);
    CGContextSetShadow(currentContext, CGSizeMake(4, 7), 3);
    
    UIImage *logoImage = [UIImage imageNamed:@"logo.png"];
    [logoImage drawInRect:CGRectMake(center.x - 80, center.y - 140, 160, 280)];
    
//    CGContextRestoreGState(currentContext);
}


@end
