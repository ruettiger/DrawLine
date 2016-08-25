# DrawLine
涂鸦板

```ruby
pod "DrawLine"
```

## Example

#import "MFSDDrawLineView.h"

MFSDDrawLineView* _MFSDDrawLineView = [[MFSDDrawLineView alloc]initWithFrame:self.view.bounds];

_MFSDDrawLineView.backgroundColor = [UIColor colorWithRed:0.192 green:0.985 blue:1.000 alpha:1.000];

_MFSDDrawLineView.currentLineColor = [UIColor redColor];

_MFSDDrawLineView.currentLineWidth = 5.0f;

[self.view addSubview:_MFSDDrawLineView];
