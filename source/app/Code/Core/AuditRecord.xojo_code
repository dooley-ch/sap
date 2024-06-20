#tag Class
Class AuditRecord
Inherits Core.RecordBase
	#tag Method, Flags = &h0
		Shared Function AuditAction2String(value As AuditAction) As String
		  Select Case value
		  Case AuditAction.Insert
		    Return "Insert"
		  Case AuditAction.Update
		    Return "Update"
		  Case AuditAction.Delete
		    Return "Delete"
		  Case Else
		    Return "Unknown"
		  End Select
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  Super.Constructor
		  
		  Self.LoggedAt = DateTime.Now
		  Self.Action = AuditAction.Unknow
		  Self.RecordId = 0
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(id As Integer, loggedAt As DateTime, action As AuditAction, recordId As Integer)
		  Super.Constructor(id)
		  
		  Self.LoggedAt = loggedAt
		  Self.Action = action
		  Self.RecordId = recordId
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function String2AuditAction(value As String) As AuditAction
		  Select Case value
		  Case "Insert"
		    Return AuditAction.Insert
		  Case "Update"
		    Return AuditAction.Update
		  Case "Delete"
		    Return AuditAction.Delete
		  Case Else
		    Return AuditAction.Unknow
		  End Select
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		Action As AuditAction
	#tag EndProperty

	#tag Property, Flags = &h0
		LoggedAt As DateTime
	#tag EndProperty

	#tag Property, Flags = &h0
		RecordId As Integer
	#tag EndProperty


	#tag Enum, Name = AuditAction, Type = Integer, Flags = &h0
		Insert
		  Update
		  Delete
		Unknow
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="Id"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
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
		#tag ViewProperty
			Name="Action"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="AuditAction"
			EditorType="Enum"
			#tag EnumValues
				"0 - Insert"
				"1 - Update"
				"2 - Delete"
				"3 - Unknow"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="RecordId"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
