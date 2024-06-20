#tag Class
Protected Class App
Inherits DesktopApplication
	#tag Event
		Sub Closing()
		  // --------------------
		  // Save settings
		  SetupFile.Save()
		  
		  // --------------------
		  // Log app closure
		  Log.AppEnd
		End Sub
	#tag EndEvent

	#tag Event
		Sub Opening()
		  // --------------------
		  // Set up Logging
		  Var logFile As FolderItem = ApplicationFolders.ApplicationSupportFolder(kAppFolderName).Child(kAppLogFile)
		  Log.Init(logFile)
		  
		  Log.AppStart
		  
		  // --------------------
		  // Load the configuration
		  Var configFile As FolderItem = ApplicationFolders.ApplicationSupportFolder(kAppFolderName).Child(kAppSetupFile)
		  SetupFile.Init(configFile)
		  
		  // Init main window config, it's the first run
		  If Not Setup.HasSection("MainWindow") Then
		    Var section As New SetupFile.SetupValueMap()
		    
		    section.ChangeValue("Left") = 100
		    section.ChangeValue("Top") = 100
		    section.ChangeValue("Width") = 850
		    section.ChangeValue("Height") = 500
		    
		    Setup.ChangeValue("MainWindow") = section
		  End If
		  
		End Sub
	#tag EndEvent


	#tag Note, Name = Setup
		Before using the template you neet to change the following constants
		
		kAppFolderName - The name of the application support folder
		kAppLogFile - The name of the application log file
		kAppSetupFile - The name of the application setup file
		kAppTitle - The application name
		
	#tag EndNote


	#tag Constant, Name = kAppFolderName, Type = String, Dynamic = False, Default = \"app_support_folder", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kAppLogFile, Type = String, Dynamic = False, Default = \"app.log", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kAppSetupFile, Type = String, Dynamic = False, Default = \"setup.json", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kAppTitle, Type = String, Dynamic = False, Default = \"Application Title", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&Delete", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Delete"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&Delete"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"&Quit", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"E&xit"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=false
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=false
			Group="ID"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=false
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=false
			Group="Position"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=false
			Group="Position"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowAutoQuit"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowHiDPI"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="BugVersion"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Copyright"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Description"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LastWindowIndex"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="MajorVersion"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="MinorVersion"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="NonReleaseVersion"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="RegionCode"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="StageCode"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Version"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_CurrentEventTime"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
