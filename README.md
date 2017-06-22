# RRRModel
RRRModel 是一款简单好用的字典转模型框架。

<img src="https://user-images.githubusercontent.com/12697902/27414745-c4e94212-5735-11e7-989f-dfa786b0beac.png" width="320">

# 使用方法
#### 1. 创建模型继承自RRRModel

WeatherResult.h
```
#import "WeatherItem.h"

@interface WeatherResult : RRRModel

@property (nonatomic, strong) WeatherItem *weatherinfo;

@end

```
WeatherItem.h
```

#import "RRRModel.h"

@interface WeatherItem : RRRModel

@property (nonatomic, copy) NSString *city;
@property (nonatomic, copy) NSString *cityid;
@property (nonatomic, copy) NSString *weather;
@property (nonatomic, copy) NSString *ptime;

@end

```
#### 2. 请求数据之后，使用 `-(void)creatWithDict:(NSDictionary *)dict;` 解析字典

```
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
```
