//
//  categoryResult.m
//  WYJJsonModel
//
//  Created by 张瑞想 on 2017/1/17.
//  Copyright © 2017年 张瑞想. All rights reserved.
//

#import "CategoryResult.h"

@implementation CategoryResult

// 剔除不想解析的属性
- (NSArray *)getOutArray
{
    return @[@"code"];
}

@end
