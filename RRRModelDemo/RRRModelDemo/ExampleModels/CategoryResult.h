//
//  categoryResult.h
//  WYJJsonModel
//
//  Created by 张瑞想 on 2017/1/17.
//  Copyright © 2017年 张瑞想. All rights reserved.
//

#import "RRRModel.h"
#import "ContentModel.h"

@interface CategoryResult : RRRModel

@property (nonatomic, strong) NSNumber *code;
@property (nonatomic, strong) NSString *msg;
@property (nonatomic, strong) ContentModel *content;


@end
