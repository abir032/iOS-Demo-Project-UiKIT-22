//
//  ViewController.swift
//  MdFahimFaezAbir-30028
//
//  Created by Bjit on 3/1/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var rajuView: UIImageView!
    @IBOutlet weak var meenaView: UIImageView!
    @IBOutlet weak var mithu: UIImageView!
    
    @IBOutlet weak var meenaText: UILabel!
    @IBOutlet weak var rajuText: UILabel!
    @IBOutlet weak var rajuConversation: UIImageView!
    @IBOutlet weak var meenaConversation: UIImageView!
    @IBOutlet weak var meenaTrailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var rajuViewConstraint: NSLayoutConstraint!
    override func viewDidLoad() {
        //meenaConversation.image = nil
        //rajuConversation.image = nil
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        meenaTrailingConstraint.constant = -meenaView.bounds.width - 20
        rajuViewConstraint.constant = -rajuView.bounds.width - 20
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.global().async {
            self.showConversation()
        }
       
    }

}

extension ViewController {
    func showConversation(){
        let queue = DispatchQueue(label: "com.serial.queue")
        
        queue.sync {
            sleep(1)
            DispatchQueue.main.async {
            UIView.animate(withDuration: 4,delay: 0, animations: { [weak self] in
                
                    self?.meenaTrailingConstraint.constant = 20
                    self?.view.layoutIfNeeded()
                
            })
            }
        }
       
        queue.sync {
            sleep(3)
            DispatchQueue.main.async {
            UIView.animate(withDuration: 3,delay: 0, animations: { [weak self] in
               
                    self?.rajuViewConstraint.constant = 20
                    self?.view.layoutIfNeeded()
                
               
            })
            }
        }
        
        queue.sync {
            sleep(3)
            DispatchQueue.main.async {
                self.meenaConversation.image = UIImage(named: "pngwing.com")
                self.meenaConversation.frame.size.width = 0
                self.meenaConversation.frame.size.height = 0
            UIView.animate(withDuration: 4,delay: 0, options: [.curveEaseOut], animations: { [weak self] in
                guard let self = self else {return}
                    self.meenaConversation.frame.size.width *= 1.0
                    self.meenaConversation.frame.size.height *= 1.0
//                self.meenaText.frame.size.height *= 1.0
//                self.meenaText.frame.size.width *= 1.0
                    self.view.layoutIfNeeded()
                 
            }, completion: { [weak self]_ in
                self?.meenaText.text = "Hi William."
            })
            }
        }
        queue.sync {
            sleep(5)
            DispatchQueue.main.async {
                self.rajuConversation.image = UIImage(named: "pngwing.com")
                //self.rajuText.text = "Hello Meena."
                self.rajuConversation.frame.size.width = 0
                self.rajuConversation.frame.size.height = 0
//                self.rajuText.frame.size.height = 0
//                self.rajuText.frame.size.width = 0
            UIView.animate(withDuration: 4,delay: 0, options: [.curveEaseOut], animations: { [weak self] in
                guard let self = self else {return}
                self.rajuConversation.frame.size.width *= 1.0
                self.rajuConversation.frame.size.height *= 1.0
//                self.rajuText.frame.size.height *= 1.0
//                self.rajuText.frame.size.width *= 1.0
            self.view.layoutIfNeeded()
                
            }, completion: { [weak self]_ in
                self?.rajuText.text = "Hello Meena."
            })
            }
        }
       
        queue.sync {
            sleep(8)
            DispatchQueue.main.async {
                self.rajuText.text = nil
                self.meenaText.text = nil
                self.meenaConversation.image = nil
                self.rajuConversation.image = nil
                
            let gif = UIImage.gifImageWithName("output-onlinegiftools")
                self.mithu.image = gif
                self.mithu.frame.size.width = 0
                self.mithu.frame.size.height = 0
            UIView.animate(withDuration: 8,delay: 0, options: [.curveEaseOut], animations: { [weak self] in
                guard let self = self else {return}
            self.mithu.frame.size.width *= 1.0
            self.mithu.frame.size.height *= 1.0
            self.view.layoutIfNeeded()
           })
            }
        }
    }
}
