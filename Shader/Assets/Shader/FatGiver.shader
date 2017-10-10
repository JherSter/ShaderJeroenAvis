Shader "Custom/FatGiver" {
	Properties {
		
		_MainTex ("Albedo (RGB)", 2D) = "white" {}
		_Fat ("_Fat", Range(0,1)) = 0.0
	}
	SubShader {
		Tags { "RenderType"="Opaque" }
		LOD 200
		
		CGPROGRAM
		// Physically based Standard lighting model, and enable shadows on all light types
		#pragma surface surf Lambert vertex:vert


		sampler2D _MainTex;
		fixed _Fat;	

		struct Input {
			float2 uv_MainTex;
		};

		void vert(inout appdata_full v){
		v.vertex.z = v.vertex.z + (1 * v.vertex.z) * _Fat;
			v.vertex.y = v.vertex.y + (1 * v.vertex.y) * _Fat;


		}

		void surf (Input IN, inout SurfaceOutput o) {
            half4 c = tex2D (_MainTex, IN.uv_MainTex);
            o.Albedo = c.rgb;
        }
        ENDCG
	}
	FallBack "Diffuse"
}
