//
//  MutexDemo2.m
//  多线程-线程同步
//
//  Created by admin on 2020/10/31.
//

#import "MutexDemo2.h"
#import <pthread/pthread.h>

@interface MutexDemo2()
@property (assign, nonatomic) pthread_mutex_t lock;

@end

@implementation MutexDemo2

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
    pthread_mutexattr_settype(&attrs, PTHREAD_MUTEX_RECURSIVE);//递归锁
    
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
        self.lock = [self __initlock:self.lock];
    }
    return self;
}


/// 测试递归锁: 对同一个线程是可以重复加锁的
- (void)otherTest {
    pthread_mutex_lock(&_lock);
    NSLog(@"__%s__",__func__);
    
    static int count = 0;
    if (count < 10) {
        count ++;
        [self otherTest];
    }
    
    pthread_mutex_unlock(&_lock);
    
}

@end
