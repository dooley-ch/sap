#tag Module
Protected Module Datastore
	#tag Method, Flags = &h1
		Protected Function Connect() As SQLiteDatabase
		  Var db As SQLiteDatabase = New SQLiteDatabase(mFile)
		  
		  Try
		    db.Connect
		    Return db
		  Catch e As DatabaseException
		    Raise New ConnectError(e.Message)
		  End Try
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub CreateFile(file As FolderItem)
		  Var sql As String
		  
		  If file.Exists Then
		    file.Remove
		  End If
		  
		  Var db As SQLiteDatabase = New SQLiteDatabase
		  
		  db.DatabaseFile = file
		   
		  Try
		    db.CreateDatabase
		  Catch e As IOException
		    Raise New FileError(file, e.Message)
		  End Try
		  
		  // --------------------
		  // version
		  sql = "CREATE TABLE version(" +_
		  "id Integer PRIMARY KEY AUTOINCREMENT Not NULL, " +_
		  "major Integer Not NULL, " +_
		  "minor Integer Not NULL, " +_
		  "build Integer Not NULL, " +_
		  "created_at Text Not NULL DEFAULT (datetime('now','localtime'))," +_
		  "CONSTRAINT version_uk_version UNIQUE(major, minor, build)) STRICT;"
		  
		  Try
		    db.ExecuteSQL(sql)
		  Catch e As DatabaseException
		    Raise New TableError("version", e.Message)
		  End Try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Init(fileName As FolderItem)
		  mFile = fileName
		  If Not mFile.Exists Then
		    CreateFile(mFile)
		    
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function IsValidVersion() As Boolean
		  Var db As SQLiteDatabase = Connect
		  
		  Try
		    Var rs As RowSet = db.SelectSQL("SELECT major, minor, build FROM version LIMIT 1;")
		    
		    rs.MoveToFirstRow
		    
		    Var major As Integer = rs.Column("major").IntegerValue
		    Var minor As Integer = rs.Column("minor").IntegerValue
		    Var build As Integer = rs.Column("build").IntegerValue
		    
		    Return (major = kMajorVersionNumber) And (minor = kMinorVersionNumber) And (build = kBuildVersionNumber)
		  Catch e As DatabaseException
		    Raise New SelectError("version", e.Message)
		  End Try
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mFile As FolderItem
	#tag EndProperty


	#tag Constant, Name = kBuildVersionNumber, Type = Double, Dynamic = False, Default = \"1", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kMajorVersionNumber, Type = Double, Dynamic = False, Default = \"1", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kMinorVersionNumber, Type = Double, Dynamic = False, Default = \"0", Scope = Private
	#tag EndConstant


	#tag Enum, Name = AuditAction, Type = Integer, Flags = &h0
		Insert
		  Update
		  Delete
		Unknown
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
