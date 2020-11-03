//
//  NSConditionLock.m
//  多线程-线程同步
//
//  Created by 郭为勇 on 2020/11/3.
//

#import "GYConditionLock.h"


@interface GYConditionLock()
@property (strong, nonatomic) NSConditionLock *lock;
@end

@implementation GYConditionLock

- (instancetype)init
{
    if (self = [super init]) {
        //[[NSConditionLock alloc] init]如果初始化条件， 默认condition为0
        self.lock = [[NSConditionLock alloc] initWithCondition:1];
    }
    return self;
}

- (void)otherTest
{
    [[[NSThread alloc] initWithTarget:self selector:@selector(__one) object:nil] start];
    
    [[[NSThread alloc] initWithTarget:self selector:@selector(__two) object:nil] start];
}


- (void)__one
{
    //[self.lock lock]; -- 如果调用lock加锁方法不管条件是什么，都会加锁，该方法表示，只要没加锁，就加锁，跟条件没有任何关系
    //当条件为1 时 加锁， 如果条件不是1 则一直等待，知道条件为1 在加锁
    [self.lock lockWhenCondition:1];
    NSLog(@"__one");
    
    //修改加锁条件为2 ，并且放开当前锁（解锁）
    [self.lock unlockWithCondition:2];
}


- (void)__two
{
    [self.lock lockWhenCondition:2];
    sleep(1);
    
    NSLog(@"__two");
    
    [self.lock unlock];
}


@end
