import SwiftUI

struct ContentView: View {
    // Se reemplaza la Bienvenida por Mis libros en lugar de navegar,
    // así la Bienvenida no queda en la pila y no se puede regresar a ella.
    @State private var mostrarLibros = false

    var body: some View {
        if mostrarLibros {
            MisLibrosView()
        } else {
            BienvenidaView(mostrarLibros: $mostrarLibros)
        }
    }
}

#Preview {
    ContentView()
}
