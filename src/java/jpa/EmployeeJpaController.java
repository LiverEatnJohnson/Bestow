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
 * @author jeremiah.johnson5
 */
public class EmployeeJpaController implements Serializable {

  public EmployeeJpaController() {
	emf = Persistence.createEntityManagerFactory("BestowPU");
  }
  private EntityManagerFactory emf = null;

  public EntityManager getEntityManager() {
	return emf.createEntityManager();
  }

  public void create(Employee employee) throws IllegalOrphanException {
	if (employee.getDonationList() == null) {
	  employee.setDonationList(new ArrayList<Donation>());
	}
	List<String> illegalOrphanMessages = null;
	Department departmentOrphanCheck = employee.getDepartment();
//	if (departmentOrphanCheck != null) {
//	  Employee oldDirectorOfDepartment = departmentOrphanCheck.getDirector();
//	  if (oldDirectorOfDepartment != null) {
//		if (illegalOrphanMessages == null) {
//		  illegalOrphanMessages = new ArrayList<String>();
//		}
//		illegalOrphanMessages.add("The Department " + departmentOrphanCheck + " already has an item of type Employee whose department column cannot be null. Please make another selection for the department field.");
//	  }
//	}
	if (illegalOrphanMessages != null) {
	  throw new IllegalOrphanException(illegalOrphanMessages);
	}
	EntityManager em = null;
	try {
	  em = getEntityManager();
	  em.getTransaction().begin();
	  Department department = employee.getDepartment();
	  if (department != null) { 
		department = em.getReference(department.getClass(), department.getId());
		employee.setDepartment(department);
                department.getEmployeeList().add(employee);
                department = em.merge(department);
	  }   
	  List<Donation> attachedDonationList = new ArrayList<Donation>();
	  for (Donation donationListDonationToAttach : employee.getDonationList()) {
		donationListDonationToAttach = em.getReference(donationListDonationToAttach.getClass(), donationListDonationToAttach.getId());
		attachedDonationList.add(donationListDonationToAttach);
	  }
	  employee.setDonationList(attachedDonationList);
	  em.persist(employee);
//	  if (department != null) {
//		department.setDirector(employee);
//		department = em.merge(department);
//	  }
	  for (Donation donationListDonation : employee.getDonationList()) {
		Employee oldEmployeeOfDonationListDonation = donationListDonation.getEmployee();
		donationListDonation.setEmployee(employee);
		donationListDonation = em.merge(donationListDonation);
		if (oldEmployeeOfDonationListDonation != null) {
		  oldEmployeeOfDonationListDonation.getDonationList().remove(donationListDonation);
		  oldEmployeeOfDonationListDonation = em.merge(oldEmployeeOfDonationListDonation);
		}
	  }
	  em.getTransaction().commit();
	} finally {
	  if (em != null) {
		em.close();
	  }
	}
  }

  public void edit(Employee employee) throws IllegalOrphanException, NonexistentEntityException, Exception {
	EntityManager em = null;
	try {
	  em = getEntityManager();
	  em.getTransaction().begin();
	  Employee persistentEmployee = em.find(Employee.class, employee.getId());
	  Department departmentOld = persistentEmployee.getDepartment();
	  Department departmentNew = employee.getDepartment();
            List<Donation> donationListOld = persistentEmployee.getDonationList();
            List<Donation> donationListNew = employee.getDonationList();
	  List<String> illegalOrphanMessages = null;
            for (Donation donationListOldDonation : donationListOld) {
                if (!donationListNew.contains(donationListOldDonation)) {
                    if (illegalOrphanMessages == null) {
                        illegalOrphanMessages = new ArrayList<String>();
                    }
                    illegalOrphanMessages.add("You must retain Donation " + donationListOldDonation + " since its employee field is not nullable.");
                }
            }
	  if (illegalOrphanMessages != null) {
		throw new IllegalOrphanException(illegalOrphanMessages);
	  }
	  if (departmentNew != null) {
		departmentNew = em.getReference(departmentNew.getClass(), departmentNew.getId());
		employee.setDepartment(departmentNew);
	  }
            List<Donation> attachedDonationListNew = new ArrayList<Donation>();
            for (Donation donationListNewDonationToAttach : donationListNew) {
                donationListNewDonationToAttach = em.getReference(donationListNewDonationToAttach.getClass(), donationListNewDonationToAttach.getId());
                attachedDonationListNew.add(donationListNewDonationToAttach);
            }
            donationListNew = attachedDonationListNew;
            employee.setDonationList(donationListNew);
	  employee = em.merge(employee);
	  if (departmentOld != null && !departmentOld.equals(departmentNew)) {
		departmentOld.getEmployeeList().remove(employee);
		if (departmentOld.getDirector() != null) {
		  if (departmentOld.getDirector().equals(employee)) { 
			departmentOld.setDirector(null);
		  }
		}
		departmentOld = em.merge(departmentOld);
	  }
	  if (departmentNew != null && !departmentNew.equals(departmentOld)) {
		departmentNew.getEmployeeList().add(employee);
		departmentNew = em.merge(departmentNew);
	  }
            for (Donation donationListNewDonation : donationListNew) {
                if (!donationListOld.contains(donationListNewDonation)) {
                    Employee oldEmployeeOfDonationListNewDonation = donationListNewDonation.getEmployee();
                    donationListNewDonation.setEmployee(employee);
                    donationListNewDonation = em.merge(donationListNewDonation);
                    if (oldEmployeeOfDonationListNewDonation != null && !oldEmployeeOfDonationListNewDonation.equals(employee)) {
                        oldEmployeeOfDonationListNewDonation.getDonationList().remove(donationListNewDonation);
                        oldEmployeeOfDonationListNewDonation = em.merge(oldEmployeeOfDonationListNewDonation);
                    }
                }
            }
	  em.getTransaction().commit();
	} catch (Exception ex) {
	  String msg = ex.getLocalizedMessage();
	  if (msg == null || msg.length() == 0) {
		Long id = employee.getId();
		if (findEmployee(id) == null) {
		  throw new NonexistentEntityException("The employee with id " + id + " no longer exists.");
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
	  Employee employee;
	  try {
		employee = em.getReference(Employee.class, id);
		employee.getId();
	  } catch (EntityNotFoundException enfe) {
		throw new NonexistentEntityException("The employee with id " + id + " no longer exists.", enfe);
	  }
	  List<String> illegalOrphanMessages = null;
	  List<Donation> donationListOrphanCheck = employee.getDonationList();
	  for (Donation donationListOrphanCheckDonation : donationListOrphanCheck) {
		if (illegalOrphanMessages == null) {
		  illegalOrphanMessages = new ArrayList<String>();
		}
		illegalOrphanMessages.add("This Employee (" + employee + ") cannot be destroyed since the Donation " + donationListOrphanCheckDonation + " in its donationList field has a non-nullable employee field.");
	  }
	  if (illegalOrphanMessages != null) {
		throw new IllegalOrphanException(illegalOrphanMessages);
	  }
	  Department department = employee.getDepartment();
	  if (department != null) {
		department.setDirector(null);
		department = em.merge(department);
	  }
	  em.remove(employee);
	  em.getTransaction().commit();
	} finally {
	  if (em != null) {
		em.close();
	  }
	}
  }

  public List<Employee> findEmployeeEntities() {
	return findEmployeeEntities(true, -1, -1);
  }

  public List<Employee> findEmployeeEntities(int maxResults, int firstResult) {
	return findEmployeeEntities(false, maxResults, firstResult);
  }

  private List<Employee> findEmployeeEntities(boolean all, int maxResults, int firstResult) {
	EntityManager em = getEntityManager();
	try {
	  CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
	  cq.select(cq.from(Employee.class));
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

  public Employee findEmployee(Long id) {
	EntityManager em = getEntityManager();
	try {
	  return em.find(Employee.class, id);
	} finally {
	  em.close();
	}
  }

  public int getEmployeeCount() {
	EntityManager em = getEntityManager();
	try {
	  CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
	  Root<Employee> rt = cq.from(Employee.class);
	  cq.select(em.getCriteriaBuilder().count(rt));
	  Query q = em.createQuery(cq);
	  return ((Long) q.getSingleResult()).intValue();
	} finally {
	  em.close();
	}
  }
}
