/*
 * Company    : MAGi iNDUSTRIES iNC.
 * Project    : Bestow
 * File       : DepartmentController.java
 * Author     : Bullforg
 * Date       : Apr 30 2013
 * Copyright  : (C) Jeremiah Johnson 2013
 * License    : GUN GPL v3
 */
package jpa;

import java.io.Serializable;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import entity.Employee;
import entity.Donor;
import entity.Department;
import entity.Donation;
import entity.Item;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import jpa.exceptions.IllegalOrphanException;
import jpa.exceptions.NonexistentEntityException;

/**
 *
 * @author jeremiah.johnson5
 */
public class DonationJpaController implements Serializable {

    public DonationJpaController() {
        emf = Persistence.createEntityManagerFactory("BestowPU");
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Donation donation) {
        if (donation.getItemList() == null) {
            donation.setItemList(new ArrayList<Item>());
        }
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Employee employee = donation.getEmployee();
            if (employee != null) {
                employee = em.getReference(employee.getClass(), employee.getId());
                donation.setEmployee(employee);
            }
            Donor donor = donation.getDonor();
            if (donor != null) {
                donor = em.getReference(donor.getClass(), donor.getId());
                donation.setDonor(donor);
            }
            Department department = donation.getDepartment();
            if (department != null) {
                department = em.getReference(department.getClass(), department.getId());
                donation.setDepartment(department);
            }
            List<Item> attachedItemList = new ArrayList<Item>();
            for (Item itemListItemToAttach : donation.getItemList()) {
                itemListItemToAttach = em.getReference(itemListItemToAttach.getClass(), itemListItemToAttach.getId());
                attachedItemList.add(itemListItemToAttach);
            }
            donation.setItemList(attachedItemList);
            em.persist(donation);
            if (employee != null) {
                employee.getDonationList().add(donation);
                employee = em.merge(employee);
            }
            if (donor != null) {
                donor.getDonationList().add(donation);
                donor = em.merge(donor);
            }
            if (department != null) {
                department.getDonationList().add(donation);
                department = em.merge(department);
            }
            for (Item itemListItem : donation.getItemList()) {
                Donation oldDonationOfItemListItem = itemListItem.getDonation();
                itemListItem.setDonation(donation);
                itemListItem = em.merge(itemListItem);
                if (oldDonationOfItemListItem != null) {
                    oldDonationOfItemListItem.getItemList().remove(itemListItem);
                    oldDonationOfItemListItem = em.merge(oldDonationOfItemListItem);
                }
            }
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Donation donation) throws IllegalOrphanException, NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Donation persistentDonation = em.find(Donation.class, donation.getId());
            Employee employeeOld = persistentDonation.getEmployee();
            Employee employeeNew = donation.getEmployee();
            Donor donorOld = persistentDonation.getDonor();
            Donor donorNew = donation.getDonor();
            Department departmentOld = persistentDonation.getDepartment();
            Department departmentNew = donation.getDepartment();
            List<Item> itemListOld = persistentDonation.getItemList();
            List<Item> itemListNew = donation.getItemList();
            List<String> illegalOrphanMessages = null;
            for (Item itemListOldItem : itemListOld) {
                if (!itemListNew.contains(itemListOldItem)) {
                    if (illegalOrphanMessages == null) {
                        illegalOrphanMessages = new ArrayList<String>();
                    }
                    illegalOrphanMessages.add("You must retain Item " + itemListOldItem + " since its donation field is not nullable.");
                }
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            if (employeeNew != null) {
                employeeNew = em.getReference(employeeNew.getClass(), employeeNew.getId());
                donation.setEmployee(employeeNew);
            }
            if (donorNew != null) {
                donorNew = em.getReference(donorNew.getClass(), donorNew.getId());
                donation.setDonor(donorNew);
            }
            if (departmentNew != null) {
                departmentNew = em.getReference(departmentNew.getClass(), departmentNew.getId());
                donation.setDepartment(departmentNew);
            }
            List<Item> attachedItemListNew = new ArrayList<Item>();
            for (Item itemListNewItemToAttach : itemListNew) {
                itemListNewItemToAttach = em.getReference(itemListNewItemToAttach.getClass(), itemListNewItemToAttach.getId());
                attachedItemListNew.add(itemListNewItemToAttach);
            }
            itemListNew = attachedItemListNew;
            donation.setItemList(itemListNew);
            donation = em.merge(donation);
            if (employeeOld != null && !employeeOld.equals(employeeNew)) {
                employeeOld.getDonationList().remove(donation);
                employeeOld = em.merge(employeeOld);
            }
            if (employeeNew != null && !employeeNew.equals(employeeOld)) {
                employeeNew.getDonationList().add(donation);
                employeeNew = em.merge(employeeNew);
            }
            if (donorOld != null && !donorOld.equals(donorNew)) {
                donorOld.getDonationList().remove(donation);
                donorOld = em.merge(donorOld);
            }
            if (donorNew != null && !donorNew.equals(donorOld)) {
                donorNew.getDonationList().add(donation);
                donorNew = em.merge(donorNew);
            }
            if (departmentOld != null && !departmentOld.equals(departmentNew)) {
                departmentOld.getDonationList().remove(donation);
                departmentOld = em.merge(departmentOld);
            }
            if (departmentNew != null && !departmentNew.equals(departmentOld)) {
                departmentNew.getDonationList().add(donation);
                departmentNew = em.merge(departmentNew);
            }
            for (Item itemListNewItem : itemListNew) {
                if (!itemListOld.contains(itemListNewItem)) {
                    Donation oldDonationOfItemListNewItem = itemListNewItem.getDonation();
                    itemListNewItem.setDonation(donation);
                    itemListNewItem = em.merge(itemListNewItem);
                    if (oldDonationOfItemListNewItem != null && !oldDonationOfItemListNewItem.equals(donation)) {
                        oldDonationOfItemListNewItem.getItemList().remove(itemListNewItem);
                        oldDonationOfItemListNewItem = em.merge(oldDonationOfItemListNewItem);
                    }
                }
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Long id = donation.getId();
                if (findDonation(id) == null) {
                    throw new NonexistentEntityException("The donation with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(Long id) throws IllegalOrphanException, NonexistentEntityException {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Donation donation;
            try {
                donation = em.getReference(Donation.class, id);
                donation.getId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The donation with id " + id + " no longer exists.", enfe);
            }
            List<String> illegalOrphanMessages = null;
            List<Item> itemListOrphanCheck = donation.getItemList();
            for (Item itemListOrphanCheckItem : itemListOrphanCheck) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("This Donation (" + donation + ") cannot be destroyed since the Item " + itemListOrphanCheckItem + " in its itemList field has a non-nullable donation field.");
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            Employee employee = donation.getEmployee();
            if (employee != null) {
                employee.getDonationList().remove(donation);
                employee = em.merge(employee);
            }
            Donor donor = donation.getDonor();
            if (donor != null) {
                donor.getDonationList().remove(donation);
                donor = em.merge(donor);
            }
            Department department = donation.getDepartment();
            if (department != null) {
                department.getDonationList().remove(donation);
                department = em.merge(department);
            }
            em.remove(donation);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Donation> findDonationEntities() {
        return findDonationEntities(true, -1, -1);
    }

    public List<Donation> findDonationEntities(int maxResults, int firstResult) {
        return findDonationEntities(false, maxResults, firstResult);
    }

    private List<Donation> findDonationEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Donation.class));
            Query q = em.createQuery(cq);
            if (!all) {
                q.setMaxResults(maxResults);
                q.setFirstResult(firstResult);
            }
            return q.getResultList();
        } finally {
            em.close();
        }
    }

    public Donation findDonation(Long id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Donation.class, id);
        } finally {
            em.close();
        }
    }

    public int getDonationCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Donation> rt = cq.from(Donation.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
}
