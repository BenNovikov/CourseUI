//
//  NSString+BNNExtensions.m
//  Course
//
//  Created by Admin on 15/07/26/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "NSString+BNNExtensions.h"

@implementation NSString (BNNExtensions)

#pragma mark -
#pragma mark Class Methods

+ (NSString *)downloadJSONfromURL:(NSString *)url;
{
    NSError *error = nil;
    NSString *message = kBNNErrorNoParameter;
    if (nil != url)
    {
        NSString *dataURL = [NSString stringWithFormat:@"%@", url];
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:dataURL]];
        NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
        
        if (nil != response) {
            NSString *jsonString = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];
            
            return jsonString;
        }
        message = kBNNErrorReadJSON;
    }
    NSLog(@"%@:%@", message, error);
    
    return nil;
}

+ (NSString *)JSONStringFromDictionary:(NSDictionary *)dictionary
{
    NSError *error = nil;
    NSString *message = kBNNErrorNoParameter;
    if (nil != dictionary)
    {
        //commented realization keeps Quotation Marks in the output string
//        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dictionary
//                                                           options:NSJSONWritingPrettyPrinted
//                                                             error:&error];
//        NSString *jsonString = [[[NSString alloc] initWithData:jsonData
//                                                      encoding:NSUTF8StringEncoding] autorelease];
        NSMutableString *string = [NSMutableString new];
        
        [dictionary enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
            [string appendFormat:@"%@ : %@\n", key, obj];
        }];
        
        if (nil == error) {
            
            return [string copy];
        }
        message = kBNNErrorConvertToString;
    }
    NSLog(@"%@:%@", message, error);
    
    return nil;
}

+ (NSDictionary *)dictionaryFromJSONString:(NSString *)jsonString options:(NSUInteger)optionsPrettyPrint
{
    NSError *error = nil;
    NSString *message = kBNNErrorNoParameter;
    
    if (nil != jsonString)
    {
        NSData *data = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
        
        NSError *error;
        NSDictionary *jsonDictionary = [self new];
        jsonDictionary  = [NSJSONSerialization JSONObjectWithData:data
                                                          options:optionsPrettyPrint
                                                            error:&error];

        if ([NSJSONSerialization isValidJSONObject:jsonDictionary]) {
            return jsonDictionary;
        }
        message = kBNNErrorConvertToDictionary;
    }
    NSLog(@"%@:%@", message, error);
    
    return nil;
}

+ (NSString *)alphabetAlphanumeric {
    return [[NSString alphabetNumeric] stringByAppendingString:[NSString alphabetLiteral]];
}
+ (NSString *)alphabetNumeric {
    return [NSString alphabetWithUnicodeRange:NSMakeRange('0', '9' - '0' + 1)];
}

+ (NSString *)alphabetLiteral {
    return [[NSString alphabetCapitalized] stringByAppendingString:[NSString alphabetLowercase]];
}

+ (NSString *)alphabetLowercase {
    return [NSString alphabetWithUnicodeRange:NSMakeRange('a', 'z' - 'a' + 1)];
}

+ (NSString *)alphabetCapitalized {
    return [NSString alphabetWithUnicodeRange:NSMakeRange('A', 'Z' - 'A' + 1)];
}

+ (NSString *)alphabetWithUnicodeRange:(NSRange)range {
    NSMutableString *string = [NSMutableString string];
    for (unichar character = range.location; character < NSMaxRange(range); character++) {
        [string appendFormat:@"%C", character];
    }
    
    return string;
}

+ (NSString *)randomUnicodeString {
    return [NSString randomUnicodeStringWithLength:kBNNDefaultRangeLength
                                      range:NSMakeRange(kBNNDefaultRangeLocation, kBNNDefaultRangeLength)];
}

+ (NSString *)randomUnicodeStringWithLength:(NSUInteger)length {
    return [NSString randomUnicodeStringWithLength:length range:NSMakeRange(kBNNDefaultRangeLocation, kBNNDefaultRangeLength)];
}

+ (NSString *)randomUnicodeStringWithLength:(NSUInteger)length range:(NSRange)range {
    NSMutableString *string = [NSMutableString stringWithCapacity:length];
    NSString *alphabet = [NSString alphabetWithUnicodeRange:range];
    u_int32_t countLength = (u_int32_t)range.length;
    
    for (NSUInteger counter = 0; counter < length; counter++) {
        [string appendFormat:@"%C", [alphabet characterAtIndex:arc4random_uniform(countLength)]];
    }
    
    return [string copy];
}

+ (NSString *)randomStringWithLength:(NSUInteger)length string:(NSString *)alphabet {
    NSMutableString *string = [NSMutableString stringWithCapacity:length];
    NSUInteger alphabetLength = [alphabet length];
    u_int32_t countLength = (u_int32_t)alphabetLength;
    
    for (NSUInteger counter = 0; counter < length; counter++) {
        [string appendFormat:@"%C", [alphabet characterAtIndex:arc4random_uniform(countLength)]];
    }
    
    return [string copy];
}

@end
