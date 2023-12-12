package com.example.movie.aspect;

import com.example.movie.model.AbstractEntity;
import com.example.movie.model.Movie;
import com.example.movie.repository.Repository;
import jakarta.interceptor.AroundInvoke;
import jakarta.interceptor.Interceptor;
import jakarta.interceptor.InvocationContext;

import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;

@Interceptor
@MyAspect
public class DeleteAspect {
    Logger logger = Logger.getLogger("LoggerName");
//    pointcut callDelete(AbstractEntity<UUID> entity, Repository<AbstractEntity<UUID>, UUID> repo): call(public *Repository.List<*> findBy*(*) && args(entity) && target(repo));
//
//    before(AbstractEntity<UUID> entity, Repository<AbstractEntity<Long>, Long> repo): callDelete(entity, repo) {
//        if (entity instanceof Movie) {
//            // notify director
//
//            logger.log(Level.INFO, "Before operation");
//        }
//        else {
//            logger.log(Level.INFO, "Before operation");
//        }
//    }
//
//    after(AbstractEntity<UUID> entity, Repository<AbstractEntity<Long>, Long> repo): callDelete(toSearch, repo) {
//        logger.log(Level.INFO, "After operation");
//    }

    @AroundInvoke
    public Object logMethodEntry(InvocationContext invocationContext) throws Exception {
        if (invocationContext.getMethod().getName().equals("delete")) {
            logger.info("Before operation");
            logger.info("Was called method: "
                    + invocationContext.getMethod().getName() + " in class "
                    + invocationContext.getMethod().getDeclaringClass().getName());
            logger.info("After operation");
        }
        return invocationContext.proceed();
    }
}
