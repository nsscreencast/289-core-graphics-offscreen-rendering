import UIKit

let scale: CGFloat = 2
let bounds = CGRect(x: 0, y: 0, width: 320, height: 320)
let colorSpace = CGColorSpaceCreateDeviceRGB()
let bitmapInfo = CGImageAlphaInfo.premultipliedFirst.rawValue

let context = CGContext(
	data: nil,
	width: Int(bounds.width * scale),
	height: Int(bounds.height * scale),
	bitsPerComponent: 8,
	bytesPerRow: 0,
	space: colorSpace,
	bitmapInfo: bitmapInfo
)!

// Apply scale
context.scaleBy(x: scale, y: scale)

// Invert Y axis
context.translateBy(x: bounds.midX, y: bounds.midY)
context.scaleBy(x: 1, y: -1)
context.translateBy(x: -bounds.midX, y: -bounds.midY)

// Draw square
//context.setFillColor(CGColor(colorSpace: colorSpace, components: [0, 0, 1, 1])!)
UIGraphicsPushContext(context)
UIColor.blue.setFill()
context.fill(CGRect(x: 20, y: 20, width: 100, height: 100))
UIGraphicsPopContext()

let cgImage = context.makeImage()!
UIImage(cgImage: cgImage, scale: scale, orientation: .up)

//UIGraphicsBeginImageContextWithOptions(bounds.size, false, scale)
//UIColor.blue.setFill()
//UIBezierPath(rect: CGRect(x: 20, y: 20, width: 100, height: 100)).fill()
//let image = UIGraphicsGetImageFromCurrentImageContext()
//UIGraphicsEndImageContext()
