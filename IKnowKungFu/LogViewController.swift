//
//  LogViewController.swift
//  IKnowKungFu
//
//  Created by Maxim Veksler on 22/02/2016.
//  Copyright © 2016 Maxim Veksler. All rights reserved.
//

/*
UIViewController is a generic controller base class that manages a view.  It has methods that are called
when a view appears or disappears.

Subclasses can override -loadView to create their custom view hierarchy, or specify a nib name to be loaded
automatically.  This class is also a good place for delegate & datasource methods, and other controller
stuff.
*/

import UIKit
import CleanroomLogger

public class LogViewController: UIViewController {
    
    // MARK: - protocol UIContentContainer : NSObjectProtocol
    
    public override var preferredContentSize: CGSize {
        get {
            Log.debug?.value(super.preferredContentSize)
            
            let preferredContentSize = super.preferredContentSize
            Log.debug?.value(preferredContentSize)
            
            return preferredContentSize
        }
        
        set {
            Log.debug?.value(newValue)
            
            super.preferredContentSize = newValue
        }
    }

    public override func preferredContentSizeDidChangeForChildContentContainer(container: UIContentContainer) {
        Log.debug?.value(container)
        
        super.preferredContentSizeDidChangeForChildContentContainer(container)
    }

    /*
    Intended as a bridge for a view controller that does not use auto layout presenting a child that does use auto layout.
    
    If the child's view is using auto layout and the -systemLayoutSizeFittingSize: of the view
    changes, -systemLayoutFittingSizeDidChangeForChildContentContainer: will be sent to the view controller's parent.
    */
    public override func systemLayoutFittingSizeDidChangeForChildContentContainer(container: UIContentContainer) {
        Log.debug?.value(container)
        
        super.systemLayoutFittingSizeDidChangeForChildContentContainer(container)
    }
    
    /*
    When the content container forwards viewWillTransitionToSize:withTransitionCoordinator: to its children, it will call this method to determine what size to send them.
    
    If the returned size is the same as the child container's current size, viewWillTransitionToSize:withTransitionCoordinator: will not be called.
    */
    public override func sizeForChildContentContainer(container: UIContentContainer, withParentContainerSize parentSize: CGSize) -> CGSize {
        Log.debug?.value(container)
        Log.debug?.value(parentSize)
        
        let cgsize = super.sizeForChildContentContainer(container, withParentContainerSize: parentSize)
        Log.debug?.value(cgsize)
        
        return cgsize
    }
    
    /*
    This method is called when the view controller's view's size is changed by its parent (i.e. for the root view controller when its window rotates or is resized).
    
    If you override this method, you should either call super to propagate the change to children or manually forward the change to children.
    */
    public override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        Log.debug?.value(size)
        Log.debug?.value(coordinator)
        
        super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
    }
    
    /*
    This method is called when the view controller's trait collection is changed by its parent.
    
    If you override this method, you should either call super to propagate the change to children or manually forward the change to children.
    */
    public override func willTransitionToTraitCollection(newCollection: UITraitCollection, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        Log.debug?.value(newCollection)
        Log.debug?.value(coordinator)
        
        super.willTransitionToTraitCollection(newCollection, withTransitionCoordinator: coordinator)
    }

    
    // MARK: - class UIViewController : UIResponder, NSCoding, UIAppearanceContainer, UITraitEnvironment, UIContentContainer, UIFocusEnvironment
    
    /*
    The designated initializer. If you subclass UIViewController, you must call the super implementation of this
    method, even if you aren't using a NIB.  (As a convenience, the default init method will do this for you,
    and specify nil for both of this methods arguments.) In the specified NIB, the File's Owner proxy should
    have its class set to your view controller subclass, with the view outlet connected to the main view. If you
    invoke this method with a nil nib name, then this class' -loadView method will attempt to load a NIB whose
    name is the same as your view controller's class. If no such NIB in fact exists then you must either call
    -setView: before -view is invoked, or override the -loadView method to set up your views programatically.
    */
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        Log.debug?.value(nibNameOrNil)
        Log.debug?.value(nibBundleOrNil)
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    
    public required init?(coder aDecoder: NSCoder) {
        Log.debug?.value(aDecoder)
        
        super.init(coder: aDecoder)
    }

    // TODO: Implement get, set trap for view property.
//    public var view: UIView! // The getter first invokes [self loadView] if the view hasn't been set yet. Subclasses must call super if they override the setter or getter.

    public override func loadView() {
        // This is where subclasses should create their custom view hierarchy if they aren't using a nib. Should never be called directly.
        
        Log.debug?.trace()
        
        super.loadView()
    }
    
    
    public override func loadViewIfNeeded() {
        // Loads the view controller's view if it has not already been set.

        Log.debug?.trace()
        
        super.loadViewIfNeeded()
    }
  
    // TODO: Implement get, set trap for viewIfLoaded property.
//    public var viewIfLoaded: UIView? { get } // Returns the view controller's view if loaded, nil if not.
        
        // Called after the view controller's view is released and set to nil. For example, a memory warning which causes the view to be purged. Not invoked as a result of -dealloc.
        
    public override func viewDidLoad() {
        // Called after the view has been loaded. For view controllers created in code, this is after -loadView. For view controllers unarchived from a nib, this is after the view is set.
        
        Log.debug?.trace()
        
        super.viewDidLoad()
    }
    
    public override func isViewLoaded() -> Bool {
        let isViewLoaded = super.isViewLoaded()

        Log.debug?.value(isViewLoaded)
        
        return isViewLoaded
    }
    
    // TODO: Implement get, set trap for viewIfLoaded property.
//    public var nibName: String? { get } // The name of the nib to be loaded to instantiate the view.
//    public var nibBundle: NSBundle? { get } // The bundle from which to load the nib.
//    public var storyboard: UIStoryboard? { get }
    
    public override func performSegueWithIdentifier(identifier: String, sender: AnyObject?) {
        Log.debug?.value(identifier)
        Log.debug?.value(sender)
        
        super.performSegueWithIdentifier(identifier, sender: sender)
    }
    

    public override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        // Invoked immediately prior to initiating a segue. Return NO to prevent the segue from firing. The default implementation returns YES. This method is not invoked when -performSegueWithIdentifier:sender: is used.

        Log.debug?.value(identifier)
        Log.debug?.value(sender)
        
        let should = super.shouldPerformSegueWithIdentifier(identifier, sender: sender)
        Log.debug?.value(should)
        
        return should
    }
    
    public override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        Log.debug?.value(sender)
        Log.debug?.value(sender)
        
        super.prepareForSegue(segue, sender: sender)
    }
    
    public override func canPerformUnwindSegueAction(action: Selector, fromViewController: UIViewController, withSender sender: AnyObject) -> Bool {
        // View controllers will receive this message during segue unwinding. The default implementation returns the result of -respondsToSelector: - controllers can override this to perform any ancillary checks, if necessary.

        Log.debug?.value(action)
        Log.debug?.value(fromViewController)
        Log.debug?.value(sender)
        
        let can = super.canPerformUnwindSegueAction(action, fromViewController: fromViewController, withSender: sender)
        Log.debug?.value(can)
        
        return can
    }
    
    @available(iOS 9.0, *)
    public override func allowedChildViewControllersForUnwindingFromSource(source: UIStoryboardUnwindSegueSource) -> [UIViewController] {
        // Returns a subset of the receiver's childViewControllers in the order they should be searched for an unwind destination.
        // The default implementation first sends itself -childViewControllerContainingSegueSource:, then returns a copy of its childViewControllers array excluding that object. A custom container view controller can override this method to affect the order in which its children are searched, or to modify the result of the default implementation.
        // For compatibility, if a view controller overrides the deprecated -viewControllerForUnwindSegueAction:fromViewController:sender: method, but does not override this method, it will receive the deprecated method instead of this method.
        // To affect this view controller's eligibility as an unwind destination, override -canPerformUnwindSegueAction:fromViewController:withSender: instead.

        Log.debug?.value(source)
        
        let viewControllers = super.allowedChildViewControllersForUnwindingFromSource(source)
        Log.debug?.value(viewControllers)
        
        return viewControllers
    }
    
    @available(iOS 9.0, *)
    public override func childViewControllerContainingSegueSource(source: UIStoryboardUnwindSegueSource) -> UIViewController? {
        // Returns the child view controller that contains the provided segue source.
        // Custom container view controllers should call this method from their implementation of -allowedChildViewControllersForUnwindingFromSource: to exclude the result from the returned array, as well as to determine the order of the returned array's contents.
        // Do not try to re-implement or override this method; it takes special care to handle situations such as unwinding from a modally-presented view controller.

        Log.debug?.value(source)
        
        let viewController = super.childViewControllerContainingSegueSource(source)
        Log.debug?.value(viewController)
        
        return viewController
    }
    
    @available(iOS, introduced=6.0, deprecated=9.0)
    public override func viewControllerForUnwindSegueAction(action: Selector, fromViewController: UIViewController, withSender sender: AnyObject?) -> UIViewController? {
        // Deprecated. Returns a direct child of the receiver that responds YES to -canPerformUnwindSegueAction:fromViewController:withSender:, or self if no children respond YES but the receiver itself does. If this method has been overridden, UIViewController's implementation does not consult child view controllers at all, and skips straight to sending -canPerformUnwindSegueAction:... to self.

        Log.debug?.value(action)
        Log.debug?.value(fromViewController)
        Log.debug?.value(sender)
        
        let viewController = super.viewControllerForUnwindSegueAction(action, fromViewController: fromViewController, withSender: sender)
        Log.debug?.value(viewController)
        
        return viewController
    }
    
    @available(iOS 9.0, *)
    public override func unwindForSegue(unwindSegue: UIStoryboardSegue, towardsViewController subsequentVC: UIViewController) {
        // Custom container view controllers should override this method to modify themselves as part of an ongoing unwind segue. The subsequentVC is the parent, child, or presented view controller closest to the receiver in the direction of the segue's destinationViewController. For example, UINavigationController's implementation of this method will pop any necessary view controllers to reveal the subsequentVC.

        Log.debug?.value(unwindSegue)
        Log.debug?.value(subsequentVC)
        
        super.unwindForSegue(unwindSegue, towardsViewController: subsequentVC)
    }
    
    @available(iOS, introduced=6.0, deprecated=9.0)
    public override func segueForUnwindingToViewController(toViewController: UIViewController, fromViewController: UIViewController, identifier: String?) -> UIStoryboardSegue? {
        // Deprecated. Returns a segue that will unwind from the source to destination view controller via the -unwindForSegue:towardViewController: method. When performing an unwind segue defined in a storyboard, if any view controller along the unwind path has overridden this method and returns non-nil, the runtime will use that segue object instead of constructing an instance of the class specified in Interface Builder.

        Log.debug?.value(toViewController)
        Log.debug?.value(fromViewController)
        Log.debug?.value(identifier)
        
        let segue = super.segueForUnwindingToViewController(toViewController, fromViewController: fromViewController, identifier: identifier)
        Log.debug?.value(segue)
        
        return segue
    }
    
    public override func viewWillAppear(animated: Bool) {
        // Called when the view is about to made visible. Default does nothing
        Log.debug?.value(animated)
        
        super.viewWillAppear(animated)
    }
    
    public override func viewDidAppear(animated: Bool) {
        // Called when the view has been fully transitioned onto the screen. Default does nothing
        Log.debug?.value(animated)
        
        super.viewDidAppear(animated)
    }
    
    public override func viewWillDisappear(animated: Bool) {
        // Called when the view is dismissed, covered or otherwise hidden. Default does nothing
        Log.debug?.value(animated)
        
        super.viewWillDisappear(animated)
    }
    
    public override func viewDidDisappear(animated: Bool) {
        // Called after the view was dismissed, covered or otherwise hidden. Default does nothing
        Log.debug?.value(animated)
        
        super.viewDidDisappear(animated)
    }
    
    
    @available(iOS 5.0, *)
    public override func viewWillLayoutSubviews() {
        // Called just before the view controller's view's layoutSubviews method is invoked. Subclasses can implement as necessary. The default is a nop.
        
        Log.debug?.trace()
        
        super.viewWillLayoutSubviews()
    }
    
    @available(iOS 5.0, *)
    public override func viewDidLayoutSubviews() {
        // Called just after the view controller's view's layoutSubviews method is invoked. Subclasses can implement as necessary. The default is a nop.

        Log.debug?.trace()
        
        super.viewDidLayoutSubviews()
    }

    // TODO: Implement get, set trap for viewIfLoaded property.
//    public var title: String? // Localized title for use by a parent controller.
    
    public override func didReceiveMemoryWarning() {
        // Called when the parent application receives a memory warning. On iOS 6.0 it will no longer clear the view by default.
        
        Log.debug?.trace()
        
        super.didReceiveMemoryWarning()
    }
    
    // TODO: Implement get, set trap for viewIfLoaded property.
//    /*
//    If this view controller is a child of a containing view controller (e.g. a navigation controller or tab bar
//    controller,) this is the containing view controller.  Note that as of 5.0 this no longer will return the
//    presenting view controller.
//    */
//    weak public var parentViewController: UIViewController? { get }
//
//    // This property has been replaced by presentedViewController.
//    
//    // The view controller that was presented by this view controller or its nearest ancestor.
//    @available(iOS 5.0, *)
//    public var presentedViewController: UIViewController? { get }
//    
//    // The view controller that presented this view controller (or its farthest ancestor.)
//    @available(iOS 5.0, *)
//    public var presentingViewController: UIViewController? { get }
//    
//    /*
//    Determines which parent view controller's view should be presented over for presentations of type
//    UIModalPresentationCurrentContext.  If no ancestor view controller has this flag set, then the presenter
//    will be the root view controller.
//    */
//    @available(iOS 5.0, *)
//    public var definesPresentationContext: Bool
//    
//    // A controller that defines the presentation context can also specify the modal transition style if this property is true.
//    @available(iOS 5.0, *)
//    public var providesPresentationContextTransitionStyle: Bool
    
    
    @available(iOS 5.0, *)
    public override func isBeingPresented() -> Bool {
        /*
        These four methods can be used in a view controller's appearance callbacks to determine if it is being
        presented, dismissed, or added or removed as a child view controller. For example, a view controller can
        check if it is disappearing because it was dismissed or popped by asking itself in its viewWillDisappear:
        method by checking the expression ([self isBeingDismissed] || [self isMovingFromParentViewController]).
        */

        let `is` = super.isBeingPresented()
        Log.debug?.value(`is`)
        
        return `is`
    }
    
    
    @available(iOS 5.0, *)
    public override func isBeingDismissed() -> Bool {
        /*
        These four methods can be used in a view controller's appearance callbacks to determine if it is being
        presented, dismissed, or added or removed as a child view controller. For example, a view controller can
        check if it is disappearing because it was dismissed or popped by asking itself in its viewWillDisappear:
        method by checking the expression ([self isBeingDismissed] || [self isMovingFromParentViewController]).
        */

        let `is` = super.isBeingDismissed()
        Log.debug?.value(`is`)
        
        return `is`
    }
    
    @available(iOS 5.0, *)
    public override func isMovingToParentViewController() -> Bool {
        /*
        These four methods can be used in a view controller's appearance callbacks to determine if it is being
        presented, dismissed, or added or removed as a child view controller. For example, a view controller can
        check if it is disappearing because it was dismissed or popped by asking itself in its viewWillDisappear:
        method by checking the expression ([self isBeingDismissed] || [self isMovingFromParentViewController]).
        */

        let `is` = super.isMovingToParentViewController()
        Log.debug?.value(`is`)
        
        return `is`
    }

    @available(iOS 5.0, *)
    public override func isMovingFromParentViewController() -> Bool {
        /*
        These four methods can be used in a view controller's appearance callbacks to determine if it is being
        presented, dismissed, or added or removed as a child view controller. For example, a view controller can
        check if it is disappearing because it was dismissed or popped by asking itself in its viewWillDisappear:
        method by checking the expression ([self isBeingDismissed] || [self isMovingFromParentViewController]).
        */

        let `is` = super.isMovingFromParentViewController()
        Log.debug?.value(`is`)
        
        return `is`
    }
    
    @available(iOS 5.0, *)
    public override func presentViewController(viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)?) {
        /*
        The next two methods are replacements for presentModalViewController:animated and
        dismissModalViewControllerAnimated: The completion handler, if provided, will be invoked after the presented
        controllers viewDidAppear: callback is invoked.
        */

        Log.debug?.value(viewControllerToPresent)
        Log.debug?.value(flag)
        Log.debug?.value(completion)
        
        super.presentViewController(viewControllerToPresent, animated: flag, completion: completion)
    }
    
    @available(iOS 5.0, *)
    public override func dismissViewControllerAnimated(flag: Bool, completion: (() -> Void)?) {
        // The completion handler, if provided, will be invoked after the dismissed controller's viewDidDisappear: callback is invoked.

        Log.debug?.value(flag)
        Log.debug?.value(completion)
        
        super.dismissViewControllerAnimated(flag, completion: completion)
    }
    
    // Display another view controller as a modal child. Uses a vertical sheet transition if animated.This method has been replaced by presentViewController:animated:completion:
    
    // Dismiss the current modal child. Uses a vertical sheet transition if animated. This method has been replaced by dismissViewControllerAnimated:completion:
    
    // TODO: Implement get, set trap for viewIfLoaded property.
//    /*
//    Defines the transition style that will be used for this view controller when it is presented modally. Set
//    this property on the view controller to be presented, not the presenter.  Defaults to
//    UIModalTransitionStyleCoverVertical.
//    */
//    @available(iOS 3.0, *)
//    public var modalTransitionStyle: UIModalTransitionStyle
//    @available(iOS 3.2, *)
//    public var modalPresentationStyle: UIModalPresentationStyle
//    // This controls whether this view controller takes over control of the status bar's appearance when presented non-full screen on another view controller. Defaults to NO.
//    @available(iOS 7.0, *)
//    public var modalPresentationCapturesStatusBarAppearance: Bool
    
    @available(iOS 4.3, *)
    public override func disablesAutomaticKeyboardDismissal() -> Bool {
        // Presentation modes may keep the keyboard visible when not required. Default implementation affects UIModalPresentationFormSheet visibility.

        let bool = super.disablesAutomaticKeyboardDismissal()
        Log.debug?.value(bool)
        
        return bool
    }

    // TODO: Implement get, set trap for viewIfLoaded property.
//    // Deprecated in 7_0, Replaced by the following:
//    
//    @available(iOS 7.0, *)
//    public var edgesForExtendedLayout: UIRectEdge // Defaults to UIRectEdgeAll
//    @available(iOS 7.0, *)
//    public var extendedLayoutIncludesOpaqueBars: Bool // Defaults to NO, but bars are translucent by default on 7_0.
//    @available(iOS 7.0, *)
//    public var automaticallyAdjustsScrollViewInsets: Bool // Defaults to YES

    // TODO: Implement get, set trap for viewIfLoaded property.
//    /* The preferredContentSize is used for any container laying out a child view controller.
//    */
//    @available(iOS 7.0, *)
//    public var preferredContentSize: CGSize
    
    @available(iOS 7.0, *)
    public override func preferredStatusBarStyle() -> UIStatusBarStyle {
        // These methods control the attributes of the status bar when this view controller is shown. They can be overridden in view controller subclasses to return the desired status bar attributes.

        // Defaults to UIStatusBarStyleDefault
        
        let style = super.preferredStatusBarStyle()
        Log.debug?.value(style)
        
        return style
    }
    
    
    @available(iOS 7.0, *)
    public override func prefersStatusBarHidden() -> Bool {
        // Defaults to NO
        
        let bool = super.prefersStatusBarHidden()
        Log.debug?.value(bool)
        
        return bool
    }
    
    @available(iOS 7.0, *)
    public override func preferredStatusBarUpdateAnimation() -> UIStatusBarAnimation {
        // Override to return the type of animation that should be used for status bar changes for this view controller. This currently only affects changes to prefersStatusBarHidden.

        // Defaults to UIStatusBarAnimationFade
        
        let animation = super.preferredStatusBarUpdateAnimation()
        Log.debug?.value(animation)
        
        return animation
    }
    
    @available(iOS 7.0, *)
    public override func setNeedsStatusBarAppearanceUpdate() {
        // This should be called whenever the return values for the view controller's status bar attributes have changed. If it is called from within an animation block, the changes will be animated along with the rest of the animation block.

        Log.debug?.trace()
        
        super.setNeedsStatusBarAppearanceUpdate()
    }
    
    @available(iOS 8.0, *)
    public override func targetViewControllerForAction(action: Selector, sender: AnyObject?) -> UIViewController? {
        /* This method returns either itself or the nearest ancestor that can perform the given action and, if applicable, has overridden UIViewController's default implementation of the action method. View controllers can return NO from canPerformAction:withSender: to opt out of being a target for a given action. */

        Log.debug?.value(action)
        Log.debug?.value(sender)
        
        let viewController = super.targetViewControllerForAction(action, sender: sender)
        Log.debug?.value(viewController)
        
        return viewController
    }
    
    @available(iOS 8.0, *)
    public override func showViewController(vc: UIViewController, sender: AnyObject?) {
        /* This method will show a view controller appropriately for the current size-class environment. It's implementation calls
        `[self targetViewControllerForAction:sender:]` first and redirects accordingly if the return value is not `self`, otherwise it will present the vc. */

        
        Log.debug?.value(vc)
        Log.debug?.value(sender)
        
        super.showViewController(vc, sender: sender)
    }
    
    @available(iOS 8.0, *)
    public override func showDetailViewController(vc: UIViewController, sender: AnyObject?) {
        /* This method will show a view controller within the semantic "detail" UI associated with the current size-class environment. It's implementation calls  `[self targetViewControllerForAction:sender:]` first and redirects accordingly if the return value is not `self`, otherwise it will present the vc.  */

        Log.debug?.value(vc)
        Log.debug?.value(sender)
        
        super.showViewController(vc, sender: sender)
    }
}




//public enum UIModalTransitionStyle : Int {
//    
//    case CoverVertical
//    case FlipHorizontal
//    case CrossDissolve
//    @available(iOS 3.2, *)
//    case PartialCurl
//}
//
//public enum UIModalPresentationStyle : Int {
//    
//    case FullScreen
//    @available(iOS 3.2, *)
//    case PageSheet
//    @available(iOS 3.2, *)
//    case FormSheet
//    @available(iOS 3.2, *)
//    case CurrentContext
//    @available(iOS 7.0, *)
//    case Custom
//    @available(iOS 8.0, *)
//    case OverFullScreen
//    @available(iOS 8.0, *)
//    case OverCurrentContext
//    @available(iOS 8.0, *)
//    case Popover
//    @available(iOS 7.0, *)
//    case None
//}





//// To make it more convenient for applications to adopt rotation, a view controller may implement the below methods. Your UIWindow's frame should use [UIScreen mainScreen].bounds as its frame.
//extension UIViewController {
//    
//    // call this method when your return value from shouldAutorotateToInterfaceOrientation: changes
//    // if the current interface orientation does not match the current device orientation, a rotation may occur provided all relevant view controllers now return YES from shouldAutorotateToInterfaceOrientation:
//    @available(iOS 5.0, *)
//    public class func attemptRotationToDeviceOrientation()
//    
//    // Applications should use supportedInterfaceOrientations and/or shouldAutorotate..
//    
//    // New Autorotation support.
//    @available(iOS 6.0, *)
//    public func shouldAutorotate() -> Bool
//    @available(iOS 6.0, *)
//    public func supportedInterfaceOrientations() -> UIInterfaceOrientationMask
//    // Returns interface orientation masks.
//    @available(iOS 6.0, *)
//    public func preferredInterfaceOrientationForPresentation() -> UIInterfaceOrientation
//    
//    // The rotating header and footer views will slide out during the rotation and back in once it has completed.
//    @available(iOS, introduced=2.0, deprecated=8.0, message="Header views are animated along with the rest of the view hierarchy")
//    public func rotatingHeaderView() -> UIView? // Must be in the view hierarchy. Default returns nil.
//    @available(iOS, introduced=2.0, deprecated=8.0, message="Footer views are animated along with the rest of the view hierarchy")
//    public func rotatingFooterView() -> UIView? // Must be in the view hierarchy. Default returns nil.
//    
//    @available(iOS, introduced=2.0, deprecated=8.0)
//    public var interfaceOrientation: UIInterfaceOrientation { get }
//    
//    // Notifies when rotation begins, reaches halfway point and ends.
//    @available(iOS, introduced=2.0, deprecated=8.0, message="Implement viewWillTransitionToSize:withTransitionCoordinator: instead")
//    public func willRotateToInterfaceOrientation(toInterfaceOrientation: UIInterfaceOrientation, duration: NSTimeInterval)
//    @available(iOS, introduced=2.0, deprecated=8.0)
//    public func didRotateFromInterfaceOrientation(fromInterfaceOrientation: UIInterfaceOrientation)
//    
//    @available(iOS, introduced=3.0, deprecated=8.0, message="Implement viewWillTransitionToSize:withTransitionCoordinator: instead")
//    public func willAnimateRotationToInterfaceOrientation(toInterfaceOrientation: UIInterfaceOrientation, duration: NSTimeInterval)
//}
//
//// The rotating header and footer views are offscreen.
//// A this point, our view orientation is set to the new orientation.
//
//// Many view controllers have a view that may be in an editing state or not- for example, a UITableView.  These view
//// controllers can track the editing state, and generate an Edit|Done button to be used in a navigation bar.
//extension UIViewController {
//    
//    public var editing: Bool
//    public func setEditing(editing: Bool, animated: Bool) // Updates the appearance of the Edit|Done button item as necessary. Clients who override it must call super first.
//    
//    public func editButtonItem() -> UIBarButtonItem // Return an Edit|Done button that can be used as a navigation item's custom view. Default action toggles the editing state with animation.
//}
//
//extension UIViewController {
//    
//    @available(iOS, introduced=3.0, deprecated=8.0)
//    public var searchDisplayController: UISearchDisplayController? { get }
//}
//
///*
//This exception is raised when a child view controller's view is added into the view hierarchy and the first
//superview of the child view controller's view that has a view controller is NOT the child view controller's
//parent.
//*/
//@available(iOS 5.0, *)
//public let UIViewControllerHierarchyInconsistencyException: String
//
///*
//The methods in the UIContainerViewControllerProtectedMethods and the UIContainerViewControllerCallbacks
//categories typically should only be called by subclasses which are implementing new container view
//controllers. They may be overridden but must call super.
//*/
//extension UIViewController {
//    
//    // An array of children view controllers. This array does not include any presented view controllers.
//    @available(iOS 5.0, *)
//    public var childViewControllers: [UIViewController] { get }
//    
//    /*
//    If the child controller has a different parent controller, it will first be removed from its current parent
//    by calling removeFromParentViewController. If this method is overridden then the super implementation must
//    be called.
//    */
//    @available(iOS 5.0, *)
//    public func addChildViewController(childController: UIViewController)
//    
//    /*
//    Removes the the receiver from its parent's children controllers array. If this method is overridden then
//    the super implementation must be called.
//    */
//    @available(iOS 5.0, *)
//    public func removeFromParentViewController()
//    
//    /*
//    This method can be used to transition between sibling child view controllers. The receiver of this method is
//    their common parent view controller. (Use [UIViewController addChildViewController:] to create the
//    parent/child relationship.) This method will add the toViewController's view to the superview of the
//    fromViewController's view and the fromViewController's view will be removed from its superview after the
//    transition completes. It is important to allow this method to add and remove the views. The arguments to
//    this method are the same as those defined by UIView's block animation API. This method will fail with an
//    NSInvalidArgumentException if the parent view controllers are not the same as the receiver, or if the
//    receiver explicitly forwards its appearance and rotation callbacks to its children. Finally, the receiver
//    should not be a subclass of an iOS container view controller. Note also that it is possible to use the
//    UIView APIs directly. If they are used it is important to ensure that the toViewController's view is added
//    to the visible view hierarchy while the fromViewController's view is removed.
//    */
//    @available(iOS 5.0, *)
//    public func transitionFromViewController(fromViewController: UIViewController, toViewController: UIViewController, duration: NSTimeInterval, options: UIViewAnimationOptions, animations: (() -> Void)?, completion: ((Bool) -> Void)?)
//    
//    // If a custom container controller manually forwards its appearance callbacks, then rather than calling
//    // viewWillAppear:, viewDidAppear: viewWillDisappear:, or viewDidDisappear: on the children these methods
//    // should be used instead. This will ensure that descendent child controllers appearance methods will be
//    // invoked. It also enables more complex custom transitions to be implemented since the appearance callbacks are
//    // now tied to the final matching invocation of endAppearanceTransition.
//    @available(iOS 5.0, *)
//    public func beginAppearanceTransition(isAppearing: Bool, animated: Bool)
//    @available(iOS 5.0, *)
//    public func endAppearanceTransition()
//    
//    // Override to return a child view controller or nil. If non-nil, that view controller's status bar appearance attributes will be used. If nil, self is used. Whenever the return values from these methods change, -setNeedsUpdatedStatusBarAttributes should be called.
//    @available(iOS 7.0, *)
//    public func childViewControllerForStatusBarStyle() -> UIViewController?
//    @available(iOS 7.0, *)
//    public func childViewControllerForStatusBarHidden() -> UIViewController?
//    
//    // Call to modify the trait collection for child view controllers.
//    @available(iOS 8.0, *)
//    public func setOverrideTraitCollection(collection: UITraitCollection?, forChildViewController childViewController: UIViewController)
//    @available(iOS 8.0, *)
//    public func overrideTraitCollectionForChildViewController(childViewController: UIViewController) -> UITraitCollection?
//}
//
//extension UIViewController {
//    
//    /*
//    This method is consulted to determine if a view controller manually forwards its containment callbacks to
//    any children view controllers. Subclasses of UIViewController that implement containment logic may override
//    this method. The default implementation returns YES. If it is overridden and returns NO, then the subclass is
//    responsible for forwarding the following methods as appropriate - viewWillAppear: viewDidAppear: viewWillDisappear:
//    viewDidDisappear: willRotateToInterfaceOrientation:duration:
//    willAnimateRotationToInterfaceOrientation:duration: didRotateFromInterfaceOrientation:
//    */
//    
//    @available(iOS, introduced=6.0, deprecated=8.0, message="Manually forward viewWillTransitionToSize:withTransitionCoordinator: if necessary")
//    public func shouldAutomaticallyForwardRotationMethods() -> Bool
//    
//    @available(iOS 6.0, *)
//    public func shouldAutomaticallyForwardAppearanceMethods() -> Bool
//    
//    /*
//    These two methods are public for container subclasses to call when transitioning between child
//    controllers. If they are overridden, the overrides should ensure to call the super. The parent argument in
//    both of these methods is nil when a child is being removed from its parent; otherwise it is equal to the new
//    parent view controller.
//    
//    addChildViewController: will call [child willMoveToParentViewController:self] before adding the
//    child. However, it will not call didMoveToParentViewController:. It is expected that a container view
//    controller subclass will make this call after a transition to the new child has completed or, in the
//    case of no transition, immediately after the call to addChildViewController:. Similarly
//    removeFromParentViewController: does not call [self willMoveToParentViewController:nil] before removing the
//    child. This is also the responsibilty of the container subclass. Container subclasses will typically define
//    a method that transitions to a new child by first calling addChildViewController:, then executing a
//    transition which will add the new child's view into the view hierarchy of its parent, and finally will call
//    didMoveToParentViewController:. Similarly, subclasses will typically define a method that removes a child in
//    the reverse manner by first calling [child willMoveToParentViewController:nil].
//    */
//    @available(iOS 5.0, *)
//    public func willMoveToParentViewController(parent: UIViewController?)
//    @available(iOS 5.0, *)
//    public func didMoveToParentViewController(parent: UIViewController?)
//}
//
//extension UIViewController : UIStateRestoring {
//    @available(iOS 6.0, *)
//    public var restorationIdentifier: String?
//    @available(iOS 6.0, *)
//    public var restorationClass: AnyObject.Type?
//    @available(iOS 6.0, *)
//    public func encodeRestorableStateWithCoder(coder: NSCoder)
//    @available(iOS 6.0, *)
//    public func decodeRestorableStateWithCoder(coder: NSCoder)
//    @available(iOS 7.0, *)
//    public func applicationFinishedRestoringState()
//}
//
//extension UIViewController {
//    /* Base implementation sends -updateConstraints to the view.
//    When a view has a view controller, this message is sent to the view controller during
//    the autolayout updateConstraints pass in lieu of sending updateConstraints directly
//    to the view.
//    You may override this method in a UIViewController subclass for updating custom
//    constraints instead of subclassing your view and overriding -[UIView updateConstraints].
//    Overrides must call super or send -updateConstraints to the view.
//    */
//    @available(iOS 6.0, *)
//    public func updateViewConstraints()
//}
//
//extension UIViewController {
//    
//    @available(iOS 7.0, *)
//    weak public var transitioningDelegate: UIViewControllerTransitioningDelegate?
//}
//
//extension UIViewController {
//    // These objects may be used as layout items in the NSLayoutConstraint API
//    @available(iOS 7.0, *)
//    public var topLayoutGuide: UILayoutSupport { get }
//    @available(iOS 7.0, *)
//    public var bottomLayoutGuide: UILayoutSupport { get }
//}
//
//extension UIViewController {
//    
//    @available(iOS 9.0, *)
//    public func addKeyCommand(keyCommand: UIKeyCommand)
//    @available(iOS 9.0, *)
//    public func removeKeyCommand(keyCommand: UIKeyCommand)
//}
//
//extension UIViewController : NSExtensionRequestHandling {
//    
//    // Returns the extension context. Also acts as a convenience method for a view controller to check if it participating in an extension request.
//    @available(iOS 8.0, *)
//    public var extensionContext: NSExtensionContext? { get }
//}
//
//extension UIViewController {
//    @available(iOS 8.0, *)
//    public var presentationController: UIPresentationController? { get }
//    @available(iOS 8.0, *)
//    public var popoverPresentationController: UIPopoverPresentationController? { get }
//}
//
//public protocol UIViewControllerPreviewing : NSObjectProtocol {
//    
//    // This gesture can be used to cause the previewing presentation to wait until one of your gestures fails or to allow simultaneous recognition during the initial phase of the preview presentation.
//    @available(iOS 9.0, *)
//    public var previewingGestureRecognizerForFailureRelationship: UIGestureRecognizer { get }
//    
//    @available(iOS 9.0, *)
//    public var delegate: UIViewControllerPreviewingDelegate { get }
//    @available(iOS 9.0, *)
//    public var sourceView: UIView { get }
//    
//    // This rect will be set to the bounds of sourceView before each call to
//    // -previewingContext:viewControllerForLocation:
//    
//    @available(iOS 9.0, *)
//    public var sourceRect: CGRect { get set }
//}
//
//@available(iOS 9.0, *)
//public protocol UIViewControllerPreviewingDelegate : NSObjectProtocol {
//    
//    // If you return nil, a preview presentation will not be performed
//    @available(iOS 9.0, *)
//    public func previewingContext(previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController?
//    @available(iOS 9.0, *)
//    public func previewingContext(previewingContext: UIViewControllerPreviewing, commitViewController viewControllerToCommit: UIViewController)
//}
//
//extension UIViewController {
//    
//    // Registers a view controller to participate with 3D Touch preview (peek) and commit (pop).
//    @available(iOS 9.0, *)
//    public func registerForPreviewingWithDelegate(delegate: UIViewControllerPreviewingDelegate, sourceView: UIView) -> UIViewControllerPreviewing
//    @available(iOS 9.0, *)
//    public func unregisterForPreviewingWithContext(previewing: UIViewControllerPreviewing)
//}
//
//extension UIViewController {
//    
//    @available(iOS 9.0, *)
//    public func previewActionItems() -> [UIPreviewActionItem]
//}
//
//@available(iOS 9.0, *)
//public protocol UIPreviewActionItem : NSObjectProtocol {
//    public var title: String { get }
//}
//
//@available(iOS 9.0, *)
//public enum UIPreviewActionStyle : Int {
//    
//    case Default
//    case Selected
//    case Destructive
//}
//
//@available(iOS 9.0, *)
//public class UIPreviewAction : NSObject, NSCopying, UIPreviewActionItem {
//    
//    public var handler: (UIPreviewActionItem, UIViewController) -> Void { get }
//    
//    public convenience init(title: String, style: UIPreviewActionStyle, handler: (UIPreviewAction, UIViewController) -> Void)
//}
//
//@available(iOS 9.0, *)
//public class UIPreviewActionGroup : NSObject, NSCopying, UIPreviewActionItem {
//    public convenience init(title: String, style: UIPreviewActionStyle, actions: [UIPreviewAction])
//}
