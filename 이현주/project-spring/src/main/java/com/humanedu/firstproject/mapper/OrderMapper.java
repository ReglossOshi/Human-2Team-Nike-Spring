package com.humanedu.firstproject.mapper;

import com.humanedu.firstproject.domain.Criteria;
import com.humanedu.firstproject.domain.OrderVO;
import com.humanedu.firstproject.domain.ReplyVO;

import java.util.List;

public interface OrderMapper {

    List<OrderVO> getOrderList(Criteria cri);
    OrderVO getListOne(int num);

    List<OrderVO> getListWithPaging(Criteria cri);

    Integer getOrderTotal(Criteria cri); // 주문목록 총 갯수

    int removeList(int num);

    int addList(OrderVO orderVO);

    int modifyList(OrderVO orderVO);



    List<ReplyVO> getReply();
    int addReply(ReplyVO replyVO);
    int modifyStatus(OrderVO orderVO);

}
