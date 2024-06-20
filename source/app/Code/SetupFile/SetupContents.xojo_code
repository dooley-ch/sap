#tag Class
Protected Class SetupContents
	#tag Method, Flags = &h0
		Function AsJson() As JSONItem
		  Var valueMap As SetupValueMap
		  Var item As New JSONItem()
		  Var paramNames() As Variant = Self.mData.Keys
		  
		  For Each param As String In paramNames
		    valueMap = Self.mData.Value(param)
		    item.Value(param) = valueMap.AsJson
		  Next param
		  
		  item.Compact = False
		  Return item
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ChangeValue(name As String, Assigns value As SetupValueMap)
		  Self.mData.Value(name) = value
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  Self.mData = New Dictionary()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HasSection(name As String) As Boolean
		  Return Self.mData.HasKey(name)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Lookup(name As String) As SetupValueMap
		  If Not Self.mData.HasKey(name) Then
		    Raise New KeyNotFoundException("Section with the name: " + name + ", not found!")
		  End If
		  
		  Return Self.mData.Value(name)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Sections() As String()
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
