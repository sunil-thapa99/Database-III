package uk.ac.northampton;

import com.mongodb.*;

import java.net.UnknownHostException;

/**
 * Java + MongoDB Hello world Example
 * 
 */
public class App {
	public static void main(String[] args) throws UnknownHostException{

		try {

			/**** Connect to MongoDB ****/
			// Since 2.10.0, uses MongoClient
			MongoClient mongo = new MongoClient("localhost", 27017);

			/**** Get database ****/
			// if database doesn't exists, MongoDB will create it for you
			DB db = mongo.getDB("testdb");

			/**** Get collection / collection from 'testdb' ****/
			// if collection doesn't exists, MongoDB will create it for you
			DBCollection collection = db.getCollection("user");

			/**** Insert ****/
			// create a document to store key and value
//			BasicDBObject document = new BasicDBObject();
//			document.put("name", "James");
//			document.put("age", 25);
//			document.put("createdDate", new Date());
//			collection.insert(document);

			/**** Find and display ****/
//			BasicDBObject searchQuery = new BasicDBObject();
//			searchQuery.put("name", "James");
//
//			DBCursor cursor = collection.find(searchQuery);
//
//			while (cursor.hasNext()) {
//				System.out.println(cursor.next());
//			}
//
//			/**** Update ****/
//			// search document where name="James" and update it with new values
//			BasicDBObject doc1 = new BasicDBObject();
//			doc1.put("name", "James");
//
//			BasicDBObject newDocument = new BasicDBObject();
//			newDocument.put("name", "James-updated");
//
//			BasicDBObject updateObj = new BasicDBObject();
//			updateObj.put("$set", newDocument);
//
//			collection.update(doc1, updateObj);
//
//			/**** Find and display ****/
//			BasicDBObject searchQuery2
//				= new BasicDBObject().append("name", "James-updated");
//
//			DBCursor cursor2 = collection.find(searchQuery2);
//
//			while (cursor2.hasNext()) {
//				System.out.println(cursor2.next());
//			}

            /*** delete document ***/
			BasicDBObject searchQuery3 = new BasicDBObject().append("name","James");

			DBCursor cursor3 = collection.find(searchQuery3);
			while(cursor3.hasNext()){
				collection.remove(cursor3.next());
				System.out.println("original document deleted");
			}

            BasicDBObject searchQuery4 = new BasicDBObject().append("name","James-updated");
			DBCursor cursor4 = collection.find(searchQuery4);

			while(cursor4.hasNext()){
				collection.remove(cursor4.next());
				System.out.println("updated document deleted ...");
			}

			/**** Done ****/
			System.out.println("Done");

		} catch (MongoException e) {
			e.printStackTrace();
		}

	}
}
