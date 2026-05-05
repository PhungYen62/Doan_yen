package com.example.DoAn.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.DoAn.domain.Province;

@Repository
public interface ProvinceRepository extends JpaRepository<Province, Long> {
    Page<Province> findAll(Pageable pageable);

    List<Province> findAllByOrderByNameAsc();

    Optional<Province> findByNameIgnoreCase(String name);

    Optional<Province> findByCode(String code);

    Optional<Province> findByGeojsonId(String geojsonId);
}
