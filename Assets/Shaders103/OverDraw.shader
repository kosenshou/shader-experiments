﻿Shader "Shaders103/OverDraw"
{
	SubShader
	{
		Tags
		{
			"Queue"="Transparent"
		}

		ZTest Always
		ZWrite Off
		Blend One One

		Pass
		{
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag

			#include "UnityCG.cginc"

			struct appdata
			{
				float4 vertex : POSITION;
			};

			struct v2f
			{
				float4 vertex : SV_POSITION;
			};

			v2f vert (appdata v)
			{
				v2f o;
				o.vertex = UnityObjectToClipPos(v.vertex);
				return o;
			}

			half4 _OverDrawColor;

			fixed4 frag (v2f i) : SV_TARGET
			{
				return _OverDrawColor;
			}
			ENDCG
		}
	}
}