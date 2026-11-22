import SwiftUI

struct FilaLibro: View {
    // Solo muestra datos, no los cambia: por eso basta con let.
    let libro: Libro

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: "book")
                .font(.title2)

            VStack(alignment: .leading) {
                Text(libro.titulo)
                    .bold()
                Text("\(libro.paginas) páginas")
                    .font(.subheadline)
                    .foregroundStyle(.gray)
            }

            Spacer()

            if libro.estaLeido {
                Image(systemName: "checkmark")
                    .font(.title2)
                    .foregroundStyle(.green)
            }
        }
    }
}

#Preview {
    List(Libro.ejemplos) { libro in
        FilaLibro(libro: libro)
    }
}
