package com.example.DoAn.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.DoAn.domain.Categories;
import java.util.List;

@Repository
public interface CategoriesRepository extends JpaRepository<Categories, Long> {
    Categories save(Categories categories);

    Page<Categories> findAll(Pageable page);

    List<Categories> findAll();

    Categories findByName(String name);

    Categories findById(long id);

    void deleteById(long id);

}
