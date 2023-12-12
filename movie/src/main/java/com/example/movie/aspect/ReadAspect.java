package com.example.movie.aspect;

import com.example.movie.model.AbstractEntity;
import com.example.movie.model.Movie;
import com.example.movie.repository.Repository;
import jakarta.interceptor.AroundInvoke;
import jakarta.interceptor.Interceptor;
import jakarta.interceptor.InvocationContext;

import java.time.Duration;
import java.time.LocalTime;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;

@Interceptor
@MyAspect
public class ReadAspect {
    Logger logger = Logger.getLogger("LoggerName");
    static String movieTitle = "Barbie";
    static String actorName;
    static String directorName;
    static int counter = 0;
//    pointcut callRead(String toFind, Repository<AbstractEntity<UUID>, UUID> repo): call(public *Repository.List<*> findBy*(*) && args(toFind) && target(repo));
//
//    before(String toFind, Repository<AbstractEntity<Long>, Long> repo): callRead(toSearch, repo) {
//        if (toFind.contains(movieTitle)) {
//            counter++;
//            logger.log(Level.INFO, "Before operation");
//        }
//        else {
//            logger.log(Level.INFO, "Before operation");
//        }
//    }
//
//    after(AbstractEntity<UUID> entity, Repository<AbstractEntity<Long>, Long> repo): callRead(toSearch, repo) {
//        logger.log(Level.INFO, "After operation");
//    }

    @AroundInvoke
    public Object logMethodEntry(InvocationContext invocationContext) throws Exception {
        if (invocationContext.getMethod().getName().startsWith("findBy")) {
            logger.info("Before operation");

            if (invocationContext.getMethod().getName().equals("findByTitle")) {
                movieTitle = invocationContext.getParameters()[0].toString();
                logger.log(Level.INFO, "A movie with title " + movieTitle + " is searching in the database.");
            }
            else if (invocationContext.getMethod().getName().equals("findByFirstName")) {
                actorName = invocationContext.getParameters()[0].toString();
                logger.log(Level.INFO, "An actor or a director with name " + actorName + " is searching in the database.");
            }
            else {
                logger.log(Level.INFO, "An object is searching in the database.");
            }

            logger.info("Was called method: "
                    + invocationContext.getMethod().getName() + " in class "
                    + invocationContext.getMethod().getDeclaringClass().getName());

            logger.info("After operation");
        }
        return invocationContext.proceed();
    }
}
