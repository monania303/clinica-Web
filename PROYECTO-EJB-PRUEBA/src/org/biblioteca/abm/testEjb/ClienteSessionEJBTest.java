package org.biblioteca.abm.testEjb;

import java.util.Hashtable;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import org.biblioteca.abm.session.ClienteSession;
import org.biblioteca.abm.session.ClienteSessionRemote;
import org.biblioteca.entidad.Ciudad;
import org.biblioteca.entidad.Cliente;

public class ClienteSessionEJBTest {
	public static void main(String[] args) throws Exception {
		// buscarTodosTest();
		// buscarPorCodigoTest(1);
		// actualizarTest(0, "Nueva Ciudad", "Direccion nueva ciudad", 2, "Obs nueva
		// ciudad");
		// eliminarTest(1);

	}

	private static void buscarTodosTest() throws NamingException {
		final ClienteSessionRemote clienteSessionRemote = lookupClienteSessionRemote();

		try {
			List<Cliente> clienteList = clienteSessionRemote.buscarTodos();
			for (Cliente cliente : clienteList) {
				System.out.println("Codigo: " + cliente.getCodigo());
				System.out.println("Nombre: " + cliente.getNombre());
				System.out.println("Direccion: " + cliente.getDireccion());
				System.out.println("Ciudad: " + cliente.getCiudad().getDescripcion());
				System.out.println("Observación: " + cliente.getObs());
				System.out.println();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private static void buscarPorCodigoTest(Integer codigo) throws NamingException {
		final ClienteSessionRemote clienteSessionRemote = lookupClienteSessionRemote();

		try {
			Cliente cliente = clienteSessionRemote.buscarPorCodigo(codigo);
			if (cliente == null) {
				System.out.println("Cliente " + codigo + " no existe");
				return;
			}

			System.out.println("Codigo: " + cliente.getCodigo());
			System.out.println("Nombre: " + cliente.getNombre());
			System.out.println("Direccion: " + cliente.getDireccion());
			System.out.println("Ciudad: " + cliente.getCiudad().getDescripcion());
			System.out.println("Observación: " + cliente.getObs());
			System.out.println();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private static void actualizarTest(Integer codigo, String nombre, String direccion, Integer codigoCiudad,
			String obs) throws NamingException {

		Cliente cliente = new Cliente();
		cliente.setCodigo(codigo);
		cliente.setNombre(nombre);
		cliente.setDireccion(direccion);

		Ciudad ciudad = new Ciudad();
		ciudad.setCodigo(codigoCiudad);

		cliente.setCiudad(ciudad);
		cliente.setObs(obs);
		final ClienteSessionRemote clienteSessionRemote = lookupClienteSessionRemote();

		try {
			Cliente clienteUpdate = clienteSessionRemote.actualizar(cliente);

			System.out.println("Cliente actualizado");
			System.out.println("Codigo: " + clienteUpdate.getCodigo());
			System.out.println("Nombre: " + clienteUpdate.getNombre());
			System.out.println("Direccion: " + clienteUpdate.getDireccion());
			System.out.println("Ciudad: " + clienteUpdate.getCiudad().getDescripcion());
			System.out.println("Observación: " + clienteUpdate.getObs());
			System.out.println();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private static void eliminarTest(Integer codigo) throws NamingException {
		final ClienteSessionRemote clienteSessionRemote = lookupClienteSessionRemote();

		try {
			clienteSessionRemote.eliminar(codigo);
			System.out.println("Cliente " + codigo + " eliminado...!!");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private static ClienteSessionRemote lookupClienteSessionRemote() throws NamingException {
		final Hashtable jndiProperties = new Hashtable();
		jndiProperties.put(Context.URL_PKG_PREFIXES, "org.jboss.ejb.client.naming");
		

		final Context context = new InitialContext(jndiProperties);
		final String earName = "PROYECTO";
		final String ejbModuleName = "PROYECTO-EJB";
		final String beanName = ClienteSession.class.getSimpleName();
		final String fullClassName = ClienteSessionRemote.class.getName();
		String jndiCompleteName = "ejb:" + earName + "/" + ejbModuleName + "/" + beanName + "!" + fullClassName;

		System.out.println("lockup: " + jndiCompleteName);

		return (ClienteSessionRemote) context.lookup(jndiCompleteName);
	}
}