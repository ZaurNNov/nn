//
//  NewClass.h
//  nn
//
//  Created by Zaur Giyasov on 26/06/2018.
//  Copyright © 2018 Zaur Giyasov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NewClass2.h"

@interface NewClass : NSObject <NSCopying>

@property (nonatomic) NSString *string1;
@property (nonatomic, copy) NSString *string2Copy;
@property (nonatomic) NSArray *array1;
@property (nonatomic, copy) NSArray *array2Copy;

@property (nonatomic, copy) NewClass2 *class2Object;

-(instancetype)initWithData;

@end
