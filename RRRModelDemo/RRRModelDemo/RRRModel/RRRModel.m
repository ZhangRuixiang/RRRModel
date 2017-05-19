//
//  RRRModel.m
//  RRRModel
//
//  Created by 张瑞想 on 2017/1/17.
//  Copyright © 2017年 张瑞想. All rights reserved.
//

#import "RRRModel.h"
#import <objc/runtime.h>

@implementation RRRModel
-(void)creatWithDict:(NSDictionary *)dict {
    if (![dict isKindOfClass:[NSDictionary class]]) {
        return;
    }
    unsigned int outCount, i;
    
    // 类的属性列表
    objc_property_t *properties = class_copyPropertyList([self class], &outCount);

    for (i = 0; i < outCount; i ++) {
        // 属性
        objc_property_t property = properties[i];
        const char *char_f = property_getName(property);
        // 属性名称："weatherinfo"

        NSString *propertyName = [NSString stringWithUTF8String:char_f];
        NSArray *outArray = [self getOutArray];
        if ([outArray containsObject:propertyName]) {
            continue;
        }
        // 属性的属性：T@"NSString",&,N,V_testString  ****  T@"weatherItem",&,N,V_weatherinfo
        NSString *str = [NSString stringWithFormat:@"%s",property_getAttributes(property)];
        /*
         array =    @[T@,
                    NSString,
                    ,&,N,V_testString]
         */
        NSArray *array = [str componentsSeparatedByString:@"\""];
        NSString *classStr = array[1];
        
        // 如果属性是数组
        if ([classStr isEqualToString:@"NSArray"] || [classStr isEqualToString:@"NSMutableArray"]) {
            
            // 属性类名：@"itemModel"
            NSString *propertyClassStr = [[self classOfArrayProperty] objectForKey:propertyName];
        
            // 属性类 itemModel
            Class propertyClass = NSClassFromString(propertyClassStr);
        
            NSMutableArray *subArray = [NSMutableArray array];
            
            // propertyName =  resultData
            if ([[dict objectForKey:propertyName] isKindOfClass:[NSArray class]]) {
                for (NSDictionary *subDict in [dict objectForKey:propertyName]) {
                    //此处不用在判断字典类型 因为在creatWithDict中 一开始 就已经判断了
                    NSObject *subModel = [[propertyClass alloc] init];
                    [subModel performSelector:@selector(creatWithDict:) withObject:subDict];
                    [subArray addObject:subModel];
                }
                
                [self setValue:subArray forKey:propertyName];
            }
            
            continue;
        } else {
            //通过获得当前属性的类名 判断是不是继承自己的类型  因为所有model 都需要继承自己的类型  这样就可以判断出 是不是自定义的类  不需要再去重写方法来表明
            NSString *str = [NSString stringWithFormat:@"%s",property_getAttributes(property)];
            NSArray *array = [str componentsSeparatedByString:@"\""];
            NSString *propertyClassStr = array[1];
            Class propertyClass = NSClassFromString(propertyClassStr);
            
            //自定义类
            if ([propertyClass isSubclassOfClass:[RRRModel class]]) {
                NSDictionary *subDict = [dict objectForKey:propertyName];
                NSObject *subModel = [[propertyClass alloc] init];
                [subModel performSelector:@selector(creatWithDict:) withObject:subDict];
                [self setValue:subModel forKey:propertyName];
                
                continue;
            }
            //直接取值
            if ([dict objectForKey:propertyName] != nil) {
                
                // KVC:NSKeyValueCoding
                [self setValue:[dict objectForKey:propertyName] forKey:propertyName];
            }
        }
        
    }
}
//不解析的属性
-(NSArray *)getOutArray{
    return @[];
}
//如何获得当前属性是数组的 需要表明
-(NSDictionary *)classOfArrayProperty {
    //{"数组类型的属性名":"里面的模型类型"}
    return @{};
}
@end
