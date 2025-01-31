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
        paginacion = !paginacion
        //paginación, al hacer scroll carga la página completa y no por partes de la pàgina
        pdfLector.usePageViewController(paginacion)
    }
    
    @IBAction func btnAjustarAction(_ sender: Any) {
        autoescala = !autoescala
        pdfLector.autoScales = autoescala
    }
    
    @IBAction func btnScrollAction(_ sender: UIBarButtonItem) {
        displayDireccion = !displayDireccion
        //cambiar de vista horizontal a vertical
        pdfLector.displayDirection = displayDireccion ? .horizontal : .vertical
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
