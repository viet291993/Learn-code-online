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
import javax.persistence.OrderBy;
import javax.persistence.Table;

import org.hibernate.annotations.Where;

/**
 * Lession generated by hbm2java
 */
@Entity
@Table(name = "Lession", schema = "dbo", catalog = "Learn_code_db")
public class Lession implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 8032835126430843111L;
	private Integer id;
	private LessionType lessionType;
	private Syllabus syllabus;
	private String name;
	private int orderDisplay;
	private String description;
	private String content;
	private String nameAscii;
	private String code;
	private boolean isActive;
	private boolean isDeleted;
	private boolean isPro;
	private Set<Question> questions = new HashSet<Question>(0);

	public Lession() {
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

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "LessionType_id", nullable = false)
	public LessionType getLessionType() {
		return this.lessionType;
	}

	public void setLessionType(LessionType lessionType) {
		this.lessionType = lessionType;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "Syllabus_id", nullable = false)
	public Syllabus getSyllabus() {
		return this.syllabus;
	}

	public void setSyllabus(Syllabus syllabus) {
		this.syllabus = syllabus;
	}

	@Column(name = "name", nullable = false)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "orderDisplay", nullable = false, unique = true)
	public int getOrderDisplay() {
		return this.orderDisplay;
	}

	public void setOrderDisplay(int orderDisplay) {
		this.orderDisplay = orderDisplay;
	}

	@Column(name = "description", nullable = false)
	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Column(name = "content", nullable = false)
	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Column(name = "nameAscii", nullable = false)
	public String getNameAscii() {
		return nameAscii;
	}

	public void setNameAscii(String nameAscii) {
		this.nameAscii = nameAscii;
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

	@Column(name = "isPro", nullable = false)
	public boolean isIsPro() {
		return this.isPro;
	}

	public void setIsPro(boolean isPro) {
		this.isPro = isPro;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "lession")
	@OrderBy("orderDisplay ASC")
	@Where(clause= "isDeleted = 0")
	public Set<Question> getQuestions() {
		return this.questions;
	}

	public void setQuestions(Set<Question> questions) {
		this.questions = questions;
	}
}
