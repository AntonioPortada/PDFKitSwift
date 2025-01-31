//
//  EscanearViewController.swift
//  PDFKitSwift
//
//  Created by Portada Luna Jorge Antonio on 17/12/24.
//

import UIKit
import PDFKit

class EscanearViewController: UIViewController {

    @IBOutlet weak var viewScan: UIView!

    let pdfView = PDFView()
    var imagenEscanear: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pdfView.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        pdfView.frame = view.bounds
    }
    
    @IBAction func escanearButton(_ sender: UIBarButtonItem) {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
        //cargarPDF()
    }
    
    @IBAction func compartirButton(_ sender: UIBarButtonItem) {
        let vc = UIActivityViewController(activityItems: [pdfView.document?.dataRepresentation()], applicationActivities: nil)
        present(vc, animated: true)
    }
    
    func cargarPDF() {
        viewScan.addSubview(pdfView)
        
        let newDocument = PDFDocument()
        guard let pagina = PDFPage(image: self.imagenEscanear ?? UIImage(named: "heart")!) else { return }
        newDocument.insert(pagina, at: 0)
        pdfView.document = newDocument
        
        pdfView.autoScales = true
        pdfView.usePageViewController(true)
    }
}

extension EscanearViewController: PDFViewDelegate {
    
}

extension EscanearViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let imagenSeleccionada = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            self.imagenEscanear = imagenSeleccionada
            self.cargarPDF()
            picker.dismiss(animated: true)
        }
    }
}
