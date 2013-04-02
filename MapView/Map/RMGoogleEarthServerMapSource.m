//
// RMGoogleEarthServerMapSource.m
//
// Copyright (c) 2008-2013, Route-Me Contributors
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//
// * Redistributions of source code must retain the above copyright notice, this
//   list of conditions and the following disclaimer.
// * Redistributions in binary form must reproduce the above copyright notice,
//   this list of conditions and the following disclaimer in the documentation
//   and/or other materials provided with the distribution.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
// ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
// LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
// CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
// SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
// INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
// CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
// ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
// POSSIBILITY OF SUCH DAMAGE.


#import "RMGoogleEarthServerMapSource.h"

@implementation RMGoogleEarthServerMapSource

-(id)init {
    NSLog(@"You Must Set the Channel and Version vars");
    if(self = [super init]) {
        return self;
    }
    return nil;
}

-(id) initWithBaseUrl:(NSString*)geurl channel:(NSString*)gechannel version:(NSString*)geversion
{
	if(self = [super init])
	{
        baseUrl = geurl;
        channel = gechannel;
        version = geversion;
		[self setMaxZoom:18];
		[self setMinZoom:1];
	}
	return self;
}

-(NSString*)tileURL: (RMTile) tile
{
    NSString *urlString = [NSString stringWithFormat:@"%@/query?request=ImageryMaps&channel=%@&version=%@&x=%d&y=%d&z=%d", baseUrl, channel, version, tile.x, tile.y, tile.zoom];
    NSLog(@"%@",urlString);
    return urlString;
}

-(NSURL *)URLForTile:(RMTile)tile {

    return [NSURL URLWithString:[self tileURL:tile]];
}

-(NSString*) uniqueTilecacheKey
{
	return @"GoogleEarthServer";
}

-(NSString *)shortName
{
	return @"GE Server";
}
-(NSString *)longDescription
{
	return @"Google Earth Server Version 4.3";
}
-(NSString *)shortAttribution
{
	return @"© OpenStreetMap CC-BY-SA";
}
-(NSString *)longAttribution
{
	return @"TST Google Earth Server";
}

@end
