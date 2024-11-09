// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "TsunaMoo/Standard Helper FX"
{
	Properties
	{
		[HideInInspector]shader_is_using_thry_editor("", Float) = 0
		[HideInInspector]shader_master_label("<color=#ffffffff>Tsuna</color> <color=#000000ff>Moo</color> <color=#ffffffff>Shader</color> <color=#000000ff>Lab</color>--{texture:{name:tsuna_moo_icon,height:128}}", Float) = 0
		[HideInInspector]shader_properties_label_file("TsunaMooLabels", Float) = 0
		[Enum(Off,0,Front,1,Back,2)]_Cull("Cull", Float) = 2
		[HideInInspector]LightmapFlags("LightmapFlags", Float) = 0
		[HideInInspector]DSGI("DSGI", Float) = 0
		[HideInInspector]Instancing("Instancing", Float) = 0
		[HideInInspector]m_start_Main("Main", Float) = 0
		[NoScaleOffset][SingleLineTexture]_MainTex("Albedo Map--{reference_property:_Color}", 2D) = "white" {}
		[HideInInspector]_Color("Albedo Color", Color) = (1,1,1,0)
		[NoScaleOffset][SingleLineTexture]_MetallicGlossMap("Metallic Map--{reference_property:_Metallic}", 2D) = "white" {}
		[HideInInspector]_Metallic("Metallic Slider", Range( 0 , 1)) = 0
		_Glossiness("Smoothness", Range( 0 , 1)) = 0
		_AntiAliasingVariance("Anti Aliasing Variance", Range( 0 , 5)) = 0.01
		_AntiAliasingThreshold("Anti Aliasing Threshold", Range( 0 , 1)) = 1
		[IntRange][Toggle(_NORMALMAP)]_UseNormalMap("Enable Normal Map", Float) = 0
		[NoScaleOffset][Normal][SingleLineTexture]_BumpMap("Normal Map--{reference_property:_NormalMapSlider,condition_show:{type:PROPERTY_BOOL,data:_UseNormalMap==1}}", 2D) = "bump" {}
		[HideInInspector]_NormalMapSlider("Normal Map Slider", Range( 0 , 5)) = 1
		[HideInInspector][HDR]_EmissionColor("Emission Color", Color) = (0,0,0,0)
		[NoScaleOffset][SingleLineTexture]_EmissionMap("Emission Map--{reference_property:_EmissionColor}", 2D) = "white" {}
		_EmissionBoost("Emission Boost", Range( 0 , 4)) = 1
		[Vector2]_Tiling("Tiling", Vector) = (1,1,0,0)
		[Vector2]_Offset("Offset", Vector) = (0,0,0,0)
		[Enum(UV0,0,UV1,1,UV2,2,UV3,3)]_UVMain("UV", Int) = 0
		[HideInInspector]m_end_Main("Main", Float) = 0
		[HideInInspector]footer_discord("", Float) = 0
		[HideInInspector]footer_patreon("", Float) = 0
		[HideInInspector]footer_booth("", Float) = 0
		[HideInInspector]footer_github("", Float) = 0
		[HideInInspector] _texcoord3( "", 2D ) = "white" {}
		[HideInInspector] _texcoord2( "", 2D ) = "white" {}
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] _texcoord4( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" "IsEmissive" = "true"  }
		Cull Back
		CGINCLUDE
		#include "UnityStandardUtils.cginc"
		#include "UnityPBSLighting.cginc"
		#include "Lighting.cginc"
		#pragma target 3.0
		#ifdef UNITY_PASS_SHADOWCASTER
			#undef INTERNAL_DATA
			#undef WorldReflectionVector
			#undef WorldNormalVector
			#define INTERNAL_DATA half3 internalSurfaceTtoW0; half3 internalSurfaceTtoW1; half3 internalSurfaceTtoW2;
			#define WorldReflectionVector(data,normal) reflect (data.worldRefl, half3(dot(data.internalSurfaceTtoW0,normal), dot(data.internalSurfaceTtoW1,normal), dot(data.internalSurfaceTtoW2,normal)))
			#define WorldNormalVector(data,normal) half3(dot(data.internalSurfaceTtoW0,normal), dot(data.internalSurfaceTtoW1,normal), dot(data.internalSurfaceTtoW2,normal))
		#endif
		struct Input
		{
			float2 uv_texcoord;
			float2 uv2_texcoord2;
			float2 uv3_texcoord3;
			float2 uv4_texcoord4;
			float3 worldPos;
			float3 worldNormal;
			INTERNAL_DATA
		};

		uniform float shader_is_using_thry_editor;
		uniform float shader_master_label;
		uniform float footer_patreon;
		uniform float footer_discord;
		uniform float Instancing;
		uniform float DSGI;
		uniform float m_start_Main;
		uniform float _Cull;
		uniform float m_end_Main;
		uniform float footer_booth;
		uniform float shader_properties_label_file;
		uniform float footer_github;
		uniform float LightmapFlags;
		uniform float _UseNormalMap;
		uniform sampler2D _BumpMap;
		uniform float2 _Offset;
		uniform float2 _Tiling;
		uniform int _UVMain;
		uniform float _NormalMapSlider;
		uniform float4 _Color;
		uniform sampler2D _MainTex;
		uniform sampler2D _EmissionMap;
		uniform float4 _EmissionColor;
		uniform float _EmissionBoost;
		uniform float _Metallic;
		uniform sampler2D _MetallicGlossMap;
		uniform float _Glossiness;
		uniform float _AntiAliasingVariance;
		uniform float _AntiAliasingThreshold;


		float2 UVSelector9_g65( int Set, float2 UV0, float2 UV1, float2 UV2, float2 UV3, float2 UV4, float2 UV5, float2 UV6 )
		{
			float2 UvSet[7];
			UvSet[0] = UV0;
			UvSet[1] = UV1;
			UvSet[2] = UV2;
			UvSet[3] = UV3;
			UvSet[4] = UV4;
			UvSet[5] = UV5;
			UvSet[6] = UV6;
			return UvSet[Set];
		}


		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float3 _Vector0 = float3(0,0,1);
			int Set9_g65 = _UVMain;
			float2 UV09_g65 = i.uv_texcoord;
			float2 UV19_g65 = i.uv2_texcoord2;
			float2 UV29_g65 = i.uv3_texcoord3;
			float2 UV39_g65 = i.uv4_texcoord4;
			float3 ase_worldPos = i.worldPos;
			float2 appendResult40_g65 = (float2(ase_worldPos.x , 0.0));
			float2 UV49_g65 = appendResult40_g65;
			float2 appendResult41_g65 = (float2(ase_worldPos.x , 0.0));
			float2 UV59_g65 = appendResult41_g65;
			float2 appendResult42_g65 = (float2(0.0 , 0.0));
			float2 UV69_g65 = appendResult42_g65;
			float2 localUVSelector9_g65 = UVSelector9_g65( Set9_g65 , UV09_g65 , UV19_g65 , UV29_g65 , UV39_g65 , UV49_g65 , UV59_g65 , UV69_g65 );
			float2 MainUV339 = ( _Offset + ( _Tiling * localUVSelector9_g65 ) );
			float3 ifLocalVar57 = 0;
			if( _UseNormalMap == 1.0 )
				ifLocalVar57 = UnpackScaleNormal( tex2D( _BumpMap, MainUV339 ), _NormalMapSlider );
			else
				ifLocalVar57 = _Vector0;
			float3 NormalMap336 = ifLocalVar57;
			o.Normal = NormalMap336;
			float4 Albedo351 = ( _Color * tex2D( _MainTex, MainUV339 ) );
			o.Albedo = Albedo351.rgb;
			float4 EmissionMap354 = ( tex2D( _EmissionMap, MainUV339 ) * _EmissionColor * _EmissionBoost );
			o.Emission = EmissionMap354.rgb;
			float4 tex2DNode59 = tex2D( _MetallicGlossMap, MainUV339 );
			float3 ase_worldNormal = WorldNormalVector( i, float3( 0, 0, 1 ) );
			float3 temp_output_1_0_g69 = ase_worldNormal;
			float3 temp_output_4_0_g69 = ddx( temp_output_1_0_g69 );
			float dotResult6_g69 = dot( temp_output_4_0_g69 , temp_output_4_0_g69 );
			float3 temp_output_5_0_g69 = ddy( temp_output_1_0_g69 );
			float dotResult8_g69 = dot( temp_output_5_0_g69 , temp_output_5_0_g69 );
			float lerpResult436 = lerp( _Glossiness , 0.0 , sqrt( sqrt( saturate( min( ( ( ( dotResult6_g69 + dotResult8_g69 ) * _AntiAliasingVariance ) * 2.0 ) , _AntiAliasingThreshold ) ) ) ));
			float2 appendResult346 = (float2(( _Metallic * tex2DNode59 ).r , ( lerpResult436 * tex2DNode59.a )));
			float2 MetallicSmoothness345 = appendResult346;
			float2 break348 = MetallicSmoothness345;
			o.Metallic = break348;
			o.Smoothness = break348.y;
			o.Alpha = 1;
		}

		ENDCG
		CGPROGRAM
		#pragma surface surf Standard keepalpha fullforwardshadows 

		ENDCG
		Pass
		{
			Name "ShadowCaster"
			Tags{ "LightMode" = "ShadowCaster" }
			ZWrite On
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#pragma target 3.0
			#pragma multi_compile_shadowcaster
			#pragma multi_compile UNITY_PASS_SHADOWCASTER
			#pragma skip_variants FOG_LINEAR FOG_EXP FOG_EXP2
			#include "HLSLSupport.cginc"
			#if ( SHADER_API_D3D11 || SHADER_API_GLCORE || SHADER_API_GLES || SHADER_API_GLES3 || SHADER_API_METAL || SHADER_API_VULKAN )
				#define CAN_SKIP_VPOS
			#endif
			#include "UnityCG.cginc"
			#include "Lighting.cginc"
			#include "UnityPBSLighting.cginc"
			struct v2f
			{
				V2F_SHADOW_CASTER;
				float4 customPack1 : TEXCOORD1;
				float4 customPack2 : TEXCOORD2;
				float4 tSpace0 : TEXCOORD3;
				float4 tSpace1 : TEXCOORD4;
				float4 tSpace2 : TEXCOORD5;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};
			v2f vert( appdata_full v )
			{
				v2f o;
				UNITY_SETUP_INSTANCE_ID( v );
				UNITY_INITIALIZE_OUTPUT( v2f, o );
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );
				UNITY_TRANSFER_INSTANCE_ID( v, o );
				Input customInputData;
				float3 worldPos = mul( unity_ObjectToWorld, v.vertex ).xyz;
				half3 worldNormal = UnityObjectToWorldNormal( v.normal );
				half3 worldTangent = UnityObjectToWorldDir( v.tangent.xyz );
				half tangentSign = v.tangent.w * unity_WorldTransformParams.w;
				half3 worldBinormal = cross( worldNormal, worldTangent ) * tangentSign;
				o.tSpace0 = float4( worldTangent.x, worldBinormal.x, worldNormal.x, worldPos.x );
				o.tSpace1 = float4( worldTangent.y, worldBinormal.y, worldNormal.y, worldPos.y );
				o.tSpace2 = float4( worldTangent.z, worldBinormal.z, worldNormal.z, worldPos.z );
				o.customPack1.xy = customInputData.uv_texcoord;
				o.customPack1.xy = v.texcoord;
				o.customPack1.zw = customInputData.uv2_texcoord2;
				o.customPack1.zw = v.texcoord1;
				o.customPack2.xy = customInputData.uv3_texcoord3;
				o.customPack2.xy = v.texcoord2;
				o.customPack2.zw = customInputData.uv4_texcoord4;
				o.customPack2.zw = v.texcoord3;
				TRANSFER_SHADOW_CASTER_NORMALOFFSET( o )
				return o;
			}
			half4 frag( v2f IN
			#if !defined( CAN_SKIP_VPOS )
			, UNITY_VPOS_TYPE vpos : VPOS
			#endif
			) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID( IN );
				Input surfIN;
				UNITY_INITIALIZE_OUTPUT( Input, surfIN );
				surfIN.uv_texcoord = IN.customPack1.xy;
				surfIN.uv2_texcoord2 = IN.customPack1.zw;
				surfIN.uv3_texcoord3 = IN.customPack2.xy;
				surfIN.uv4_texcoord4 = IN.customPack2.zw;
				float3 worldPos = float3( IN.tSpace0.w, IN.tSpace1.w, IN.tSpace2.w );
				half3 worldViewDir = normalize( UnityWorldSpaceViewDir( worldPos ) );
				surfIN.worldPos = worldPos;
				surfIN.worldNormal = float3( IN.tSpace0.z, IN.tSpace1.z, IN.tSpace2.z );
				surfIN.internalSurfaceTtoW0 = IN.tSpace0.xyz;
				surfIN.internalSurfaceTtoW1 = IN.tSpace1.xyz;
				surfIN.internalSurfaceTtoW2 = IN.tSpace2.xyz;
				SurfaceOutputStandard o;
				UNITY_INITIALIZE_OUTPUT( SurfaceOutputStandard, o )
				surf( surfIN, o );
				#if defined( CAN_SKIP_VPOS )
				float2 vpos = IN.pos;
				#endif
				SHADOW_CASTER_FRAGMENT( IN )
			}
			ENDCG
		}
	}
	Fallback "Diffuse"
	CustomEditor "Thry.ShaderEditor"
}
/*ASEBEGIN
Version=18921
974.4;601.6;1513;639;-467.9185;970.1804;1;True;False
Node;AmplifyShaderEditor.CommentaryNode;353;-13.06665,-2923.378;Inherit;False;3151.7;441.8367;;12;93;325;53;351;92;52;51;339;293;429;427;428;Albedo;1,1,1,1;0;0
Node;AmplifyShaderEditor.Vector2Node;92;876.457,-2857.449;Inherit;False;Property;_Tiling;Tiling;21;0;Create;True;0;0;0;False;1;Vector2;False;1,1;1,1;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.Vector2Node;93;878.8617,-2721.203;Inherit;False;Property;_Offset;Offset;22;0;Create;True;0;0;0;False;1;Vector2;False;0,0;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.IntNode;293;878.231,-2579.398;Inherit;False;Property;_UVMain;UV;23;1;[Enum];Create;False;0;4;UV0;0;UV1;1;UV2;2;UV3;3;0;False;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.FunctionNode;325;1218.81,-2834.146;Inherit;False;UV Selector;-1;;65;d8047ff639977014ab6649a770bd5cd4;0;3;15;INT;0;False;16;FLOAT2;0,0;False;17;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerStateNode;427;42.18301,-2596.55;Inherit;False;0;0;0;1;-1;1;0;SAMPLER2D;;False;1;SAMPLERSTATE;0
Node;AmplifyShaderEditor.CommentaryNode;349;103.451,-2396.025;Inherit;False;1718.701;670.9299;;14;434;435;433;436;345;346;63;62;60;437;430;344;61;59;Metallic Smoothness;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;434;221.9034,-1840.355;Inherit;False;Property;_AntiAliasingThreshold;Anti Aliasing Threshold;14;0;Create;False;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;435;221.4537,-1928.146;Inherit;False;Property;_AntiAliasingVariance;Anti Aliasing Variance;13;0;Create;False;0;0;0;False;0;False;0.01;1;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;428;261.1377,-2601.339;Inherit;False;Sampler;-1;True;1;0;SAMPLERSTATE;;False;1;SAMPLERSTATE;0
Node;AmplifyShaderEditor.WorldNormalVector;437;220.0246,-2157.388;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RegisterLocalVarNode;339;1586.841,-2589.398;Inherit;False;MainUV;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;430;222.9283,-2246.377;Inherit;False;428;Sampler;1;0;OBJECT;;False;1;SAMPLERSTATE;0
Node;AmplifyShaderEditor.GetLocalVarNode;344;233.9534,-2328.221;Inherit;False;339;MainUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FunctionNode;433;564.8549,-1949.357;Inherit;False;GSAA;-1;;69;a3c5c6cf9d1dd744589a5e3146f5a3a1;0;3;1;FLOAT3;0,0,0;False;10;FLOAT;0;False;12;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;60;219.4762,-2011.271;Inherit;False;Property;_Glossiness;Smoothness;12;0;Create;False;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;436;1011.431,-2037.736;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;357;806.2949,-942.3341;Inherit;False;1224.44;469.0579;;7;354;50;109;342;233;432;438;Emission Base;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;61;545.2057,-2327.54;Inherit;False;Property;_Metallic;Metallic Slider;11;1;[HideInInspector];Create;False;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;59;493.8893,-2245.168;Inherit;True;Property;_MetallicGlossMap;Metallic Map--{reference_property:_Metallic};10;2;[NoScaleOffset];[SingleLineTexture];Create;False;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CommentaryNode;350;825.9982,-1635.868;Inherit;False;1304.338;547.112;;8;55;56;54;58;343;336;57;431;Normal;1,1,1,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode;429;1624.968,-2702.157;Inherit;False;428;Sampler;1;0;OBJECT;;False;1;SAMPLERSTATE;0
Node;AmplifyShaderEditor.GetLocalVarNode;432;909.0336,-746.5608;Inherit;False;428;Sampler;1;0;OBJECT;;False;1;SAMPLERSTATE;0
Node;AmplifyShaderEditor.GetLocalVarNode;342;913.2749,-826.2921;Inherit;False;339;MainUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;431;959.7844,-1264.483;Inherit;False;428;Sampler;1;0;OBJECT;;False;1;SAMPLERSTATE;0
Node;AmplifyShaderEditor.RangedFloatNode;54;862.5239,-1441.853;Inherit;False;Property;_NormalMapSlider;Normal Map Slider;17;1;[HideInInspector];Create;False;0;0;0;False;0;False;1;1;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;343;960.2593,-1353.611;Inherit;False;339;MainUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;63;1207.841,-2134.308;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;62;1209.009,-2247.843;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;233;1153.879,-895.1215;Inherit;True;Property;_EmissionMap;Emission Map--{reference_property:_EmissionColor};19;2;[NoScaleOffset];[SingleLineTexture];Create;False;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;55;1171.324,-1481.494;Inherit;True;Property;_BumpMap;Normal Map--{reference_property:_NormalMapSlider,condition_show:{type:PROPERTY_BOOL,data:_UseNormalMap==1}};16;3;[NoScaleOffset];[Normal];[SingleLineTexture];Create;False;0;0;0;False;0;False;-1;None;None;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;58;1263.983,-1571.453;Inherit;False;Property;_UseNormalMap;Enable Normal Map;15;1;[IntRange];Create;False;0;0;0;False;1;Toggle(_NORMALMAP);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;50;1263.592,-648.4316;Inherit;False;Property;_EmissionColor;Emission Color;18;2;[HideInInspector];[HDR];Create;False;0;0;0;False;0;False;0,0,0,0;0.7169812,0.4633322,0.4633322,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector3Node;56;1311.983,-1265.853;Inherit;False;Constant;_Vector0;Vector 0;11;0;Create;True;0;0;0;False;0;False;0,0,1;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SamplerNode;51;2032.456,-2700.218;Inherit;True;Property;_MainTex;Albedo Map--{reference_property:_Color};8;2;[NoScaleOffset];[SingleLineTexture];Create;False;0;0;0;False;0;False;-1;None;5a44b81b7fc213a459c7ba071dd81ffe;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;346;1410.247,-2214.088;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;438;884.7167,-632.7006;Inherit;False;Property;_EmissionBoost;Emission Boost;20;0;Create;True;0;0;0;False;0;False;1;0;0;4;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;53;2256.196,-2886.578;Inherit;False;Property;_Color;Albedo Color;9;1;[HideInInspector];Create;False;0;0;0;False;0;False;1,1,1,0;1,1,1,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;52;2579.131,-2770.723;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ConditionalIfNode;57;1527.983,-1468.853;Inherit;False;False;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;383;2724.658,-1501.358;Inherit;False;1046.414;638.5916;;6;382;338;347;348;352;425;Output;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;109;1572.314,-744.9402;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;345;1569.711,-2216.984;Inherit;False;MetallicSmoothness;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;347;2893.103,-1063.297;Inherit;False;345;MetallicSmoothness;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.CommentaryNode;87;3030.35,-752.2058;Inherit;False;741.2661;134.4619;;4;90;89;88;260;Settings;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;351;2774.396,-2772.925;Inherit;False;Albedo;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;336;1785.398,-1474.161;Inherit;False;NormalMap;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;354;1759.782,-753.0757;Inherit;False;EmissionMap;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;260;3611.366,-701.9099;Inherit;False;Property;_Cull;Cull;3;1;[Enum];Create;True;0;3;Off;0;Front;1;Back;2;0;True;0;False;2;2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;101;3076.935,-2012.448;Inherit;False;Property;m_end_Main;Main;24;1;[HideInInspector];Create;False;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;82;2321.891,-1788.982;Inherit;False;Property;footer_booth;;27;1;[HideInInspector];Create;False;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;90;3412.35,-707.2058;Inherit;False;Property;LightmapFlags;LightmapFlags;4;1;[HideInInspector];Create;False;0;0;0;True;0;False;0;2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;84;2641.697,-1790.064;Inherit;False;Property;footer_github;;28;1;[HideInInspector];Create;False;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;382;3007.455,-1165.835;Inherit;False;354;EmissionMap;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;81;2706.268,-2011.101;Inherit;False;Property;shader_properties_label_file;TsunaMooLabels;2;1;[HideInInspector];Create;False;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.BreakToComponentsNode;348;3169.103,-1080.297;Inherit;False;FLOAT2;1;0;FLOAT2;0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.RangedFloatNode;79;2502.38,-2013.116;Inherit;False;Property;shader_master_label;<color=#ffffffff>Tsuna</color> <color=#000000ff>Moo</color> <color=#ffffffff>Shader</color> <color=#000000ff>Lab</color>--{texture:{name:tsuna_moo_icon,height:128}};1;1;[HideInInspector];Create;False;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;88;3068.169,-708.6589;Inherit;False;Property;DSGI;DSGI;5;1;[HideInInspector];Create;False;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;89;3235.35,-707.2058;Inherit;False;Property;Instancing;Instancing;6;1;[HideInInspector];Create;False;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;338;3015.643,-1244.666;Inherit;False;336;NormalMap;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;85;2790.643,-1790.084;Inherit;False;Property;footer_discord;;25;1;[HideInInspector];Create;False;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;83;2473.747,-1787.348;Inherit;False;Property;footer_patreon;;26;1;[HideInInspector];Create;False;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;352;3021.234,-1322.206;Inherit;False;351;Albedo;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;78;2328.039,-2010.404;Inherit;False;Property;shader_is_using_thry_editor;;0;1;[HideInInspector];Create;False;0;0;0;True;0;False;0;69;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;86;2919.912,-2011.462;Inherit;False;Property;m_start_Main;Main;7;1;[HideInInspector];Create;False;0;0;0;True;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;425;3372.38,-1307.736;Float;False;True;-1;2;Thry.ShaderEditor;0;0;Standard;TsunaMoo/Standard Helper FX;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;18;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;True;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;False;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;325;15;293;0
WireConnection;325;16;92;0
WireConnection;325;17;93;0
WireConnection;428;0;427;0
WireConnection;339;0;325;0
WireConnection;433;1;437;0
WireConnection;433;10;435;0
WireConnection;433;12;434;0
WireConnection;436;0;60;0
WireConnection;436;2;433;0
WireConnection;59;1;344;0
WireConnection;59;7;430;0
WireConnection;63;0;436;0
WireConnection;63;1;59;4
WireConnection;62;0;61;0
WireConnection;62;1;59;0
WireConnection;233;1;342;0
WireConnection;233;7;432;0
WireConnection;55;1;343;0
WireConnection;55;5;54;0
WireConnection;55;7;431;0
WireConnection;51;1;339;0
WireConnection;51;7;429;0
WireConnection;346;0;62;0
WireConnection;346;1;63;0
WireConnection;52;0;53;0
WireConnection;52;1;51;0
WireConnection;57;0;58;0
WireConnection;57;2;56;0
WireConnection;57;3;55;0
WireConnection;57;4;56;0
WireConnection;109;0;233;0
WireConnection;109;1;50;0
WireConnection;109;2;438;0
WireConnection;345;0;346;0
WireConnection;351;0;52;0
WireConnection;336;0;57;0
WireConnection;354;0;109;0
WireConnection;348;0;347;0
WireConnection;425;0;352;0
WireConnection;425;1;338;0
WireConnection;425;2;382;0
WireConnection;425;3;348;0
WireConnection;425;4;348;1
ASEEND*/
//CHKSM=76FB45602A5E8A3E7C7D7E936821F58B0D231346