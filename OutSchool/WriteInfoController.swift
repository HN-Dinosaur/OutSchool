//
//  WriteInfoController.swift
//  OutSchool
//
//  Created by LongDengYu on 2021/11/19.
//

import UIKit

class WriteInfoController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var stuClass: UITextField!
    @IBOutlet weak var stuNo: UITextField!
    @IBOutlet weak var beginTime: UITextField!
    @IBOutlet weak var endTime: UITextField!
    @IBOutlet weak var readyDisplayImageView: UIImageView!
    @IBAction func selectPhoto(_ sender: Any) {
        let alert = UIAlertController(title: "提示", message: "选择方式添加图片", preferredStyle: .actionSheet)
        let cancel = UIAlertAction(title: "取消", style: .cancel)
        let photoLibrary = UIAlertAction(title: "相册", style: .default) { _ in self.clickPhotoLibrary() }
        let camera = UIAlertAction(title: "相机", style: .default) { _ in self.clickCamera()}
        alert.addAction(cancel)
        alert.addAction(photoLibrary)
        alert.addAction(camera)
        present(alert, animated: true)
        
    }
    func clickCamera(){
        let picker = UIImagePickerController()
        picker.delegate = self
        //打开相机
        picker.sourceType = .camera
        //让页面出现
        present(picker, animated: true)
    }
    func clickPhotoLibrary(){
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        
        present(picker, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //如果是去InfoViewController
        if let infoVC = segue.destination as? InfoViewController{
            //拿到View1，View2，View3
            if let view1 = infoVC.viewArray[0] as? View1,
                let view2 = infoVC.viewArray[1] as? VIew2{
                

                infoVC.selfName = self.name.text
                view1.name.text = self.name.text
                view1.stuClass.text = self.stuClass.text
                view1.stuNo.text = self.stuNo.text
                view2.beginTime.text = self.beginTime.text
                view2.endTime.text = self.endTime.text
                view2.image.image = readyDisplayImageView.image
            }
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage{
            readyDisplayImageView.image = image
        }
        picker.dismiss(animated: true, completion: nil)
    }
    

}
