# flutter_firebase_auth

Flutterで、Firebase Authのログインの実装とFirestoreからuidと名前を取得

## 必要なこと  
Firebaseの各種設定ファイルの追加（iOS & Android)
Firestoreの設定とデータベース構造の作成  

### データベース構造
users - documentID - name:田中 太郎  
　　　　　　　　　　uid:Firebaseのuid  
※eventは、アクセス制御のためのboolのものなので、削除しても問題ありません。  

## Thanks  
https://qiita.com/iketeruhiyoko/items/0571c08e53fbbe9d70f1  
https://qiita.com/iketeruhiyoko/items/7d0718bc6210ed545913  
https://note.com/zutai_dekame/n/nabf22f1a3eec  
