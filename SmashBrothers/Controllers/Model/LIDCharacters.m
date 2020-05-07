//
//  LIDCharacters.m
//  SmashBrothers
//
//  Created by Leonardo Diaz on 5/7/20.
//  Copyright © 2020 Leonardo Diaz. All rights reserved.
//

#import "LIDCharacters.h"

@implementation LIDCharacters

- (instancetype)initWithCharacterName:(NSString *)characterName thumbnail:(NSString *)thumbnail moves:(NSString *)moves
{
    self = [super init];
    if (self){
        _name = characterName;
        _thumbnail = thumbnail;
        _moves = moves;
    }
    return self;
}

@end

@implementation LIDCharacters (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    NSString *name = dictionary[@"Name"];
    NSString *thumbnail = dictionary[@"ThumbnailUrl"];
    
    NSDictionary *related = dictionary[@"Related"];
    NSDictionary *smash4 = related[@"Smash4"];
    NSString *moves = smash4[@"Moves"];
    
    return [self initWithCharacterName:name thumbnail:thumbnail moves:moves];
}

@end
