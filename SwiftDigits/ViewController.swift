import UIKit
import CoreML
import EasyImagy

class ViewController: UIViewController {
    @IBOutlet var canvasView: CanvasView!
    
    private let classifier = Digits()
    
    @IBAction func pressClassifyButton(_ button: UIButton) {
        let image = Image<UInt8>(uiImage: canvasView.image).resizedTo(width: 8, height: 8)
        let input = try! MLMultiArray(shape: [8, 8], dataType: .double)

        var pointer = input.dataPointer.bindMemory(to: Double.self, capacity: 8 * 8)
        for pixel in image {
            pointer.pointee = Double(255 - pixel) / 16.0
            pointer += 1
        }
        
        let result = try! classifier.prediction(input: DigitsInput(input: input))
        
        let alertController = UIAlertController(title: "\(result.classLabel)", message: nil, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default) { [weak self] _ in
            self?.canvasView.clear()
        })
        present(alertController, animated: true, completion: nil)
    }
}

