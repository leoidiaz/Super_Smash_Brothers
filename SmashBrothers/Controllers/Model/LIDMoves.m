//
//  LIDMoves.m
//  SmashBrothers
//
//  Created by Leonardo Diaz on 5/7/20.
//  Copyright © 2020 Leonardo Diaz. All rights reserved.
//

#import "LIDMoves.h"

@implementation LIDMoves

- (instancetype)initWithMove:(NSString *)moveName
{
    self = [super init];
    if(self){
        _moveName = moveName;
    }
    return self;
}


@end

@implementation LIDMoves (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)movesDictionary
{
    NSString *moveName = movesDictionary[@"Name"];
    return [self initWithMove:moveName];
}
@end
