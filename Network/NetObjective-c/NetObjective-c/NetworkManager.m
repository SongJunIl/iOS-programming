//
//  NetworkManager.m
//  NetObjective-c
//
//  Created by 휴빌론 on 06/02/2020.
//  Copyright © 2020 hubilon. All rights reserved.
//

#import "NetworkManager.h"

@implementation NetworkManager


- (void)getRequestHTTP:(NSString *)url httpMethod:(NSString *)httpMethod completion:(ResponseBlock)completion
{
    NSURL *URL = [NSURL URLWithString:url];
    NSMutableURLRequest *request =[[NSMutableURLRequest alloc] init];
    
//    NSData *postData = [/*보낼 파라메터*/ dataUsingEncoding:NSUTF8StringEncoding];
//    NSString *postLength = [NSString stringWithFormat:@"%d", (int)[postData length]];
//    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
//    [request setHTTPBody:postData];
    
    [request setURL:URL];
    [request setHTTPMethod:httpMethod];
    [request setValue:@"Mozilla/4.0 (compatible;)" forHTTPHeaderField:@"User-Agent"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request
                                                    completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
                                          {
                                              NSError *myError = error;
                                              NSMutableDictionary *productionSchedule = [[NSMutableDictionary alloc]initWithDictionary:[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&myError]];
        
                                            /*네트워크 통신이 완료되면 데이터를 콜백한다.*/
                                            completion(productionSchedule,error);
                                              
                                          }];
        [dataTask resume];

}
    
- (void)postRequestHTTP:(NSString *)url httpMethod:(NSString *)httpMethod  body:(NSDictionary *)body completion:(ResponseBlock)completion
{
    NSError *error;

//    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURL *URL = [NSURL URLWithString:url];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:URL
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];

    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];

    [request setHTTPMethod:@"POST"];
    // NSDictionary *mapData = [[NSDictionary alloc] initWithObjectsAndKeys: @"TEST IOS", @"name",@"IOS TYPE", @"typemap",nil];
    NSDictionary *mapData = body;
    NSData *postData = [NSJSONSerialization dataWithJSONObject:mapData options:0 error:&error];
    [request setHTTPBody:postData];


    NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
     NSError *myError = error;
     NSMutableDictionary *productionSchedule = [[NSMutableDictionary alloc]initWithDictionary:[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&myError]];
        /*네트워크 통신이 완료되면 데이터를 콜백한다.*/
        completion(productionSchedule,error);
    }];

    [postDataTask resume];
}
@end
