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
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * User generated by hbm2java
 */
@Entity
@Table(name = "User", schema = "dbo", catalog = "Learn_code_db")
public class User implements java.io.Serializable {

	private Integer id;
	private String username;
	private String password;
	private String key;
	private boolean isActive;
	private boolean isDeleted;
	private Set<Member> members = new HashSet<Member>(0);
	private Set<Topic> topics = new HashSet<Topic>(0);
	private Set<Admin> admins = new HashSet<Admin>(0);
	private Set<Post> posts = new HashSet<Post>(0);

	public User() {
	}

	public User(String username, String password, String key, boolean isActive, boolean isDeleted) {
		this.username = username;
		this.password = password;
		this.key = key;
		this.isActive = isActive;
		this.isDeleted = isDeleted;
	}

	public User(String username, String password, String key, boolean isActive, boolean isDeleted, Set<Member> members,
			Set<Topic> topics, Set<Admin> admins, Set<Post> posts) {
		this.username = username;
		this.password = password;
		this.key = key;
		this.isActive = isActive;
		this.isDeleted = isDeleted;
		this.members = members;
		this.topics = topics;
		this.admins = admins;
		this.posts = posts;
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

	@Column(name = "username", nullable = false, length = 32)
	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Column(name = "password", nullable = false, length = 256)
	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(name = "key", nullable = false, length = 8)
	public String getKey() {
		return this.key;
	}

	public void setKey(String key) {
		this.key = key;
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

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "user")
	public Set<Member> getMembers() {
		return this.members;
	}

	public void setMembers(Set<Member> members) {
		this.members = members;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "user")
	public Set<Topic> getTopics() {
		return this.topics;
	}

	public void setTopics(Set<Topic> topics) {
		this.topics = topics;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "user")
	public Set<Admin> getAdmins() {
		return this.admins;
	}

	public void setAdmins(Set<Admin> admins) {
		this.admins = admins;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "user")
	public Set<Post> getPosts() {
		return this.posts;
	}

	public void setPosts(Set<Post> posts) {
		this.posts = posts;
	}

}
