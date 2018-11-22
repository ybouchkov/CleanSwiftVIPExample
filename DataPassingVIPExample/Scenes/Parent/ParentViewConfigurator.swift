//
//  ParentViewConfigurator.swift
//  DataPassingVIPExample
//
//  Created by Yani Buchkov on 21.11.18.
//  Copyright © 2018 Yani Buchkov. All rights reserved.
//

import Foundation

class ParentViewConfigurator {
    
    static var shared: ParentViewConfigurator = ParentViewConfigurator()
    
    // MARK: - Init
    private init () {}
    
    // MARK: - Configuration
    func config(viewController: ParentViewViewController) {
        let presenter = ParentViewPresenter()
        let router = ParentViewRouter()
        let interator = ParentViewInteractor()
        
        viewController.interator = interator
        viewController.router = router
        interator.presenter = presenter
        presenter.viewController = viewController
        
        router.viewController = viewController
        router.dataStore = interator
    }
}
