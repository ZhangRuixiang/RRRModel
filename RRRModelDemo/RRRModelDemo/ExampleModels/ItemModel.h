//
//  itemModel.h
//  WYJJsonModel
//
//  Created by 张瑞想 on 2017/1/17.
//  Copyright © 2017年 WYJ. All rights reserved.
//

#import "RRRModel.h"

@interface ItemModel : RRRModel

@property (strong, nonatomic) NSNumber *CategoryID;     // 分类id
@property (strong, nonatomic) NSString *CategoryName;   // 分类名称

@end
