import SwiftUI

struct MisLibrosView: View {
    // Esta vista es la dueña de los datos; el Registro los recibe con @Binding.
    @State private var libros = Libro.ejemplos

    var body: some View {
        NavigationStack {
            List(libros) { libro in
                FilaLibro(libro: libro)
                    .swipeActions(edge: .leading) {
                        if libro.estaLeido {
                            Button("Quitar", systemImage: "xmark") {
                                alternarLeido(libro)
                            }
                            .tint(.gray)
                        } else {
                            Button("Leído", systemImage: "checkmark") {
                                alternarLeido(libro)
                            }
                            .tint(.green)
                        }
                    }
            }
            .navigationTitle("Mis libros")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        RegistroView(libros: $libros)
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }

    // Se busca por id y no por la posición de la fila,
    // porque la posición puede cambiar si la lista cambia.
    private func alternarLeido(_ libro: Libro) {
        if let indice = libros.firstIndex(where: { $0.id == libro.id }) {
            libros[indice].estaLeido.toggle()
        }
    }
}

#Preview {
    MisLibrosView()
}
