package com.example.demo.service;

import com.example.demo.model.entity.Like;
import com.example.demo.model.entity.Post;
import com.example.demo.repository.LikeRepository;
import com.example.demo.repository.PostRepository;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Service
@RequiredArgsConstructor
@Transactional
public class PostService implements GenericInterface<Post>{
    private final PostRepository repo;
    private final LikeRepository likeRepository;
    @Override
    public List<Post> findAll() {
        return (List<Post>) repo.findAll();
    }
    @Override
    public Optional<Post> findById(int id) {
        return  repo.findById(id);
    }
    @Transactional(rollbackOn = Exception.class)
    public Post save(Post post){
        return repo.save(post);
    }
    public void saveAll(List<Post> likes){
        repo.saveAll(likes);
    }
    @Override
    public void deleteById(int id) {
        repo.deleteById(id);
    }

    public List<Post> findAllByUserID(int user_id,int post_id){
        return repo.findAllByUserID(user_id,post_id);
    }

    public List<Post> findAll(Pageable pageable) {
        return  repo.findAllByPage(pageable);
    }

    public Map<String,Object> findById(int user_id, int post_id){
        Post post = findById(post_id).get();
        Like like = likeRepository.isLikePost(post_id,user_id);
        Map<String, Object> result = new HashMap<>();
        result.put("post", post);
        if (like!=null){
            result.put("isLike", true);
            result.put("id_like", like.getId());
        } else {
            result.put("isLike", false);
            result.put("like_id", -1);
        }
        return  result;
    }
}
