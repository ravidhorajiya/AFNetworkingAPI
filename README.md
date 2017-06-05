# AFNetworkingAPI
Create global function with AFNetworking for API calling of GET and POST method.

Just call above method



    objWebServices.delegate = self;
    
    NSDictionary *dict =  @{
                            @"key":@"Value",
                            @"key":@"Value"
                            };
    [objWebServices callApiWithParameters:dict apiName:APIURL type:POST_REQUEST loader:YES view:self];
    
    //upload audio to server.
    [objWebServices callApiWithParameters:dict AudioParameters:@"ADD KEY NAME" AudioData:[NSData dataWithContentsOfFile:@"ADD FILE"] apiName:APIURL type:POST_REQUEST loader:YES view:self];
    
    //upload image to server.
    [objWebServices callApiWithParameters:dict imageParameters:@"ADD KEY NAME" imageData:[NSData dataWithContentsOfFile:@"ADD FILE"] apiName:APIURL type:POST_REQUEST loader:YES view:self];

And you get response this function

      -(void)response:(NSDictionary *)responseDict apiName:(NSString *)apiName ifAnyError:(NSError *)error
      {
          if ([apiName isEqualToString:APIURL])
          {
              if(responseDict != nil)
              {
                  NSLog(@"%@",responseDict.description);
              }
          }
          else
          {
              NSLog(@"Connection time out!");
          }
      }
