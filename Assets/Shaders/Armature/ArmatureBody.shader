Shader "Custom/ArmatureBody"
{
    Properties
    { }

    SubShader
    {
        Tags { "RenderType" = "Opaque" "RenderPipeline" = "UniversalRenderPipeline" }

        Pass
        {
            HLSLPROGRAM
            #pragma vertex vMain
            #pragma fragment fMain

            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"            

            struct VertIn
            {
                float4 position : POSITION;                 
            };

            struct VertOut
            {
                float4 position : SV_POSITION;
            };

            VertOut vMain(VertIn input)
            {
                VertOut output;
                output.position = TransformObjectToHClip(input.position.xyz);
                return output;
            }

            float4 fMain() : SV_Target
            {
                //discard;
                return float4(0.0f, 0.0f, 0.0f, 0.0f);
            }
            ENDHLSL
        }
    }
}
