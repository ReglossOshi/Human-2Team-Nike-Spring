package com.humanedu.firstproject.mapper;

import com.humanedu.firstproject.config.DBConfig;
import com.humanedu.firstproject.domain.Criteria;
import com.humanedu.firstproject.domain.OrderVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {DBConfig.class})
@Log4j
public class OrderMapperTests {

    @Setter(onMethod_ = @Autowired)
    private OrderMapper orderMapper;

    @Test
    public void testGetList(Criteria cri){

        orderMapper.getOrderList(cri).forEach(board -> log.info(board));
    }

    @Test
    public void testPaging(){
        Criteria cri = new Criteria();

        cri.setPageNum(2);
        cri.setAmount(10);

        List<OrderVO> list = orderMapper.getListWithPaging(cri);
        list.forEach(board -> log.info(board));
    }
}
