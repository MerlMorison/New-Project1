
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon;
using VRC.Udon.Common;

namespace VRCMarker
{
    [UdonBehaviourSyncMode(BehaviourSyncMode.Manual)]
    public class EraseAll : UdonSharpBehaviour
    {
        [SerializeField] private bool masterOnly;
        [SerializeField] private MarkerTrail[] markerTrail;
        private VRCPlayerApi localPlayer;

        private void Start()
        {
            localPlayer = Networking.LocalPlayer;
        }

        public void EraseAllNetworked()
        {
            if (masterOnly)
            {
                if (!localPlayer.isMaster) return;
            }

            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, nameof(Erase));
        }
        public void Erase()
        {
            for (int i = 0; i < markerTrail.Length; i++)
            {
                markerTrail[i].Clear();
            }
        }
    }
}
