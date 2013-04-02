//
//  TSTGEServerMapSource.m
//  MapView
//
//  Created by Wes Richardet on 2/28/13.
//
//

#import "TSTGEServerMapSource.h"

@implementation TSTGEServerMapSource

-(id) init
{
	if(self = [super init])
	{
		//http://gee.t-sciences.com/default_map
		[self setMaxZoom:18];
		[self setMinZoom:1];
	}
	return self;
}

-(NSString*) tileURL: (RMTile) tile
{
    return [self urlStringForTile:tile];
}

-(NSString*)urlStringForTile:(RMTile)tile {
	NSString *urlString = [NSString stringWithFormat:@"http://gee.t-sciences.com/default_map/query?request=ImageryMaps&channel=1085&version=10&x=%d&y=%d&z=%d", tile.x, tile.y, tile.zoom];
    NSLog(@"%@",urlString);
    return urlString;
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
