//
//  main.m
//  ObjectiveC-Example
//
//  Created by Francisco on 2018-08-13.
//  Copyright © 2018 Francisco. All rights reserved.
//

//
//  main.m
//  ObjectiveC-Example
//
//  Created by Francisco on 2018-08-13.
//  Copyright © 2018 Francisco. All rights reserved.
//

#import <Foundation/Foundation.h>


NSString *options[8] = {
    @"Uppercase",
    @"Lowercase",
    @"Numberize",
    @"Canadianize",
    @"Respond",
    @"De-Space-It",
    @"Reverse",
    @"Exit"
};

int menu(){
    int i;
    char inputChars[10];
    
    printf("---------------\n");
    printf("Word conversion\n");
    printf("---------------\n");
    for(i=0; i<8; i++){
        printf("%d.- %s\n", i+1, [options[i] UTF8String]);
    }
    
    printf("Select an option [1 - 8]: ");
    // limit input to max 255 characters
    fgets(inputChars, 10, stdin);
    
    int option = atoi(inputChars);
    
    return option;
    
}

void uppercase(NSString *word){
    printf("%s\n", [[word uppercaseString] UTF8String]);
}


void lowercase(NSString *word){
    printf("%s\n", [[word lowercaseString] UTF8String]);
}

void numberize(NSString *word){
    int number = [word intValue];
    printf("Number %d\n", number);

}

void canadianize(NSString *word){
    NSString *extra = @", eh?";
    NSString *final = [word stringByAppendingString:extra];
    printf("%s\n", [final UTF8String]);

}


void respond(NSString *word){
    unichar lastChar = [word characterAtIndex:[word length] - 1];
    
    if (lastChar == '?'){
        printf("I dont know\n");
    }
    if (lastChar == '!'){
        printf("Whoa, calm down!\n");
    }
    
}

void despace(NSString *word){
    printf("%s\n", [[word stringByReplacingOccurrencesOfString:@" " withString:@""] UTF8String]);
}

NSString *reverseString(NSString *text)
{
    NSMutableString *reversedStr;
    int len = (int)[text length];
    
    // Auto released string
    reversedStr = [NSMutableString stringWithCapacity:len];
    
    // Probably woefully inefficient...
    while (len > 0)
        [reversedStr appendString:
         [NSString stringWithFormat:@"%C", [text characterAtIndex:--len]]];
    
    return reversedStr;
}

void reverse(NSString *word){
    printf("%s\n", [reverseString(word) UTF8String]);
}



int main(int argc, const char * argv[]) {
    //NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    @autoreleasepool {
        int opt;
        char word[100];
        
        printf("Enter a word : ");
        // limit input to max 255 characters
        fgets(word, 100, stdin);
        strtok(word, "\n");
        NSString *nsword = [NSString stringWithUTF8String:word];

        
        while ( (opt = menu() ) !=8 ){
            if (opt >= 1 && opt<=7){
                printf("********************\n");
                printf("Selected option %d [%s]\n",opt, [options[opt-1] UTF8String]);
                printf("****** Result ******\n");
                switch (opt) {
                    case 1:
                        uppercase(nsword);
                        break;
                    case 2:
                        lowercase(nsword);
                        break;
                    case 3:
                        numberize(nsword);
                        break;
                    case 4:
                        canadianize(nsword);
                        break;
                    case 5:
                        respond(nsword);
                        break;
                    case 6:
                        despace(nsword);
                        break;
                    case 7:
                        reverse(nsword);
                        break;
                    default:
                        break;
            }
            }
        };
        

    //[pool drain];
    }
    return 0;
}
