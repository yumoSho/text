package com.glanway.jty.dao.customer;


import com.glanway.jty.dao.BaseDao;
import com.glanway.jty.entity.customer.MemberDividend;

import java.util.List;

/**
* </b>会员 Dao
*  @author  generator
*  @Time     2016-04-12
*  @version 1.0
*/
public interface MemberDividendDao extends BaseDao<MemberDividend,Long> {
    void deleteAll();

    List<MemberDividend> findAll();
}
