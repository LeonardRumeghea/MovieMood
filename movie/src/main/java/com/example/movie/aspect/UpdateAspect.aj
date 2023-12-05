package com.example.movie.aspect;

import com.example.movie.model.*;
import com.example.movie.repository.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;

public aspect UpdateAspect {
    Logger logger = Logger.getLogger("LoggerName");
    private Map<String, Integer> counters = new HashMap<>();
    pointcut callUpdate(AbstractEntity<UUID> entity, Repository<AbstractEntity<UUID>, UUID> repo): call(public *Repository.List<*> refresh(*) && args(entity) && target(repo));

    before(AbstractEntity<UUID> entity, Repository<AbstractEntity<Long>, Long> repo): callUpdate(entity, repo) {
        if (entity instanceof Movie) {
            logger.log(Level.INFO, "Before operation");
            counters.put("Movie", counters.getOrDefault("Movie", 0) + 1);
        }
        else if (entity instanceof Actor) {
            counters.put("Movie", counters.getOrDefault("Actor", 0) + 1);
            logger.log(Level.INFO, "Before operation");
        }
        else if (entity instanceof Director) {
            counters.put("Movie", counters.getOrDefault("Director", 0) + 1);
            logger.log(Level.INFO, "Before operation");
        }
        else if (entity instanceof Award) {
            counters.put("Movie", counters.getOrDefault("Award", 0) + 1);
            logger.log(Level.INFO, "Before operation");
        }
    }

    after(AbstractEntity<UUID> entity, Repository<AbstractEntity<Long>, Long> repo): callUpdate(toSearch, repo) {
        logger.log(Level.INFO, "After operation");
    }
}
