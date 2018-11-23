//
//  Coordinator.swift
//  Dont
//
//  Created by Adam Smaka on 11/23/18.
//  Copyright © 2018 Adam Smaka. All rights reserved.
//

import Foundation

protocol Coordinator: class {
    //var childCoordinators: [Coordinator] { get set }
    func start()
}

extension Coordinator {
}



/*
/// Base abstract coordinator generic over the return type of the `start` method.
class BaseCoordinator<ResultType> {
    
    /// Typealias which will allows to access a ResultType of the Coordainator by `CoordinatorName.CoordinationResult`.
    typealias CoordinationResult = ResultType
    
    /// Utility `DisposeBag` used by the subclasses.
    let disposeBag = DisposeBag()
    
    /// Unique identifier.
    private let identifier = UUID()
    
    /// Dictionary of the child coordinators. Every child coordinator should be added
    /// to that dictionary in order to keep it in memory.
    /// Key is an `identifier` of the child coordinator and value is the coordinator itself.
    /// Value type is `Any` because Swift doesn't allow to store generic types in the array.
    private var childCoordinators = [UUID: Any]()
    
    /// Stores coordinator to the `childCoordinators` dictionary.
    ///
    /// - Parameter coordinator: Child coordinator to store.
    private func store<T>(coordinator: BaseCoordinator<T>) {
        childCoordinators[coordinator.identifier] = coordinator
    }
    
    /// Release coordinator from the `childCoordinators` dictionary.
    ///
    /// - Parameter coordinator: Coordinator to release.
    private func free<T>(coordinator: BaseCoordinator<T>) {
        childCoordinators[coordinator.identifier] = nil
    }
    
    /// 1. Stores coordinator in a dictionary of child coordinators.
    /// 2. Calls method `start()` on that coordinator.
    /// 3. On the `onNext:` of returning observable of method `start()` removes coordinator from the dictionary.
    ///
    /// - Parameter coordinator: Coordinator to start.
    /// - Returns: Result of `start()` method.
    func coordinate<T>(to coordinator: BaseCoordinator<T>) -> Observable<T> {
        store(coordinator: coordinator)
        return coordinator.start()
            .do(onNext: { [weak self] _ in self?.free(coordinator: coordinator) })
    }
    
    /// Starts job of the coordinator.
    ///
    /// - Returns: Result of coordinator job.
    func start() -> Observable<ResultType> {
        fatalError("Start method should be implemented.")
    }
}
 
 /// Type that defines possible coordination results of the `LanguageListCoordinator`.
 ///
 /// - language: Language was choosen.
 /// - cancel: Cancel button was tapped.
 enum LanguageListCoordinationResult {
 case language(String)
 case cancel
 }
 
 class LanguageListCoordinator: BaseCoordinator<LanguageListCoordinationResult> {
 
 private let rootViewController: UIViewController
 
 init(rootViewController: UIViewController) {
 self.rootViewController = rootViewController
 }
 
 override func start() -> Observable<CoordinationResult> {
 // Initialize a View Controller from the storyboard and put it into the UINavigationController stack
 let viewController = LanguageListViewController.initFromStoryboard(name: "Main")
 let navigationController = UINavigationController(rootViewController: viewController)
 
 // Initialize a View Model and inject it into the View Controller
 let viewModel = LanguageListViewModel()
 viewController.viewModel = viewModel
 
 // Map the outputs of the View Model to the LanguageListCoordinationResult type
 let cancel = viewModel.didCancel.map { _ in CoordinationResult.cancel }
 let language = viewModel.didSelectLanguage.map { CoordinationResult.language($0) }
 
 // Present View Controller onto the provided rootViewController
 rootViewController.present(navigationController, animated: true)
 
 // Merge the mapped outputs of the view model, taking only the first emitted event and dismissing the View Controller on that event
 return Observable.merge(cancel, language)
 .take(1)
 .do(onNext: { [weak self] _ in self?.rootViewController.dismiss(animated: true) })
 }
 }
 https://hackernoon.com/how-to-use-mvvm-coordinators-and-rxswift-7364370b7b95
*/
