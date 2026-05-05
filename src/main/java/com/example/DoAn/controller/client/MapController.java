package com.example.DoAn.controller.client;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.DoAn.domain.Product;
import com.example.DoAn.domain.Province;
import com.example.DoAn.domain.ProvinceMarker;
import com.example.DoAn.service.ProvinceMarkerService;
import com.example.DoAn.service.ProvinceService;
import com.google.gson.Gson;

@Controller
public class MapController {
    private final ProvinceService provinceService;
    private final ProvinceMarkerService provinceMarkerService;
    private final Gson gson = new Gson();

    public MapController(ProvinceService provinceService, ProvinceMarkerService provinceMarkerService) {
        this.provinceService = provinceService;
        this.provinceMarkerService = provinceMarkerService;
    }

    @GetMapping("/map")
    public String getMapPage(Model model) {
        List<Province> provinces = this.provinceService.getAllProvinces();
        Map<String, Object> provinceData = new HashMap<>();

        for (Province province : provinces) {
            if (province.getGeojsonId() == null || province.getGeojsonId().isBlank()) {
                continue;
            }

            Map<String, Object> provinceInfo = new HashMap<>();
            provinceInfo.put("id", province.getId());
            provinceInfo.put("code", province.getCode());
            provinceInfo.put("name", province.getName());
            provinceInfo.put("geojsonId", province.getGeojsonId());
            provinceInfo.put("products", buildProductPayload(this.provinceService.getProductsByProvinceId(province.getId())));
            provinceInfo.put("markers", buildMarkerPayload(this.provinceMarkerService.getMarkersByProvinceId(province.getId())));
            provinceData.put(province.getGeojsonId(), provinceInfo);
        }

        model.addAttribute("activePage", "map");
        model.addAttribute("provinceDataJson", this.gson.toJson(provinceData));
        return "client/map/show";
    }

    private List<Map<String, Object>> buildProductPayload(List<Product> products) {
        List<Map<String, Object>> payload = new ArrayList<>();
        for (Product product : products) {
            Map<String, Object> item = new HashMap<>();
            item.put("id", product.getId());
            item.put("name", product.getName());
            item.put("shortDesc", product.getShortDesc());
            item.put("image", product.getFirstImage());
            item.put("price", product.getPrice());
            item.put("salePrice", product.getSalePrice());
            payload.add(item);
        }
        return payload;
    }

    private List<Map<String, Object>> buildMarkerPayload(List<ProvinceMarker> markers) {
        List<Map<String, Object>> payload = new ArrayList<>();
        for (ProvinceMarker marker : markers) {
            Map<String, Object> item = new HashMap<>();
            item.put("id", marker.getId());
            item.put("title", marker.getTitle());
            item.put("description", marker.getDescription());
            item.put("latitude", marker.getLatitude());
            item.put("longitude", marker.getLongitude());
            item.put("color", marker.getColor());
            payload.add(item);
        }
        return payload;
    }
}
