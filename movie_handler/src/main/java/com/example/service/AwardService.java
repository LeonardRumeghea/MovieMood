package com.example.service;

import com.example.model.Award;
import com.example.repository.AwardRepository;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service
public class AwardService {

    private final AwardRepository awardRepository;

    public AwardService(AwardRepository awardRepository) {
        this.awardRepository = awardRepository;
    }

    public void createAward(Award award) {
        awardRepository.save(award);
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
        awardRepository.save(award);
    }
}