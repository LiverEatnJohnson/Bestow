/*
 * Company    : MAGi iNDUSTRIES iNC.
 * Project    : Bestow
 * File       : OrganizationView.java
 * Author     : LiverEatnJohnson
 * Date       : Feb 27 2013
 * Copyright  : (C) Jeremiah Johnson 2013
 * License    : GUN GPL v3
 */
package view;

import controller.OrganizationController;
import dto.OrganizationDTO;
import entity.Organization;
import java.util.ArrayList;
import java.util.List;
import view.vo.OrganizationVO;

/**
 * @author LiverEatnJohnson
 */
public class OrganizationView {

    private OrganizationController organizationController;

    /**
     * @param organizationController OrganizationController
     */
    public void setOrganizationController(OrganizationController organizationController) {
        this.organizationController = organizationController;
    }

    /**
     * @param dto OrganizationDTO
     */
    public void saveOrganization(OrganizationDTO dto) {
        organizationController.saveOrganization(dto);
    }

    public List<OrganizationVO> getList() {
        List<OrganizationVO> rtv = new ArrayList<>();
        for(Organization o : organizationController.getList()){
            OrganizationVO temp = new OrganizationVO(o, false);
            rtv.add(temp);
        }
        return rtv;
    }

    /**
     * @param orgId String
     */
    public void deleteOrganization(String orgId) {
        int oid = Integer.parseInt(orgId);
        organizationController.deleteOrganization(oid);
    }

    /**
     * @param dto OrganizationDTO
     */
    public void editOrganization(OrganizationDTO dto) {
        organizationController.editOrganization(dto);
    }

    /**
     * @param orgId String
     * @return OrganizationVO
     */
    public OrganizationVO getOrganization(String orgId) {
        int oid = Integer.parseInt(orgId);
        OrganizationVO temp = new OrganizationVO(organizationController.getOrganization(oid), true);
        return temp;
    }
}
