package com.model.mapper;

import java.util.List;

import com.model.member.ReportDTO;

public interface ReportMapper {
	public int reportDelete(int send_user);
	public List<ReportDTO> reportlist(int num);
	public int insertreport(ReportDTO dto);
}
