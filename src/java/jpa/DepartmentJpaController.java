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
import entity.Donation;
import entity.Employee;
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
public class DepartmentJpaController implements Serializable {

  public DepartmentJpaController() {
	emf = Persistence.createEntityManagerFactory("BestowPU");
  }
  private EntityManagerFactory emf = null;

  public EntityManager getEntityManager() {
	return emf.createEntityManager();
  }

  public void create(Department department) {
	if (department.getDonationList() == null) {
	  department.setDonationList(new ArrayList<Donation>());
	}
	if (department.getEmployeeList() == null) {
	  department.setEmployeeList(new ArrayList<Employee>());
	}
	EntityManager em = null;
	try {
	  em = getEntityManager();
	  em.getTransaction().begin();
	  Organization organization = department.getOrganization();
	  if (organization != null) {
		organization = em.getReference(organization.getClass(), organization.getId());
		department.setOrganization(organization);
	  }
	  List<Donation> attachedDonationList = new ArrayList<Donation>();
	  for (Donation donationListDonationToAttach : department.getDonationList()) {
		donationListDonationToAttach = em.getReference(donationListDonationToAttach.getClass(), donationListDonationToAttach.getId());
		attachedDonationList.add(donationListDonationToAttach);
	  }
	  department.setDonationList(attachedDonationList);
	  List<Employee> attachedEmployeeList = new ArrayList<Employee>();
	  for (Employee employeeListEmployeeToAttach : department.getEmployeeList()) {
		employeeListEmployeeToAttach = em.getReference(employeeListEmployeeToAttach.getClass(), employeeListEmployeeToAttach.getId());
		attachedEmployeeList.add(employeeListEmployeeToAttach);
	  }
	  department.setEmployeeList(attachedEmployeeList);
	  em.persist(department);
	  if (organization != null) {
		organization.getDepartmentList().add(department);
		organization = em.merge(organization);
	  }
	  for (Donation donationListDonation : department.getDonationList()) {
		Department oldDepartmentOfDonationListDonation = donationListDonation.getDepartment();
		donationListDonation.setDepartment(department);
		donationListDonation = em.merge(donationListDonation);
		if (oldDepartmentOfDonationListDonation != null) {
		  oldDepartmentOfDonationListDonation.getDonationList().remove(donationListDonation);
		  oldDepartmentOfDonationListDonation = em.merge(oldDepartmentOfDonationListDonation);
		}
	  }
	  for (Employee employeeListEmployee : department.getEmployeeList()) {
		Department oldDepartmentOfEmployeeListEmployee = employeeListEmployee.getDepartment();
		employeeListEmployee.setDepartment(department);
		employeeListEmployee = em.merge(employeeListEmployee);
		if (oldDepartmentOfEmployeeListEmployee != null) {
		  oldDepartmentOfEmployeeListEmployee.getEmployeeList().remove(employeeListEmployee);
		  oldDepartmentOfEmployeeListEmployee = em.merge(oldDepartmentOfEmployeeListEmployee);
		}
	  }
	  em.getTransaction().commit();
	} finally {
	  if (em != null) {
		em.close();
	  }
	}
  }

  public void edit(Department department) throws IllegalOrphanException, NonexistentEntityException, Exception {
	EntityManager em = null;
	try {
	  em = getEntityManager();
	  em.getTransaction().begin();
	  Department persistentDepartment = em.find(Department.class, department.getId());
	  Employee directorOld = persistentDepartment.getDirector();
	  Employee directorNew = department.getDirector();
	  Organization organizationOld = persistentDepartment.getOrganization();
	  Organization organizationNew = department.getOrganization();
	  List<Donation> donationListOld = persistentDepartment.getDonationList();
	  List<Donation> donationListNew = department.getDonationList();
	  List<Employee> employeeListOld = persistentDepartment.getEmployeeList();
	  List<Employee> employeeListNew = department.getEmployeeList();
	  List<String> illegalOrphanMessages = null;
	  for (Donation donationListOldDonation : donationListOld) {
		if (!donationListNew.contains(donationListOldDonation)) {
		  if (illegalOrphanMessages == null) {
			illegalOrphanMessages = new ArrayList<String>();
		  }
		  illegalOrphanMessages.add("You must retain Department " + donationListOldDonation + " since its department field is not nullable.");
		}
	  }
	  for (Employee employeeListOldEmployee : employeeListOld) {
		if (!employeeListNew.contains(employeeListOldEmployee)) {
		  if (illegalOrphanMessages == null) {
			illegalOrphanMessages = new ArrayList<String>();
		  }
		  illegalOrphanMessages.add("You must retain Department " + employeeListOldEmployee + " since its department field is not nullable.");
		}
	  }
	  if (illegalOrphanMessages != null) {
		throw new IllegalOrphanException(illegalOrphanMessages);
	  }
	  if (directorNew != null) {
		directorNew = em.getReference(directorNew.getClass(), directorNew.getId());
		department.setDirector(directorNew);
	  }
	  if (organizationNew != null) {
		organizationNew = em.getReference(organizationNew.getClass(), organizationNew.getId());
		department.setOrganization(organizationNew);
	  }
	  List<Donation> attachedDonationListNew = new ArrayList<Donation>();
	  for (Donation donationListNewDonationToAttach : donationListNew) {
		donationListNewDonationToAttach = em.getReference(donationListNewDonationToAttach.getClass(), donationListNewDonationToAttach.getId());
		attachedDonationListNew.add(donationListNewDonationToAttach);
	  }
	  donationListNew = attachedDonationListNew;
	  department.setDonationList(donationListNew);
	  List<Employee> attachedEmployeeListNew = new ArrayList<Employee>();
	  for (Employee employeeListNewEmployeeToAttach : employeeListNew) {
		employeeListNewEmployeeToAttach = em.getReference(employeeListNewEmployeeToAttach.getClass(), employeeListNewEmployeeToAttach.getId());
		attachedEmployeeListNew.add(employeeListNewEmployeeToAttach);
	  }
	  employeeListNew = attachedEmployeeListNew;
	  department.setEmployeeList(employeeListNew);
	  department = em.merge(department);
	  if (organizationOld != null && !organizationOld.equals(organizationNew)) {
		organizationOld.getDepartmentList().remove(department);
		organizationOld = em.merge(organizationOld);
	  }
	  if (organizationNew != null && !organizationNew.equals(organizationOld)) {
		organizationNew.getDepartmentList().add(department);
		organizationNew = em.merge(organizationNew);
	  }
	  for (Donation donationListNewDonation : donationListNew) {
		if (!donationListOld.contains(donationListNewDonation)) {
		  Department oldDepartmentOfDonationListNewDonation = donationListNewDonation.getDepartment();
		  donationListNewDonation.setDepartment(department);
		  donationListNewDonation = em.merge(donationListNewDonation);
		  if (oldDepartmentOfDonationListNewDonation != null && !oldDepartmentOfDonationListNewDonation.equals(department)) {
			oldDepartmentOfDonationListNewDonation.getDonationList().remove(donationListNewDonation);
			oldDepartmentOfDonationListNewDonation = em.merge(oldDepartmentOfDonationListNewDonation);
		  }
		}
	  }
	  for (Employee employeeListNewEmployee : employeeListNew) {
		if (!employeeListOld.contains(employeeListNewEmployee)) {
		  Department oldDepartmentOfEmployeeListNewEmployee = employeeListNewEmployee.getDepartment();
		  employeeListNewEmployee.setDepartment(department);
		  employeeListNewEmployee = em.merge(employeeListNewEmployee);
		  if (oldDepartmentOfEmployeeListNewEmployee != null && !oldDepartmentOfEmployeeListNewEmployee.equals(department)) {
			oldDepartmentOfEmployeeListNewEmployee.getEmployeeList().remove(employeeListNewEmployee);
			oldDepartmentOfEmployeeListNewEmployee = em.merge(oldDepartmentOfEmployeeListNewEmployee);
		  }
		}
	  }
	  em.getTransaction().commit();
	} catch (Exception ex) {
	  String msg = ex.getLocalizedMessage();
	  if (msg == null || msg.length() == 0) {
		Integer id = department.getId();
		if (findDepartment(id) == null) {
		  throw new NonexistentEntityException("The department with id " + id + " no longer exists.");
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
	  Department department;
	  try {
		department = em.getReference(Department.class, id);
		department.getId();
	  } catch (EntityNotFoundException enfe) {
		throw new NonexistentEntityException("The department with id " + id + " no longer exists.", enfe);
	  }
	  List<String> illegalOrphanMessages = null;
	  Employee directorOrphanCheck = department.getDirector();
	  if (directorOrphanCheck != null) {
		if (illegalOrphanMessages == null) {
		  illegalOrphanMessages = new ArrayList<String>();
		}
		illegalOrphanMessages.add("This Department (" + department + ") cannot be destroyed since the Employee " + directorOrphanCheck + " in its director field has a non-nullable department field.");
	  }
	  List<Donation> donationListOrphanCheck = department.getDonationList();
	  for (Donation donationListOrphanCheckDonation : donationListOrphanCheck) {
		if (illegalOrphanMessages == null) {
		  illegalOrphanMessages = new ArrayList<String>();
		}
		illegalOrphanMessages.add("This Department (" + department + ") cannot be destroyed since the Donation " + donationListOrphanCheckDonation + " in its donationList field has a non-nullable department field.");
	  }
	  List<Employee> employeeListOrphanCheck = department.getEmployeeList();
	  for (Employee employeeListOrphanCheckEmployee : employeeListOrphanCheck) {
		if (illegalOrphanMessages == null) {
		  illegalOrphanMessages = new ArrayList<String>();
		}
		illegalOrphanMessages.add("This Department (" + department + ") cannot be destroyed since the Employee " + employeeListOrphanCheckEmployee + " in its employeeList field has a non-nullable department field.");
	  }
	  if (illegalOrphanMessages != null) {
		throw new IllegalOrphanException(illegalOrphanMessages);
	  }
	  Organization organization = department.getOrganization();
	  if (organization != null) {
		organization.getDepartmentList().remove(department);
		organization = em.merge(organization);
	  }
	  em.remove(department);
	  em.getTransaction().commit();
	} finally {
	  if (em != null) {
		em.close();
	  }
	}
  }

  public List<Department> findDepartmentEntities() {
	return findDepartmentEntities(true, -1, -1);
  }

  public List<Department> findDepartmentEntities(int maxResults, int firstResult) {
	return findDepartmentEntities(false, maxResults, firstResult);
  }

  private List<Department> findDepartmentEntities(boolean all, int maxResults, int firstResult) {
	EntityManager em = getEntityManager();
	try {
	  CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
	  cq.select(cq.from(Department.class));
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

  public Department findDepartment(Integer id) {
	EntityManager em = getEntityManager();
	try {
	  return em.find(Department.class, id);
	} finally {
	  em.close();
	}
  }

  public int getDepartmentCount() {
	EntityManager em = getEntityManager();
	try {
	  CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
	  Root<Department> rt = cq.from(Department.class);
	  cq.select(em.getCriteriaBuilder().count(rt));
	  Query q = em.createQuery(cq);
	  return ((Long) q.getSingleResult()).intValue();
	} finally {
	  em.close();
	}
  }
  
}
