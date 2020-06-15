# CurvedRectangle

A SwiftUIView that creates a rectanle with a curved top, bottom or both.

![CurvedRectangle](/Users/slynch/Dropbox/SwiftUISamples/TopBottomCurvedRectangle/README.assets/CurvedRectangle.gif)



### How to use

Copy the **CurvedRectangle.swift** file into your project

Create a CurvedRectangle view just as you would a Rectangle() or other native SwiftUI shapes.

There are 3 optional parameters

​	**sides**: .top, .bottom or .both

​	**topCurve**: a CGFloat between 0 and 1

​	**bottomCurve**: a CGFloat between 0 and 1

##### Top Curve Example

![image-20200614224434759](/Users/slynch/Dropbox/SwiftUISamples/TopBottomCurvedRectangle/README.assets/image-20200614224434759.png)

`````swift
CurvedRectangle {
  sites: .top,
  topCurve: 0.2
}
`````

##### Bottom Curve Example

![image-20200614224554241](/Users/slynch/Dropbox/SwiftUISamples/TopBottomCurvedRectangle/README.assets/image-20200614224554241.png)

`````swift
CurvedRectangle {
  sites: .bottom,
  topCurve: -0.2
}
`````

##### Dual Curve Example

![image-20200614224628128](/Users/slynch/Dropbox/SwiftUISamples/TopBottomCurvedRectangle/README.assets/image-20200614224628128.png)

`````swift
CurvedRectangle {
  sites: .both,
  topCurve: 0.2,
  bottomCurve: -0.2
}
`````



