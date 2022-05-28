package com.yqxd.service.imp;

import java.util.List;

import com.yqxd.entity.Medical;
import com.yqxd.mapper.MedicalMapper;
import com.yqxd.service.MedicalService;

public class MedicalServiceImp implements MedicalService{
	MedicalMapper me = new MedicalMapper();

	@Override
	public List<Medical> getAllMedical() {
		// TODO �Զ����ɵķ������
		return me.selectAll();
	}

	@Override
	public int addMedical(Medical v) {
		// TODO �Զ����ɵķ������
		return me.addToMedical(v);
	}

	@Override
	public int deleteMedical(int id) {
		// TODO �Զ����ɵķ������
		return me.deleteMedicalById(id);
	}

	@Override
	public int updateMedical(Medical v) {
		// TODO �Զ����ɵķ������
		return me.updateById(v);
	}
}
