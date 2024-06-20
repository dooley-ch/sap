#tag Module
Protected Module Log
	#tag Method, Flags = &h1
		Protected Sub AppEnd()
		  Var currentTime As DateTime =  DateTime.Now
		  Var message As String
		  
		  message = StringOfChars("-", 20) + " Application End " + currentTime.SQLDateTime + " " + StringOfChars("-", 22)
		  
		  WriteMessage(message)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub AppStart()
		  Var currentTime As DateTime =  DateTime.Now
		  Var message As String
		  
		  message = StringOfChars("-", 20) + " Application Start " + currentTime.SQLDateTime + " " + StringOfChars("-", 20)
		  
		  WriteMessage(message)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Error(message As String)
		  WriteMessage(FormatMessage(kError, message))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Fatal(message As String)
		  WriteMessage(FormatMessage(kFatal, message))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function FormatMessage(messageType As String, message As String) As String
		  Var currentTime As DateTime =  DateTime.Now
		  
		  Return currentTime.SQLDateTime + " | "  + messageType + " | " + message
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Info(message As String)
		  WriteMessage(FormatMessage(kInfo, message))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Init(file As FolderItem)
		  mFile = file
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function StringOfChars(value As String, numOfChars As Integer) As String
		  Var line As String
		  
		  For i As Integer = 1 To numOfChars
		    line = line + value
		  Next i
		  
		  Return line
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Warn(message As String)
		  WriteMessage(FormatMessage(kWarn, message))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub WriteMessage(message As String)
		  // ----------
		  // Make sure module has been initialized
		  
		  If mFile = Nil Then
		    Raise New InvalidArgumentException("Logging moudule not initialized - file missing")
		  End If
		  
		  // ----------
		  // Write the message 
		  Var stream As TextOutputStream
		  
		  Try
		    stream = TextOutputStream.Open(mFile)
		    stream.WriteLine(message)
		  Catch e As IOException
		    System.Log(System.LogLevelCritical, "Unable to write log file: " + e.Message)
		  Finally
		    If stream <> Nil Then
		      stream.Flush()
		      stream.Close()
		      stream = Nil
		    End If
		  End Try
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected mFile As FolderItem
	#tag EndProperty


	#tag Constant, Name = kError, Type = String, Dynamic = False, Default = \"ERROR", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kFatal, Type = String, Dynamic = False, Default = \"FATAL", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kInfo, Type = String, Dynamic = False, Default = \"INFO ", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kWarn, Type = String, Dynamic = False, Default = \"WARN ", Scope = Private
	#tag EndConstant


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
