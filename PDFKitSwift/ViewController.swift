//
//  ViewController.swift
//  PDFKitSwift
//
//  Created by Portada Luna Jorge Antonio on 10/12/24.
//

import UIKit
import PDFKit

class ViewController: UIViewController {

    let pdfLector = PDFView()
    var paginacion = false, displayDireccion = false, autoescala = false
    
    @IBOutlet weak var pdfView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pdfLector.delegate = self
        visualizar()
    }

    // agrega vista de pdf a la view
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        pdfLector.frame = view.bounds
        pdfView.addSubview(pdfLector)
    }
    
    @IBAction func btnOrientacionAction(_ sender: Any) {
    }
    
    @IBAction func btnAjustarAction(_ sender: Any) {
    }
    
    @IBAction func btnScrollAction(_ sender: UIBarButtonItem) {
    }
    
    func visualizar() {
        guard let url = Bundle.main.url(forResource: "ejemplopdf", withExtension: "pdf") else { return }
        guard let documento = PDFDocument(url: url) else { return }
        pdfLector.document = documento
        //pdfLector.autoScales = true
    }
}

// MARK:PDFViewDelegate
extension ViewController: PDFViewDelegate {
    
}
