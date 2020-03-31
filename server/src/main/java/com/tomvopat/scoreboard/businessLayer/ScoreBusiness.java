package com.tomvopat.scoreboard.businessLayer;

import com.tomvopat.scoreboard.dataLayer.entities.ScoreEntity;
import com.tomvopat.scoreboard.dataLayer.repository.ScoreRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class ScoreBusiness {

    @Autowired
    ScoreRepository scoreRepository;

    public List<ScoreEntity> findAll() {
        Iterable<ScoreEntity> scoreEntityIterable = scoreRepository.findAll();
        List<ScoreEntity> scoreEntities = new ArrayList<>();
        scoreEntityIterable.forEach(scoreEntities::add);
        return scoreEntities;
    }

    public ScoreEntity findOne(Long id) {
        if (id == null) return null;
        Optional<ScoreEntity> scoreEntity = scoreRepository.findById(id);
        return scoreEntity.orElse(null);
    }

    /**
     * Updates if there is an existing object, otherwise creates a new one
     *
     * @param scoreEntity
     * @return null if the it's not possible to create or update the object
     */
    public ScoreEntity update(ScoreEntity scoreEntity) {
        if (scoreEntity.getName() == null ||
                scoreEntity.getName().isEmpty() ||
                scoreEntity.getScore() < 0) return null;
        return scoreRepository.save(scoreEntity);
    }

    public boolean remove(Long id) {
        if (id == null) return false;
        if (!scoreRepository.existsById(id)) return false;
        scoreRepository.deleteById(id);
        return true;
    }
}
