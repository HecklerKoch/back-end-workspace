package com.semi.youtube.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor
public class Video {
	private int videoCode; // video_code
	private String videoUrl;
	private String videoImg;
	private String videoTitle;
	private int videoCount;
	private Date videoDate;
	private String videoDesc;
//	private int ChannelCode; // channel
	private Channel channel;
}
