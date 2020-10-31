//
//  MutexDemo.m
//  多线程-线程同步
//
//  Created by admin on 2020/10/31.
//

#import "MutexDemo.h"
#import <pthread/pthread.h>

@interface MutexDemo()
@property (assign, nonatomic) pthread_mutex_t moneyLock;
@property (assign, nonatomic) pthread_mutex_t ticketLock;
@end

@implementation MutexDemo

- (pthread_mutex_t)__initlock:(pthread_mutex_t)lock {
    //初始化锁的属性
    pthread_mutexattr_t attrs;
    pthread_mutexattr_init(&attrs);
    /**
     
     Mutex type attributes ，锁的类型属性
     
     #define PTHREAD_MUTEX_NORMAL        0
     #define PTHREAD_MUTEX_ERRORCHECK    1
     #define PTHREAD_MUTEX_RECURSIVE        2 ---》 递归锁
     #define PTHREAD_MUTEX_DEFAULT        PTHREAD_MUTEX_NORMAL  --默认锁类型
     */
    //设置锁的类型
    pthread_mutexattr_settype(&attrs, PTHREAD_MUTEX_DEFAULT);
    
    //初始化锁
    pthread_mutex_init(&lock, &attrs);
    
    //释放属性
    pthread_mutexattr_destroy(&attrs);
    //初始化的时候，如果属性参数传递NULL 代表是默认锁 类型
//    pthread_mutex_init(&lock, NULL);
    
    return  lock;
}

- (instancetype)init
{
    if (self = [super init]) {
        self.moneyLock = [self __initlock:self.moneyLock];
        self.ticketLock = [self __initlock:self.ticketLock];
    }
    return self;
}

- (void)__drawMoney
{
    //加锁
    pthread_mutex_lock(&_moneyLock);
    
    [super __drawMoney];
    //解锁
    pthread_mutex_unlock(&_moneyLock);
}

- (void)__saveMoney
{
    //加锁
    pthread_mutex_lock(&_moneyLock);
    
    
    [super __saveMoney];
    
    //解锁
    pthread_mutex_unlock(&_moneyLock);
}

- (void)__saleTicket
{
    pthread_mutex_lock(&_ticketLock);
    [super __saleTicket];
    pthread_mutex_unlock(&_ticketLock);
}

- (void)dealloc {
    //销毁锁
    pthread_mutex_destroy(&_moneyLock);
    pthread_mutex_destroy(&_ticketLock);
}

@end
