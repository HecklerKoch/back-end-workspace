package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kh.mybatis.model.vo.Client;

@Mapper
public interface MemberMapper {
	void register(Client client);
	List<Client> allClient();
	Client login(Client client);
	
}
