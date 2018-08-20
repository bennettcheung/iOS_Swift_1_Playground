//: [Previous](@previous)
/*:
 ## Protocols
 Protocols are a defined contract or blueprint that a class, struct or enum must follow.
 */
/*:
 Here we define a 'ShapeProtocol' where anything that conforms to it must provide a property of number of sides and a function called 'shapeDescription'
 */
protocol ShapeProtocol {
    var numberOfSides: Int { get set }
  var lengthOfSide: Int {get set}
  var color: String {get set}
    func shapeDescription()
    func area() -> Int
}

/*:
 This 'Square' class conforms to the 'ShapeProtocol' and defines the number of sides for this shape and it has the shapeDescription method inside.
 */
class Square: ShapeProtocol {
    var numberOfSides: Int
  var lengthOfSide: Int
  var color: String
    
  init(length: Int, color: String){
        self.numberOfSides = 4
    self.lengthOfSide = length
    self.color = color
    }
    
    func shapeDescription() {
        
        print("This is a square")
    }
  
  func area()->Int{
    return  lengthOfSide * lengthOfSide
  }
}

var square = Square(length: 10, color: "White")
square.area()
/*:
 - Experiment:
 Add a new function in our 'ShapeProtocol' that should calculate the area of its shape. Make sure you implement it in our 'Square' class as well.
 */
//added see above
/*:
 - Experiment:
 Add a new property in our 'ShapeProtocol' of type String that indicates the colour of this shape.
 */
//added above
/*:
 - Experiment:
 We can also declare a custom initializer within our 'ShapeProtocol' that any class must have present. Create an initializer that takes in a colour as a parameter.
 */
//added
/*:
 - Callout(Challenge):
 Define a person protocol with name, gender, age and add a custom initializer to set all the properties and a function to print a description of this person. Create a 'Student' class that conforms to this protocol and print the description of this student using its name.
 */
protocol Person {
  var name: String {get set}
  var gender: String {get set}
  var age: Int {get set}
  
  init(name:String, gender: String, age: Int)
  func printDescription()
}

class Student: Person{
  var name: String
  
  var gender: String
  
  var age: Int
  
  required init(name: String, gender: String, age: Int) {
    self.name = name
    self.gender = gender
    self.age = age
  }
  
  func printDescription() {
    print ("\(name) is \(gender) and \(age)")
  }
  
}

var student = Student.init(name: "JohnSmith", gender: "Male", age: 30)
student.printDescription()
/*:
 ## Extensions
 Extensions are a way to add additional functions to an existing class, struct or enum.
 \
 For example, I can extend the `'Double'` class to add a function I may use very often such as squaring a number. ie: 4*4 = 16
 
 - Note:
 Extensions are like categories from Objective-C. Unlike Objective-C categories, Swift extensions do not have names.
 */

// This is declaring an extension on the Double class
extension Double {
    
    // This 'square' function takes its own value and multiples it by itself, then returns the new value
    func square() -> Double {
        
        return self * self
    }
}

var myDoubleValue = 5.0
var mySquaredDoubleValue = myDoubleValue.square()

/*:
 - Experiment:
 Try adding the 'square' function to the `Float` type
 */
extension Float {
  func square() ->Float{
    return self * self
  }
}

var someFloat: Float = 2.3
someFloat.square()

/*:
 We are going to add a few extensions to several classes that you could potentially use for your future projects to make things more convenient.
 */
/*:
 - Callout(Challenge):
 Create an extension on UIColor that converts hex represented colours to a UIColor to use. ex: #FFFFFF would give a UIColor of white (Hint: You can google the algorithm on how to convert hex values to a UIColor)
 */
import UIKit
extension UIColor {
  convenience init(red: Int, green: Int, blue: Int) {
    assert(red >= 0 && red <= 255, "Invalid red component")
    assert(green >= 0 && green <= 255, "Invalid green component")
    assert(blue >= 0 && blue <= 255, "Invalid blue component")
    
    self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
  }
  
  convenience init(rgb: Int) {
    self.init(
      red: (rgb >> 16) & 0xFF,
      green: (rgb >> 8) & 0xFF,
      blue: rgb & 0xFF
    )
}
}

let hex =  0xFFFFFF

UIColor.init(rgb: hex)

/*:
 - Callout(Challenge):
 Create an extension on `String` called 'trim'. This will return a `String` that has the whitespace trimmed from the beginning and end. For example: "    hello there  " will return "hellothere"
 */
extension String{
  
  func trim() -> String{
    var outputString:String = self
    outputString = self.trimmingCharacters(in: CharacterSet.init(charactersIn: " "))
    
    return outputString
  }
}

var test = "    test String    "
print (test.trim())
/*:
 - Callout(Challenge):
 Create an extension on String that checks if an email address has a valid format. You can make the rules as strict or as loose as you'd like. Rules can include verifying there are no spaces, there is a '@' present, etc.
 */
extension String{
  
    func isEmailAddress() -> Bool{
      
      return !self.contains(" ") && self.contains("@") && self.contains(".")
    }

  
  }

var testEmail = "sfsd@yahoo.com"
testEmail.isEmailAddress()
/*:
 - Callout(Challenge):
 Create an extension on `Double` to add a function that converts the number of seconds into minutes and another function to hours. ex: Given 900 seconds, the minutes returned will be 15 minutes, and the hours returned would be 0.25 hours.
 */
extension Double{
  
  func convertSecondsToMinutes() -> Double{
    return self / 60;
  }
  
  func convertSecondsToHours() -> Double {
    return self / 60 / 60;
  }
}

var seconds:Double = 900
seconds.convertSecondsToMinutes()
seconds.convertSecondsToHours()
//: [Next](@next)
