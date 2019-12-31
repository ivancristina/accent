```objectivec
// Experimental Notes.app 

%hook UIToolbar
-(void)setTintColor:(id)arg1
{
    if (isCurrentApp(@"com.apple.mobilenotes")) {
            arg1 = newColor;
    }
    %orig;
}
%end

%hook UINavigationBar
-(void)layoutSubviews
{
    %orig;
    if (isCurrentApp(@"com.apple.mobilenotes")) {
            self.tintColor = newColor;
    }
}
%end

%hook UIImageView
-(void)layoutSubviews
{
    %orig;
    if (isCurrentApp(@"com.apple.mobilenotes")) {
            self.tintColor = newColor;
    }
}

// Side effect: themes even the keyboard in Notes

-(UIColor *)tintColor
{
    if (isCurrentApp(@"com.apple.mobilenotes")) {
            return newColor;
    } else {
        return %orig;
    }
}
%end
```