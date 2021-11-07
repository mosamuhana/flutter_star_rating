# flutter_star_rating package


A Star rating with touch and swipe rate enabled
* Supports replacing default star icons with desired IconData
* Supports half rate and full rate (1.0 or 0.5)
* Swipe for incrementing/decrementing rate amount
* Change star body and boundary colors independently
* Control size of the star rating
* Set your desired total Star count
* Supports click-to-rate
* Spacing between stars

## Getting Started

In your flutter project add the dependency:
```
    dependencies:
        ...
        flutter_star_rating:
```

## Usage example
```dart
import 'package:flutter_star_rating/flutter_star_rating.dart'; 

SmoothStarRating(
    allowHalfRating: false,
    onChanged: (v) => setState(() => rating = v),
    count: 5,
    value: rating,
    size: 40.0,
    filledIcon: Icons.blur_off,
    halfIcon: Icons.blur_on,
    color: Colors.green,
    borderColor: Colors.green,
    spacing:0.0
)
```

## Constructor parameters
``` 
allowHalfRating             -   Whether to use whole number for rating(1.0  or 0.5)
onChanged(double rating)    -   Rating changed callback
count                       -   The maximum amount of stars
value                       -   The current value of rating
size                        -   The size of a single star
color                       -   The body color of star
borderColor                 -   The border color of star
spacing                     -   Spacing between stars(default is 0.0)
filledIcon                  -   Full Rated Icon
halfIcon                    -   Half Rated Icon
defaultIcon                 -   Default Rated Icon
```

### Screenshots

![alt text](screenshots/screen1.gif "Star Rating")
