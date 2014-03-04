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

    public void addToDB() {
        ArrayList<Issues> list = new ArrayList<Issues>();
        list = db.getIssues();

        if (list.isEmpty()) {
            for (Issues x : issueList) {
                db.regIssues(x);
            }
        } else {
            for (int i = 0; i < issueList.size(); i++) {
                if (checkIssue(issueList.get(i))) {
                    db.regIssues(issueList.get(i));
                }
            }
        }

    }

    private boolean checkIssue(Issues check) {
        ArrayList<Issues> list = new ArrayList<Issues>();
        list = db.getIssues();
        for (int j = 0; j < list.size(); j++) {
            if (check.equals(list.get(j))) {
                System.out.println("OK");
                return false;
            }
        }
        System.out.println("NOPE");
        return true;

    }
}
