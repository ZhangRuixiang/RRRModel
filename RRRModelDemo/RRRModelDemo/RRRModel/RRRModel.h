//
//  RRRModel.h
//  RRRModel
//
//  Created by 张瑞想 on 2017/1/17.
//  Copyright © 2017年 张瑞想. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RRRModel : NSObject
-(void)creatWithDict:(NSDictionary *)dict;
//不解析的属性
-(NSArray *)getOutArray;
//如何获得当前属性是数组的 需要表明
-(NSDictionary *)classOfArrayProperty;
@end
