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

import entity.Donation;
import entity.Item;
import java.io.Serializable;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityNotFoundException;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import jpa.exceptions.NonexistentEntityException;

/**
 *
 * @author bullfrog
 */
public class ItemJpaController implements Serializable {

  public ItemJpaController() {
	emf = Persistence.createEntityManagerFactory("BestowPU");
  }
  private EntityManagerFactory emf = null;

  public EntityManager getEntityManager() {
	return emf.createEntityManager();
  }

  public void create(Item item) {
	EntityManager em = null;
	try {
	  em = getEntityManager();
	  em.getTransaction().begin();
	  Donation donation = item.getDonation();
          
	  if (donation != null) {
		donation = em.getReference(donation.getClass(), donation.getId());
		item.setDonation(donation);
	  }
	  em.persist(item);
	  if (donation != null) {
		donation.getItemList().add(item);
		donation = em.merge(donation);
	  }
	  em.getTransaction().commit();
	} finally {
	  if (em != null) {
		em.close();
	  }
	}
  }

  public void edit(Item item) throws NonexistentEntityException, Exception {
	EntityManager em = null;
	try {
	  em = getEntityManager();
	  em.getTransaction().begin();
	  Item persistentItem = em.find(Item.class, item.getId());
	  Donation donationOld = persistentItem.getDonation();
	  Donation donationNew = item.getDonation();
	  if (donationNew != null) {
		donationNew = em.getReference(donationNew.getClass(), donationNew.getId());
		item.setDonation(donationNew);
	  }
	  item = em.merge(item);
	  if (donationOld != null && !donationOld.equals(donationNew)) {
		donationOld.getItemList().remove(item);
		donationOld = em.merge(donationOld);
	  }
	  if (donationNew != null && !donationNew.equals(donationOld)) {
		donationNew.getItemList().add(item);
		donationNew = em.merge(donationNew);
	  }
	  em.getTransaction().commit();
	} catch (Exception ex) {
	  String msg = ex.getLocalizedMessage();
	  if (msg == null || msg.length() == 0) {
		Long id = item.getId();
		if (findItem(id) == null) {
		  throw new NonexistentEntityException("The item with id " + id + " no longer exists.");
		}
	  }
	  throw ex;
	} finally {
	  if (em != null) {
		em.close();
	  }
	}
  }

  public void destroy(Long id) throws NonexistentEntityException {
	EntityManager em = null;
	try {
	  em = getEntityManager();
	  em.getTransaction().begin();
	  Item item;
	  try {
		item = em.getReference(Item.class, id);
		item.getId();
	  } catch (EntityNotFoundException enfe) {
		throw new NonexistentEntityException("The item with id " + id + " no longer exists.", enfe);
	  }
	  Donation donation = item.getDonation();
	  if (donation != null) {
		donation.getItemList().remove(item);
		donation = em.merge(donation);
	  }
	  em.remove(item);
	  em.getTransaction().commit();
	} finally {
	  if (em != null) {
		em.close();
	  }
	}
  }

  public List<Item> findItemEntities() {
	return findItemEntities(true, -1, -1);
  }

  public List<Item> findItemEntities(int maxResults, int firstResult) {
	return findItemEntities(false, maxResults, firstResult);
  }

  private List<Item> findItemEntities(boolean all, int maxResults, int firstResult) {
	EntityManager em = getEntityManager();
	try {
	  CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
	  cq.select(cq.from(Item.class));
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

  public Item findItem(Long id) {
	EntityManager em = getEntityManager();
	try {
	  return em.find(Item.class, id);
	} finally {
	  em.close();
	}
  }

  public int getItemCount() {
	EntityManager em = getEntityManager();
	try {
	  CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
	  Root<Item> rt = cq.from(Item.class);
	  cq.select(em.getCriteriaBuilder().count(rt));
	  Query q = em.createQuery(cq);
	  return ((Long) q.getSingleResult()).intValue();
	} finally {
	  em.close();
	}
  }
  
}
