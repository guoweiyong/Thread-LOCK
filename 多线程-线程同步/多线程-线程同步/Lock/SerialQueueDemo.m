//
//  SerialQueueDemo.m
//  多线程-线程同步
//
//  Created by 郭为勇 on 2020/11/3.
//

#import "SerialQueueDemo.h"

@interface SerialQueueDemo ()

/** <#descrption#> */
@property (nonatomic, strong) dispatch_queue_t serialQueue;
@end
@implementation SerialQueueDemo



- (instancetype)init
{
    if (self = [super init]) {
        self.serialQueue = dispatch_queue_create("myqueue", DISPATCH_QUEUE_SERIAL);
    }
    return self;
}

- (void)__drawMoney
{
    dispatch_sync(self.serialQueue, ^{
        [super __drawMoney];
    });
    
}

- (void)__saveMoney
{
    dispatch_sync(self.serialQueue, ^{
        [super __saveMoney];
    });
}

- (void)__saleTicket
{
    dispatch_sync(self.serialQueue, ^{
        [super __saleTicket];
    });
}



@end
