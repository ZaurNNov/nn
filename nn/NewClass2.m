//
//  NewClass2.m
//  nn
//
//  Created by Zaur Giyasov on 26/06/2018.
//  Copyright © 2018 Zaur Giyasov. All rights reserved.
//

#import "NewClass2.h"

@implementation NewClass2

-(id)copyWithZone:(NSZone *)zone {
    
    NewClass2 *copySelf = [[NewClass2 alloc] init];
    copySelf.name = [self.name copy];
    return copySelf;
}

@end
