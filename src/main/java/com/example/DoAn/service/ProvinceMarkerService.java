package com.example.DoAn.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.DoAn.domain.ProvinceMarker;
import com.example.DoAn.repository.ProvinceMarkerRepository;

@Service
public class ProvinceMarkerService {
    private final ProvinceMarkerRepository provinceMarkerRepository;

    public ProvinceMarkerService(ProvinceMarkerRepository provinceMarkerRepository) {
        this.provinceMarkerRepository = provinceMarkerRepository;
    }

    public List<ProvinceMarker> getMarkersByProvinceId(Long provinceId) {
        if (provinceId == null) {
            return List.of();
        }
        return this.provinceMarkerRepository.findByProvince_IdOrderByIdAsc(provinceId);
    }

    public ProvinceMarker saveMarker(ProvinceMarker marker) {
        return this.provinceMarkerRepository.save(marker);
    }
}
