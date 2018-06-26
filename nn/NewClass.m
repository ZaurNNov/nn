//
//  NewClass.m
//  nn
//
//  Created by Zaur Giyasov on 26/06/2018.
//  Copyright © 2018 Zaur Giyasov. All rights reserved.
//

#import "NewClass.h"

@implementation NewClass 

-(instancetype)init {
    self = [super init];
    return self;
}

-(instancetype)initWithData {
    self = [self init];
    if (self) {
        _string1 = @"NSString *string1";
        _string2Copy = @"NSString *string2Copy";
        _array1 = @[@"one", @"two", @"three"];
        _array2Copy = @[@"nine", @"eight", @"seven"];
    }
    return self;
}

- (id)copyWithZone:(nullable NSZone *)zone
{
    NewClass *copyObject = [[NewClass alloc] init];
    copyObject.string1 = [self.string1 copy];
    copyObject.string2Copy = self.string2Copy.copy;
    copyObject.array1 = self.array1.copy;
    copyObject.array2Copy = self.array2Copy.copy;
    return copyObject;
}
@end
