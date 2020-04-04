package com.tomvopat.scoreboard.controller;

import com.tomvopat.scoreboard.businessLayer.ScoreBusiness;
import com.tomvopat.scoreboard.dataLayer.entities.ScoreEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@CrossOrigin(origins = "*")
@RequestMapping(path = "/score")
public class ScoreController {

    @Autowired
    private ScoreBusiness scoreBusiness;

    @GetMapping
    public @ResponseBody
    ResponseEntity findAll() {
        return ResponseEntity.ok(scoreBusiness.findAll());
    }

    @GetMapping(path = "/find ")
    public ResponseEntity findOne(@RequestParam(name = "id") Long id) {
        ScoreEntity scoreEntity = scoreBusiness.findOne(id);
        if (scoreEntity == null) return ResponseEntity.badRequest().body(null);
        return ResponseEntity.ok(scoreEntity);
    }

    @PostMapping
    public @ResponseBody
    ResponseEntity update(@RequestBody ScoreEntity scoreEntity) {
        ScoreEntity result = scoreBusiness.update(scoreEntity);
        if (result == null) {
            return ResponseEntity.badRequest().body(null);
        }
        return ResponseEntity.ok(result);
    }

    @PostMapping(path = "/remove")
    public ResponseEntity remove(@RequestParam(name = "id") Long id) {
        if (!scoreBusiness.remove(id)) {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(null);
    }

}
