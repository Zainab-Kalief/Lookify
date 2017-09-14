package com.wura.lookify.services;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import org.springframework.stereotype.Service;

import com.wura.lookify.models.Lookify;
import com.wura.lookify.repositories.LookifyRepository;

@Service
public class LookifyService {
	private LookifyRepository lookifyRepository;
	public LookifyService(LookifyRepository lookifyRepository) {
		this.lookifyRepository = lookifyRepository;
	}
	public List<Lookify> all() {
		return (List<Lookify>) lookifyRepository.findAll();
	}
	public void add(Lookify lookify) {
		lookifyRepository.save(lookify);
	}
	public void delete(Long id) {
		lookifyRepository.delete(id);
	}
	public Lookify find(Long id) {
		return lookifyRepository.findOne(id);
	}
	public List<Lookify> findByArtist(String search) {
		List<Lookify> result = new ArrayList<Lookify>();
		for(Lookify song:lookifyRepository.findAll()) {
			if(song.getArtist().equals(search)) {
				result.add(song);
			}
		}
		return result;
	}
	public List<Lookify> findTopFive() {
		List<Lookify> result = new ArrayList<Lookify>();
		result = (List<Lookify>) lookifyRepository.findAll();
		Collections.sort(result, new Comparator<Lookify>() {
			@Override
			public int compare(Lookify one, Lookify two) {
				return two.getRating().compareTo(one.getRating());
			}
		});
		return result;
	}
	
}
