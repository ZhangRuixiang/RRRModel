//
//  contentModel.h
//  WYJJsonModel
//
//  Created by 张瑞想 on 2017/1/17.
//  Copyright © 2017年 张瑞想. All rights reserved.
//

#import "RRRModel.h"
#import "DataModel.h"
@interface ContentModel : RRRModel

@property (nonatomic, strong) NSNumber *businessCode;
@property (nonatomic, strong) NSString *message;
@property (nonatomic, strong) DataModel *data;

@end
