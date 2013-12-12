//
//  MRCBase.m
//  funWithCompSci
//
//  Created by Mathew Cruz on 12/12/13.
//
//

#import "MRCBase.h"
#import <mach/mach_time.h>

@implementation MRCBase

CGFloat BNRTimeBlock (void (^block)(void)) {
    mach_timebase_info_data_t info;
    if (mach_timebase_info(&info) != KERN_SUCCESS) return -1.0;
    
    uint64_t start = mach_absolute_time ();
    block ();
    uint64_t end = mach_absolute_time ();
    uint64_t elapsed = end - start;
    
    uint64_t nanos = elapsed * info.numer / info.denom;
    return (CGFloat)nanos / NSEC_PER_SEC;
    
}

@end
