package com.poly.entity;
// Generated Jul 22, 2019 3:26:12 PM by Hibernate Tools 4.3.5.Final

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
 * Syllabus generated by hbm2java
 */
@Entity
@Table(name = "Syllabus", schema = "dbo", catalog = "Learn_code_db")
public class Syllabus {

	private Integer id;
	private Course course;
	private String name;
	private int order;
	private String description;
	private String code;
	private boolean isActive;
	private boolean isDeleted;
	private Set<Lession> lessions = new HashSet<Lession>(0);

	public Syllabus() {
	}

	public Syllabus(Course course, String name, int order, String description, String code,
			boolean isActive, boolean isDeleted) {
		this.course = course;
		this.name = name;
		this.order = order;
		this.description = description;
		this.code = code;
		this.isActive = isActive;
		this.isDeleted = isDeleted;
	}

	public Syllabus(Course course, String name, int order, String description, String code,
			boolean isActive, boolean isDeleted, Set<Lession> lessions) {
		this.course = course;
		this.name = name;
		this.order = order;
		this.description = description;
		this.code = code;
		this.isActive = isActive;
		this.isDeleted = isDeleted;
		this.lessions = lessions;
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
	@JoinColumn(name = "Language_id", nullable = false)
	public Course getCourse() {
		return this.course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	@Column(name = "name", nullable = false)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "order", nullable = false)
	public int getOrder() {
		return this.order;
	}

	public void setOrder(int order) {
		this.order = order;
	}

	@Column(name = "description", nullable = false)
	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Column(name = "code", nullable = false, length = 32)
	public String getCode() {
		return this.code;
	}

	public void setCode(String code) {
		this.code = code;
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

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "syllabus")
	public Set<Lession> getLessions() {
		return this.lessions;
	}

	public void setLessions(Set<Lession> lessions) {
		this.lessions = lessions;
	}

}
