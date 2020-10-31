//
//  OS_unfair_lockDemo.m
//  多线程-线程同步
//
//  Created by admin on 2020/10/31.
//

#import "OS_unfair_lockDemo.h"
#import <os/lock.h>
@interface OS_unfair_lockDemo()
@property (assign, nonatomic) os_unfair_lock moneyLock;
@property (assign, nonatomic) os_unfair_lock ticketLock;
@end

@implementation OS_unfair_lockDemo

- (instancetype)init
{
    if (self = [super init]) {
        self.moneyLock = OS_UNFAIR_LOCK_INIT;
        self.ticketLock = OS_UNFAIR_LOCK_INIT;
    }
    return self;
}

- (void)__drawMoney
{
    //加锁
    os_unfair_lock_lock(&_moneyLock);
    
    [super __drawMoney];
    os_unfair_lock_unlock(&_moneyLock);
    
}

- (void)__saveMoney
{
    os_unfair_lock_lock(&_moneyLock);
    
    
    [super __saveMoney];
    
    os_unfair_lock_unlock(&_moneyLock);
}

- (void)__saleTicket
{
    os_unfair_lock_lock(&_ticketLock);
    [super __saleTicket];
    os_unfair_lock_unlock(&_ticketLock);
}

@end
