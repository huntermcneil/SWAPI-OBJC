//
//  DVMPerson.m
//  SWAPI-OBJC
//
//  Created by Hunter McNeil on 6/25/20.
//  Copyright © 2020 Hunter McNeil. All rights reserved.
//

#import "DVMPerson.h"

@implementation DVMPerson

- (instancetype)initWithName:(NSString *)name height:(NSString *)height
{
    self = [super init];
    
    if (self)
    {
        _name = name;
        _height = height;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    NSString *name = dictionary[@"name"];
    NSString *height = dictionary[@"height"];
    
    return [self initWithName:name height:height];
}

@end
