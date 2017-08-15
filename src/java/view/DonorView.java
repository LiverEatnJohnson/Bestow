/*
 * Company    : MAGi iNDUSTRIES iNC.
 * Project    : Bestow
 * File       : DonorView.java
 * Author     : LiverEatnJohnson
 * Date       : Feb 14 2013
 * Copyright  : (C) Jeremiah Johnson 2013
 * License    : GUN GPL v3
 */
package view;

import controller.DonorController;
import dto.DonorDTO;
import entity.Donor;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import view.vo.DonorVO;

/**
 * @author LiverEatnJohnson
 */
public class DonorView {

    private DonorController donorController;

    /**
     * Basic Constructor
     */
    public DonorView() {
    }

    /**
     * @param donorController DonorController
     */
    public void setDonorController(DonorController donorController) {
        this.donorController = donorController;
    }

    /**
     * @param dto DonorDTO
     */
    public Donor saveDonor(DonorDTO dto) {
        return donorController.saveDonor(dto);
    }

    public List<DonorVO> getListByLastFirst() {
        List<DonorVO> rtv = new ArrayList<>();
                for(Donor d : donorController.getList()){
                    DonorVO temp = new DonorVO(d);
                    rtv.add(temp);
                }
        Collections.sort(rtv, new Comparator<DonorVO>() {
            @Override
            public int compare(DonorVO o1, DonorVO o2) {
                if (o1.getLastName().compareToIgnoreCase(o2.getLastName()) == 0) {
                    return o1.getFirstName().compareToIgnoreCase(o2.getFirstName());
                } else {
                    return o1.getLastName().compareToIgnoreCase(o2.getLastName());
                }
            }
        });
        return rtv;
    }

    /**
     * @param donorId String
     */
    public void deleteDonor(String donorId) {
        Long did = Long.parseLong(donorId);
        donorController.deleteDonor(did);
    }

    /**
     * @param dto DonorDTO
     */
    public void editDonor(DonorDTO dto) {
        donorController.editDonor(dto);
    }

    /**
     * @param donorId String id of donor
     * @return DonorVO or null
     */
    public DonorVO getDonor(String donorId) {
        Long did = Long.parseLong(donorId);
        DonorVO me = new DonorVO(donorController.getDonor(did));
        return me;
    }
}
