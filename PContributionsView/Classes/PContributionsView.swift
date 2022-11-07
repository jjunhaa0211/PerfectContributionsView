import UIKit

@available(iOS 13.0, *)

open class PContributionsView: UIView {
    @IBInspectable public var colorScheme: String = "Default"
    @IBInspectable public var gridMargin: Float = 20
    @IBInspectable public var gridSpacing: Float = 2
    public var data: [[Int]] = [[]]
    
    // Init for IB
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    // Init for the code way
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    // #3
    convenience init(frame: CGRect, data: [[Int]]) {
        self.init(frame: frame)
        self.data = data
        setupView()
    }
    
    private func setupView() {
        self.backgroundColor = .white
        
        // Disable if AutoLayout is used
        self.translatesAutoresizingMaskIntoConstraints = false
        
        // Accessibility
        isAccessibilityElement = true
        #if swift(>=4.2)
        accessibilityTraits = UIAccessibilityTraits.updatesFrequently
        #else
        accessibilityTraits = UIAccessibilityTraitUpdatesFrequently
        #endif
        accessibilityLabel = "ContributionView"
    }
    
    // MARK: Setter
    
    public func addEntry(with coordinates: CGPoint, level: Int) {
        
        let intendedIndex = coordinates
        
        if (intendedIndex.y >= 0 && data.count > Int(intendedIndex.y)) {
            let subData = data[Int(intendedIndex.y)]
            if (intendedIndex.x >= 0 && subData.count > Int(intendedIndex.x)) {
                self.data[Int(intendedIndex.y)][Int(intendedIndex.x)] = level
            } else {
                print("Out of Range")
            }
        } else {
            print("Out of Range")
        }
    }
    
    // MARK: Drawing Functions
    
    override open func draw(_ rect: CGRect) {
        createGrid(with: data)
    }
    
    private func createGrid(with data: [[Int]]) {
        
        let rectHeightCount = data.count
        let rectWidthCount = data.max(by: { $0.count < $1.count })!.count
        
        let width: Float = Float(self.bounds.width)
        let height: Float = Float(self.bounds.height)
        
        var rectWidth: Float = 10 // Default Value
        
        if rectWidthCount > 0 {
            // Based on UIView Width
            let rectWidthVal = (width - (gridMargin * 2) - (gridSpacing * Float(rectWidthCount - 1))) / Float(rectWidthCount)
            // Based on UIView Height
            let rectHeightVal = (height - (gridMargin * 2) - (gridSpacing * Float(rectHeightCount - 1))) / Float(rectHeightCount)
            
            // Scale based on width or height
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
                drawRect(x: CGPoint(x: CGFloat(xCoord + gridMargin), y: CGFloat(yCoord + gridMargin)), y: CGPoint(x: CGFloat(xCoord + gridMargin + rectWidth), y: CGFloat(yCoord + gridMargin + rectWidth)), color: "color" + String(x))
                xCoord = xCoord + rectWidth + gridSpacing
            }
            yCoord = yCoord + rectWidth + gridSpacing
        }
    }
    
    private func drawRect(x: CGPoint, y: CGPoint, color: String) {
        
        // create the points
        let p1 = CGPoint(x: x.x, y: x.y)
        let p2 = CGPoint(x: y.x, y: x.y)
        let p3 = CGPoint(x: y.x, y: y.y)
        let p4 = CGPoint(x: x.x, y: y.y)
        let p5 = p1
        
        // create the path
        let path = UIBezierPath()
        path.move(to: p1)
        path.addLine(to: p2)
        path.addLine(to: p3)
        path.addLine(to: p4)
        path.addLine(to: p5)
        path.close()
        
        // set default color
        let pinkColor = UIColor(red:1.00, green:0.00, blue:1.00, alpha:1.0)
        let clearColor = UIColor.clear
        var color0 = pinkColor
        var color1 = pinkColor
        var color2 = pinkColor
        var color3 = pinkColor
        var color4 = pinkColor
        
        // Set Color Scheme
        if colorScheme == "Default" {
            
            color0 = UIColor(red:0.93, green:0.93, blue:0.93, alpha:1.0) /* #eeeeee */
            color1 = UIColor(red:0.78, green:0.89, blue:0.55, alpha:1.0) /* #c6e48b */
            color2 = UIColor(red:0.48, green:0.79, blue:0.44, alpha:1.0) /* #7bc96f */
            color3 = UIColor(red:0.14, green:0.60, blue:0.23, alpha:1.0) /* #239a3b */
            color4 = UIColor(red:0.10, green:0.38, blue:0.15, alpha:1.0) /* #196127 */
        } else if colorScheme == "Halloween" {
            color0 = UIColor(red:0.93, green:0.93, blue:0.93, alpha:1.0) /* #eeeeee */
            color1 = UIColor(red:0.99, green:0.95, blue:0.34, alpha:1.0) /* #fdf156 */
            color2 = UIColor(red:1.00, green:0.78, blue:0.13, alpha:1.0) /* #ffc722 */
            color3 = UIColor(red:1.00, green:0.59, blue:0.07, alpha:1.0) /* #ff9711 */
            color4 = UIColor(red:0.02, green:0.00, blue:0.11, alpha:1.0) /* #04001b */
        } else if colorScheme == "Blue" {
            color0 = UIColor(red:0.93, green:0.93, blue:0.93, alpha:1.0) /* #eeeeee */
            color1 = UIColor(red:0.73, green:0.87, blue:0.98, alpha:1.0) /* #bbdefb */
            color2 = UIColor(red:0.39, green:0.71, blue:0.96, alpha:1.0) /* #64b5f6 */
            color3 = UIColor(red:0.12, green:0.53, blue:0.90, alpha:1.0) /* #1e88e5 */
            color4 = UIColor(red:0.05, green:0.28, blue:0.63, alpha:1.0) /* #0d47a1 */
        }
        
        
        var useColor: UIColor
        
        switch color {
        case "color-1":
            useColor = clearColor
        case "color0":
            useColor = color0
        case "color1":
            useColor = color1
        case "color2":
            useColor = color2
        case "color3":
            useColor = color3
        case "color4":
            useColor = color4
        default:
            useColor = pinkColor
        }
        
        useColor.set()
        
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
            return "ContributionView"
        }
        set {
            overriddenAccessibilityValue = newValue
        }
    }

}

extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }

        return nil
    }
}
