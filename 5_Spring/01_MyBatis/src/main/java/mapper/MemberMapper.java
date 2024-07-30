package mapper;

import org.apache.ibatis.annotations.Mapper;

import com.kh.mybatis.model.vo.Client;

@Mapper
public interface MemberMapper {
	void register(Client client);
}
