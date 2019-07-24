package com.poly.entity;
// Generated Jul 24, 2019 11:22:08 PM by Hibernate Tools 5.0.6.Final

import static javax.persistence.GenerationType.IDENTITY;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * AdminRole generated by hbm2java
 */
@Entity
@Table(name = "AdminRole", schema = "dbo", catalog = "Learn_code_db")
public class AdminRole implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7588412055616917350L;
	private Integer id;
	private String name;
	private boolean isActive;
	private boolean isDeleted;
	private Set<AdminModuleInRole> adminModuleInRoles = new HashSet<AdminModuleInRole>(0);
	private Set<Admin> admins = new HashSet<Admin>(0);

	public AdminRole() {
	}

	public AdminRole(String name, boolean isActive, boolean isDeleted) {
		this.name = name;
		this.isActive = isActive;
		this.isDeleted = isDeleted;
	}

	public AdminRole(String name, boolean isActive, boolean isDeleted, Set<AdminModuleInRole> adminModuleInRoles,
			Set<Admin> admins) {
		this.name = name;
		this.isActive = isActive;
		this.isDeleted = isDeleted;
		this.adminModuleInRoles = adminModuleInRoles;
		this.admins = admins;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "name", nullable = false)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "isActive", nullable = false)
	public boolean isIsActive() {
		return this.isActive;
	}

	public void setIsActive(boolean isActive) {
		this.isActive = isActive;
	}

	@Column(name = "isDeleted", nullable = false)
	public boolean isIsDeleted() {
		return this.isDeleted;
	}

	public void setIsDeleted(boolean isDeleted) {
		this.isDeleted = isDeleted;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "adminRole")
	public Set<AdminModuleInRole> getAdminModuleInRoles() {
		return this.adminModuleInRoles;
	}

	public void setAdminModuleInRoles(Set<AdminModuleInRole> adminModuleInRoles) {
		this.adminModuleInRoles = adminModuleInRoles;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "adminRole")
	public Set<Admin> getAdmins() {
		return this.admins;
	}

	public void setAdmins(Set<Admin> admins) {
		this.admins = admins;
	}

}
