import UIKit
import QuartzCore

let circle = UIView();

// General Dimenstions
circle.frame = CGRectMake(0, 0, 300, 300);

var progressCircle = CAShapeLayer();

// see above circle.frame
let centerPoint = CGPoint(
  x: circle.bounds.width / 2,
  y: circle.bounds.width / 2);

// makes sense to set it to <(circle.bounds.width / 2)
let circleRadius : CGFloat = circle.bounds.width / 2 * 0.9;

var circlePath = UIBezierPath(
  arcCenter: centerPoint,
  radius: circleRadius,
  startAngle: CGFloat(-0.5 * M_PI),
  endAngle: CGFloat(1.5 * M_PI),
  clockwise: true);

progressCircle = CAShapeLayer();
progressCircle.path = circlePath.CGPath;

// line styling
progressCircle.strokeColor = UIColor.redColor().CGColor;
progressCircle.fillColor = UIColor.clearColor().CGColor;
progressCircle.lineWidth = 8;

circle.layer.addSublayer(progressCircle);

// example situations

progressCircle.strokeEnd = 0.6;
circle // 22% percentage of pomodoro

progressCircle.strokeEnd = 0.83;
circle // 83% percentage of pomodoro

progressCircle.strokeEnd = 1;
circle // 83% percentage of pomodoro

//for i in 0...99 {
//  progressCircle.strokeEnd = 1.0/CGFloat(i);
//  circle // in loop
//}
