package com.example.DoAn.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.DoAn.domain.ProvinceMarker;

@Repository
public interface ProvinceMarkerRepository extends JpaRepository<ProvinceMarker, Long> {
    List<ProvinceMarker> findByProvince_IdOrderByIdAsc(Long provinceId);
}
