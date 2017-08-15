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

import controller.ItemController;
import dto.DonationDTO;
import dto.ItemDTO;
import entity.Item;
import java.util.ArrayList;
import java.util.List;
import view.vo.ItemVO;

/**
 *
 * @author jeremiah.johnson5
 */
public class ItemView {

    private ItemController itemController;

    public void setItemController(ItemController itemController) {
        this.itemController = itemController;
    }

    public void saveItem(ItemDTO idto) {
        itemController.saveItem(idto);
    }

    public List<ItemVO> getItemsFromDonation(DonationDTO d) {
        List<ItemVO> rtv = new ArrayList<>();
        for (Item i : itemController.getItemsFromDonation(d)) {
            ItemVO temp = new ItemVO(i);
            rtv.add(temp);
        }

        return rtv;
    }

    public void deleteItem(String itemId) {
        Long id = Long.parseLong(itemId);
        itemController.deleteItem(id);
    }

    public void editItem(ItemDTO idto) {
        itemController.editItem(idto);
    }
}
