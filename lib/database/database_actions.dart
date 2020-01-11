import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseActions {
  static Database db;

  static var _currentId;
  static String _currentUsername,_currentPassword;


  static Future open() async {
      // RootBundle ?

      // how to load pre populated sqflite

      db = await openDatabase(
        // join(await getDatabasesPath(), 'dummy.db'),
        join(await getDatabasesPath(), 'chris1.db'), 
        version: 1,
        onCreate: (Database db, int version) async {
            db.execute('''
              create table Todos(
                id integer primary key autoincrement,
                title text not null,
                isDone tinyint not null,
                owner integer not null
              );
            '''
            );
                  db.execute('''
              create table Users(
                id integer primary key autoincrement,
                username text unique not null,
                password text not null
              );
            ''');
          }
        );

    }

    static void setLoggedIn(int id, String username, String password){
      _currentId = id;
      _currentUsername = username;
      _currentPassword = password;
    }

    static int getCurrentId() {
      print(_currentId);
      return _currentId;
    }

    static Future<List<Map<String, dynamic>>> getTodos( int id) async{
      if (db == null) {
        await open();
      }
      return await db.rawQuery("SELECT * FROM Todos WHERE owner = ?", [id]);
    }

    static Future insertTodo(Map<String, dynamic> todo) async {
      await db.insert("Todos", todo);
    }

    static Future updateTodo(Map<String, dynamic> todo) async {
      await db.update("Todos", 
          todo,
          where: 'id=?',
          whereArgs: [todo['id']]
        );
    }
    

    static Future<List<Map<String, dynamic>>> getUsers(String username , String password) async{
      if (db == null) {
        await open();
      }
      return await db.rawQuery("SELECT * FROM Users WHERE username = ? AND password = ? ", [username,password]);
    }

    static Future insertUser(Map<String, String> user) async {
      if (db == null) {
        await open();
      }
      int x = await db.insert("Users", user);
      print(x);
    }

    static Future deleteTodo(int id) async {
      await db.delete(
        'Todos',
        where: 'id = ?',
        whereArgs: [id]
      );
    }
    
}