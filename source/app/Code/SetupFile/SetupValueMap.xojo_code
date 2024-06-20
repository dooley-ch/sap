#tag Class
Protected Class SetupValueMap
	#tag Method, Flags = &h0
		Function AsJson() As JSONItem
		  Var item As New JSONItem()
		  Var paramNames() As Variant = Self.mData.Keys
		  
		  For Each param As String In paramNames
		    item.Value(param) = Self.mData.Value(param).StringValue
		  Next param
		  
		  item.Compact = False
		  Return item
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ChangeValue(name As String, Assigns value As Variant)
		  Self.mData.Value(name) = value
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  Self.mData = New Dictionary()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HasParameter(name As String) As Boolean
		  Return Self.mData.HasKey(name)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Lookup(name As String) As Variant
		  If Not Self.mData.HasKey(name) Then
		    Raise New KeyNotFoundException("Parameter with the name: " + name + ", not found!")
		  End If
		  
		  Return Self.mData.Value(name)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Parameters() As String()
		  Return Self.mData.Keys.AsStringArray()
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
