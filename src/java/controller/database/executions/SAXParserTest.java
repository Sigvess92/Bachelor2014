/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.database.executions;

import data.Issues;
import java.util.ArrayList;
import java.util.List;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

/**
 *
 * @author Frode
 */
public class SAXParserTest {

    public static void main(String[] args) throws Exception {
        SAXParserFactory parserFactor = SAXParserFactory.newInstance();

        SAXParser parser = parserFactor.newSAXParser();

        SAXHandler handler = new SAXHandler();

        parser.parse(ClassLoader.getSystemResourceAsStream("xml/jira-example.xml"),
                handler);
        handler.addToDB();

        //Printing the list of employees obtained from XML
        for (Issues issue : handler.issueList) {

            System.out.println(issue);
        }
        System.out.println(handler.issueList.size());
    }

}

class SAXHandler extends DefaultHandler {

    DBController db = new DBController();

    List<Issues> issueList = new ArrayList<Issues>();

    Issues issue = null;

    String content = null;

    @Override
    //Triggered when the start of tag is found.
    public void startElement(String uri, String localName,
            String qName, Attributes attributes)
            throws SAXException {

        //HVER ISSUE STARTER MED <ITEM>
        if (qName.equalsIgnoreCase("ITEM")) {
            issue = new Issues();
            issueList.add(issue);
        }

        if (qName.equalsIgnoreCase("KEY")) {
            issue.id = Integer.parseInt(attributes.getValue("id"));
        }
        if (qName.equalsIgnoreCase("TYPE")) {
            if (attributes.getValue("id").equals("16")) {
                issue.issuetype = "TEST CASE";
            }
        }
    }

    @Override

    public void endElement(String uri, String localName,
            String qName) throws SAXException {
        if (qName.equalsIgnoreCase("STATUS")) {
            issue.status = content;
        }

    }

    @Override

    public void characters(char[] ch, int start, int length)
            throws SAXException {
        content = String.copyValueOf(ch, start, length).trim();
    }

    //CHECK IF THIS ISSUE IS ALREADY IN DB
    public void addToDB() {
        ArrayList<Issues> list = new ArrayList<Issues>();
        list = db.getIssues();
        if (list.isEmpty()) {
            for (Issues x : issueList) {
                db.regIssues(x);
            }
        } else {
            for(int i = 0;i<issueList.size();i++){
                for(int j = 0;j<list.size();j++){
                    if(!issueList.get(i).equals(list.get(j))){
                        db.regIssues(issueList.get(i));
                    }
                }
            }

        }

    }
}
