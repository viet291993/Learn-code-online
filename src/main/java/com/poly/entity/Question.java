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
 * Question generated by hbm2java
 */
@Entity
@Table(name = "Question", schema = "dbo", catalog = "Learn_code_db")
public class Question implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4965841764265309538L;
	private Integer id;
	private Lession lession;
	private String instruction;
	private String hint;
	private String result;
	private Integer orderDisplay;
	private String description;
	private String defaultCode;
	private String code;
	private Integer resultQuiz;
	private boolean isActive;
	private boolean isDeleted;
	private Set<Quiz> quizs = new HashSet<Quiz>(0);
	private Set<RecordQuestion> recordQuestions = new HashSet<RecordQuestion>(0);

	public Question() {
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
	@JoinColumn(name = "Lession_id")
	public Lession getLession() {
		return this.lession;
	}

	public void setLession(Lession lession) {
		this.lession = lession;
	}

	@Column(name = "instruction")
	public String getInstruction() {
		return this.instruction;
	}

	public void setInstruction (String instruction) {
		this.instruction = instruction;
	}

	@Column(name = "hint")
	public String getHint() {
		return this.hint;
	}

	public void setHint (String hint) {
		this.hint = hint;
	}

	@Column(name = "result")
	public String getResult() {
		return this.result;
	}

	public void setResult (String result) {
		this.result = result;
	}

	@Column(name = "orderDisplay")
	public Integer getOrderDisplay() {
		return this.orderDisplay;
	}

	public void setOrderDisplay(Integer orderDisplay) {
		this.orderDisplay = orderDisplay;
	}

	@Column(name = "description")
	public String getDescription() {
		return this.description;
	}

	public void setDescription (String description) {
		this.description = description;
	}

	@Column(name = "default_code")
	public String getDefaultCode() {
		return this.defaultCode;
	}

	public void setDefaultCode (String defaultCode) {
		this.defaultCode = defaultCode;
	}

	@Column(name = "code", length = 32)
	public String getCode() {
		return this.code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	@Column(name = "result_quiz")
	public Integer getResultQuiz() {
		return this.resultQuiz;
	} 

	public void setResultQuiz(Integer resultQuiz) {
		this.resultQuiz = resultQuiz;
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

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "question")
	public Set<Quiz> getQuizs() {
		return this.quizs;
	}

	public void setQuizs(Set<Quiz> quizs) {
		this.quizs = quizs;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "question")
	public Set<RecordQuestion> getRecordQuestions() {
		return this.recordQuestions;
	}

	public void setRecordQuestions(Set<RecordQuestion> recordQuestions) {
		this.recordQuestions = recordQuestions;
	}
}
