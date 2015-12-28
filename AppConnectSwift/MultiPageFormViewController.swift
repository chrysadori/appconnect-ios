//
//  MultiPageFormViewController.swift
//  AppConnectSample
//
//  Created by Steve Roy on 2015-12-16.
//  Copyright © 2015 Medidata Solutions. All rights reserved.
//

import UIKit

class MultiPageFormViewController: UIViewController, UIPageViewControllerDelegate {

    var pageViewController: UIPageViewController?
    
    private var form : MDForm!
    var formID : Int64! {
        didSet {
            form = UIThreadDatastore().formWithID(formID)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Configure the page view controller and add it as a child view controller.
        self.pageViewController = UIPageViewController(transitionStyle: .PageCurl, navigationOrientation: .Horizontal, options: nil)
        self.pageViewController!.delegate = self
        
        // Setup field data in the ModelController
        self.modelController.fields = form.fields as! [MDField]
        self.pageViewController!.dataSource = self.modelController

        let startingViewController: FieldViewController = self.modelController.viewControllerAtIndex(0, storyboard: self.storyboard!)!
        let viewControllers = [startingViewController]
        self.pageViewController!.setViewControllers(viewControllers, direction: .Forward, animated: false, completion: {done in })

        self.addChildViewController(self.pageViewController!)
        self.view.addSubview(self.pageViewController!.view)

        self.pageViewController!.didMoveToParentViewController(self)

        // Add the page view controller's gesture recognizers to the book view controller's view so that the gestures are started more easily.
        self.view.gestureRecognizers = self.pageViewController!.gestureRecognizers
    }

    var modelController: ModelController {
        // Return the model controller object, creating it if necessary.
        // In more complex implementations, the model controller may be passed to the view controller.
        if _modelController == nil {
            _modelController = ModelController()
        }
        return _modelController!
    }

    var _modelController: ModelController? = nil

    internal func setFormID(formID: Int64) {
        self.formID = formID
    }

}

