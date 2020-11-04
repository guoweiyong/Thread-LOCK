//
//  GYSemaphoreDemo.m
//  多线程-线程同步
//
//  Created by admin on 2020/11/4.
//

#import "GYSemaphoreDemo.h"

@interface GYSemaphoreDemo ()

/// 创建一个信号值
@property (nonatomic, strong)dispatch_semaphore_t semaphore;
/// 创建一个信号值
@property (nonatomic, strong)dispatch_semaphore_t moneySemaphore;
/// 创建一个信号值
@property (nonatomic, strong)dispatch_semaphore_t tickSemaphore;


@end
@implementation GYSemaphoreDemo

- (instancetype)init
{
    self = [super init];
    if (self) {
        //初始化信号量，参数传递:控制最大并发数是 多少
        self.semaphore = dispatch_semaphore_create(5);
        self.moneySemaphore = dispatch_semaphore_create(1);
        self.tickSemaphore = dispatch_semaphore_create(1);
    }
    return self;
}

//使用dispatch_semaphore 控制最多允许5条线程执行
- (void)otherTest {
    for(int i = 0; i < 20 ; i++) {
        [[[NSThread alloc] initWithTarget:self selector:@selector(threadTest) object:nil] start];
    }
}

- (void)threadTest {
    
    dispatch_semaphore_wait(self.semaphore, DISPATCH_TIME_FOREVER);
    
    sleep(2);
    
    NSLog(@"current thread------%@",[NSThread currentThread]);
    
    dispatch_semaphore_signal(self.semaphore);
}


- (void)__drawMoney {
    dispatch_semaphore_wait(self.moneySemaphore, DISPATCH_TIME_FOREVER);
    [super __drawMoney];
    dispatch_semaphore_signal(self.moneySemaphore);
}

- (void)__saveMoney {
    dispatch_semaphore_wait(self.moneySemaphore, DISPATCH_TIME_FOREVER);
    [super __saveMoney];
    dispatch_semaphore_signal(self.moneySemaphore);
}

- (void)__saleTicket {
    dispatch_semaphore_wait(self.tickSemaphore, DISPATCH_TIME_FOREVER);
    [super __saleTicket];
    dispatch_semaphore_signal(self.tickSemaphore);
}

@end
