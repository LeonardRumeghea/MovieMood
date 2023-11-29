package com.example.movie.aspect;

import com.example.movie.model.AbstractEntity;
import com.example.movie.model.Movie;
import com.example.movie.repository.Repository;

import java.time.Duration;
import java.time.LocalTime;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;

public aspect ReadAspect {
    Logger logger = Logger.getLogger("LoggerName");
    static String movieTitle = "Barbie";
    static String actorName;
    static String directorName;
    static int counter = 0;
    pointcut callRead(String toFind, Repository<AbstractEntity<UUID>, UUID> repo): call(public *Repository.List<*> findBy*(*) && args(toFind) && target(repo));

    before(String toFind, Repository<AbstractEntity<Long>, Long> repo): callRead(entity, repo) {
        if (toFind.contains(movieTitle)) {
            counter++;
            logger.log(Level.INFO, "Before operation");
        }
        else {
            logger.log(Level.INFO, "Before operation");
        }
    }

    after(AbstractEntity<UUID> entity, Repository<AbstractEntity<Long>, Long> repo): callRead(toSearch, repo) {
        logger.log(Level.INFO, "After operation");
    }
}
