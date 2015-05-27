

import UIKit

class AddPageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func addContent(sender: AnyObject) {
        
        let alertController = UIAlertController(title: nil, message: "Escolha um objeto para adicionar na pagina", preferredStyle: UIAlertControllerStyle.ActionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancela", style: .Cancel) { (action) -> Void in
            
        }
        
        alertController.addAction(cancelAction)
        
        let addTextAction = UIAlertAction(title: "Adiciona Texto", style: .Default) { (action) -> Void in
            
        }
        
        alertController.addAction(addTextAction)
        
        self.presentViewController(alertController, animated: true, completion: nil)
        
    }

}
