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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * AdminModule generated by hbm2java
 */
@Entity
@Table(name = "AdminModule", schema = "dbo", catalog = "Learn_code_db")
public class AdminModule implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1244574887826371749L;
	private Integer id;
	private AdminModule adminModule;
	private String name;
	private String controller;
	private String icon;
	private Boolean isShow;
	private Boolean isDeleted;
	private Integer orderNumber;
	private Set<AdminModuleInRole> adminModuleInRoles = new HashSet<AdminModuleInRole>(0);
	private Set<AdminModule> adminModules = new HashSet<AdminModule>(0);

	public AdminModule() {
	}

	public AdminModule(AdminModule adminModule, String name, String controller, String icon, Boolean isShow,
			Boolean isDeleted, Integer orderNumber, Set<AdminModuleInRole> adminModuleInRoles,
			Set<AdminModule> adminModules) {
		this.adminModule = adminModule;
		this.name = name;
		this.controller = controller;
		this.icon = icon;
		this.isShow = isShow;
		this.isDeleted = isDeleted;
		this.orderNumber = orderNumber;
		this.adminModuleInRoles = adminModuleInRoles;
		this.adminModules = adminModules;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "ID", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "ParentID")
	public AdminModule getAdminModule() {
		return this.adminModule;
	}

	public void setAdminModule(AdminModule adminModule) {
		this.adminModule = adminModule;
	}

	@Column(name = "Name")
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "Controller", length = 150)
	public String getController() {
		return this.controller;
	}

	public void setController(String controller) {
		this.controller = controller;
	}

	@Column(name = "Icon", length = 50)
	public String getIcon() {
		return this.icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	@Column(name = "IsShow")
	public Boolean getIsShow() {
		return this.isShow;
	}

	public void setIsShow(Boolean isShow) {
		this.isShow = isShow;
	}

	@Column(name = "IsDeleted")
	public Boolean getIsDeleted() {
		return this.isDeleted;
	}

	public void setIsDeleted(Boolean isDeleted) {
		this.isDeleted = isDeleted;
	}

	@Column(name = "OrderNumber")
	public Integer getOrderNumber() {
		return this.orderNumber;
	}

	public void setOrderNumber(Integer orderNumber) {
		this.orderNumber = orderNumber;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "adminModule")
	public Set<AdminModuleInRole> getAdminModuleInRoles() {
		return this.adminModuleInRoles;
	}

	public void setAdminModuleInRoles(Set<AdminModuleInRole> adminModuleInRoles) {
		this.adminModuleInRoles = adminModuleInRoles;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "adminModule")
	public Set<AdminModule> getAdminModules() {
		return this.adminModules;
	}

	public void setAdminModules(Set<AdminModule> adminModules) {
		this.adminModules = adminModules;
	}

}
