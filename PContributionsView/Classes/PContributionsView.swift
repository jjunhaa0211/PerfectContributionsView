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
            
            color0 = UIColor(hex: "#eeeeee")! /* #eeeeee */
            color1 = UIColor(hex: "#c6e48b")! /* #c6e48b */
            color2 = UIColor(hex: "#7bc96f")! /* #7bc96f */
            color3 = UIColor(hex: "#239a3b")! /* #239a3b */
            color4 = UIColor(hex: "#196127")! /* #196127 */
            
        } else if colorScheme == "Violet" {
            color0 = UIColor(hex: "#F4F4F4")! /* #F4F4F4 */
            color1 = UIColor(hex: "#EEF1FF")! /* #EEF1FF */
            color2 = UIColor(hex: "#D2DAFF")! /* #D2DAFF */
            color3 = UIColor(hex: "#AAC4FF")! /* #AAC4FF */
            color4 = UIColor(hex: "#9495FF")! /* #9495FF */
        } else if colorScheme == "shootingStar" {
            color0 = UIColor(hex: "#F4F4F4")! /* #F4F4F4 */
            color1 = UIColor(hex: "#72FFFF")! /* #72FFFF */
            color2 = UIColor(hex: "#7bc96f")! /* #00D7FF */
            color3 = UIColor(hex: "#00D7FF")! /* #0096FF */
            color4 = UIColor(hex: "##5800FF")! /* #5800FF */
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

    // MARK: - Initialization

    convenience init?(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt32 = 0

        var r: CGFloat = 0.0
        var g: CGFloat = 0.0
        var b: CGFloat = 0.0
        var a: CGFloat = 1.0

        let length = hexSanitized.characters.count

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
