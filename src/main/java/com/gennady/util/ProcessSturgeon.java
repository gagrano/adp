/**
 * 
 */
package com.gennady.util;

import java.io.File;
import java.io.FileReader;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import org.apache.log4j.BasicConfigurator;
import org.apache.log4j.Logger;

import au.com.bytecode.opencsv.CSVReader;

/**
 * @author Gennady
 *
 */
public class ProcessSturgeon extends ProcessRN {

	/**
	 * @param args
	 */
	static Logger logger = Logger.getLogger(ProcessSturgeon.class);
	
	public static void main(String[] args) {
		BasicConfigurator.configure();
		String inputFile = "viewpoint-hr-export.csv";
		String outputDir = "RN1";
		if (args != null && args.length == 2) {
			inputFile = args[0];
			outputDir = args[1];
		}
        run(inputFile, outputDir);
	}
	
	public static String run(String inputFile, String outputDir) {
		String result = "FAIL";
		logger.info("Start processing file: "+inputFile);
		SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
		SimpleDateFormat inputSdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		try {
			File f = new File(inputFile);
			if (!f.exists()) {
				System.out.println("Such file does not exist: "+inputFile);
				return "Such file does not exist: "+inputFile;
			}
			CSVReader reader = new CSVReader(new FileReader(inputFile), ',');
		    String [] nextLine;
		    int rowNum = 0;
		    ArrayList<ArrayList<Object>> alist = new ArrayList<ArrayList<Object>>();
            ArrayList<Object> rowlist = new ArrayList<Object>();
            rowlist.add("Co Code");
            rowlist.add("Associate ID");
            rowlist.add("Change Effective On");
        	rowlist.add("Last Name");
        	rowlist.add("First Name");
        	rowlist.add("Middle Name");
        	rowlist.add("Is Paid By WFN");
        	rowlist.add("Worked In Country");
        	rowlist.add("Address 1 Line 1");
        	rowlist.add("Address 1 City");
        	rowlist.add("Address 1 State Postal Code");
        	rowlist.add("Address 1 Zip Code");
        	rowlist.add("Address 1 Use As Legal");
        	rowlist.add("Address 2 Line 1");
        	rowlist.add("Address 2 City");
        	rowlist.add("Address 2 State Postal Code");
        	rowlist.add("Address 2 Zip Code");
        	rowlist.add("Home Phone Number");
        	rowlist.add("Work Phone Number");
        	rowlist.add("Work E-mail");
        	rowlist.add("Birth Date");
        	rowlist.add("Gender");
        	rowlist.add("Hire Date");
        	rowlist.add("Termination Date");
        	rowlist.add("Tax ID Number");
        	rowlist.add("Tax ID Type");
        	rowlist.add("Maiden Name");
        	rowlist.add("Education Level");
        	rowlist.add("Union Code");
        	rowlist.add("Preferred Name");
        	rowlist.add("Work Mail Stop");
        	rowlist.add("Employee Type");
        	alist.add(rowlist);
        	int empIdx =-1, maidNameIdx=-1, handicapIdx=-1, disVetIdx = -1, eduLevelIdx =-1, prefNameIdx= -1, mailStopIdx = -1, empTypeIdx = -1;
        	int emailIdx = -1, earnCodeIdx = -1;
		    while ((nextLine = reader.readNext()) != null) {
		        // nextLine[] is an array of values from the line
		    	if (rowNum == 0) {
			    	for (int i=0; i< nextLine.length; i++) {
			    		String item = nextLine[i];
			    		//System.out.print("Row#"+rowNum+":" + item+",");
			    		if ("PREmp".equalsIgnoreCase(item)) empIdx = i; 
			    		else if ("MaidenName".equalsIgnoreCase(item)) maidNameIdx = i;
			    		else if ("HandicapYN".equalsIgnoreCase(item)) handicapIdx = i;
			    		else if ("DisabledVetYN".equalsIgnoreCase(item)) disVetIdx = i;
			    		else if ("PhysicalYN".equalsIgnoreCase(item)) eduLevelIdx = i; 
			    		else if ("DriveCoVehiclesYN".equalsIgnoreCase(item)) prefNameIdx= i;
			    		else if ("NoContactEmplYN".equalsIgnoreCase(item)) mailStopIdx = i;
			    		else if ("TempWorker".equalsIgnoreCase(item)) empTypeIdx = i;
			    		else if ("Email".equalsIgnoreCase(item)) emailIdx = i; 
			    		else if ("EarnCode".equalsIgnoreCase(item)) earnCodeIdx = i; 
			    		else continue;
			    	}
		    	} else {
		    		rowlist = new ArrayList<Object>();
		    		rowlist.add("G9G");
		    		rowlist.add(nextLine[empIdx]);
		    		String hireDate = nextLine[21].equals("")? "": sdf.format(inputSdf.parse(nextLine[21]));
		    		rowlist.add(hireDate);//hire-date - Change Effective on
		    		rowlist.add(nextLine[4]);
		    		rowlist.add(nextLine[5]);
		    		rowlist.add(nextLine[6]);
		    		rowlist.add("N");//is Paid by WFN
		    		rowlist.add("USA");//worked in USA
		    		rowlist.add(nextLine[8].trim()); //Address
		    		rowlist.add(nextLine[9].trim());
		    		rowlist.add(nextLine[10]);
		    		rowlist.add(nextLine[11]);
		    		if (nextLine[12] != null) rowlist.add("Y");
		    		else rowlist.add("");
		    		//Address 2
		    		rowlist.add("");rowlist.add("");rowlist.add("");rowlist.add("");
		    		rowlist.add(nextLine[13]);
		    		rowlist.add(nextLine[14]);
		    		rowlist.add(nextLine[emailIdx]);//Email 
		    		rowlist.add(nextLine[20].equals("")? "": sdf.format(inputSdf.parse(nextLine[20])));//birth-date
		    		rowlist.add(nextLine[18]);//gender
		    		rowlist.add(hireDate);//hire-date
		    		rowlist.add(nextLine[22].equals("")? "": sdf.format(inputSdf.parse(nextLine[22])));//term-date
		    		rowlist.add(nextLine[17]);//SSN
		    		rowlist.add("SSN");
		    		//rowlist.add(nextLine[earnCodeIdx]);//NAICS Worker's Comp Code ?
		    		String maidName = nextLine[maidNameIdx];		    		
		    		if (maidName.equals("Y")) rowlist.add("Eligible for Rehire");
		    		else if (maidName.equals("N")) rowlist.add("Not Eligible for Rehire");
		    		else rowlist.add("");
		    		
		    		if (nextLine[eduLevelIdx].equals("Y")) rowlist.add("Physical Completed");
		    		else rowlist.add("");
		    		
		    		String handicap = nextLine[handicapIdx];
		    		String disableVet = nextLine[disVetIdx];
		    		if (handicap.equals("Y")) {
		    			if (disableVet.equals("Y")) rowlist.add("H-D");
		    			else rowlist.add("H");
		    		} else {
		    			if (disableVet.equals("Y")) rowlist.add("D");
		    			else rowlist.add("");
		    		}
		    		
		    		if (nextLine[prefNameIdx].equals("Y")) rowlist.add("Approved to Operate Co. Vehicle");
		    		else rowlist.add("");
		    		
		    		if (nextLine[mailStopIdx].equals("Y")) rowlist.add("Contact current empr = Y");
		    		else if (nextLine[mailStopIdx].equals("N")) rowlist.add("Contact current empr = N");
		    		else rowlist.add("");
		    		
		    		if (nextLine[empTypeIdx].equals("Y")) rowlist.add("TEMP");
		    		else if (nextLine[empTypeIdx].equals("N")) rowlist.add("N");
		    		else rowlist.add("");
		    		alist.add(rowlist);
		    	}
		    	rowNum++;
		    	//System.out.println();
		    }
		    reader.close();
		    if (createCSVOutput("PRG9GEPI.CSV", outputDir, alist)) 
		    	result = "OK";
		    logger.info("DONE!");
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("Error:"+ e.getMessage());
		}
		return result;
	}

}
