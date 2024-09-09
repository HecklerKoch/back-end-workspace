package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kh.movie.model.vo.Movie;

@Mapper
public interface MovieMapper {
	
	//접근제어자 리턴타입 메서드명(파라미터);
	
	public void add(Movie vo);
	
	public List<Movie> query();	

}