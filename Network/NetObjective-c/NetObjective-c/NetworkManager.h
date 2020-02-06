//
//  NetworkManager.h
//  NetObjective-c
//
//  Created by 휴빌론 on 06/02/2020.
//  Copyright © 2020 hubilon. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef void (^ResponseBlock)(NSMutableDictionary *data, NSError *error);

@interface NetworkManager : NSObject


- (void)getRequestHTTP:(NSString *)url httpMethod:(NSString *)httpMethod completion:(ResponseBlock)completion;
- (void)postRequestHTTP:(NSString *)url httpMethod:(NSString *)httpMethod  body:(NSMutableData *)body completion:(ResponseBlock)completion;
@end


