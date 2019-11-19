package org.biblioteca.abm.testEjb;

import java.util.Hashtable;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

import org.biblioteca.abm.session.AutorSession;
import org.biblioteca.abm.session.AutorSessionRemote;
import org.biblioteca.entidad.Autor;

public class AutorSessionEJBTest {
	public static void main(String[] args) throws Exception {
		 buscarTodosTest();
		// buscarPorCodigoTest(1);
		 //buscarPorNombreTest("R");
		//actualizarTest(7, "Jose Rodriguez");
		 //eliminarTest(3);

	}

	private static void buscarTodosTest() throws NamingException {
		final AutorSessionRemote autorSessionRemote = lookupAutorSessionRemote();
		try {
			List<Autor> autorList = autorSessionRemote.buscarTodos();
			for (Autor autor : autorList) {
				System.out.println("Codigo: " + autor.getCodigo());
				System.out.println("Nombre: " + autor.getNombre());
				System.out.println();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private static void buscarPorCodigoTest(Integer codigo) throws NamingException {
		final AutorSessionRemote autorSessionRemote = lookupAutorSessionRemote();

		try {
			Autor autor = autorSessionRemote.buscarPorCodigo(codigo);
			if (autor == null) {
				System.out.println("Autor" + codigo + " no existe");
				return;
			}

			System.out.println("Codigo: " + autor.getCodigo());
			System.out.println("Nombre: " + autor.getNombre());
			System.out.println();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private static void buscarPorNombreTest(String nombre) throws NamingException {
		final AutorSessionRemote autorSessionRemote = lookupAutorSessionRemote();
		
		
		try {
			List<Autor> autorLista = autorSessionRemote.buscarPorNombre(nombre);
			for (Autor autor : autorLista) {
			  System.out.println("Codigo: " + autor.getCodigo());
			  System.out.println("Nombre: " + autor.getNombre());
			  System.out.println();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private static void actualizarTest(Integer codigo, String nombre) throws NamingException {

		Autor autor = new Autor();
		autor.setCodigo(codigo);
		autor.setNombre(nombre);

		final AutorSessionRemote autorSessionRemote = lookupAutorSessionRemote();

		try {
			Autor autorUpdate = autorSessionRemote.actualizar(autor);
			System.out.println("Autor actualizado");
			System.out.println("Codigo: " + autorUpdate.getCodigo());
			System.out.println("Nombre: " + autorUpdate.getNombre());
			System.out.println();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private static void eliminarTest(Integer codigo) throws NamingException {
		final AutorSessionRemote autorSessionRemote = lookupAutorSessionRemote();
		try {
			autorSessionRemote.eliminar(codigo);
			System.out.println("Autor " + codigo + " foi envora...!!");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@SuppressWarnings("unchecked")
	private static AutorSessionRemote lookupAutorSessionRemote() throws NamingException {
		final Hashtable jndiProperties = new Hashtable();
		jndiProperties.put(Context.URL_PKG_PREFIXES, "org.jboss.ejb.client.naming");

		final Context context = new InitialContext(jndiProperties);
		final String earName = "PROYECTO";
		final String ejbModuleName = "PROYECTO-EJB";
		final String beanName = AutorSession.class.getSimpleName();
		final String fullClassName = AutorSessionRemote.class.getName();
		String jndiCompleteName = "ejb:" + earName + "/" + ejbModuleName + "/" + beanName + "!" + fullClassName;

		System.out.println("lockup: " + jndiCompleteName);

		return (AutorSessionRemote) context.lookup(jndiCompleteName);
	}

}