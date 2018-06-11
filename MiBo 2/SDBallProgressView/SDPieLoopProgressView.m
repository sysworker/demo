//
//  SDPieLoopProgressView.m
//  SDProgressView
//
//  Created by aier on 15-2-20.
//  Copyright (c) 2015年 GSD. All rights reserved.
//

#import "SDPieLoopProgressView.h"

@implementation SDPieLoopProgressView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
   
   CGContextRef ctx = UIGraphicsGetCurrentContext();
   
   CGFloat xCenter = rect.size.width * 0.5;
   CGFloat yCenter = rect.size.height * 0.5;
   CGFloat radius = MIN(rect.size.width * 0.5, rect.size.height * 0.5) - SDProgressViewItemMargin * 0.2;
   
   CGContextSetRGBStrokeColor(ctx, 0/255.0f, 160/255.0f , 255/255.0f, 0.1);//画笔线的颜色
   CGContextSetLineWidth(ctx, 3.0);//线的宽度
   CGContextAddArc(ctx, xCenter, yCenter, radius - 8 , 0, 2*M_PI, 0); //添加一个圆
   CGContextDrawPath(ctx, kCGPathStroke); //绘制路径
   
   CGContextSetRGBStrokeColor(ctx, 0/255.0f, 160/255.0f , 255/255.0f, 1.0);
   CGFloat to = - M_PI * 0.5 + self.progress * M_PI * 2 + 0.001;
   CGContextSetLineWidth(ctx, 4.0);
   CGContextSetLineCap(ctx, kCGLineCapRound);
   CGContextAddArc(ctx, xCenter, yCenter, radius - 8, - M_PI * 0.5, to, 0);
   CGContextDrawPath(ctx, kCGPathStroke);
#if 0
   CGContextRef ctx = UIGraphicsGetCurrentContext();
   
   CGFloat xCenter = rect.size.width * 0.5;
   CGFloat yCenter = rect.size.height * 0.5;
   CGFloat radius = MIN(rect.size.width * 0.5, rect.size.height * 0.5) - SDProgressViewItemMargin * 0.2;
   
   // 进度环边框
   [[UIColor grayColor] set];
   CGFloat w = radius * 2 + 1;
   CGFloat h = w;
   CGFloat x = (rect.size.width - w) * 0.5;
   CGFloat y = (rect.size.height - h) * 0.5;
   CGContextAddEllipseInRect(ctx, CGRectMake(x, y, w, h));
   CGContextStrokePath(ctx);
   
   // 进度环
   [SDProgressViewBackgroundColor set];
   CGContextMoveToPoint(ctx, xCenter, yCenter);
   CGContextAddLineToPoint(ctx, xCenter, 0);
   CGFloat to = - M_PI * 0.5 + self.progress * M_PI * 2 + 0.001; // 初始值
   CGContextAddArc(ctx, xCenter, yCenter, radius, - M_PI * 0.5, to, 0);
   CGContextClosePath(ctx);
   CGContextFillPath(ctx);
   
   // 遮罩
   [SDColorMaker(240, 240, 240, 1) set];
   CGFloat maskW = (radius - 15) * 2;
   CGFloat maskH = maskW;
   CGFloat maskX = (rect.size.width - maskW) * 0.5;
   CGFloat maskY = (rect.size.height - maskH) * 0.5;
   CGContextAddEllipseInRect(ctx, CGRectMake(maskX, maskY, maskW, maskH));
   CGContextFillPath(ctx);
   
   // 遮罩边框
   [[UIColor grayColor] set];
   CGFloat borderW = maskW + 1;
   CGFloat borderH = borderW;
   CGFloat borderX = (rect.size.width - borderW) * 0.5;
   CGFloat borderY = (rect.size.height - borderH) * 0.5;
   CGContextAddEllipseInRect(ctx, CGRectMake(borderX, borderY, borderW, borderH));
   CGContextStrokePath(ctx);
 #endif
   // 进度数字
   NSString *progressStr = [NSString stringWithFormat:@"%.0f%s", self.progress * 100, "\%"];
   NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
   attributes[NSFontAttributeName] = [UIFont boldSystemFontOfSize:20 * SDProgressViewFontScale];
   attributes[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
   [self setCenterProgressText:progressStr withAttributes:attributes];

}

@end
