package com.example.movie.aspect;

import com.example.movie.model.*;
import com.example.movie.repository.Repository;
import jakarta.interceptor.AroundInvoke;
import jakarta.interceptor.Interceptor;
import jakarta.interceptor.InvocationContext;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;

@Interceptor
@MyAspect
public class UpdateAspect {
    Logger logger = Logger.getLogger("LoggerName");
    private Map<String, Integer> counters = new HashMap<>();
//    pointcut callUpdate(AbstractEntity<UUID> entity, Repository<AbstractEntity<UUID>, UUID> repo): call(public *Repository.List<*> refresh(*) && args(entity) && target(repo));
//
//    before(AbstractEntity<UUID> entity, Repository<AbstractEntity<Long>, Long> repo): callUpdate(entity, repo) {
//        if (entity instanceof Movie) {
//            logger.log(Level.INFO, "Before operation");
//            counters.put("Movie", counters.getOrDefault("Movie", 0) + 1);
//        }
//        else if (entity instanceof Actor) {
//            counters.put("Movie", counters.getOrDefault("Actor", 0) + 1);
//            logger.log(Level.INFO, "Before operation");
//        }
//        else if (entity instanceof Director) {
//            counters.put("Movie", counters.getOrDefault("Director", 0) + 1);
//            logger.log(Level.INFO, "Before operation");
//        }
//        else if (entity instanceof Award) {
//            counters.put("Movie", counters.getOrDefault("Award", 0) + 1);
//            logger.log(Level.INFO, "Before operation");
//        }
//    }
//
//    after(AbstractEntity<UUID> entity, Repository<AbstractEntity<Long>, Long> repo): callUpdate(toSearch, repo) {
//        logger.log(Level.INFO, "After operation");
//    }

    @AroundInvoke
    public Object logMethodEntry(InvocationContext invocationContext) throws Exception {
        if (invocationContext.getMethod().getName().equals("update")) {
            logger.info("Before operation");

            if (invocationContext.getParameters()[0] instanceof Actor) {
                counters.put("Actor", counters.getOrDefault("Actor", 0) + 1);
                logger.log(Level.INFO, "Actor modified");
            }
            else if (invocationContext.getParameters()[0] instanceof Director) {
                counters.put("Director", counters.getOrDefault("Director", 0) + 1);
                logger.log(Level.INFO, "Director modified");
            }
            else if (invocationContext.getParameters()[0] instanceof Award) {
                counters.put("Award", counters.getOrDefault("Award", 0) + 1);
                logger.log(Level.INFO, "Award modified");
            }
            else if (invocationContext.getParameters()[0] instanceof Movie) {
                counters.put("Movie", counters.getOrDefault("Movie", 0) + 1);
                logger.log(Level.INFO, "Movie modified");
            }

            logger.info("Was called method: "
                    + invocationContext.getMethod().getName() + " in class "
                    + invocationContext.getMethod().getDeclaringClass().getName());
            logger.info("After operation");
        }

        return invocationContext.proceed();
    }
}
