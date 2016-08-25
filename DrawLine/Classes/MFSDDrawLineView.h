//
//  MFSDDrawLineView.h
//  DrawLineAndScreen
//
//  Created by sun on 16/8/12.
//  Copyright © 2016年 sun. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  实现涂鸦并且能够自定义涂鸦板大小和截图
 */
@interface MFSDDrawLineView : UIView
/**
 *  当前绘制的点,一般来说2个点
 */
@property (nonatomic,strong)NSMutableArray <__kindof NSValue *>*linePoints;

/**
 *  所有需要绘制的线的信息
 */
@property(nonatomic,strong)NSMutableArray* allDrawlinInfoArray;
/*
 *  实时画线的颜色
 */
@property(nonatomic,strong)UIColor* currentLineColor;
/**
 *  实时画线的宽度
 */
@property(nonatomic) float currentLineWidth;
/**
 *  截取涂鸦板的内容并且生成图片返回
 *
 *  @return 返回截图
 */
-(UIImage*)screenShot;

/**
 *  清除绘制的上一条记录
 */
-(void)cleanlastline;

/**
 *  移除已经绘制的所有线
 */
-(void)clear;
@end
