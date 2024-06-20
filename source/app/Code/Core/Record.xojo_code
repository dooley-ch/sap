#tag Class
Class Record
Inherits Core.RecordBase
	#tag Method, Flags = &h0
		Sub Constructor()
		  Super.Constructor
		  
		  Var current As DateTime = DateTime.Now
		  
		  Self.mLockVersion = 1
		  Self.mCreatedAt = current
		  Self.mUpdatedAt = current
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(id As Integer, lockVersion As Integer, createdAt As DateTime, updatedAt As DateTime)
		  Super.Constructor(id)
		  
		  Self.mLockVersion = lockVersion
		  Self.mCreatedAt = createdAt
		  Self.mUpdatedAt = updatedAt
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mCreatedAt
			End Get
		#tag EndGetter
		CreatedAt As DateTime
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mLockVersion
			End Get
		#tag EndGetter
		LockVersion As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mCreatedAt As DateTime
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLockVersion As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mUpdatedAt As DateTime
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mUpdatedAt
			End Get
		#tag EndGetter
		UpdatedAt As DateTime
	#tag EndComputedProperty


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
			Name="LockVersion"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
