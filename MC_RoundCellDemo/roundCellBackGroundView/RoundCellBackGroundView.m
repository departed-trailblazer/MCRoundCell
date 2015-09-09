//
//  RoundCellBackGroundView.m
//  MC_RoundCellDemo
//
//  Created by xulu on 15/9/9.
//  Copyright (c) 2015年 _MC. All rights reserved.
//

#import "RoundCellBackGroundView.h"

@implementation RoundCellBackGroundView

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
    }
    self.backgroundColor = [UIColor clearColor];
    self.drawBackgroundColor = [UIColor groupTableViewBackgroundColor];
    return self;
}

- (void)contextTopPathWith:(CGContextRef)contextRef rec:(CGRect)rect
{
    
    
    CGFloat minx = CGRectGetMinX(rect) , midx = CGRectGetMidX(rect), maxx = CGRectGetMaxX(rect) ;
    CGFloat miny = CGRectGetMinY(rect) , maxy = CGRectGetMaxY(rect) ;
    CGContextMoveToPoint(contextRef, minx, maxy);
    CGContextAddArcToPoint(contextRef, minx, miny, midx, miny, 10);
    CGContextAddArcToPoint(contextRef, maxx, miny, maxx, maxy, 10);
    CGContextAddLineToPoint(contextRef, maxx, maxy);
    
    CGContextClosePath(contextRef);
}


- (void)contextMiddlePathWith:(CGContextRef)contextRef rec:(CGRect)rect
{
    
    CGFloat minx = CGRectGetMinX(rect) , maxx = CGRectGetMaxX(rect) ;
    CGFloat miny = CGRectGetMinY(rect) , maxy = CGRectGetMaxY(rect) ;
    
    CGContextMoveToPoint(contextRef, minx, miny);
    CGContextAddLineToPoint(contextRef, maxx, miny);
    CGContextAddLineToPoint(contextRef, maxx, maxy);
    CGContextAddLineToPoint(contextRef, minx, maxy);
    
    CGContextClosePath(contextRef);
}

- (void)contextSinglePathWith:(CGContextRef)contextRef rec:(CGRect)rect
{
    
    CGFloat minx = CGRectGetMinX(rect), midx = CGRectGetMidX(rect), maxx = CGRectGetMaxX(rect) ;
    CGFloat miny = CGRectGetMinY(rect), midy = CGRectGetMidY(rect), maxy = CGRectGetMaxY(rect) ;
    
    CGContextSetLineWidth(contextRef, 1.0);
    CGContextMoveToPoint(contextRef, minx, midy);
    CGContextAddArcToPoint(contextRef, minx, miny, midx, miny, 10);
    CGContextAddArcToPoint(contextRef, maxx, miny, maxx, midy, 10);
    CGContextAddArcToPoint(contextRef, maxx, maxy, midx, maxy, 10);
    CGContextAddArcToPoint(contextRef, minx, maxy, minx, midy, 10);
    
    CGContextClosePath(contextRef);
}

- (void)contextBottomPathWith:(CGContextRef)contextRef rec:(CGRect)rect
{
    
    CGFloat minx = CGRectGetMinX(rect), midx = CGRectGetMidX(rect), maxx = CGRectGetMaxX(rect) ;
    CGFloat miny = CGRectGetMinY(rect), maxy = CGRectGetMaxY(rect);
    
    CGContextMoveToPoint(contextRef, minx, miny);
    CGContextAddArcToPoint(contextRef, minx, maxy, midx, maxy, 10);
    CGContextAddArcToPoint(contextRef, maxx, maxy, maxx, miny, 10);
    CGContextAddLineToPoint(contextRef, maxx, miny);
    
    CGContextClosePath(contextRef);
}


- (void)drawRoundWith:(CGContextRef)contextRef rect:(CGRect)rect cellStyle:(CellStyle)style {
    
    rect = CGRectMake(rect.origin.x + 10, rect.origin.y, rect.size.width - 20, rect.size.height);
    CGContextSetFillColorWithColor(contextRef, self.drawBackgroundColor.CGColor);
    CGContextSetStrokeColorWithColor(contextRef, [UIColor blackColor].CGColor);
    switch (style) {
        case CellStyleTop:
            [self contextTopPathWith:contextRef rec:rect];
            break;
            
        case CellStyleMiddle:
            [self contextMiddlePathWith:contextRef rec:rect];
            break;
            
        case CellStyleBottom:
            [self contextBottomPathWith:contextRef rec:rect];
            break;
            
        case CellStyleSingle:
            [self contextSinglePathWith:contextRef rec:rect];
        default:
            break;
    }
    
    CGContextDrawPath(contextRef, kCGPathFillStroke);
}



- (void)drawRect:(CGRect)rect {
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    [self drawRoundWith:contextRef rect:rect cellStyle:self.style];
    [super drawRect:rect];
    self.backgroundColor = [UIColor clearColor];
}
@end
