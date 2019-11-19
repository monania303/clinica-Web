package org.biblioteca.mov.testEjb;
import java.util.Hashtable;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import org.biblioteca.abm.session.ClienteSession;
import org.biblioteca.abm.session.ClienteSessionRemote;
import org.biblioteca.entidad.Cliente;
public class PrestamoSessionEJBTest {
 public static void main(String[] args) throws Exception {
 invokeStatelessBean();
 }
 private static void invokeStatelessBean() throws NamingException {
 final ClienteSessionRemote clienteSessionRemote =
lookupClienteSessionRemote();
 
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
 
 private static ClienteSessionRemote lookupClienteSessionRemote() throws
NamingException {
 final Hashtable jndiProperties = new Hashtable();
 jndiProperties.put(Context.URL_PKG_PREFIXES, "org.jboss.ejb.client.naming");
 jndiProperties.put(Context.PROVIDER_URL, "remote://localhost:4447");
 jndiProperties.put(Context.SECURITY_PRINCIPAL,"admin");
  
jndiProperties.put(Context.SECURITY_CREDENTIALS, "admin123");
 
 final Context context = new InitialContext(jndiProperties);
 final String appName = "PROYECTO";
 final String moduleName = "PROYECTO-EJB";
 final String beanName = ClienteSession.class.getSimpleName();
 final String viewClassName = ClienteSessionRemote.class.getName();
 String jndiCompleteName = "ejb:" + appName + "/" + moduleName + "/" + beanName 
+ "!" + viewClassName;
 
 System.out.println("lockup: " + jndiCompleteName);
 
 return (ClienteSessionRemote) context.lookup(jndiCompleteName);
 }
}