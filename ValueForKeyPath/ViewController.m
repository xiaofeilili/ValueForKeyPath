//
//  ViewController.m
//  ValueForKeyPath
//
//  Created by 李晓飞 on 2018/5/25.
//  Copyright © 2018年 xiaofei. All rights reserved.
//  ValueForKeyPath 用法

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


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
