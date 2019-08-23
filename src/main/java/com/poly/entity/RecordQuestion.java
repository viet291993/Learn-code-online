package com.poly.entity;
// Generated Jul 24, 2019 11:22:08 PM by Hibernate Tools 5.0.6.Final

import static javax.persistence.GenerationType.IDENTITY;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * RecordQuestion generated by hbm2java
 */
@Entity
@Table(name = "Record_Question", schema = "dbo", catalog = "Learn_code_db")
public class RecordQuestion implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7699114470336126387L;
	private Integer id;
	private Question question;
	private Record record;
	private String tempCode;
	private int resultQuiz;
	private boolean isPass;
	private Date lastUpdate;
	private boolean isActive;
	private boolean isDeleted;

	public RecordQuestion() {
	}

	public RecordQuestion(Question question, Record record, String tempCode, int resultQuiz, boolean isActive,
			boolean isDeleted) {
		this.question = question;
		this.record = record;
		this.tempCode = tempCode;
		this.resultQuiz = resultQuiz;
		this.isActive = isActive;
		this.isDeleted = isDeleted;
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
	@JoinColumn(name = "Question_id", nullable = false)
	public Question getQuestion() {
		return this.question;
	}

	public void setQuestion(Question question) {
		this.question = question;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "Record_id", nullable = false)
	public Record getRecord() {
		return this.record;
	}

	public void setRecord(Record record) {
		this.record = record;
	}

	@Column(name = "temp_code")
	public String getTempCode() {
		return this.tempCode;
	}

	public void setTempCode(String tempCode) {
		this.tempCode = tempCode;
	}

	@Column(name = "result_quiz")
	public int getResultQuiz() {
		return this.resultQuiz;
	}

	public void setResultQuiz(int resultQuiz) {
		this.resultQuiz = resultQuiz;
	}

	@Column(name = "isPass", nullable = false)
	public boolean isIsPass() {
		return this.isPass;
	}

	public void setIsPass(boolean isPass) {
		this.isPass = isPass;
	}
	
	@Column(name = "lastUpdate", nullable = false)
	public Date getLastUpdate() {
		return this.lastUpdate;
	}

	public void setLastUpdate(Date lastUpdate) {
		this.lastUpdate = lastUpdate;
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

}
