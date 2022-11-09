//
//  ViewController.swift
//  PContributionsView
//
//  Created by 102890390 on 11/07/2022.
//  Copyright (c) 2022 102890390. All rights reserved.
//

import UIKit
import PContributionsView

class ViewController: UIViewController {

    @IBOutlet var activityView: PContributionsView!
    
    let dataActivity = [
        [-1, 3, 1, 1, 2, 1, 1, 1, 3, 1, 2, 1, 1, 1, 2, 2, 2, 1, 1, 3],
        [-1, 2, 1, 1, 2, 2, 1, 0, 2, 1, 2, 1, 1, 1, 4, 2, 0, 2, 1, 3],
        [-1, 1, 1, 1, 2, 3, 1, 1, 1, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 4],
        [-1, 3, 4, 2, 1, 3, 0, 4, 1, 2, 0, 3, 1, 1, 2, 2, 1, 2, 2, 4],
        [1, 2, 4, 3, 2, 3, 2, 3, 2, 1, 1, 2, 2, 1, 1, 2, 1, 1, 2],
        [2, 3, 3, 3, 1, 3, 2, 3, 4, 0, 3, 3, 3, 2, 0, 1, 1, 3, 3],
        [3, 1, 2, 2, 1, 3, 3, 2, 1, 0, 4, 2, 1, 1, 4, 4, 1, 2, 3]
    ]
    
    let dataSquare = [
        [-1, 3, -1, 3, -1],
        [3, -1, 3, -1, 3],
        [-1, 3, -1, 3, -1],
        [3, -1, 3, -1, 3],
        [-1, 3, -1, 3, -1]
    ]
    
    var contributionView = PContributionsView()
    
    var nilpointView = PContributionsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        // Interface Builder
        activityView.contrilbutionsData = dataActivity
        
        // 사각형
        contributionView.contrilbutionsData = dataSquare
        contributionView.userCustomColor(ColorMap("000000", "333333", "666666", "999999", "CCCCCC"))
        
        contributionView.Spacing = 10
                
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

