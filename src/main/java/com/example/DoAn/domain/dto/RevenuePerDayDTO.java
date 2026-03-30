package com.example.DoAn.domain.dto;

import java.math.BigDecimal;
import java.time.LocalDate;

//Dùng để tính 
public class RevenuePerDayDTO {
    private LocalDate day;
    private BigDecimal total;

    public RevenuePerDayDTO(LocalDate day, BigDecimal total) {
        this.day = day;
        this.total = total;
    }

    public LocalDate getDay() {
        return day;
    }

    public void setDay(LocalDate day) {
        this.day = day;
    }

    public BigDecimal getTotal() {
        return total;
    }

    public void setTotal(BigDecimal total) {
        this.total = total;
    }

}
