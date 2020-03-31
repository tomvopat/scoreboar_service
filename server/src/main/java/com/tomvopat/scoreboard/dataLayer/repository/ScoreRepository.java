package com.tomvopat.scoreboard.dataLayer.repository;

import com.tomvopat.scoreboard.dataLayer.entities.ScoreEntity;
import org.springframework.data.repository.CrudRepository;

public interface ScoreRepository extends CrudRepository<ScoreEntity, Long> {

}
