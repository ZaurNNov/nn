//
//  NewClass2.h
//  nn
//
//  Created by Zaur Giyasov on 26/06/2018.
//  Copyright © 2018 Zaur Giyasov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewClass2 : NSObject <NSCopying, NSCoding>

@property (nonatomic, strong) NSString *name;

-(id)initWithName: (NSString *)name;

-(void)archiveMyPropertyAs:(NSString *)saveDataName;
-(id)unarchiveMyPropertyFrom:(NSString *)saveDataName;

@end
