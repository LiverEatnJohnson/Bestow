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
import entity.Donor;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityNotFoundException;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import jpa.exceptions.IllegalOrphanException;
import jpa.exceptions.NonexistentEntityException;

/**
 *
 * @author bullfrog
 */
public class DonorJpaController implements Serializable {

  public DonorJpaController() {
	emf = Persistence.createEntityManagerFactory("BestowPU");
  }
  private EntityManagerFactory emf = null;

  public EntityManager getEntityManager() {
	return emf.createEntityManager();
  }

  public void create(Donor donor) {
	if (donor.getDonationList() == null) {
	  donor.setDonationList(new ArrayList<Donation>());
	}
	EntityManager em = null;
	try {
	  em = getEntityManager();
	  em.getTransaction().begin();
	  List<Donation> attachedDonationList = new ArrayList<Donation>();
	  for (Donation donationListDonationToAttach : donor.getDonationList()) {
		donationListDonationToAttach = em.getReference(donationListDonationToAttach.getClass(), donationListDonationToAttach.getId());
		attachedDonationList.add(donationListDonationToAttach);
	  }
	  donor.setDonationList(attachedDonationList);
	  em.persist(donor);
	  for (Donation donationListDonation : donor.getDonationList()) {
		Donor oldDonorOfDonationListDonation = donationListDonation.getDonor();
		donationListDonation.setDonor(donor);
		donationListDonation = em.merge(donationListDonation);
		if (oldDonorOfDonationListDonation != null) {
		  oldDonorOfDonationListDonation.getDonationList().remove(donationListDonation);
		  oldDonorOfDonationListDonation = em.merge(oldDonorOfDonationListDonation);
		}
	  }
	  em.getTransaction().commit();
	} finally {
	  if (em != null) {
		em.close();
	  }
	}
  }

  public void edit(Donor donor) throws IllegalOrphanException, NonexistentEntityException, Exception {
	EntityManager em = null;
	try {
	  em = getEntityManager();
	  em.getTransaction().begin();
	  Donor persistentDonor = em.find(Donor.class, donor.getId());
	  List<Donation> donationListOld = persistentDonor.getDonationList();
	  List<Donation> donationListNew = donor.getDonationList();
	  List<String> illegalOrphanMessages = null;
	  for (Donation donationListOldDonation : donationListOld) {
		if (!donationListNew.contains(donationListOldDonation)) {
		  if (illegalOrphanMessages == null) {
			illegalOrphanMessages = new ArrayList<String>();
		  }
		  illegalOrphanMessages.add("You must retain Donation " + donationListOldDonation + " since its donor field is not nullable.");
		}
	  }
	  if (illegalOrphanMessages != null) {
		throw new IllegalOrphanException(illegalOrphanMessages);
	  }
	  List<Donation> attachedDonationListNew = new ArrayList<Donation>();
	  for (Donation donationListNewDonationToAttach : donationListNew) {
		donationListNewDonationToAttach = em.getReference(donationListNewDonationToAttach.getClass(), donationListNewDonationToAttach.getId());
		attachedDonationListNew.add(donationListNewDonationToAttach);
	  }
	  donationListNew = attachedDonationListNew;
	  donor.setDonationList(donationListNew);
	  donor = em.merge(donor);
	  for (Donation donationListNewDonation : donationListNew) {
		if (!donationListOld.contains(donationListNewDonation)) {
		  Donor oldDonorOfDonationListNewDonation = donationListNewDonation.getDonor();
		  donationListNewDonation.setDonor(donor);
		  donationListNewDonation = em.merge(donationListNewDonation);
		  if (oldDonorOfDonationListNewDonation != null && !oldDonorOfDonationListNewDonation.equals(donor)) {
			oldDonorOfDonationListNewDonation.getDonationList().remove(donationListNewDonation);
			oldDonorOfDonationListNewDonation = em.merge(oldDonorOfDonationListNewDonation);
		  }
		}
	  }
	  em.getTransaction().commit();
	} catch (Exception ex) {
	  String msg = ex.getLocalizedMessage();
	  if (msg == null || msg.length() == 0) {
		Long id = donor.getId();
		if (findDonor(id) == null) {
		  throw new NonexistentEntityException("The donor with id " + id + " no longer exists.");
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
	  Donor donor;
	  try {
		donor = em.getReference(Donor.class, id);
		donor.getId();
	  } catch (EntityNotFoundException enfe) {
		throw new NonexistentEntityException("The donor with id " + id + " no longer exists.", enfe);
	  }
	  List<String> illegalOrphanMessages = null;
	  List<Donation> donationListOrphanCheck = donor.getDonationList();
	  for (Donation donationListOrphanCheckDonation : donationListOrphanCheck) {
		if (illegalOrphanMessages == null) {
		  illegalOrphanMessages = new ArrayList<String>();
		}
		illegalOrphanMessages.add("This Donor (" + donor + ") cannot be destroyed since the Donation " + donationListOrphanCheckDonation + " in its donationList field has a non-nullable donor field.");
	  }
	  if (illegalOrphanMessages != null) {
		throw new IllegalOrphanException(illegalOrphanMessages);
	  }
	  em.remove(donor);
	  em.getTransaction().commit();
	} finally {
	  if (em != null) {
		em.close();
	  }
	}
  }

  public List<Donor> findDonorEntities() {
	return findDonorEntities(true, -1, -1);
  }

  public List<Donor> findDonorEntities(int maxResults, int firstResult) {
	return findDonorEntities(false, maxResults, firstResult);
  }

  private List<Donor> findDonorEntities(boolean all, int maxResults, int firstResult) {
	EntityManager em = getEntityManager();
	try {
	  CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
	  cq.select(cq.from(Donor.class));
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

  public Donor findDonor(Long id) {
	EntityManager em = getEntityManager();
	try {
	  return em.find(Donor.class, id);
	} finally {
	  em.close();
	}
  }

  public int getDonorCount() {
	EntityManager em = getEntityManager();
	try {
	  CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
	  Root<Donor> rt = cq.from(Donor.class);
	  cq.select(em.getCriteriaBuilder().count(rt));
	  Query q = em.createQuery(cq);
	  return ((Long) q.getSingleResult()).intValue();
	} finally {
	  em.close();
	}
  }
  
}
