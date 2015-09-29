package com.bean;

public class Url {
	
	private int    tenant_url_id;
	private String tenant_name;
    private String tenant_desc;
    private String tenant_url;
	
    public String getTenant_name() {
		return tenant_name;
	}
	public void setTenant_name(String tenant_name) {
		this.tenant_name = tenant_name;
	}
	public String getTenant_desc() {
		return tenant_desc;
	}
	public void setTenant_desc(String tenant_desc) {
		this.tenant_desc = tenant_desc;
	}
	public String getTenant_url() {
		return tenant_url;
	}
	public void setTenant_url(String tenant_url) {
		this.tenant_url = tenant_url;
	}
	public int getTenant_url_id() {
		return tenant_url_id;
	}
	public void setTenant_url_id(int tenant_url_id) {
		this.tenant_url_id = tenant_url_id;
	}
}