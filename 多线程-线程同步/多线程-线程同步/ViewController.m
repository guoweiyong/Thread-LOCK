//
//  ViewController.m
//  多线程-线程同步
//
//  Created by admin on 2020/10/31.
//

#import "ViewController.h"
#import "GYBaseDemo.h"
#import "OSSpinLockDemo.h"
#import "OS_unfair_lockDemo.h"
#import "MutexDemo.h"
#import "MutexDemo2.h"
#import "GYConditionLock.h"
#import "SerialQueueDemo.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    GYBaseDemo *demo = [[SerialQueueDemo alloc] init];
    [demo moneyTest];
    [demo ticketTest];
    
//    [demo otherTest];
    
}


@end
