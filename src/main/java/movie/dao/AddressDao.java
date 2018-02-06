package movie.dao;

import java.util.List;

import movie.dto.Address;

public interface AddressDao {
	public List<Address> selectAll();
}
