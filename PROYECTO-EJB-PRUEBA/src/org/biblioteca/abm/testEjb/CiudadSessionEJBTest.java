package org.biblioteca.abm.testEjb;

import java.util.Hashtable;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import org.biblioteca.abm.session.CiudadSession;
import org.biblioteca.abm.session.CiudadSessionRemote;
import org.biblioteca.entidad.Ciudad;

public class CiudadSessionEJBTest {
	public static void main(String[] args) throws Exception {
		// buscarTodosTest();
		// buscarPorCodigoTest(2);
		//actualizarTest(1, "Nueva Ciudad");
		 eliminarTest(1);

	}

	private static void buscarTodosTest() throws NamingException {
		final CiudadSessionRemote ciudadSessionRemote = lookupCiudadSessionRemote();
		try {
			List<Ciudad> ciudadList = ciudadSessionRemote.buscarTodos();
			for (Ciudad ciudad : ciudadList) {
				System.out.println("Codigo: " + ciudad.getCodigo());
				System.out.println("Descripción: " + ciudad.getDescripcion());
				System.out.println();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private static void buscarPorCodigoTest(Integer codigo) throws NamingException {
		final CiudadSessionRemote ciudadSessionRemote = lookupCiudadSessionRemote();

		try {
			Ciudad ciudad = ciudadSessionRemote.buscarPorCodigo(codigo);
			if (ciudad == null) {
				System.out.println("Ciudad " + codigo + " no existe");
				return;
			}

			System.out.println("Codigo: " + ciudad.getCodigo());
			System.out.println("Descripción: " + ciudad.getDescripcion());
			System.out.println();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private static void actualizarTest(Integer codigo, String descripcion) throws NamingException {

		Ciudad ciudad = new Ciudad();
		ciudad.setCodigo(codigo);
		ciudad.setDescripcion(descripcion);

		final CiudadSessionRemote ciudadSessionRemote = lookupCiudadSessionRemote();

		try {
			Ciudad ciudadUpdate = ciudadSessionRemote.actualizar(ciudad);

			System.out.println("Ciudad actualizado");
			System.out.println("Codigo: " + ciudadUpdate.getCodigo());
			System.out.println("Descripción: " + ciudadUpdate.getDescripcion());
			System.out.println();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private static void eliminarTest(Integer codigo) throws NamingException {
		final CiudadSessionRemote ciudadSessionRemote = lookupCiudadSessionRemote();

		try {
			ciudadSessionRemote.eliminar(codigo);
			System.out.println("Ciudad " + codigo + " eliminado...!!");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@SuppressWarnings("unchecked")
	private static CiudadSessionRemote lookupCiudadSessionRemote() throws NamingException {
		final Hashtable jndiProperties = new Hashtable();
		jndiProperties.put(Context.URL_PKG_PREFIXES, "org.jboss.ejb.client.naming");
		
		//jndiProperties.put(Context.PROVIDER_URL, "remote://localhost:4447");
		
		final Context context = new InitialContext(jndiProperties);
		final String earName = "PROYECTO";
		final String ejbModuleName = "PROYECTO-EJB";
		final String beanName = CiudadSession.class.getSimpleName();
		final String fullClassName = CiudadSessionRemote.class.getName();
		String jndiCompleteName = "ejb:" + earName + "/" + ejbModuleName + "/" + beanName + "!" + fullClassName;
		
		System.out.println("lockup: " + jndiCompleteName);

		return (CiudadSessionRemote) context.lookup(jndiCompleteName);
	}

}