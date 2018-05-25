//
//  ViewController.m
//  ValueForKeyPath
//
//  Created by 李晓飞 on 2018/5/25.
//  Copyright © 2018年 xiaofei. All rights reserved.
//  ValueForKeyPath 用法

/**
 @distinctUnionOfObjects  // 去重后所得的数组
 @avg, @sum, @max, @min   // 对数组中数字进行做相应的计算  NSNumber类型
 uppercaseString          // 数组中所有字母大写后所得的数组
 length                   // 数组中每个元素的字符个数组成的数组
 */

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self arrayRepeat];
    [self uppercaseAllCom];
    [self lengthPerCom];
    [self getTargetValue];
    [self answerForArr];
}

// 去除数组中重复的对象
- (void)arrayRepeat {
    NSArray *arr = @[@"3", @"4", @"1", @"2", @"2", @"3", @"4", @"2"];
    NSArray *newArr = [arr valueForKeyPath:@"@distinctUnionOfObjects.self"];
    NSLog(@"%@", newArr);
    /**
     @[@"3", @"4", @"1", @"2"]
     */
}

// 把数组中的字符都转换成大写
- (void)uppercaseAllCom {
    NSArray *arr = @[@"xiao", @"fei", @"li", @"slie"];
    NSArray *newArr = [arr valueForKeyPath:@"uppercaseString"];
    NSLog(@"%@", newArr);
    /**
     [@"XIAO", @"FEI", @"LI", @"SLIE"]
     */
}

// 获取每个成员字符串的长度组成的字符串
- (void)lengthPerCom {
    NSArray *arr = @[@"xiao", @"fei", @"li", @"slie"];
    NSArray *newArr = [arr valueForKeyPath:@"length"];
    NSLog(@"%@", newArr);
    /**
     [4, 3, 2, 4]
     */
}

// 对NSDictionary数组快速找出相应key对的值
- (void)getTargetValue {
    NSArray *array = @[@{@"name" : @"cookeee",@"code" : @1},
                       @{@"name": @"jim",@"code" : @2},
                       @{@"name": @"jim",@"code" : @1},
                       @{@"name": @"jbos",@"code" : @1}];
    NSLog(@"%@", [array valueForKeyPath:@"name"]);
    NSLog(@"%@", [array valueForKeyPath:@"@distinctUnionOfObjects.code"]);
    /**
     [@"cookeee", @"jim", @"jim", @"jbos"]
     [@2, @1]
     */
}

/**
 * @sum.self / @sum.floatValue  求和
 * @avg.self / @avg.floatValue  求平均
 * @max.self / @max.floatValue  求最大
 * @min.self / @min.floatValue  求最小
 */

- (void)answerForArr {
    NSArray *arr = @[@1, @5, @47, @7];
    NSNumber *avg = [arr valueForKeyPath:@"@avg.self"];
    NSLog(@"%.2f", [avg floatValue]);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
