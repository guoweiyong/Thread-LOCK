//
//  ViewController.m
//  多线程-线程同步
//
//  Created by admin on 2020/10/31.
//

#import "ViewController.h"
#import "GYBaseDemo.h"
#import "OSSpinLockDemo.h"
#import <libkern/OSAtomic.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    GYBaseDemo *demo = [[OSSpinLockDemo alloc] init];
    [demo moneyTest];
    [demo ticketTest];
    
    
}


@end
