package com.utill;

public class ResultReturn<T> {
	private int count;
	private T data;
	
	public ResultReturn(T data) {
		this.data = data;
	}
	
	public ResultReturn(int count, T data) {
		this.count = count;
		this.data = data;
	}
	
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public T getData() {
		return data;
	}
	public void setData(T data) {
		this.data = data;
	}
}
