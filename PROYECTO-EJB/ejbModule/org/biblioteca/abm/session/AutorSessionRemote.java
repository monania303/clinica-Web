package org.biblioteca.abm.session;

import java.util.List;
import javax.ejb.Remote;
import org.biblioteca.entidad.Autor;

@Remote
public interface AutorSessionRemote {
	List<Autor> buscarTodos() throws Exception;

	Autor buscarPorCodigo(Integer codigo) throws Exception;
	
	List<Autor> buscarPorNombre(String nombre) throws Exception;

	Autor actualizar(Autor autor) throws Exception;

	void eliminar(Integer codigo) throws Exception;
}