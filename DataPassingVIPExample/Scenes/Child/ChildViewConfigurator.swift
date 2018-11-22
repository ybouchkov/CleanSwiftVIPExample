//
//  ChildViewConfigurator.swift
//  DataPassingVIPExample
//
//  Created by Yani Buchkov on 21.11.18.
//  Copyright © 2018 Yani Buchkov. All rights reserved.
//

import Foundation

class ChildViewConfigurator {
    
    // MARK: Shared
    static var shared: ChildViewConfigurator = ChildViewConfigurator()
    
    // MARK: - Init
    private init() {}
    
    // MARK: - Config
    func config(viewController: ChildViewViewController) {
        let interator = ChildViewInteractor()
        let router = ChildViewRouter()
        let presenter = ChildViewPresenter()
        
        viewController.interactor = interator
        viewController.router = router
        presenter.viewController = viewController
        interator.presenter = presenter
        router.viewController = viewController
        router.dataStore = interator
    }
}
