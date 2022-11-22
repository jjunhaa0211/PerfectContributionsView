import UIKit

@available(iOS 13.0, *)

open class PContributionsView: UIView {
    open var margin: Float = 20
    open var spacing: Float = 2
    open var contrilbutionsData: [[Int]] = [[]]
    private var cornerRadius: Double = 0
    private var colorMap: ColorMap
    
    // Init for IB
    public required init?(coder aDecoder: NSCoder) {
        colorMap = DefaultColorMap()
        super.init(coder: aDecoder)
        setupView()
    }

    // Init for the code way
    public override init(frame: CGRect) {
        colorMap = DefaultColorMap()
        super.init(frame: frame)
        setupView()
    }
    
    // #3
    convenience init(frame: CGRect, data: [[Int]]) {
        self.init(frame: frame)
        self.contrilbutionsData = data
        setupView()
    }
    
    private func setupView() {
        listBackground(.white)
        
        // Disable if AutoLayout is used
        self.translatesAutoresizingMaskIntoConstraints = false
        
        // Accessibility
        isAccessibilityElement = true
        #if swift(>=4.2)
        accessibilityTraits = UIAccessibilityTraits.updatesFrequently
        #else
        accessibilityTraits = UIAccessibilityTraitUpdatesFrequently
        #endif
        accessibilityLabel = "PContributionsView"
    }

    public func listBackground(_ backgroundColor: UIColor) {
        self.backgroundColor = backgroundColor
    }
    
    // MARK: Setter
    
    public func addEntry(with coordinates: CGPoint, level: Int) {
        
        let intendedIndex = coordinates
        
        if (intendedIndex.y >= 0 && contrilbutionsData.count > Int(intendedIndex.y)) {
            let subData = contrilbutionsData[Int(intendedIndex.y)]
            if (intendedIndex.x >= 0 && subData.count > Int(intendedIndex.x)) {
                self.contrilbutionsData[Int(intendedIndex.y)][Int(intendedIndex.x)] = level
            } else {
                print("📐 Out of Range")
            }
        } else {
            print("📐 Out of Range")
        }
    }
    
    

    public func cellCornerRadius(_ borderRadius: Double ) {
        self.cornerRadius = borderRadius >= 0 ? borderRadius : 0
    }
    
    public func userCustomColor(_ colorMap: ColorMap) {
        self.colorMap = colorMap
    }

    // MARK: Drawing Functions

    override open func draw(_ rect: CGRect) {
        createGrid(with: contrilbutionsData)
    }
    
    private func createGrid(with data: [[Int]]) {
        
        let rectHeightCount = data.count
        let rectWidthCount = data.max(by: { $0.count < $1.count })!.count

        let width: Float = Float(self.bounds.width)
        let height: Float = Float(self.bounds.height)
        
        var rectWidth: Float = 10 // Default Value
        
        if rectWidthCount > 0 {

            let rectWidthVal = (width - (margin * 2) - (spacing * Float(rectWidthCount - 1))) / Float(rectWidthCount)

            let rectHeightVal = (height - (margin * 2) - (spacing * Float(rectHeightCount - 1))) / Float(rectHeightCount)

            if rectWidthVal > rectHeightVal {
                rectWidth = rectHeightVal
            } else {
                rectWidth = rectWidthVal
            }
        }

        var yCoord: Float = 0
        for i in data {
            var xCoord: Float = 0
            for x in i {
                drawRect(x: CGPoint(x: CGFloat(xCoord + margin),
                                    y: CGFloat(yCoord + margin)),
                         y: CGPoint(x:CGFloat(xCoord + margin + rectWidth),
                                    y: CGFloat(yCoord + margin + rectWidth)),
                         color: x)
                xCoord = xCoord + rectWidth + spacing
            }
            yCoord = yCoord + rectWidth + spacing
        }
    }

    private static var angles = [[270, 180], [180, 90], [90, 0], [360, 270]]

    private func drawRect(x: CGPoint, y: CGPoint, color: Int) {

        // create the points
        cornerRadius = 7
        print("x: \(x)")
        print("y: \(y)")
        let pre_radius = [Double(y.x - x.x), Double(x.y - y.y)];
        let radius = [cornerRadius, cornerRadius * (pre_radius[0] / pre_radius[1])]
//        let point = [
//            CGPoint(x: x.x, y: y.y),
//            CGPoint(x: y.x, y: y.y),
//            CGPoint(x: y.x, y: x.y),
//            CGPoint(x: x.x, y: x.y)
//        ]
        let circlePoint = [
            CGPoint(x: x.x + radius[0], y: y.y + radius[1]),
            CGPoint(x: y.x - radius[0], y: y.y + radius[1]),
            CGPoint(x: y.x - radius[0], y: x.y - radius[1]),
            CGPoint(x: x.x + radius[0], y: x.y - radius[1])
        ]

        let path = UIBezierPath()
        
        path.addArc(withCenter: circlePoint[0], radius: cornerRadius, startAngle: 0, endAngle: 360, clockwise: false)

        path.addArc(withCenter: circlePoint[1], radius: cornerRadius, startAngle: 0, endAngle: 360, clockwise: true)

        path.addArc(withCenter: circlePoint[2], radius: cornerRadius, startAngle: 0, endAngle: 360, clockwise: false)

        path.addArc(withCenter: circlePoint[3], radius: cornerRadius, startAngle: 0, endAngle: 360, clockwise: false)
        
        path.move(to: CGPoint(x: circlePoint[0].x, y: y.y))
        path.addLine(to: CGPoint(x: circlePoint[1].x, y: y.y))
        path.addLine(to: CGPoint(x: y.x, y: circlePoint[1].y))
        path.addLine(to: CGPoint(x: y.x, y: circlePoint[2].y))
        path.addLine(to: CGPoint(x: circlePoint[2].x, y: x.y))
        path.addLine(to: CGPoint(x: circlePoint[3].x, y: x.y))
        path.addLine(to: CGPoint(x: x.x, y: circlePoint[3].y))
        path.addLine(to: CGPoint(x: x.x, y: circlePoint[0].y))
        path.addLine(to: CGPoint(x: circlePoint[0].x, y: y.y))
        
        //원으로 만드는 코드
        
//        let centerPos = CGPoint(x: (y.x - x.x) / 2 + x.x, y: (y.y - x.y) / 2 + x.y)

        // create the path
//        path.move(to: p1)
//        path.addLine(to: p2)
//        path.addLine(to: p3)
//        path.addLine(to: p4)
//        path.addLine(to: p5)
//        path.addArc(withCenter: centerPos, radius: (y.x - x.x) / 2, startAngle: 0, endAngle: 360, clockwise: true)
        path.close()

        colorMap.getColor(color).set()
        
        // fill the path
        path.fill()
    }
        
    // MARK: Accessibility
    
    private var overriddenAccessibilityValue: String?
    
    open override var accessibilityValue: String? {
        get {
            if let override = overriddenAccessibilityValue {
                return override
            }
            return "PContributionsView"
        }
        set {
            overriddenAccessibilityValue = newValue
        }
    }

}

extension UIColor {

    // MARK: - Initialization

    convenience init?(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt32 = 0

        var r: CGFloat = 0.0
        var g: CGFloat = 0.0
        var b: CGFloat = 0.0
        var a: CGFloat = 1.0

        let length = hexSanitized.count

        guard Scanner(string: hexSanitized).scanHexInt32(&rgb) else { return nil }

        if length == 6 {
            r = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
            g = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
            b = CGFloat(rgb & 0x0000FF) / 255.0

        } else if length == 8 {
            r = CGFloat((rgb & 0xFF000000) >> 24) / 255.0
            g = CGFloat((rgb & 0x00FF0000) >> 16) / 255.0
            b = CGFloat((rgb & 0x0000FF00) >> 8) / 255.0
            a = CGFloat(rgb & 0x000000FF) / 255.0

        } else {
            return nil
        }

        self.init(red: r, green: g, blue: b, alpha: a)
    }

    // MARK: - Computed Properties

    var toHex: String? {
        return toHex()
    }

    // MARK: - From UIColor to String

    func toHex(alpha: Bool = false) -> String? {
        guard let components = cgColor.components, components.count >= 3 else {
            return nil
        }

        let r = Float(components[0])
        let g = Float(components[1])
        let b = Float(components[2])
        var a = Float(1.0)

        if components.count >= 4 {
            a = Float(components[3])
        }

        if alpha {
            return String(format: "%02lX%02lX%02lX%02lX", lroundf(r * 255), lroundf(g * 255), lroundf(b * 255), lroundf(a * 255))
        } else {
            return String(format: "%02lX%02lX%02lX", lroundf(r * 255), lroundf(g * 255), lroundf(b * 255))
        }
    }
}
