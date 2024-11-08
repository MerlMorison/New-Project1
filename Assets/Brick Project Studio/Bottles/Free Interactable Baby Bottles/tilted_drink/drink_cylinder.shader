Shader "Unlit/drink_cylinder"
{
	Properties
	{
		_FrontColor ("Color (Side)", Color) = (1,1,1,1)
		_BackColor ("Color (Surface)", Color) = (1,1,1,1)
		_Level ("Level", Range(0,1)) = 1
		_UpperRadius ("Upper radius", Float) = 1
		_LowerRadius ("Lower radius", Float) = 1
	}
	SubShader
	{
		Tags { "RenderType"="Transparent" "Queue"="Transparent+0" "DisableBatching"="True" }
		LOD 100
		Blend SrcAlpha OneMinusSrcAlpha

		Pass
		{
			Cull Front
			ZWrite Off
			ZTest Off
			Stencil {
				Pass IncrSat
			}

			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#pragma target 3.0
			
			#include "UnityCG.cginc"

			struct appdata
			{
				float4 vertex : POSITION;
				
			};

			struct v2f
			{
				float4 vertex : SV_POSITION;
				float3 rotOrig : TEXCOORD0;
				float3 orig : TEXCOORD1;
				float2 depth : TEXCOORD2;
			};

			struct fragOut {
				fixed4 color : COLOR;
				float depth : DEPTH;
			};

			float _Level;
			float _UpperRadius;
			float _LowerRadius;

			v2f vert (appdata v)
			{
				if(v.vertex.z >	0) {
					v.vertex.xy *= _UpperRadius;
				} else {
					v.vertex.xy *= _LowerRadius;
				}

				v2f o;
				o.vertex = UnityObjectToClipPos(v.vertex);
				o.rotOrig = mul((float3x3)unity_ObjectToWorld, v.vertex);
				o.orig = v.vertex;
				o.depth = o.vertex.zw;
				return o;
			}
			
			fixed4 frag (v2f i, fixed face : VFACE) : SV_TARGET
			{
				clip(i.orig.z - (-1.0));
				float scale = pow(abs(determinant((float3x3)unity_ObjectToWorld)),1.0/3);
				float top = mul((float3x3)unity_ObjectToWorld, float3(0,0,0.9999) / scale).y;
				float theta = acos(top);
				float level = (sin(theta) * (-_UpperRadius) + cos(theta) * (1.0)) * scale;
				float lowest = (sin(theta) * (-_LowerRadius) + cos(theta) * (-1.0)) * scale;
				float quantity = lowest + _Level * scale * 2;
				level = min(level, quantity);

				clip(level - lowest);
				float ratio = (i.rotOrig.y - lowest) / (level - lowest);
				clip(1.0001 - ratio);

				return float4(0,0,0,0);
			}
			ENDCG
		}

		Pass
		{
			Cull Back
			Stencil {
				Pass DecrSat
				ZFail DecrSat
			}

			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#pragma target 3.0
			
			#include "UnityCG.cginc"

			struct appdata
			{
				float4 vertex : POSITION;
				
			};

			struct v2f
			{
				float4 vertex : SV_POSITION;
				float3 rotOrig : TEXCOORD0;
				float3 orig : TEXCOORD1;
				float2 depth : TEXCOORD2;
			};

			fixed4 _FrontColor;
			float _Level;
			float _UpperRadius;
			float _LowerRadius;

			v2f vert (appdata v)
			{
				if(v.vertex.z >	0) {
					v.vertex.xy *= _UpperRadius;
				} else {
					v.vertex.xy *= _LowerRadius;
				}

				v2f o;
				o.vertex = UnityObjectToClipPos(v.vertex);
				o.rotOrig = mul((float3x3)unity_ObjectToWorld, v.vertex);
				o.orig = v.vertex;
				o.depth = o.vertex.zw;
				return o;
			}
			
			fixed4 frag (v2f i, fixed face : VFACE) : SV_TARGET
			{
				clip(i.orig.z - (-1.0));
				float scale = pow(abs(determinant((float3x3)unity_ObjectToWorld)),1.0/3);
				float top = mul((float3x3)unity_ObjectToWorld, float3(0,0,0.9999) / scale).y;
				float theta = acos(top);
				float level = (sin(theta) * (-_UpperRadius) + cos(theta) * (1.0)) * scale;
				float lowest = (sin(theta) * (-_LowerRadius) + cos(theta) * (-1.0)) * scale;
				float quantity = lowest + _Level * scale * 2;
				level = min(level, quantity);

				clip(level - lowest);
				float ratio = (i.rotOrig.y - lowest) / (level - lowest);
				clip(1.0001 - ratio);

				return _FrontColor;
			}
			ENDCG
		}

		Pass
		{
			Cull Off
			Stencil {
				Ref 1
				Comp Equal
				Pass DecrSat
			}

			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#pragma target 3.0
			
			#include "UnityCG.cginc"

			struct appdata
			{
				float4 vertex : POSITION;
				
			};

			struct v2f
			{
				float4 vertex : SV_POSITION;
				float3 rotOrig : TEXCOORD0;
				float3 orig : TEXCOORD1;
				float2 depth : TEXCOORD2;
			};

			struct fragOut {
				fixed4 color : COLOR;
				float depth : DEPTH;
			};

			fixed4 _BackColor;
			float _Level;
			float _UpperRadius;
			float _LowerRadius;

			v2f vert (appdata v)
			{
				if(v.vertex.z >	0) {
					v.vertex.xy *= _UpperRadius;
				} else {
					v.vertex.xy *= _LowerRadius;
				}

				v2f o;
				o.vertex = UnityObjectToClipPos(v.vertex);
				o.rotOrig = mul((float3x3)unity_ObjectToWorld, v.vertex);
				o.orig = v.vertex;
				o.depth = o.vertex.zw;
				return o;
			}
			
			fragOut frag (v2f i, fixed face : VFACE)
			{
				clip(i.orig.z - (-1.0));
				float scale = pow(abs(determinant((float3x3)unity_ObjectToWorld)),1.0/3);
				float top = mul((float3x3)unity_ObjectToWorld, float3(0,0,0.9999) / scale).y;
				float theta = acos(top);
				float level = (sin(theta) * (-_UpperRadius) + cos(theta) * (1.0)) * scale;
				float lowest = (sin(theta) * (-_LowerRadius) + cos(theta) * (-1.0)) * scale;
				float quantity = lowest + _Level * scale * 2;
				level = min(level, quantity);

				clip(level - lowest);
				float ratio = (i.rotOrig.y - lowest) / (level - lowest);
				clip(1.0001 - ratio);

				fragOut o;
				o.color = _BackColor;
				float3 trans = mul(unity_ObjectToWorld, float4(0,0,0,1)).xyz;
				float3 cam = _WorldSpaceCameraPos;
				float3 pos = i.rotOrig + trans;
				float3 dir = pos - cam;
				float lev = level + trans.y;
				// (cam + dir * d).y == lev
				float d = (lev - cam.y) / dir.y;
				float4 levelPos = float4(cam + dir * d, 1);
				float2 levelDepth = mul(UNITY_MATRIX_VP, levelPos).zw;
				o.depth = max(0, levelDepth.x / levelDepth.y);
				return o;
			}
			ENDCG
		}
	}
}
