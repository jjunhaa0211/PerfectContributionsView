import UIKit
import PContributionsView

class ViewController: UIViewController {

    @IBOutlet var activityView: PContributionsView!
    

    let dataActivity = [
        [-1, 1, 1, 1, 2, 1, 1, 1, 3, 1, 2, 1, 1, 1, 2, 2, 2, 1, 1, 3],
        [-1, 2, 1, 1, 2, 2, 1, 1, 2, 1, 2, 1, 1, 1, 4, 2, 1, 2, 1, 3],
        [-1, 1, 1, 1, 2, 3, 1, 1, 1, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 4],
        [-1, 3, 4, 2, 1, 3, 1, 4, 1, 2, 1, 3, 1, 1, 2, 2, 1, 2, 2, 4],
        [1, 2, 4, 3, 2, 3, 2, 3, 2, 1, 1, 2, 2, 1, 1, 2, 1, 1, 2],
        [2, 3, 3, 3, 1, 3, 2, 3, 4, 1, 3, 3, 3, 2, 1, 1, 1, 3, 3],
        [3, 1, 2, 2, 1, 3, 3, 2, 1, 1, 4, 2, 1, 1, 4, 4, 1, 2, 3]
    ]


//    let dataSquare = [
//        [-1, 0, -1, 0, -1],
//        [0, -1, 0, -1, 0],
//        [-1, 0, -1, 0, -1],
//        [0, -1, 0, -1, 0],
//        [-1, 0, -1, 0, -1],
//        [0 ,-1 ,0, -1, 0]
//    ]
    


    var contributionView = PContributionsView()

    var nilpointView = PContributionsView()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Interface Builder
        activityView.contrilbutionsData = dataActivity
        
        // 사각형
//        contributionView.contrilbutionsData = dataSquare
//        contributionView.userCustomColor(ColorMap("#F4F4F4", "#EEF1FF", "#D2DAFF", "#AAC4FF", "#9495FF"))
//        activityView.userCustomColor(ColorMap("#F4F4F4", "#72FFFF", "#00D7FF", "#0096FF", "#5800FF"))
//        contributionView.cellCornerRadius(10)
        activityView.cellCornerRadius(3)
//        activityView.spacing = 5
//        activityView.listBackground(.red)
//        contributionView.listBackground(.blue)
        
        let colorMap = VioletColorMap()
        let c1 = colorMap.getColor(0)
        let c2 = colorMap.getColor(1)
        let c3 = colorMap.getColor(2)
        let c4 = colorMap.getColor(3)
        
        activityView.userCustomColor(ColorMap(c1, c2, c3, c4, c4))
        
    
        contributionView.spacing = 10

        view.addSubview(contributionView)
        contributionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 212).isActive = true
        contributionView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        contributionView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        contributionView.heightAnchor.constraint(equalToConstant: 230).isActive = true
        
        self.view.backgroundColor = .white
    }

    override func viewDidLayoutSubviews() {
        // Redraw view when orientation changed
        activityView.setNeedsDisplay()
        contributionView.setNeedsDisplay()
    }

}
