package com.poly.entity;
// Generated Jul 22, 2019 3:26:12 PM by Hibernate Tools 4.3.5.Final

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Member generated by hbm2java
 */
@Entity
@Table(name = "Member", schema = "dbo", catalog = "Learn_code_db")
public class Member implements java.io.Serializable {

	private Integer id;
	private User user;
	private Serializable name;
	private String email;
	private Serializable address;
	private Serializable profileimage;
	private boolean isActive;
	private boolean isDeleted;
	private Set<Record> records = new HashSet<Record>(0);

	public Member() {
	}

	public Member(User user, Serializable name, String email, Serializable address, Serializable profileimage,
			boolean isActive, boolean isDeleted) {
		this.user = user;
		this.name = name;
		this.email = email;
		this.address = address;
		this.profileimage = profileimage;
		this.isActive = isActive;
		this.isDeleted = isDeleted;
	}

	public Member(User user, Serializable name, String email, Serializable address, Serializable profileimage,
			boolean isActive, boolean isDeleted, Set<Record> records) {
		this.user = user;
		this.name = name;
		this.email = email;
		this.address = address;
		this.profileimage = profileimage;
		this.isActive = isActive;
		this.isDeleted = isDeleted;
		this.records = records;
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

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "User_id", nullable = false)
	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Column(name = "name", nullable = false)
	public Serializable getName() {
		return this.name;
	}

	public void setName(Serializable name) {
		this.name = name;
	}

	@Column(name = "email", nullable = false, length = 512)
	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "address", nullable = false)
	public Serializable getAddress() {
		return this.address;
	}

	public void setAddress(Serializable address) {
		this.address = address;
	}

	@Column(name = "profileimage", nullable = false)
	public Serializable getProfileimage() {
		return this.profileimage;
	}

	public void setProfileimage(Serializable profileimage) {
		this.profileimage = profileimage;
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

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "member")
	public Set<Record> getRecords() {
		return this.records;
	}

	public void setRecords(Set<Record> records) {
		this.records = records;
	}

}
