/*
 * Company    : MAGi iNDUSTRIES iNC.
 * Project    : Bestow
 * File       : DepartmentView.java
 * Author     : LiverEatnJohnson
 * Date       : Feb 27 2013
 * Copyright  : (C) Jeremiah Johnson 2013
 * License    : GUN GPL v3
 */
package view;

import controller.DepartmentController;
import dto.DepartmentDTO;
import entity.Department;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import view.vo.DepartmentVO;
import view.vo.OrganizationVO;

/**
 * @author LiverEatnJohnson
 */
public class DepartmentView {

    private DepartmentController departmentController;

    /**
     * Basic Constructor
     */
    public DepartmentView() {
    }

    /**
     * @param departmentController DepartmentController
     */
    public void setDepartmentController(DepartmentController departmentController) {
        this.departmentController = departmentController;
    }

    /**
     * @param dto DepartmentDTO
     */
    public void saveDepartment(DepartmentDTO dto) {
        departmentController.saveDepartment(dto);
    }

    public List<DepartmentVO> getListAlpha() {
        List<DepartmentVO> rtv = new ArrayList<>();
        for(Department d : departmentController.getList()){
		    OrganizationVO tempO = new OrganizationVO(d.getOrganization(), false);
            DepartmentVO temp = new DepartmentVO(d, tempO, false);
            rtv.add(temp);
        }
        Collections.sort(rtv, new Comparator<DepartmentVO>() {
            @Override
            public int compare(DepartmentVO o1, DepartmentVO o2) {
                if (o1.getTitle().compareToIgnoreCase(o2.getTitle()) == 0) {
                    return o1.getTitle().compareToIgnoreCase(o2.getTitle());
                } else {
                    return o1.getTitle().compareToIgnoreCase(o2.getTitle());
                }
            }
        });
        return rtv;
    }

    /**
     * @param depId String
     */
    public void deleteDepartment(String depId) {
        int did = Integer.parseInt(depId);
        departmentController.deleteDepartment(did);
    }

    /**
     * @param dto DepartmentDTO
     */
    public void editDepartment(DepartmentDTO dto) {
        departmentController.editDepartment(dto);
    }

    /**
     * @param depId String
     * @return DepartmentVO
     */
    public DepartmentVO getDepartment(String depId) {
        int did = Integer.parseInt(depId);
		OrganizationVO tempO = new OrganizationVO(departmentController.getDepartment(did).getOrganization(), false);
        DepartmentVO dep = new DepartmentVO(departmentController.getDepartment(did), tempO, true);
        return dep;
    }
}
