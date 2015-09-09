//
//  RoundCellBackGroundView.h
//  MC_RoundCellDemo
//
//  Created by xulu on 15/9/9.
//  Copyright (c) 2015年 _MC. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum CellStyleT
{
    CellStyleNone,
    CellStyleTop,
    CellStyleMiddle,
    CellStyleBottom,
    CellStyleSingle,
    
    CellStyleCount
} CellStyle;
@interface RoundCellBackGroundView : UIView

@property (strong, nonatomic) UIColor *drawBackgroundColor;
@property (assign, nonatomic) CellStyle  style;

@end
