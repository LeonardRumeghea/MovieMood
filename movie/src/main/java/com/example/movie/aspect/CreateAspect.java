package com.example.movie.aspect;

import com.example.movie.model.AbstractEntity;
import com.example.movie.model.Movie;
import com.example.movie.repository.Repository;
import jakarta.interceptor.AroundInvoke;
import jakarta.interceptor.Interceptor;
import jakarta.interceptor.InvocationContext;

import java.time.Duration;
import java.time.LocalTime;
import java.util.Timer;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;

@Interceptor
@MyAspect
public class CreateAspect {
    Logger logger = Logger.getLogger("LoggerName");
    LocalTime initTime;
//    pointcut callCreate(AbstractEntity<UUID> entity, Repository<AbstractEntity<UUID>, UUID> repo): call(public *Repository.List<*> create(*) && args(entity) && target(repo));
//
//    before(AbstractEntity<UUID> entity, Repository<AbstractEntity<Long>, Long> repo): callCreate(entity, repo) {
//        initTime = LocalTime.now();
//        if (entity instanceof Movie) {
//            logger.log(Level.INFO, "A new movie is inserting into the database: " + entity.toString());
//        }
//        else {
//            logger.log(Level.INFO, "A new object is inserting into the database: " + entity.toString());
//        }
//    }
//
//    after(AbstractEntity<UUID> entity, Repository<AbstractEntity<Long>, Long> repo): callCreate(toSearch, repo) {
//        Duration duration = Duration.between(LocalTime.now(), initTime);
//        logger.log(Level.INFO, "A new object was inserting into the database: " + entity.toString() + " and it took " + duration.toSeconds() + " seconds.");
//    }

    @AroundInvoke
    public Object logMethodEntry(InvocationContext invocationContext) throws Exception {
        initTime = LocalTime.now();
        if (invocationContext.getMethod().getName().equals("create")) {
            if (invocationContext.getMethod().getDeclaringClass().getName().equals("Movie")) {
                logger.log(Level.INFO, "A new movie is inserting into the database: " + invocationContext.getParameters()[0].toString());
                logger.info("Was called method: "
                        + invocationContext.getMethod().getName() + " in class "
                        + invocationContext.getMethod().getDeclaringClass().getName());
            }
            else {
                logger.log(Level.INFO, "A new object is inserting into the database: " + invocationContext.getParameters()[0].toString());
                logger.info("Was called method: "
                        + invocationContext.getMethod().getName() + " in class "
                        + invocationContext.getMethod().getDeclaringClass().getName());

            }
        }

        return invocationContext.proceed();
    }
}
