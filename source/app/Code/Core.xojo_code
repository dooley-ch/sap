#tag Module
Protected Module Core
	#tag Method, Flags = &h0
		Function AsStringArray(extends va() As Variant) As String()
		  Var values() As String
		  
		  For Each item As Variant In va
		    values.Add(item.StringValue)
		  Next item
		  
		  Return values
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetFileNames(Extends folder As FolderItem) As String()
		  Var file As FolderItem
		  Var fileNames() As String
		  
		  If folder.IsFolder Then
		    For index As Integer = 0 To folder.Count - 1
		      file = folder.ChildAt(index)
		      
		      If file.IsFolder Then
		        Continue
		      End If
		      
		      fileNames.Add(file.DisplayName)
		    Next index
		  End If
		  
		  Return fileNames
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LoadCsvContent(file As FolderItem) As String()
		  If Not file.Exists Then
		    Raise New FileNotFoundError(file)
		  End If
		  
		  Var content As String = ReadTextFile(file)
		  
		  Return content.Split(EndOfLine)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MessageBoxConfirm(message As string, explanation As String = "") As Boolean
		  Var msgDlg As MessageDialog = New MessageDialog()
		  
		  msgDlg.IconType = MessageDialog.IconTypes.Question
		  msgDlg.ActionButton.Caption = "Yes"
		  msgDlg.CancelButton.Visible = True
		  msgDlg.CancelButton.Caption = "No"
		  msgDlg.AlternateActionButton.Visible = False
		  msgDlg.Message = message
		  
		  If explanation.Trim.Length > 0 Then
		    msgDlg.Explanation = explanation
		  End If
		  
		  Var dlgButton As MessageDialogButton = msgDlg.ShowModal()
		  
		  If dlgButton = msgDlg.ActionButton Then
		    Return True
		  End If
		  
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MessageBoxError(message As string, explanation As String = "")
		  Var msgDlg As MessageDialog = New MessageDialog()
		  
		  msgDlg.IconType = MessageDialog.IconTypes.Stop
		  msgDlg.ActionButton.Caption = "OK"
		  msgDlg.CancelButton.Visible = False
		  msgDlg.AlternateActionButton.Visible = False
		  msgDlg.Message = message
		  
		  If explanation.Trim.Length > 0 Then
		    msgDlg.Explanation = explanation
		  End If
		  
		  Call msgDlg.ShowModal
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MessageBoxGeneric(message As string, explanation As String = "")
		  Var msgDlg As MessageDialog = New MessageDialog()
		  
		  msgDlg.IconType = MessageDialog.IconTypes.None
		  msgDlg.ActionButton.Caption = "OK"
		  msgDlg.CancelButton.Visible = False
		  msgDlg.AlternateActionButton.Visible = False
		  msgDlg.Message = message
		  
		  If explanation.Trim.Length > 0 Then
		    msgDlg.Explanation = explanation
		  End If
		  
		  Call msgDlg.ShowModal
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MessageBoxInfo(message As string, explanation As String = "")
		  Var msgDlg As MessageDialog = New MessageDialog()
		  
		  msgDlg.IconType = MessageDialog.IconTypes.Note
		  msgDlg.ActionButton.Caption = "OK"
		  msgDlg.CancelButton.Visible = False
		  msgDlg.AlternateActionButton.Visible = False
		  msgDlg.Message = message
		  
		  If explanation.Trim.Length > 0 Then
		    msgDlg.Explanation = explanation
		  End If
		  
		  Call msgDlg.ShowModal
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MessageBoxWarn(message As string, explanation As String = "")
		  Var msgDlg As MessageDialog = New MessageDialog()
		  
		  msgDlg.IconType = MessageDialog.IconTypes.Caution
		  msgDlg.ActionButton.Caption = "OK"
		  msgDlg.CancelButton.Visible = False
		  msgDlg.AlternateActionButton.Visible = False
		  msgDlg.Message = message
		  
		  If explanation.Trim.Length > 0 Then
		    msgDlg.Explanation = explanation
		  End If
		  
		  Call msgDlg.ShowModal
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ReadTextFile(file As FolderItem) As String
		  Const kBlockSize = 4096
		  
		  If Not file.Exists Then Raise New FileNotFoundError(file)
		  
		  Var contents As String = ""
		  Var binStream As BinaryStream = BinaryStream.Open(file)
		  
		  While Not binStream.EndOfFile 
		    contents = contents + binStream.Read(kBlockSize)
		  Wend
		  
		  binStream.Close
		  
		  Return contents.DefineEncoding(Encodings.UTF8)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TrimCsv(Extends value As String) As String
		  If value.BeginsWith("""") Then
		    value = value.Middle(1)
		  End If
		  
		  If value.EndsWith("""") Then
		    value = value.Left(value.Length - 1)
		  End If
		  
		  Return value
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub WriteTextFile(file As FolderItem, content As String)
		  If file.Exists Then
		    file.Remove
		  End if
		  
		  Var binStream As BinaryStream = BinaryStream.Create(file)
		  
		  binStream.Write(content)
		  binStream.Close
		End Sub
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
End Module
#tag EndModule
