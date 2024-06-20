#tag Module
Protected Module SetupFile
	#tag Method, Flags = &h1
		Protected Sub Init(file As FolderItem)
		  mFile = file
		  mSetup = LoadFile(mFile)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function LoadFile(file As FolderItem) As SetupContents
		  If Not file.Exists Then
		    Return New SetupContents()
		  End If
		  
		  Var fileContent As String = ReadTextFile(file)
		  Var jsonDict As Dictionary = ParseJSON(fileContent)
		  Var SectionKeys() As String = jsonDict.Keys.AsStringArray
		  Var setupKeys() As String
		  Var jsonSetupDict As Dictionary
		  Var setupValue As String
		  
		  Var setupContents As New SetupContents()
		  
		  For Each section As String In SectionKeys
		    jsonSetupDict = jsonDict.Value(section)
		    setupKeys = jsonSetupDict.Keys.AsStringArray
		    
		    Var setupParamMap As New SetupValueMap
		    For Each param As String In setupKeys
		      setupValue = jsonSetupDict.Value(param).StringValue
		      
		      setupParamMap.ChangeValue(param) = setupValue
		    Next param
		    
		    setupContents.ChangeValue(section) = setupParamMap
		  Next section
		  
		  Return setupContents
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Save()
		  WriteFile(mFile, mSetup)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Setup() As SetupContents
		  // ----------
		  // Make sure module has been initialized
		  If mFile = Nil Then
		    Raise New InvalidArgumentException("Setup moudule not initialized - file missing")
		  End If
		  
		  If mSetup = Nil Then
		    Raise New InvalidArgumentException("Setup moudule not initialized - file not loaded")
		  End If
		  
		  Return mSetup
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub WriteFile(fileName As FolderItem, content As SetupContents)
		  Var jsonData As JSONItem = content.AsJson
		  Var jsonText As String = jsonData.ToString
		  
		  WriteTextFile(fileName, jsonText)
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mFile As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSetup As SetupContents
	#tag EndProperty


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
