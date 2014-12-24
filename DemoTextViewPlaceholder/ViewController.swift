import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var customTextView : RMTextViewPlaceholder!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //customTextView.text = ""
        //customTextView.placeholder = "Custom Placeholder"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

