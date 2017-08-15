/*
 * Company    : MAGi iNDUSTRIES iNC.
 * Project    : Bestow
 * File       : DepartmentController.java
 * Author     : Bullforg
 * Date       : Apr 30 2013
 * Copyright  : (C) Jeremiah Johnson 2013
 * License    : GUN GPL v3
 */
package view;

import controller.DonationController;
import dto.DonationDTO;
import entity.Donation;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import view.vo.DepartmentVO;
import view.vo.DonationVO;
import view.vo.DonorVO;
import view.vo.EmployeeVO;
import view.vo.OrganizationVO;

/**
 *
 * @author bullfrog
 */
public class DonationView {

    private DonationController donationController;

    /**
     * Basic Constructor
     */
    public DonationView() {
    }

    /**
     * @param donationController DonationController
     */
    public void setDonationController(DonationController donationController) {
        this.donationController = donationController;
    }

    /**
     * @param dto DonationDTO
     */
    public void saveDonation(DonationDTO dto) {
        donationController.saveDonation(dto);
    }

    public List<DonationVO> getListAlpha() {
        List<DonationVO> rtv = new ArrayList<>();
		for(Donation d : donationController.getList()){
		  OrganizationVO tempO = new OrganizationVO(d.getDepartment().getOrganization(), false);
		  DepartmentVO tempD = new DepartmentVO(d.getDepartment(), tempO, false);
		  EmployeeVO tempE = new EmployeeVO(d.getEmployee(), null, false);
		  DonorVO tempDonor = new DonorVO(d.getDonor());
		  DonationVO temp = new DonationVO(d, tempE, tempDonor, tempD, true);
		  rtv.add(temp);
		}
        Collections.sort(rtv, new Comparator<DonationVO>() {
            @Override
            public int compare(DonationVO o1, DonationVO o2) {
                if (o1.getDonor().getLastName().compareToIgnoreCase(o2.getDonor().getLastName()) == 0) {
                    return o1.getDonor().getLastName().compareToIgnoreCase(o2.getDonor().getLastName());
                } else {
                    return o1.getDonor().getLastName().compareToIgnoreCase(o2.getDonor().getLastName());
                }
            }
        });
        return rtv;
    }

    /**
     * @param depId String
     */
    public void deleteDonation(String depId) {
        int did = Integer.parseInt(depId);
        donationController.deleteDonation(did);
    }

    /**
     * @param dto DonationDTO
     */
    public void editDonation(DonationDTO dto) {
        donationController.editDonation(dto);
    }

    /**
     * @param depId String
     * @return DonationVO
     */
    public DonationVO getDonation(String donationId) {
        Long did = Long.parseLong(donationId);
		OrganizationVO tempO = new OrganizationVO(donationController.getDonation(did).getDepartment().getOrganization(), false);
		  DepartmentVO tempD = new DepartmentVO(donationController.getDonation(did).getDepartment(), tempO, false);
		  EmployeeVO tempE = new EmployeeVO(donationController.getDonation(did).getEmployee(), null, true);
		  DonorVO tempDonor = new DonorVO(donationController.getDonation(did).getDonor());
		  DonationVO vo = new DonationVO(donationController.getDonation(did), tempE, tempDonor, tempD, true);
        return vo;
    }
}
