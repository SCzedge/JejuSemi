package accommodation.model.vo;

/**
 * @author Sangyoon Kim
 *
 */
public class Acm {
	
	private int acmNum;				
	private String acmName;			
	private String memNum;		// 사장님, 관리자쪽에서 조회할때 조인받아온 사장님 이름을 컬럼 추가 없이 여기에 넣어도 되요(string이라)
	private String acmPhone;		
	private String acmAddress;		
	private String acmType;			
	private int acmGrade;
	private String acmDescriptA;
	private String acmDescriptB;
	private String acmCoordX;		
	private String acmCoordY;
	private String acmDistrict;		
	private String acmPower;		
	private String status;
	private int minPrice;		// 사용자가 숙소 검색할때 보여줄 해당숙소의 가장 싼 방의 가격
	
	public Acm() {
		
	}
	
	

	public int getMinPrice() {
		return minPrice;
	}



	public void setMinPrice(int minPrice) {
		this.minPrice = minPrice;
	}

	

	public Acm(int acmNum, String acmName, String acmPhone, String acmAddress, String acmType, int acmGrade,
			String acmDescriptA, String acmDescriptB, String acmCoordX, String acmCoordY, String acmDistrict,
			String acmPower, String status) {
		super();
		this.acmNum = acmNum;
		this.acmName = acmName;
		this.acmPhone = acmPhone;
		this.acmAddress = acmAddress;
		this.acmType = acmType;
		this.acmGrade = acmGrade;
		this.acmDescriptA = acmDescriptA;
		this.acmDescriptB = acmDescriptB;
		this.acmCoordX = acmCoordX;
		this.acmCoordY = acmCoordY;
		this.acmDistrict = acmDistrict;
		this.acmPower = acmPower;
		this.status = status;
	}



	public Acm(int acmNum, String acmName, String memNum, String acmPhone, String acmAddress, String acmType,
			int acmGrade, String acmDescriptA, String acmDescriptB, String acmCoordX, String acmCoordY,
			String acmDistrict, String acmPower, String status, int minPrice) {
		super();
		this.acmNum = acmNum;
		this.acmName = acmName;
		this.memNum = memNum;
		this.acmPhone = acmPhone;
		this.acmAddress = acmAddress;
		this.acmType = acmType;
		this.acmGrade = acmGrade;
		this.acmDescriptA = acmDescriptA;
		this.acmDescriptB = acmDescriptB;
		this.acmCoordX = acmCoordX;
		this.acmCoordY = acmCoordY;
		this.acmDistrict = acmDistrict;
		this.acmPower = acmPower;
		this.status = status;
		this.minPrice = minPrice;
	}



	public Acm(int acmNum, String acmName, String memNum, String acmPhone, String acmAddress, String acmType,
			int acmGrade, String acmDescriptA, String acmDescriptB, String acmCoordX, String acmCoordY,
			String acmDistrict, String acmPower, String status) {
		super();
		this.acmNum = acmNum;
		this.acmName = acmName;
		this.memNum = memNum;
		this.acmPhone = acmPhone;
		this.acmAddress = acmAddress;
		this.acmType = acmType;
		this.acmGrade = acmGrade;
		this.acmDescriptA = acmDescriptA;
		this.acmDescriptB = acmDescriptB;
		this.acmCoordX = acmCoordX;
		this.acmCoordY = acmCoordY;
		this.acmDistrict = acmDistrict;
		this.acmPower = acmPower;
		this.status = status;
	}

	public int getAcmNum() {
		return acmNum;
	}

	public void setAcmNum(int acmNum) {
		this.acmNum = acmNum;
	}

	public String getAcmName() {
		return acmName;
	}

	public void setAcmName(String acmName) {
		this.acmName = acmName;
	}

	public String getMemNum() {
		return memNum;
	}

	public void setMemNum(String memNum) {
		this.memNum = memNum;
	}

	public String getAcmPhone() {
		return acmPhone;
	}

	public void setAcmPhone(String acmPhone) {
		this.acmPhone = acmPhone;
	}

	public String getAcmAddress() {
		return acmAddress;
	}

	public void setAcmAddress(String acmAddress) {
		this.acmAddress = acmAddress;
	}

	public String getAcmType() {
		return acmType;
	}

	public void setAcmType(String acmType) {
		this.acmType = acmType;
	}

	public int getAcmGrade() {
		return acmGrade;
	}

	public void setAcmGrade(int acmGrade) {
		this.acmGrade = acmGrade;
	}

	public String getAcmDescriptA() {
		return acmDescriptA;
	}

	public void setAcmDescriptA(String acmDescriptA) {
		this.acmDescriptA = acmDescriptA;
	}

	public String getAcmDescriptB() {
		return acmDescriptB;
	}

	public void setAcmDescriptB(String acmDescriptB) {
		this.acmDescriptB = acmDescriptB;
	}

	public String getAcmCoordX() {
		return acmCoordX;
	}

	public void setAcmCoordX(String acmCoordX) {
		this.acmCoordX = acmCoordX;
	}

	public String getAcmCoordY() {
		return acmCoordY;
	}

	public void setAcmCoordY(String acmCoordY) {
		this.acmCoordY = acmCoordY;
	}

	public String getAcmDistrict() {
		return acmDistrict;
	}

	public void setAcmDistrict(String acmDistrict) {
		this.acmDistrict = acmDistrict;
	}

	public String getAcmPower() {
		return acmPower;
	}

	public void setAcmPower(String acmPower) {
		this.acmPower = acmPower;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Acm [acmNum=" + acmNum + ", acmName=" + acmName + ", memNum=" + memNum + ", acmPhone=" + acmPhone
				+ ", acmAddress=" + acmAddress + ", acmType=" + acmType + ", acmGrade=" + acmGrade + ", acmDescriptA="
				+ acmDescriptA + ", acmDescriptB=" + acmDescriptB + ", acmCoordX=" + acmCoordX + ", acmCoordY="
				+ acmCoordY + ", acmDistrict=" + acmDistrict + ", acmPower=" + acmPower + ", status=" + status + "]";
	}

	

	
}
