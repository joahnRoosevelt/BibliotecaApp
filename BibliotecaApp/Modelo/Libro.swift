import Foundation

// Struct (tipo valor): al cambiar una propiedad, SwiftUI detecta el cambio
// en el arreglo @State y vuelve a dibujar la lista.
struct Libro: Identifiable {
    let id = UUID()
    var titulo: String
    var paginas: Int
    var estaLeido: Bool = false

    // Datos iniciales en memoria: la app no tiene persistencia.
    static let ejemplos: [Libro] = [
        Libro(titulo: "Cien años de soledad", paginas: 471, estaLeido: true),
        Libro(titulo: "El principito", paginas: 96),
        Libro(titulo: "Don Quijote", paginas: 863, estaLeido: true),
        Libro(titulo: "La ciudad y los perros", paginas: 408)
    ]
}
