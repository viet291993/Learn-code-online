package com.poly.entity;
// Generated Jul 24, 2019 11:22:08 PM by Hibernate Tools 5.0.6.Final

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
 * Record generated by hbm2java
 */
@Entity
@Table(name = "Record", schema = "dbo", catalog = "Learn_code_db")
public class Record implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3098402535888938134L;
	private Integer id;
	private Course course;
	private Member member;
	private boolean correct;
	private boolean isActive;
	private boolean isDeleted;
	private Set<RecordQuestion> recordQuestions = new HashSet<RecordQuestion>(0);

	public Record() {
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
	@JoinColumn(name = "Course_id", nullable = false)
	public Course getCourse() {
		return this.course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "Member_id", nullable = false)
	public Member getMember() {
		return this.member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	@Column(name = "correct", nullable = false)
	public boolean isCorrect() {
		return this.correct;
	}

	public void setCorrect(boolean correct) {
		this.correct = correct;
	}

	@Column(name = "isActive")
	public boolean isIsActive() {
		return this.isActive;
	}

	public void setIsActive(boolean isActive) {
		this.isActive = isActive;
	}

	@Column(name = "isDeleted")
	public boolean isIsDeleted() {
		return this.isDeleted;
	}

	public void setIsDeleted(boolean isDeleted) {
		this.isDeleted = isDeleted;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "record")
	public Set<RecordQuestion> getRecordQuestions() {
		return this.recordQuestions;
	}

	public void setRecordQuestions(Set<RecordQuestion> recordQuestions) {
		this.recordQuestions = recordQuestions;
	}

}
