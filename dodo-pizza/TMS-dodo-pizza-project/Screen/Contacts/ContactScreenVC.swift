import UIKit

class ContactScreenVC: UIViewController {
    
    private var contactView: ContactScreenView {
        return self.view as! ContactScreenView
    }
    
    override func loadView() {
        self.view = ContactScreenView(frame: Screen.bounds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


