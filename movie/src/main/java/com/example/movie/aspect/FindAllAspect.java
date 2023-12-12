package com.example.movie.aspect;

import jakarta.interceptor.AroundInvoke;
import jakarta.interceptor.Interceptor;
import jakarta.interceptor.InvocationContext;

import java.util.logging.Logger;

@Interceptor
@MyAspect
public class FindAllAspect {
    Logger logger = Logger.getLogger("LoggerName");

//    pointcut callReadFindAll(Repository<AbstractEntity<UUID>, UUID> repo): call(public *Repository.List<*> findAll() && target(repo));
//
//    before(Repository<AbstractEntity<Long>, Long> repo): callReadFindAll(repo) {
//        logger.log(Level.INFO, "Before operation");
//    }
//
//    after(Repository<AbstractEntity<Long>, Long> repo): callReadFindAll(repo) {
//        logger.log(Level.INFO, "After operation");
//    }

    @AroundInvoke
    public Object logMethodEntry(InvocationContext invocationContext) throws Exception {
        if (invocationContext.getMethod().getName().equals("findAll")) {
            logger.info("Before operation");
            logger.info("Was called method: "
                    + invocationContext.getMethod().getName() + " in class "
                    + invocationContext.getMethod().getDeclaringClass().getName());
            logger.info("After operation");
        }
        return invocationContext.proceed();
    }
}
