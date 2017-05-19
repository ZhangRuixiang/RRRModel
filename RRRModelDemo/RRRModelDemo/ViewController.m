//
//  ViewController.m
//  RRRModelDemo
//
//  Created by 张瑞想 on 2017/1/17.
//  Copyright © 2017年 张瑞想. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import "RRRModel.h"
#import "CategoryResult.h"
#import "ContentModel.h"
#import "DataModel.h"
#import "ItemModel.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)query:(id)sender {
    
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    
    
    [mgr POST:@"http://m.zhtxw.cn/V1_7/api/GoodsCategorys/GetFirstGoodCategory" parameters:nil progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"****%@****",responseObject);
        CategoryResult *result = [[CategoryResult alloc] init];
        [result creatWithDict:responseObject];
        
        ItemModel *item = result.content.data.resultData[0];
        
        NSLog(@"****%@****",item.CategoryName);
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

@end
