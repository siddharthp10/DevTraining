/**
 * Description: Json parcing logic
 **/
public class JSONParser {

	// Json parse method
    public static JSONParser parse (String json) {
        return (JSONParser) System.JSON.deserialize (json, JSONParser.class);
    }

	// Wrapper classes
	public class Oppty {
		public Integer composite_key;
		public String status;
		public String name;
		public String lastdate;
		public Decimal revenue;
	}

	public class Acct {
		public Integer key;
		public String companyname;
		public String company_industry;
		public Decimal company_revenue;
		public List<Oppty> opportunities;
	}

	public List<Acct> accounts;
}