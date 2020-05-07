//
//  LIDCharacterController.m
//  SmashBrothers
//
//  Created by Leonardo Diaz on 5/7/20.
//  Copyright © 2020 Leonardo Diaz. All rights reserved.
//

#import "LIDCharacterController.h"
#import "LIDCharacters.h"
#import "LIDMoves.h"

#import <UIKit/UIKit.h>

@implementation LIDCharacterController

static NSString *const baseURLString = @"https://api.kuroganehammer.com/api";
static NSString *const characterComponent = @"characters";

#pragma mark - Fetch Characters
+ (void)fetchWithCharacters:(void (^)(NSArray<LIDCharacters *> * ))completion
{
    // URL
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURL *finalURL = [baseURL URLByAppendingPathComponent:characterComponent];
    NSLog(@"%@", finalURL);
    
    //Session
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData *  data, NSURLResponse *  response, NSError *  error) {

        //Error
        if (error){
            NSLog(@"There was an error in %s: %@, %@", __PRETTY_FUNCTION__, error, [error localizedDescription]);
            completion(nil);
            return;
        }
        
        if (!data){
            NSLog(@"There was an error in %s: %@, %@", __PRETTY_FUNCTION__, error, [error localizedDescription]);
            completion(nil);
            return;
        }
        
        //Data
        NSArray *topLevelArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        
        NSMutableArray *characterArray = [NSMutableArray new];
        
        for (NSDictionary *characterDictionary in topLevelArray){
            LIDCharacters *characters = [[LIDCharacters alloc] initWithDictionary:characterDictionary];
            [characterArray addObject:characters];
        }
        
        //Completion
        completion(characterArray);
        
    }]resume];
    
}

#pragma mark - Fetch Thumbnail
+ (void)fetchthumbNailWithCharacter:(LIDCharacters *)character completion:(void (^)(UIImage * ))completion
{
    NSString *thumbnailString = [[NSString alloc]initWithFormat:@"%@", character.thumbnail];
    NSURL *thumbnailURL = [[NSURL alloc] initWithString:thumbnailString];
    
    NSLog(@"%@", thumbnailURL);

    [[[NSURLSession sharedSession] dataTaskWithURL:thumbnailURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if(error){
            NSLog(@"There was an error in %s: %@, %@", __PRETTY_FUNCTION__, error, [error localizedDescription]);
            completion(nil);
            return;
        }
        
        if(!data){
            NSLog(@"There was an error in %s: %@, %@", __PRETTY_FUNCTION__, error, [error localizedDescription]);
            completion(nil);
            return;
        }
        UIImage *thumbnail = [[UIImage alloc]initWithData:data];
        
        if(!thumbnail){
            NSLog(@"There was an error in %s: %@, %@", __PRETTY_FUNCTION__, error, [error localizedDescription]);
            completion(nil);
            return;
        }
        
        completion(thumbnail);
        
    }]resume];
}

#pragma mark - Fetch moves

+ (void)fetchMovesWithCharacter:(LIDCharacters *)character completion:(void (^)(NSArray<NSString *> * ))completion
{
    NSString *thumbnailString = [[NSString alloc]initWithFormat:@"%@", character.moves];
    NSURL *movesURL = [[NSURL alloc] initWithString:thumbnailString];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:movesURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error){
            NSLog(@"There was an error in %s: %@, %@", __PRETTY_FUNCTION__, error, [error localizedDescription]);
            completion(nil);
            return;
        }
        
        if(!data){
            NSLog(@"There was an error in %s: %@, %@", __PRETTY_FUNCTION__, error, [error localizedDescription]);
            completion(nil);
            return;
        }
        
        NSArray *topLevelArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        
        NSMutableArray *movesArray = [NSMutableArray new];
        
        for (NSDictionary *moves in topLevelArray){
            LIDMoves *moveNames = [[LIDMoves alloc] initWithDictionary:moves];
            [movesArray addObject:moveNames];
        }
        
        completion(movesArray);
        
    }]resume];
}


@end
