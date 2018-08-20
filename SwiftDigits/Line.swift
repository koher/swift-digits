import CoreGraphics

struct Line {
    var points: [CGPoint]
    
    init() {
        self.init([])
    }
    
    init(_ points: [CGPoint]) {
        self.points = points
    }
}
