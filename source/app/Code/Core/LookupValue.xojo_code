#tag Class
Class LookupValue
	#tag Method, Flags = &h0
		Sub Constructor(data As Dictionary)
		  Self.mData = data
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Lookup(name As String) As Variant
		  If Not Self.mData.HasKey(name) Then
		    Raise New KeyNotFoundException(" Attribute: " + name + ", not found!")
		  End If
		  
		  Return Self.mData.Value(name)
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mData As Dictionary
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
End Class
#tag EndClass
