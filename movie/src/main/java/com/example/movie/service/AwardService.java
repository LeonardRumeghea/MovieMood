package com.example.movie.service;

import com.example.movie.model.Award;
import com.example.movie.repository.AwardRepository;
import jakarta.ejb.Stateless;
import jakarta.inject.Inject;

import java.util.Date;
import java.util.List;
import java.util.UUID;

@Stateless
public class AwardService {
@Inject
    private AwardRepository awardRepository;

    public void createAward(Award award) {
        awardRepository.create(award);
    }

    public Award findAwardById(UUID id) {
        return awardRepository.findById(id);
    }

    public List<Award> findAwardsByTitle(String title) {
        return awardRepository.findByTitle(title);
    }

    public List<Award> findAllAwards() {
        return awardRepository.findAll();
    }

    public void deleteAward(UUID awardId) {
        Award award = awardRepository.findById(awardId);
        awardRepository.delete(award);
    }

    public void updateAward(UUID awardId, String title, Date date) {
        Award award = awardRepository.findById(awardId);
        if (title != null) {
            award.setTitle(title);
        }
        if (date != null) {
            award.setDate(date);
        }
        awardRepository.create(award);
    }
}