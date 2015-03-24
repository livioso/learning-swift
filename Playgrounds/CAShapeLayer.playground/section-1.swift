import UIKit
import QuartzCore

let circle = UIView()

// General Dimenstions
circle.frame = CGRectMake(0, 0, 300, 300)

var progressCircle = CAShapeLayer()

// see above circle.frame
let centerPoint = CGPoint(
  x: circle.bounds.width / 2,
  y: circle.bounds.width / 2)

// makes sense to set it to <(circle.bounds.width / 2)
let circleRadius : CGFloat = circle.bounds.width / 2 * 0.9

var circlePath = UIBezierPath(
  arcCenter: centerPoint,
  radius: circleRadius,
  startAngle: CGFloat(-0.5 * M_PI),
  endAngle: CGFloat(1.5 * M_PI),
  clockwise: true)

progressCircle = CAShapeLayer()
progressCircle.path = circlePath.CGPath

// line styling
progressCircle.strokeColor = UIColor.redColor().CGColor
progressCircle.fillColor = UIColor.clearColor().CGColor
progressCircle.lineWidth = 8

circle.layer.addSublayer(progressCircle)

let label = CATextLayer()
label.frame = CGRectMake(
  circle.bounds.width / 2 - 50,
  circle.bounds.width / 2 - 25,
  100, 50)

label.foregroundColor = UIColor.redColor().CGColor
label.string = "12:30"

circle.layer.addSublayer(label)

var buttonStartStop = CAShapeLayer()
buttonStartStop.fillColor = UIColor.redColor().CGColor

var squarePath = UIBezierPath(
  rect: CGRectMake(
    circle.bounds.width / 2 - 20,
    circle.bounds.width / 2 + 45, 40, 40))

buttonStartStop.path = squarePath.CGPath


circle.layer.addSublayer(buttonStartStop)


// example situations

progressCircle.strokeEnd = 1
circle // 22% percentage of pomodoro

progressCircle.strokeEnd = 0.5
circle // 83% percentage of pomodoro

progressCircle.strokeEnd = 1
circle // 83% percentage of pomodoro

//for i in 0...99 {
//  progressCircle.strokeEnd = 1.0/CGFloat(i);
//  circle // in loop
//}
