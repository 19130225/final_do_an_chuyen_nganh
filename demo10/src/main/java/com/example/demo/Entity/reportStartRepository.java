package com.example.demo.Entity;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import com.example.demo.model.reportStart;

import java.util.List;

public interface reportStartRepository extends CrudRepository<reportStart,Integer> {
    @Query("SELECT c FROM reportStart c WHERE c.productID= :productID")
    List<reportStart> findReprotByProductID(String productID);

//    default reportStart findAllByCreatedAtLikeS(String productID) {
//
//        return findAllByCreatedAtLike(date);
//    }
}
