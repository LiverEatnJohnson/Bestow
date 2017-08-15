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

import entity.Department;
import entity.Organization;
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
public class OrganizationJpaController implements Serializable {

  public OrganizationJpaController() {
	emf = Persistence.createEntityManagerFactory("BestowPU");
  }
  private EntityManagerFactory emf = null;

  public EntityManager getEntityManager() {
	return emf.createEntityManager();
  }

  public void create(Organization organization) {
	if (organization.getDepartmentList() == null) {
	  organization.setDepartmentList(new ArrayList<Department>());
	}
	EntityManager em = null;
	try {
	  em = getEntityManager();
	  em.getTransaction().begin();
	  List<Department> attachedDepartmentList = new ArrayList<Department>();
	  for (Department departmentListDepartmentToAttach : organization.getDepartmentList()) {
		departmentListDepartmentToAttach = em.getReference(departmentListDepartmentToAttach.getClass(), departmentListDepartmentToAttach.getId());
		attachedDepartmentList.add(departmentListDepartmentToAttach);
	  }
	  organization.setDepartmentList(attachedDepartmentList);
	  em.persist(organization);
	  for (Department departmentListDepartment : organization.getDepartmentList()) {
		Organization oldOrganizationOfDepartmentListDepartment = departmentListDepartment.getOrganization();
		departmentListDepartment.setOrganization(organization);
		departmentListDepartment = em.merge(departmentListDepartment);
		if (oldOrganizationOfDepartmentListDepartment != null) {
		  oldOrganizationOfDepartmentListDepartment.getDepartmentList().remove(departmentListDepartment);
		  oldOrganizationOfDepartmentListDepartment = em.merge(oldOrganizationOfDepartmentListDepartment);
		}
	  }
	  em.getTransaction().commit();
	} finally {
	  if (em != null) {
		em.close();
	  }
	}
  }

  public void edit(Organization organization) throws IllegalOrphanException, NonexistentEntityException, Exception {
	EntityManager em = null;
	try {
	  em = getEntityManager();
	  em.getTransaction().begin();
	  Organization persistentOrganization = em.find(Organization.class, organization.getId());
	  List<Department> departmentListOld = persistentOrganization.getDepartmentList();
	  List<Department> departmentListNew = organization.getDepartmentList();
	  List<String> illegalOrphanMessages = null;
	  for (Department departmentListOldDepartment : departmentListOld) {
		if (!departmentListNew.contains(departmentListOldDepartment)) {
		  if (illegalOrphanMessages == null) {
			illegalOrphanMessages = new ArrayList<String>();
		  }
		  illegalOrphanMessages.add("You must retain Department " + departmentListOldDepartment + " since its organization field is not nullable.");
		}
	  }
	  if (illegalOrphanMessages != null) {
		throw new IllegalOrphanException(illegalOrphanMessages);
	  }
	  List<Department> attachedDepartmentListNew = new ArrayList<Department>();
	  for (Department departmentListNewDepartmentToAttach : departmentListNew) {
		departmentListNewDepartmentToAttach = em.getReference(departmentListNewDepartmentToAttach.getClass(), departmentListNewDepartmentToAttach.getId());
		attachedDepartmentListNew.add(departmentListNewDepartmentToAttach);
	  }
	  departmentListNew = attachedDepartmentListNew;
	  organization.setDepartmentList(departmentListNew);
	  organization = em.merge(organization);
	  for (Department departmentListNewDepartment : departmentListNew) {
		if (!departmentListOld.contains(departmentListNewDepartment)) {
		  Organization oldOrganizationOfDepartmentListNewDepartment = departmentListNewDepartment.getOrganization();
		  departmentListNewDepartment.setOrganization(organization);
		  departmentListNewDepartment = em.merge(departmentListNewDepartment);
		  if (oldOrganizationOfDepartmentListNewDepartment != null && !oldOrganizationOfDepartmentListNewDepartment.equals(organization)) {
			oldOrganizationOfDepartmentListNewDepartment.getDepartmentList().remove(departmentListNewDepartment);
			oldOrganizationOfDepartmentListNewDepartment = em.merge(oldOrganizationOfDepartmentListNewDepartment);
		  }
		}
	  }
	  em.getTransaction().commit();
	} catch (Exception ex) {
	  String msg = ex.getLocalizedMessage();
	  if (msg == null || msg.length() == 0) {
		Integer id = organization.getId();
		if (findOrganization(id) == null) {
		  throw new NonexistentEntityException("The organization with id " + id + " no longer exists.");
		}
	  }
	  throw ex;
	} finally {
	  if (em != null) {
		em.close();
	  }
	}
  }

  public void destroy(Integer id) throws IllegalOrphanException, NonexistentEntityException {
	EntityManager em = null;
	try {
	  em = getEntityManager();
	  em.getTransaction().begin();
	  Organization organization;
	  try {
		organization = em.getReference(Organization.class, id);
		organization.getId();
	  } catch (EntityNotFoundException enfe) {
		throw new NonexistentEntityException("The organization with id " + id + " no longer exists.", enfe);
	  }
	  List<String> illegalOrphanMessages = null;
	  List<Department> departmentListOrphanCheck = organization.getDepartmentList();
	  for (Department departmentListOrphanCheckDepartment : departmentListOrphanCheck) {
		if (illegalOrphanMessages == null) {
		  illegalOrphanMessages = new ArrayList<String>();
		}
		illegalOrphanMessages.add("This Organization (" + organization + ") cannot be destroyed since the Department " + departmentListOrphanCheckDepartment + " in its departmentList field has a non-nullable organization field.");
	  }
	  if (illegalOrphanMessages != null) {
		throw new IllegalOrphanException(illegalOrphanMessages);
	  }
	  em.remove(organization);
	  em.getTransaction().commit();
	} finally {
	  if (em != null) {
		em.close();
	  }
	}
  }

  public List<Organization> findOrganizationEntities() {
	return findOrganizationEntities(true, -1, -1);
  }

  public List<Organization> findOrganizationEntities(int maxResults, int firstResult) {
	return findOrganizationEntities(false, maxResults, firstResult);
  }

  private List<Organization> findOrganizationEntities(boolean all, int maxResults, int firstResult) {
	EntityManager em = getEntityManager();
	try {
	  CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
	  cq.select(cq.from(Organization.class));
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

  public Organization findOrganization(Integer id) {
	EntityManager em = getEntityManager();
	try {
	  return em.find(Organization.class, id);
	} finally {
	  em.close();
	}
  }

  public int getOrganizationCount() {
	EntityManager em = getEntityManager();
	try {
	  CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
	  Root<Organization> rt = cq.from(Organization.class);
	  cq.select(em.getCriteriaBuilder().count(rt));
	  Query q = em.createQuery(cq);
	  return ((Long) q.getSingleResult()).intValue();
	} finally {
	  em.close();
	}
  }
  
}
