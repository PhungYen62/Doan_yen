-- Run these DDL statements once. If geojson_id or the unique key already exists,
-- skip the corresponding statement manually.
ALTER TABLE provinces
ADD COLUMN geojson_id VARCHAR(20) NULL;

ALTER TABLE provinces
ADD UNIQUE KEY uk_provinces_geojson_id (geojson_id);

CREATE TABLE IF NOT EXISTS province_markers (
  id BIGINT NOT NULL AUTO_INCREMENT,
  province_id BIGINT NOT NULL,
  title VARCHAR(255) NOT NULL,
  description VARCHAR(500) NULL,
  latitude DECIMAL(10,7) NOT NULL,
  longitude DECIMAL(10,7) NOT NULL,
  color VARCHAR(20) NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_province_markers_province
    FOREIGN KEY (province_id) REFERENCES provinces(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

SET SQL_SAFE_UPDATES = 0;

-- Map provinces in DB to feature.properties.id in vietnam-provinces.json
UPDATE provinces SET geojson_id = 'VN44' WHERE id = 66;   -- An Giang
UPDATE provinces SET geojson_id = 'VN43' WHERE id = 67;   -- Bà Rịa - Vũng Tàu
UPDATE provinces SET geojson_id = 'VN54' WHERE id = 68;   -- Bắc Giang
UPDATE provinces SET geojson_id = 'VN53' WHERE id = 69;   -- Bắc Kạn
UPDATE provinces SET geojson_id = 'VN55' WHERE id = 70;   -- Bạc Liêu
UPDATE provinces SET geojson_id = 'VN56' WHERE id = 71;   -- Bắc Ninh
UPDATE provinces SET geojson_id = 'VN50' WHERE id = 72;   -- Bến Tre
UPDATE provinces SET geojson_id = 'VN31' WHERE id = 73;   -- Bình Định
UPDATE provinces SET geojson_id = 'VN57' WHERE id = 74;   -- Bình Dương
UPDATE provinces SET geojson_id = 'VN58' WHERE id = 75;   -- Bình Phước
UPDATE provinces SET geojson_id = 'VN40' WHERE id = 76;   -- Bình Thuận
UPDATE provinces SET geojson_id = 'VN59' WHERE id = 77;   -- Cà Mau
UPDATE provinces SET geojson_id = 'VNCT' WHERE id = 78;   -- Cần Thơ
UPDATE provinces SET geojson_id = 'VN04' WHERE id = 79;   -- Cao Bằng
UPDATE provinces SET geojson_id = 'VNDN' WHERE id = 80;   -- Đà Nẵng
UPDATE provinces SET geojson_id = 'VN33' WHERE id = 81;   -- Đắk Lắk
UPDATE provinces SET geojson_id = 'VN72' WHERE id = 82;   -- Đắk Nông
UPDATE provinces SET geojson_id = 'VN71' WHERE id = 83;   -- Điện Biên
UPDATE provinces SET geojson_id = 'VN39' WHERE id = 84;   -- Đồng Nai
UPDATE provinces SET geojson_id = 'VN46' WHERE id = 85;   -- Đồng Tháp
UPDATE provinces SET geojson_id = 'VN30' WHERE id = 86;   -- Gia Lai
UPDATE provinces SET geojson_id = 'VN03' WHERE id = 87;   -- Hà Giang
UPDATE provinces SET geojson_id = 'VN63' WHERE id = 88;   -- Hà Nam
UPDATE provinces SET geojson_id = 'VNHN' WHERE id = 89;   -- Hà Nội
UPDATE provinces SET geojson_id = 'VN23' WHERE id = 90;   -- Hà Tĩnh
UPDATE provinces SET geojson_id = 'VN61' WHERE id = 91;   -- Hải Dương
UPDATE provinces SET geojson_id = 'VNHP' WHERE id = 92;   -- Hải Phòng
UPDATE provinces SET geojson_id = 'VN73' WHERE id = 93;   -- Hậu Giang
UPDATE provinces SET geojson_id = 'VNSG' WHERE id = 94;   -- TP. Hồ Chí Minh
UPDATE provinces SET geojson_id = 'VN14' WHERE id = 95;   -- Hòa Bình
UPDATE provinces SET geojson_id = NULL   WHERE id = 96;   -- Hưng Yên: not found in current GeoJSON file
UPDATE provinces SET geojson_id = 'VN34' WHERE id = 97;   -- Khánh Hòa
UPDATE provinces SET geojson_id = 'VN47' WHERE id = 98;   -- Kiên Giang
UPDATE provinces SET geojson_id = 'VN28' WHERE id = 99;   -- Kon Tum
UPDATE provinces SET geojson_id = 'VN01' WHERE id = 100;  -- Lai Châu
UPDATE provinces SET geojson_id = 'VN35' WHERE id = 101;  -- Lâm Đồng
UPDATE provinces SET geojson_id = 'VN09' WHERE id = 102;  -- Lạng Sơn
UPDATE provinces SET geojson_id = 'VN02' WHERE id = 103;  -- Lào Cai
UPDATE provinces SET geojson_id = 'VN41' WHERE id = 104;  -- Long An
UPDATE provinces SET geojson_id = 'VN67' WHERE id = 105;  -- Nam Định
UPDATE provinces SET geojson_id = 'VN22' WHERE id = 106;  -- Nghệ An
UPDATE provinces SET geojson_id = 'VN18' WHERE id = 107;  -- Ninh Bình
UPDATE provinces SET geojson_id = 'VN36' WHERE id = 108;  -- Ninh Thuận
UPDATE provinces SET geojson_id = 'VN68' WHERE id = 109;  -- Phú Thọ
UPDATE provinces SET geojson_id = 'VN32' WHERE id = 110;  -- Phú Yên
UPDATE provinces SET geojson_id = 'VN24' WHERE id = 111;  -- Quảng Bình
UPDATE provinces SET geojson_id = 'VN27' WHERE id = 112;  -- Quảng Nam
UPDATE provinces SET geojson_id = 'VN29' WHERE id = 113;  -- Quảng Ngãi
UPDATE provinces SET geojson_id = 'VN13' WHERE id = 114;  -- Quảng Ninh
UPDATE provinces SET geojson_id = 'VN25' WHERE id = 115;  -- Quảng Trị
UPDATE provinces SET geojson_id = 'VN52' WHERE id = 116;  -- Sóc Trăng
UPDATE provinces SET geojson_id = 'VN05' WHERE id = 117;  -- Sơn La
UPDATE provinces SET geojson_id = 'VN37' WHERE id = 118;  -- Tây Ninh
UPDATE provinces SET geojson_id = 'VN69' WHERE id = 119;  -- Thái Nguyên
UPDATE provinces SET geojson_id = 'VN21' WHERE id = 120;  -- Thanh Hóa
UPDATE provinces SET geojson_id = 'VN26' WHERE id = 121;  -- Thừa Thiên - Huế
UPDATE provinces SET geojson_id = 'VN46' WHERE id = 122;  -- Tiền Giang
UPDATE provinces SET geojson_id = 'VN51' WHERE id = 123;  -- Trà Vinh
UPDATE provinces SET geojson_id = 'VN07' WHERE id = 124;  -- Tuyên Quang
UPDATE provinces SET geojson_id = 'VN49' WHERE id = 125;  -- Vĩnh Long
UPDATE provinces SET geojson_id = 'VN70' WHERE id = 126;  -- Vĩnh Phúc
UPDATE provinces SET geojson_id = 'VN06' WHERE id = 127;  -- Yên Bái
UPDATE provinces SET geojson_id = 'VN20' WHERE id = 2;    -- Thái Bình (existing older row)

-- Optional sample product mapping. Remove these lines if you want to assign provinces manually in admin.
UPDATE products
SET province_id = 124
WHERE name IN ('Cam', 'Bưởi', 'Chanh')
  AND province_id IS NULL;

UPDATE products
SET province_id = 72
WHERE name = 'Dừa'
  AND province_id IS NULL;

-- Sample markers for the first map screen
INSERT INTO province_markers (province_id, title, description, latitude, longitude, color)
SELECT 124, 'Trung tâm Tuyên Quang', 'Điểm gợi ý để mở thông tin tỉnh trên bản đồ', 21.8236, 105.2140, '#749b3f'
WHERE NOT EXISTS (
  SELECT 1 FROM province_markers WHERE province_id = 124 AND title = 'Trung tâm Tuyên Quang'
);

INSERT INTO province_markers (province_id, title, description, latitude, longitude, color)
SELECT 89, 'Trung tâm Hà Nội', 'Điểm gợi ý để mở thông tin tỉnh trên bản đồ', 21.0285, 105.8542, '#ff7a3d'
WHERE NOT EXISTS (
  SELECT 1 FROM province_markers WHERE province_id = 89 AND title = 'Trung tâm Hà Nội'
);

INSERT INTO province_markers (province_id, title, description, latitude, longitude, color)
SELECT 80, 'Trung tâm Đà Nẵng', 'Điểm gợi ý để mở thông tin tỉnh trên bản đồ', 16.0544, 108.2022, '#176d38'
WHERE NOT EXISTS (
  SELECT 1 FROM province_markers WHERE province_id = 80 AND title = 'Trung tâm Đà Nẵng'
);

SET SQL_SAFE_UPDATES = 1;
