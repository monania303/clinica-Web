package org.biblioteca.abm.testEjb;

import java.util.Hashtable;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import org.biblioteca.abm.session.LibroSession;
import org.biblioteca.abm.session.LibroSessionRemote;
import org.biblioteca.entidad.Libro;

public class LibroSessionEJBTest {
	public static void main(String[] args) throws Exception {
		// buscarTodosTest();
		// buscarPorCodigoTest(2);
		// actualizarTest(0, "Matemáticas", 2, "Obs hay que estudiar");
		//eliminarTest(2);
	}

	private static void buscarTodosTest() throws NamingException {
		final LibroSessionRemote libroSessionRemote = lookupLibroSessionRemote();

		try {
			List<Libro> libroList = libroSessionRemote.buscarTodos();
			for (Libro libro : libroList) {
				System.out.println("Codigo: " + libro.getCodigo());
				System.out.println("Descripción: " + libro.getDescripcion());
				System.out.println("Cantidad: " + libro.getCantidad());
				System.out.println("Ciudad: " + libro.getObs());
				System.out.println();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private static void buscarPorCodigoTest(Integer codigo) throws NamingException {
		final LibroSessionRemote libroSessionRemote = lookupLibroSessionRemote();

		try {
			Libro libro = libroSessionRemote.buscarPorCodigo(codigo);
			if (libro == null) {
				System.out.println("Libro " + codigo + " no existe");
				return;
			}
			System.out.println("Codigo: " + libro.getCodigo());
			System.out.println("Descripción: " + libro.getDescripcion());
			System.out.println("Cantidad: " + libro.getCantidad());
			System.out.println("Observación: " + libro.getObs());
			System.out.println();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private static void actualizarTest(Integer codigo, String nombre, Integer cantidad, String obs)
			throws NamingException {

		Libro libro = new Libro();
		libro.setCodigo(codigo);
		libro.setDescripcion(nombre);
		libro.setCantidad(cantidad);
		libro.setObs(obs);

		final LibroSessionRemote libroSessionRemote = lookupLibroSessionRemote();

		try {
			Libro libroUpdate = libroSessionRemote.actualizar(libro);

			System.out.println("Libro actualizado");
			System.out.println("Codigo: " + libroUpdate.getCodigo());
			System.out.println("Descripción: " + libroUpdate.getDescripcion());
			System.out.println("Cantidad: " + libroUpdate.getCantidad());
			System.out.println("Observación: " + libroUpdate.getObs());
			System.out.println();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private static void eliminarTest(Integer codigo) throws NamingException {
		final LibroSessionRemote libroSessionRemote = lookupLibroSessionRemote();

		try {
			libroSessionRemote.eliminar(codigo);
			System.out.println("Libro " + codigo + " eliminado...!!");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private static LibroSessionRemote lookupLibroSessionRemote() throws NamingException {
		final Hashtable jndiProperties = new Hashtable();
		jndiProperties.put(Context.URL_PKG_PREFIXES, "org.jboss.ejb.client.naming");
		jndiProperties.put(Context.PROVIDER_URL, "remote://localhost:4447");
		jndiProperties.put(Context.SECURITY_PRINCIPAL, "admin");
		jndiProperties.put(Context.SECURITY_CREDENTIALS, "admin123");

		final Context context = new InitialContext(jndiProperties);
		final String earName = "PROYECTO";
		final String ejbModuleName = "PROYECTO-EJB";
		final String beanName = LibroSession.class.getSimpleName();
		final String fullClassName = LibroSessionRemote.class.getName();
		String jndiCompleteName = "ejb:" + earName + "/" + ejbModuleName + "/" + beanName + "!" + fullClassName;

		System.out.println("lockup: " + jndiCompleteName);

		return (LibroSessionRemote) context.lookup(jndiCompleteName);
	}
}