//
//  DVMPerson.h
//  SWAPI-OBJC
//
//  Created by Hunter McNeil on 6/25/20.
//  Copyright © 2020 Hunter McNeil. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DVMPerson : NSObject

@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, readonly) NSString *height;

-(instancetype)initWithName:(NSString *)name height:(NSString *)height;

@end

@interface DVMPerson (JSONConvertable)
-(instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary;

@end

NS_ASSUME_NONNULL_END
