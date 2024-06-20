#tag Class
Class ApplicationFolders
	#tag Method, Flags = &h0
		Shared Function ApplicationDataFolder(applicationName As String, Optional groupName As String) As FolderItem
		  Var targetFolder As FolderItem = DataFolder
		  
		  If groupName.Trim.Length <> 0 Then
		    targetFolder = targetFolder.Child(groupName)
		    If Not targetFolder.Exists Then
		      targetFolder.CreateFolder
		    End If
		  End If
		  
		  targetFolder = targetFolder.Child(applicationName)
		  If Not targetFolder.Exists Then
		    targetFolder.CreateFolder
		  End If
		  
		  Return targetFolder
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function ApplicationSupportFolder(applicationName As String, Optional groupName As String) As FolderItem
		  Var targetFolder As FolderItem = SupportFolder
		  
		  If groupName.Trim.Length <> 0 Then
		    targetFolder = targetFolder.Child(groupName)
		    If Not targetFolder.Exists Then
		      targetFolder.CreateFolder
		    End If
		  End If
		  
		  targetFolder = targetFolder.Child(applicationName)
		  If Not targetFolder.Exists Then
		    targetFolder.CreateFolder
		  End If
		  
		  Return targetFolder
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function DataFolder() As FolderItem
		  Var targetFolder As FolderItem = SpecialFolder.UserHome.Child("dooley.ch")
		  
		  If Not targetFolder.Exists Then
		    targetFolder.CreateFolder
		  End If
		  
		  Return targetFolder
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function SupportFolder() As FolderItem
		  Var targetFolder As FolderItem = SpecialFolder.UserLibrary.Child("Application Support")
		  If Not targetFolder.Exists Then
		    targetFolder.CreateFolder
		  End If
		  
		  targetFolder = targetFolder.Child("dooley.ch")
		  If Not targetFolder.Exists Then
		    targetFolder.CreateFolder
		  End If
		  
		  Return targetFolder
		End Function
	#tag EndMethod


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
End Class
#tag EndClass
