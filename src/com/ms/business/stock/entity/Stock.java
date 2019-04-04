package com.ms.business.stock.entity;
import org.hibernate.annotations.GenericGenerator;
import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name="business_stock")
public class Stock {

    @Id
    @GeneratedValue(generator="stockGenerator")
    @GenericGenerator(name="stockGenerator",strategy="uuid")
    @Column(length=125,name = "stock_id")
    private String  StockId;

    // 库存食材名称 字段
    @Column(length=125,name = "stock_name")
    private String StockName;
    // 库存数量 字段
    @Column(length=125,name = "stock_number")
    private double StockNumber;
    // 店铺名称 字段
    @Column(length=125,name = "store_id")
    private String StordId;




    public String getStockId() {
        return StockId;
    }

    public void setStockId(String StockId) {
        this.StockId = StockId;
    }

    public String getStockName() {
        return StockName;
    }

    public void setStockName(String StockName) {
        this.StockName = StockName;
    }


    public String getStordId() {
        return StordId;
    }

    public void setStordId(String StordId) {
        this.StordId = StordId;
    }

    public double getStockNumber() {
        return StockNumber;
    }

    public void setStockNumber(double stockNumber) {
        StockNumber = stockNumber;
    }
}
