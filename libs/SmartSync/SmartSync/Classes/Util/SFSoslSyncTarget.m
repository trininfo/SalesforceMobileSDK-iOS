/*
 Copyright (c) 2015, salesforce.com, inc. All rights reserved.
 
 Redistribution and use of this software in source and binary forms, with or without modification,
 are permitted provided that the following conditions are met:
 * Redistributions of source code must retain the above copyright notice, this list of conditions
 and the following disclaimer.
 * Redistributions in binary form must reproduce the above copyright notice, this list of
 conditions and the following disclaimer in the documentation and/or other materials provided
 with the distribution.
 * Neither the name of salesforce.com, inc. nor the names of its contributors may be used to
 endorse or promote products derived from this software without specific prior written
 permission of salesforce.com, inc.
 
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR
 IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
 FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
 CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY
 WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#import "SFSoslSyncTarget.h"

NSString * const kSFSoslSyncTargetQuery = @"query";

@interface SFSoslSyncTarget ()

@property (nonatomic, strong, readwrite) NSString* query;

@end

@implementation SFSoslSyncTarget

#pragma mark - Factory methods

+ (SFSoslSyncTarget*) newSyncTarget:(NSString*)query {
    SFSoslSyncTarget* syncTarget = [[SFSoslSyncTarget alloc] init];
    syncTarget.queryType = SFSyncTargetQueryTypeSosl;
    syncTarget.query = query;
    syncTarget.isUndefined = NO;
    return syncTarget;
}


#pragma mark - From/to dictionary

+ (SFSoslSyncTarget*) newFromDict:(NSDictionary*)dict {
    SFSoslSyncTarget* syncTarget = [[SFSoslSyncTarget alloc] init];
    if (syncTarget) {
        if (dict == nil || [dict count] == 0) {
            syncTarget.isUndefined = YES;
        }
        else {
            syncTarget.isUndefined = NO;
            syncTarget.queryType = SFSyncTargetQueryTypeSosl;
            syncTarget.query = dict[kSFSoslSyncTargetQuery];
        }
    }
    
    return syncTarget;
}

- (NSDictionary*) asDict {
    NSDictionary* dict;

    if (self.isUndefined) {
        dict = @{};
    }
    else {
        dict = @{
        kSFSyncTargetQueryType: [SFSyncTarget queryTypeToString:self.queryType],
        kSFSoslSyncTargetQuery: self.query
        };
    }

    return dict;
}

@end
