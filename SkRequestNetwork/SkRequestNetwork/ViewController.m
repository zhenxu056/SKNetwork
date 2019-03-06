//
//  ViewController.m
//  SkRequestNetwork
//
//  Created by user on 2019/3/6.
//  Copyright © 2019 烧烤有点辣. All rights reserved.
//

#import "ViewController.h"
#import "Network/NetworkAction.h"
#import "NetworkAction+RequestCancel.h"

@interface ViewController ()

@property (nonatomic, strong) NSURLSessionDataTask *task;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    self.task = [[NetworkAction sharedAction] getHomeNoticeListWithPage:@(1) success:^(NSArray *modelList, NSString *message) {
        
    } failuer:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [[NetworkAction sharedAction] cancelRequestWithRequestUrlArray:@[self.task]];
}


@end
