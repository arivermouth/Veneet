package model;

public class Vene {
	private int tunnus, hinta;
	private String nimi, merkkimalli;
	private double pituus, leveys;
	public Vene() {
		super();
	}
	public Vene(int tunnus, String nimi, String merkkimalli, double pituus, double leveys, int hinta) {
		super();
		this.tunnus = tunnus;
		this.hinta = hinta;
		this.nimi = nimi;
		this.merkkimalli = merkkimalli;
		this.pituus = pituus;
		this.leveys = leveys;
	}
	public int getTunnus() {
		return tunnus;
	}
	public void setTunnus(int tunnus) {
		this.tunnus = tunnus;
	}
	public int getHinta() {
		return hinta;
	}
	public void setHinta(int hinta) {
		this.hinta = hinta;
	}
	public String getNimi() {
		return nimi;
	}
	public void setNimi(String nimi) {
		this.nimi = nimi;
	}
	public String getMerkkimalli() {
		return merkkimalli;
	}
	public void setMerkkimalli(String merkkimalli) {
		this.merkkimalli = merkkimalli;
	}
	public double getPituus() {
		return pituus;
	}
	public void setPituus(double pituus) {
		this.pituus = pituus;
	}
	public double getLeveys() {
		return leveys;
	}
	public void setLeveys(double leveys) {
		this.leveys = leveys;
	}
	@Override
	public String toString() {
		return "Vene [tunnus=" + tunnus + ", hinta=" + hinta + ", nimi=" + nimi + ", merkkimalli=" + merkkimalli
				+ ", pituus=" + pituus + ", leveys=" + leveys + "]";
	}
	
}