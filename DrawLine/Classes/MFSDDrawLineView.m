//
//  MFSDDrawLineView.m
//  DrawLineAndScreen
//
//  Created by sun on 16/8/12.
//  Copyright © 2016年 sun. All rights reserved.
//

#import "MFSDDrawLineView.h"
@implementation MFSDDrawLineView

#pragma mark
#pragma custom methods
-(UIImage*)screenShot{
    UIGraphicsBeginImageContext(self.bounds.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self.layer renderInContext:context];
    UIImage *screenShotImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return screenShotImage;
}
-(void)cleanlastline{
    if(_allDrawlinInfoArray.count >0){
        [_allDrawlinInfoArray removeLastObject];
        [self setNeedsDisplay];
    }
}

-(void)clear{
    [_allDrawlinInfoArray removeAllObjects];
    [self setNeedsDisplay];
}

#pragma mark
#pragma system methods
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch* touch=[touches anyObject];
    [_linePoints removeLastObject];
    _linePoints = nil;
    _linePoints  = [[NSMutableArray alloc]initWithCapacity:10];
    [_linePoints addObject:[NSValue valueWithCGPoint:[touch locationInView:self ]]];
    if(_allDrawlinInfoArray == nil){
        _allDrawlinInfoArray = [[NSMutableArray alloc]initWithCapacity:10];
    }
}
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch* touch=[touches anyObject];
    [_linePoints addObject:[NSValue valueWithCGPoint:[touch locationInView:self ]]];
    if(_linePoints.count>2){
        [_linePoints removeObjectAtIndex:0];
    }
    NSMutableArray* drawInfo = [[NSMutableArray alloc]initWithArray:_linePoints];
    [_allDrawlinInfoArray addObject:drawInfo];
    [self setNeedsDisplay];
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
}
-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextSetLineWidth(context, _currentLineWidth);  //线宽
    CGContextSetAllowsAntialiasing(context, true);
    CGContextSetStrokeColorWithColor(context, _currentLineColor.CGColor);//线的颜色
    for(NSMutableArray* _MFSDDrawLineInfo in _allDrawlinInfoArray){
        CGPoint startPoint = [[_MFSDDrawLineInfo objectAtIndex:0]CGPointValue];
        CGPoint endPoint = [[_MFSDDrawLineInfo objectAtIndex:1]CGPointValue];
        CGContextMoveToPoint(context, startPoint.x, startPoint.y);  //起点坐标
        CGContextAddLineToPoint(context, endPoint.x, endPoint.y);   //终点坐标
        CGContextStrokePath(context);
    }
    
}


@end
