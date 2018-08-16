//
//  ViewController.m
//  ProtoypePattern
//
//  Created by wupeng on 2017/2/26.
//  Copyright © 2017年 wupeng. All rights reserved.
//

#import "ViewController.h"
#import "StudentModel.h"
#import "ClassModel.h"
#import "Student.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self testProtoypeCopyProtocol];
    [self testNSCopying];
    
}

//为了方便演示，代码中有两个student的model
- (void)testProtoypeCopyProtocol {
    // 学生1
    StudentModel *stu1 = [[StudentModel alloc] init];
    stu1.name          = @"小王";
    stu1.age           = @(19);
    stu1.address       = @"中关村";
    stu1.totalScore    = @(100);
    
    // 学生2
    StudentModel *stu2 = [stu1 clone];
    stu2.name          = @"小红";
    NSLog(@"%@", stu2.name);

    NSArray* array = @[stu1,stu2];
    ///不可变数组里的对象属性是可变的
    stu2.name = @"爸爸";
#pragma mark -- 对数组中copy的理解
    ///选择NO时数组内元素不遵守copy协议，选择YES时数组内元素要遵守copy协议，内部所有元素都进行copy，修改原对象不会影响copy后的对象
    NSMutableArray* arr = [[NSMutableArray alloc] initWithArray:array copyItems:YES];
    NSMutableArray* arr1 = [array copy];
    NSMutableArray* arr2 = [array mutableCopy];
    stu1.name = @"妈妈";
    NSLog(@"%@-------%@-------%@-------%@",array[0],arr[0],arr1[0],arr2[0]);

    NSLog(@"%p-------%p-------%p-------%p",array,arr,arr1,arr2);
}

- (void)testNSCopying {
    Student *stu1 = [[Student alloc] init];
    stu1.name          = @"小明";
    
    Student *stu2 = stu1.copy;
    
    ClassModel *class1 = [[ClassModel alloc] init];
    class1.className   = @"班级1";
    class1.students    = @[stu1, stu2];
    
    ClassModel *class2 = class1.copy;
    NSLog(@"%@ %@", class1, class2);
    
    NSLog(@"%@", class1.students);
    NSLog(@"%@", class2.students);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
