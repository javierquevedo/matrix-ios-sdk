/*
 Copyright 2014 OpenMarket Ltd

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

 http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */

#import "MXFileStoreMetaData.h"

@implementation MXFileStoreMetaData

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [self init];
    if (self)
    {
        NSDictionary *dict = [aDecoder decodeObjectForKey:@"dict"];
        _homeServer = dict[@"homeServer"];
        _userId = dict[@"userId"];
        _accessToken = dict[@"accessToken"];
        _eventStreamToken = dict[@"eventStreamToken"];
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    // All properties are mandatory except eventStreamToken
    NSMutableDictionary *dict =[NSMutableDictionary dictionaryWithDictionary:
                                @{
                                  @"homeServer": _homeServer,
                                  @"userId": _userId,
                                  @"accessToken": _accessToken,
                                  }];

    if (_eventStreamToken)
    {
        dict[@"eventStreamToken"] = _eventStreamToken;
    }

    [aCoder encodeObject:dict forKey:@"dict"];
}
@end
