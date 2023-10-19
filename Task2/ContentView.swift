import SwiftUI

struct ContentView: View {
    @State private var isExpanded = false
    @Namespace private var namespace

    var body: some View {
        ZStack(alignment: isExpanded ? .center : .bottomTrailing) {
            Color.white

            Group {
                if isExpanded {
                    ZStack(alignment: .top) {
                        createRoundedRectangle(width: 350, height: 400)
                        
                        Button { isExpanded.toggle() } label: {
                            Text("\(Image(systemName: "arrowshape.backward.fill")) Back")
                                .matchedGeometryEffect(id: "1", in: namespace)
                                .foregroundStyle(.white).bold()
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .matchedGeometryEffect(id: "2", in: namespace)
                        }
                        .frame(width: 350, alignment: .leading)
                    }
                } else {
                    ZStack {
                        createRoundedRectangle(width: 100, height: 50)
                        
                        Button { isExpanded.toggle() } label: {
                            Text("Open")
                                .matchedGeometryEffect(id: "1", in: namespace)
                                .foregroundStyle(.white).bold()
                                .matchedGeometryEffect(id: "2", in: namespace)
                        }
                        .buttonStyle(.plain)
                    }
                    .padding()
                }
            } }
        .animation(.spring(duration: 0.3), value: isExpanded)
    }
    
    private func createRoundedRectangle(width: CGFloat, height: CGFloat) -> some View {
        RoundedRectangle(cornerRadius: 12)
            .fill(Color.blue)
            .matchedGeometryEffect(id: "background", in: namespace)
            .frame(width: width, height: height)
    }
}
