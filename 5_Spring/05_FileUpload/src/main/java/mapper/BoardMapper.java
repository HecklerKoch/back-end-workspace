package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kh.upload.model.vo.Board;
import com.kh.upload.model.vo.Paging;

@Mapper
public interface BoardMapper {
	
	public void insert(Board vo);
	public List<Board> selectAll(Paging paging);
	public int total();
	public Board select(int no);
	public void update(Board vo);
	public void delete(int no);
}
