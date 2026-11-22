import SwiftUI

struct RegistroView: View {
    // @Binding: la lista pertenece a Mis libros; aquí solo se le agrega un libro.
    @Binding var libros: [Libro]
    @Environment(\.dismiss) private var dismiss

    @State private var titulo = ""
    // String porque el TextField trabaja con texto; se convierte a Int al validar.
    @State private var paginas = ""
    // Vacío cuando no hay error; si tiene texto, se muestra debajo de los campos.
    @State private var mensajeError = ""

    // Se ignoran los espacios al inicio y al final antes de validar y guardar.
    private var tituloLimpio: String {
        titulo.trimmingCharacters(in: .whitespaces)
    }

    private var paginasLimpias: String {
        paginas.trimmingCharacters(in: .whitespaces)
    }

    var body: some View {
        Form {
            TextField("Título", text: $titulo)
            TextField("Número de páginas", text: $paginas)
                .keyboardType(.numberPad)

            if !mensajeError.isEmpty {
                Text(mensajeError)
                    .foregroundStyle(.red)
            }
        }
        .navigationTitle("Nuevo libro")
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button("Guardar", action: guardar)
            }
        }
    }

    // Devuelve el mensaje del primer error encontrado, o nil si todo es válido.
    private func validar() -> String? {
        if tituloLimpio.isEmpty {
            return "Ingrese el título del libro."
        }
        if paginasLimpias.isEmpty {
            return "Ingrese el número de páginas."
        }
        if tituloLimpio.count < 2 {
            return "El título debe tener al menos 2 caracteres."
        }
        guard let numero = Int(paginasLimpias), (50...1000).contains(numero) else {
            return "Las páginas deben ser un número entre 50 y 1000."
        }
        return nil
    }

    private func guardar() {
        if let error = validar() {
            mensajeError = error
            return
        }

        // validar() ya comprobó que las páginas son un número válido.
        guard let numero = Int(paginasLimpias) else { return }
        libros.append(Libro(titulo: tituloLimpio, paginas: numero))
        dismiss()
    }
}

#Preview {
    NavigationStack {
        RegistroView(libros: .constant(Libro.ejemplos))
    }
}
