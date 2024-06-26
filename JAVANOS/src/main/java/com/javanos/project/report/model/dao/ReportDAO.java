package com.javanos.project.report.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.javanos.project.common.paging.SelectCriteria;
import com.javanos.project.report.model.dto.ReportDTO;
import com.javanos.project.user.model.dto.UserDTO;

public interface ReportDAO {
    List<ReportDTO> selectAllReports();
    int insertReport(ReportDTO report);
    ReportDTO selectReportByNo(int reportNo);
    
    UserDTO selectUserByUserId(@Param("userId") String userId);
    
    int deleteReport(int reportNo);

    String selectUserNicknameByUserNo(@Param("userNo") int userNo);
    
    // 회원 정지 메서드
    int banUserByUserNo(@Param("userNo") int userNo);
    int updateReportStatus(@Param("reportNo") int reportNo, @Param("reportStatus") String reportStatus);
    
    // 전체 게시물 수 조회
    int selectTotalCount();

    // 페이징 처리된 게시물 목록 조회
    List<ReportDTO> selectReports(SelectCriteria selectCriteria);
}