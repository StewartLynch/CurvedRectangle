# CurvedRectangle

A SwiftUIView that creates a rectanle with a curved top, bottom or both.

![CurvedRectangle](README.assets/CurvedRectangle.gif)



### How to use

Copy the **CurvedRectangle.swift** file into your project

Create a CurvedRectangle view just as you would a Rectangle() or other native SwiftUI shapes.

There are 3 optional parameters

​	**sides**: .top, .bottom or .both

​	**topCurve**: a CGFloat between 0 and 1

​	**bottomCurve**: a CGFloat between 0 and 1

##### Top Curve Example

![image-20200614225352517](README.assets/image-20200614225352517.png)

`````swift
CurvedRectangle {
  sites: .top,
  topCurve: 0.2
}
`````

##### Bottom Curve Example

![image-20200614225418884](README.assets/image-20200614225418884.png)

`````swift
CurvedRectangle {
  sites: .bottom,
  topCurve: -0.2
}
`````

##### Dual Curve Example

![image-20200615070629906](README.assets/image-20200615070629906.png)

`````swift
CurvedRectangle {
  sites: .both,
  topCurve: 0.2,
  bottomCurve: -0.2
}
`````



