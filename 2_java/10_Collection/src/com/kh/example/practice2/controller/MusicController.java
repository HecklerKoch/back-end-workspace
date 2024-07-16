package com.kh.example.practice2.controller;

import java.util.ArrayList;
import java.util.Collections;

import com.kh.example.practice2.compare.ArtistDescending;
import com.kh.example.practice2.compare.SongAscending;
import com.kh.example.practice2.model.Music;

public class MusicController {
	
	private ArrayList<Music> list = new ArrayList<>();

	//1. 마지막위치에곡추가
	public boolean addLastList(Music music) {
		if(!music.getArtist().equals("") && !music.getSong().equals("")) {	
		 return	list.add(music);
		}
		return false;
	}
	//2. 첫위치에곡추가
	public boolean addFirstList(Music music) {
		if(!music.getArtist().equals("") && !music.getSong().equals("")) {
		list.add(0, music);
		return true;
	}
		return false;
	}
	//3. 전체곡목록출력
	public ArrayList<Music> printAll() {
		return list;
	}
	//4. 특정곡검색
	public Music searchMusic(String song) {
		for(Music music : list) {
			if(music.getSong().contains(song)) {
				return music;
			}
		}
		return null;
	}
	//5. 특정곡삭제
	public Music delMusic(String song) {
		for(Music music : list) {
			if(music.getSong().equals(song)) {
				return list.remove(list.indexOf(music));
			}
		}
		return null;
	}


	//6. 특정곡수정
	public Music updateMusic(String search, Music update) {
		for(Music music : list) {
			if(music.getSong().equals(search)) {
				return list.set(list.indexOf(music), update);
			}
		}
		return null;
	}
	//7. 가수명내림차순정렬
	public ArrayList<Music> descArtist() {
		ArrayList<Music> cloneList = (ArrayList<Music>) list.clone();
		Collections.sort(cloneList, new ArtistDescending());
		return cloneList;
	}
	//8. 곡명오름차순정렬
	public ArrayList<Music> ascMusic() {
		ArrayList<Music> cloneList = (ArrayList<Music>) list.clone();
		Collections.sort(cloneList, new SongAscending());
		return cloneList;
	}
}
