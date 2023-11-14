package com.example.controller;

import com.example.model.Award;
import com.example.service.AwardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping(path = "api/v1/award")
public class AwardController {

    private final AwardService awardService;

    @Autowired
    public AwardController(AwardService awardService) {
        this.awardService = awardService;
    }

    @GetMapping
    public List<Award> getAwards() {
        return awardService.findAllAwards();
    }

    @PostMapping
    public void addNewAward(@RequestBody Award award) {
        awardService.createAward(award);
    }

    @DeleteMapping(path = "{awardId}")
    public void deleteAward(@PathVariable("awardId") UUID awardId) {
        awardService.deleteAward(awardId);
    }

    @PutMapping(path = "{awardId}")
    public void updateAward(@PathVariable("awardId") UUID awardId, @RequestParam(required = false) String title, @RequestParam(required = false) Date date) {
        awardService.updateAward(awardId, title, date);
    }
}
