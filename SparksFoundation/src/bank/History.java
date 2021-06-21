package bank;

public class History {
	private String Ref_id;
	private String to;
	private String from;
	private String date;
	private String time;
	private String amount;
	public String getRef_id() {
		return Ref_id;
	}
	public void setRef_id(String ref_id) {
		Ref_id = ref_id;
	}
	public String getTo() {
		return to;
	}
	public void setTo(String to) {
		this.to = to;
	}
	public String getFrom() {
		return from;
	}
	public void setFrom(String from) {
		this.from = from;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}

}
