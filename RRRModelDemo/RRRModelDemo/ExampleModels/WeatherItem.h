//
//  WeatherItem.h
//  RRRModelDemo
//
//  Created by 张瑞想 on 2017/6/21.
//  Copyright © 2017年 张瑞想. All rights reserved.
//

#import "RRRModel.h"

@interface WeatherItem : RRRModel

@property (nonatomic, copy) NSString *city;
@property (nonatomic, copy) NSString *cityid;
@property (nonatomic, copy) NSString *weather;
@property (nonatomic, copy) NSString *ptime;

@end
