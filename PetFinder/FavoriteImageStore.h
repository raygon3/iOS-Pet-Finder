//
//  FavoriteImageStore.h
//  PetFinder v1.0
//
//  Created by Raymond Gonzalez, Reyneiro Hernandez, Gregory Jean Baptiste
//  https://github.com/raygon3/iOS-Pet-Finder
//
//  This work is licensed under the Creative Commons Attribution 3.0 Unported License. To view a copy of this license, visit
//  http://creativecommons.org/licenses/by/3.0/

#import <Foundation/Foundation.h>

@interface FavoriteImageStore : NSObject
{
    NSMutableDictionary * dictionary;
}

+(FavoriteImageStore *)sharedImages;

-(void)setImage:(UIImage *)i forKey:(NSString *)s;
-(UIImage *)imageForKey:(NSString *)s;
-(void)deleteImageForKey:(NSString *)s;
-(NSString *)imagePathForKey:(NSString *)key;

@end
