package com.example.demo.service;

import com.example.demo.model.entity.Like;
import com.example.demo.repository.LikeRepository;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
@Transactional
public class LikeService implements GenericInterface<Like>{
    private final LikeRepository repo;
    @Override
    public List<Like> findAll() {
        return (List<Like>) repo.findAll();
    }
    @Override
    public Optional<Like> findById(int id) {
        return  repo.findById(id);
    }
    @Transactional(rollbackOn = Exception.class)
    public Like save(Like like){
        return repo.save(like);
    }
    public void saveAll(List<Like> likes){
        repo.saveAll(likes);
    }
    @Override
    public void deleteById(int id) {
        repo.deleteById(id);
    }
}
