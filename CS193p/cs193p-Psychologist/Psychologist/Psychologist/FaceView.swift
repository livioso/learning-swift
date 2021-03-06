//
//  FaceView.swift
//  Happiness
//
//  Created by Livio Bieri on 19/08/15.
//  Copyright © 2015 Livio Bieri. All rights reserved.
//

import UIKit

protocol FaceViewDataSource: class {
    func smilenesForFaceView(sender: FaceView) -> Double?
}

@IBDesignable
class FaceView: UIView {

    @IBInspectable
    var lineWidth: CGFloat = 3 {didSet {setNeedsDisplay() }}
    @IBInspectable
    var color: UIColor = UIColor.blueColor() {didSet {setNeedsDisplay() }}
    @IBInspectable
    var scale: CGFloat = 0.9 { didSet {setNeedsDisplay() }}

    weak var dataSource: FaceViewDataSource?

    func scale(gesture: UIPinchGestureRecognizer) {
        if gesture.state == .Changed {
            scale *= gesture.scale
            gesture.scale = 1
        }
    }

    var faceCenter: CGPoint {
        return convertPoint(center, fromView: superview)
    }

    var faceRadius: CGFloat {
        return min(bounds.size.width, bounds.size.height) / 2 * scale
    }

    private struct Scaling {
        static let FaceRadiusToEyeRadiusRatio: CGFloat = 10
        static let FaceRadiusToEyeOffsetRatio: CGFloat = 3
        static let FaceRadiusToEyesSeperationRatio: CGFloat = 1.5
        static let FaceRadiusToMouthWidthRatio: CGFloat = 1
        static let FaceRadiusToMouthHeightRatio: CGFloat = 3
        static let FaceRadiusToMouthOffsetRatio: CGFloat = 3
    }

    private enum Eye {case Left, Right}

    private func bezierPathForEye(whichEye: Eye) -> UIBezierPath {
        let eyeRadius = faceRadius / Scaling.FaceRadiusToEyeRadiusRatio
        let eyeVerticalOffset = faceRadius / Scaling.FaceRadiusToEyeOffsetRatio
        let eyeHorizontalSeparation = faceRadius / Scaling.FaceRadiusToEyesSeperationRatio

        var eyeCenter = faceCenter
        eyeCenter.y -= eyeVerticalOffset

        switch(whichEye) {
        case .Left: eyeCenter.x -= eyeHorizontalSeparation / 2
        case .Right: eyeCenter.x += eyeHorizontalSeparation / 2
        }

        let path = UIBezierPath(arcCenter: eyeCenter, radius:eyeRadius, startAngle: 0, endAngle: CGFloat(2*M_PI), clockwise: true)
        path.lineWidth = lineWidth
        return path
    }

    private func bezierPathForSmile(fractionOfMaxSmile: Double) -> UIBezierPath {
        let mouthWidth = faceRadius / Scaling.FaceRadiusToMouthWidthRatio
        let mouthHeight = faceRadius / Scaling.FaceRadiusToMouthHeightRatio
        let mouthVeriticalOffset = faceRadius / Scaling.FaceRadiusToMouthOffsetRatio

        let smileHeight = CGFloat(max(min(fractionOfMaxSmile, 1), -1)) * mouthHeight

        let start = CGPoint(x: faceCenter.x - mouthWidth / 2, y: faceCenter.y + mouthVeriticalOffset)
        let end = CGPoint(x: start.x + mouthWidth, y: start.y)
        let cp1 = CGPoint(x: start.x + mouthWidth / 3, y: start.y + smileHeight)
        let cp2 = CGPoint(x: end.x - mouthWidth / 3, y: cp1.y)

        let path = UIBezierPath()
        path.moveToPoint(start)
        path.addCurveToPoint(end, controlPoint1: cp1, controlPoint2: cp2)
        path.lineWidth = lineWidth

        return path
    }

    override func drawRect(rect: CGRect)    {
        let facePath = UIBezierPath(arcCenter: faceCenter, radius: faceRadius, startAngle: 0, endAngle: CGFloat(2*M_PI), clockwise: true);
        facePath.lineWidth = lineWidth
        color.set()
        facePath.stroke()

        bezierPathForEye(.Left).stroke()
        bezierPathForEye(.Right).stroke()
        let smilines = dataSource?.smilenesForFaceView(self) ?? 0.0
        let smilePath = bezierPathForSmile(smilines)
        smilePath.stroke()
    }
}
