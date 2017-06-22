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
#import "WeatherResult.h"
#import "WeatherItem.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextView *text;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

// 分类网络请求
- (IBAction)query:(id)sender {
    
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    
    [mgr POST:@"http://m.zhtxw.cn/V1_7/api/GoodsCategorys/GetFirstGoodCategory" parameters:nil progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"****%@****",responseObject);
        
        CategoryResult *result = [[CategoryResult alloc] init];
        [result creatWithDict:responseObject];
        ItemModel *item = result.content.data.resultData[0];
        
        self.text.text = item.CategoryName;
        
        NSLog(@"****CategoryName: %@****",item.CategoryName);
        NSLog(@"****code: %@****",result.code);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"****%@****",error);
    }];
}


// 天气网络请求
- (IBAction)queryData:(id)sender {
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    
    [mgr GET:@"http://www.weather.com.cn/data/cityinfo/101010100.html" parameters:nil progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"****%@****",responseObject);
        
        WeatherResult *weather = [[WeatherResult alloc] init];
        [weather creatWithDict:responseObject];
        WeatherItem *item = weather.weatherinfo;
        
        self.text.text = item.city;
        
        NSLog(@"****city: %@****",item.city);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"****%@****",error);
    }];
}

@end
