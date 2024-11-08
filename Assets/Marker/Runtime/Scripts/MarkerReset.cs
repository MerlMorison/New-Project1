
using System;
using UdonSharp;
#if UNITY_EDITOR && !COMPILER_UDONSHARP
using UnityEditor;
#endif
using UnityEngine;
using VRC.SDK3.Components;
using VRC.SDKBase;
using VRC.Udon;

namespace VRCMarker
{
    [UdonBehaviourSyncMode(BehaviourSyncMode.NoVariableSync)]
    public class MarkerReset : UdonSharpBehaviour
    {
        [SerializeField] private bool masterOnly;
        public VRCPickup[] pickups;
        public VRCObjectSync[] objectSync;
        private VRCPlayerApi localPlayer;

        private void Start()
        {
            localPlayer = Networking.LocalPlayer;
        }

        public void ResetAll()
        {
            if (masterOnly)
            {
                if (!localPlayer.isMaster) return;
            }

            for (int i = 0; i < pickups.Length; i++)
            {
                if (!pickups[i].IsHeld)
                {
                    Networking.SetOwner(localPlayer, objectSync[i].gameObject);
                    objectSync[i].Respawn();
                }
            }
        }
    }

#if UNITY_EDITOR && !COMPILER_UDONSHARP

    [CustomEditor(typeof(MarkerReset))]
    public class CustomInspectorResetEditor : Editor
    {

        public override void OnInspectorGUI()
        {
            var reset = (MarkerReset)target;
            if (GUILayout.Button("Find All"))
            {
                Undo.RecordObject(reset, "Find All ");
                var markers = FindObjectsOfType<MarkerSettings>();
                if (markers?.Length > 0)
                {
                    reset.objectSync = new VRCObjectSync[markers.Length];
                    reset.pickups = new VRCPickup[markers.Length];

                    for (int i = 0; i < markers.Length; i++)
                    {
                        reset.objectSync[i] = markers[i]?.marker.GetComponent<VRCObjectSync>();
                        reset.pickups[i] = markers[i]?.marker.GetComponent<VRCPickup>();
                    }
                }
            }
            base.OnInspectorGUI();
        }
    }
#endif
}
