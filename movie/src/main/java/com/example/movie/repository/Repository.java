package com.example.movie.repository;

import com.example.movie.aspect.MyAspect;
import com.example.movie.model.AbstractEntity;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

import java.io.Serializable;
import java.util.List;

public abstract class Repository<T extends AbstractEntity<ID>, ID extends Serializable> {
    protected Class<T> entityClass;
    @PersistenceContext
    protected EntityManager entityManager;

    public Repository(Class<T> entityClass) {
        this.entityClass = entityClass;
    }

    @MyAspect
    public void create(T entity) {
        entityManager.persist(entity);
    }

    @MyAspect
    public T findById(ID id) {
        if (id == null) {
            return null;
        }
        return entityManager.find(entityClass, id);
    }

    @MyAspect
    public void update(T entity) {
        entityManager.merge(entity);
    }

    @MyAspect
    public void delete(T entity) {
        if (!entityManager.contains(entity)) {
            entity = entityManager.merge(entity);
        }
        entityManager.remove(entity);
    }

    @MyAspect
    public List<T> findAll() {
        return entityManager.createNamedQuery(entityClass.getSimpleName() + ".findAll", entityClass).getResultList();
    }

    public T refresh(T entity) {
        if (!entityManager.contains(entity)) {
            entity = entityManager.merge(entity);
        }
        entityManager.refresh(entity);
        return entity;
    }

    public void clearCache() {
        entityManager.getEntityManagerFactory().getCache().evictAll();
    }
}
