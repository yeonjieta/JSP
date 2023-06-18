package date;

import java.sql.Date;
import java.text.SimpleDateFormat;

public class DateUtil {
	
	private static DateUtil instanace = new DateUtil();
	
	public static DateUtil getInstance() {
		return instanace;
	}
	
	public static Date toSqlDate(String param) throws Exception{
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date date1 = sdf.parse(param);
		long time = date1.getTime();
		java.sql.Date date2 = new java.sql.Date(time);
		return date2;
	}
	
	

}
