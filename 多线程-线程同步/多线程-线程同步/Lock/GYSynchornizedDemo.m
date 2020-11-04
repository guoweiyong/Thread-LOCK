//
//  GYSynchornizedDemo.m
//  多线程-线程同步
//
//  Created by admin on 2020/11/4.
//

#import "GYSynchornizedDemo.h"

@implementation GYSynchornizedDemo

- (void)__drawMoney {
    //[self class]:  该对象相当于一个锁对象
    @synchronized ([self class]) { //底层执行 objc_sync_enter
        [super __drawMoney];
    }//objc_sync_exit
   
}

- (void)__saveMoney {
    @synchronized ([self class]) {
        [super __saveMoney];
    }
}

- (void)__saleTicket {
   //如果想每个方法单独使用一把锁，建议可以这样使用
    static NSObject *objLock;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        objLock = [[NSObject alloc] init];
    });
    
    @synchronized (objLock) {
        [super __saleTicket];
    }
}


@end
