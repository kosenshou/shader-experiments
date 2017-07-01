using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[ExecuteInEditMode]
public class ReplacementShader : MonoBehaviour
{
	public Shader shader;
	public Color overDrawColor;
	
	void OnValidate()
	{
		Shader.SetGlobalColor ("_OverDrawColor", overDrawColor);
	}

	void OnEnable()
	{
		if (shader != null)
			GetComponent<Camera> ().SetReplacementShader (shader, "");
	}

	void OnDisable()
	{
		GetComponent<Camera> ().ResetReplacementShader ();
	}
}
