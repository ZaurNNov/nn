//
//  NewClass2.m
//  nn
//
//  Created by Zaur Giyasov on 26/06/2018.
//  Copyright © 2018 Zaur Giyasov. All rights reserved.
//

#import "NewClass2.h"

@implementation NewClass2

// For true copyng
-(id)copyWithZone:(NSZone *)zone
{
    NewClass2 *copySelf = [[NewClass2 alloc] init];
    copySelf.name = [self.name copy];
    return copySelf;
}

-(id)initWithName: (NSString *)name {
    self = [super init];
    if (!self) {
        return nil;
    }
    self.name = name;
    return self;
}

-(NSString *)description {
    // print self property
    return [NSString stringWithFormat:@"%@", ((void)(@"this is new: %@"), _name)];
}

- (void)encodeWithCoder:(NSCoder *)coder
{
    [coder encodeObject:_name forKey:@"Name"];
}


- (nullable instancetype)initWithCoder:(nonnull NSCoder *)aDecoder {
    _name = [aDecoder decodeObjectForKey:@"Name"];
    return self;
}


// Returns the URL to the application's Documents directory.
- (NSURL *)applicationDocumentsDirectory {
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory
                                                   inDomains:NSUserDomainMask] lastObject];
}

// Returns the file path from Documents directory.
- (NSString *)pathToFile: (NSString *)saveName {
    return [[self applicationDocumentsDirectory].path stringByAppendingPathComponent:saveName];
}

// Save (pack) self property in file
-(void)archiveMyPropertyAs:(NSString *)saveDataName {
    NSLog(@"%@", [self pathToFile:saveDataName]);
    [NSKeyedArchiver archiveRootObject:_name toFile:[self pathToFile:saveDataName]];
}

// Unpack self property from file
-(id)unarchiveMyPropertyFrom:(NSString *)saveDataName {
    NSLog(@"%@", [self pathToFile:saveDataName]);
    _name = [NSKeyedUnarchiver unarchiveObjectWithFile:[self pathToFile:saveDataName]];
    return self;
}

@end
