Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:57088 "EHLO pokefinder.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751692AbcEJNyy (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 10 May 2016 09:54:54 -0400
From: Wolfram Sang <wsa@the-dreams.de>
To: driverdev-devel@linuxdriverproject.org
Cc: Wolfram Sang <wsa@the-dreams.de>, linux-renesas-soc@vger.kernel.org
Subject: [PATCH 15/27] staging: ks7010: indent eap_packet.h
Date: Tue, 10 May 2016 15:52:28 +0200
Message-Id: <1462888360-21649-16-git-send-email-wsa@the-dreams.de>
In-Reply-To: <1462888360-21649-1-git-send-email-wsa@the-dreams.de>
References: <1462888360-21649-1-git-send-email-wsa@the-dreams.de>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Wolfram Sang <wsa+renesas@sang-engineering.com>

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/staging/ks7010/eap_packet.h | 49 ++++++++++++++++++-------------------
 1 file changed, 24 insertions(+), 25 deletions(-)

diff --git a/drivers/staging/ks7010/eap_packet.h b/drivers/staging/ks7010/eap_packet.h
index b664bdd8c961db..88384fb19d9580 100644
--- a/drivers/staging/ks7010/eap_packet.h
+++ b/drivers/staging/ks7010/eap_packet.h
@@ -14,13 +14,13 @@
 #endif
 
 struct ether_hdr {
-	unsigned char	h_dest[ETH_ALEN];	/* destination eth addr	*/
-	unsigned char	h_source[ETH_ALEN];	/* source ether addr	*/
-	unsigned char   h_dest_snap;
-	unsigned char   h_source_snap;
-	unsigned char   h_command;
-	unsigned char   h_vendor_id[3];
-	unsigned short	h_proto;		/* packet type ID field	*/
+	unsigned char h_dest[ETH_ALEN];	/* destination eth addr */
+	unsigned char h_source[ETH_ALEN];	/* source ether addr    */
+	unsigned char h_dest_snap;
+	unsigned char h_source_snap;
+	unsigned char h_command;
+	unsigned char h_vendor_id[3];
+	unsigned short h_proto;	/* packet type ID field */
 #define ETHER_PROTOCOL_TYPE_EAP		0x888e
 #define ETHER_PROTOCOL_TYPE_IP		0x0800
 #define ETHER_PROTOCOL_TYPE_ARP		0x0806
@@ -37,15 +37,15 @@ struct ieee802_1x_hdr {
 #define EAPOL_VERSION 2
 
 enum { IEEE802_1X_TYPE_EAP_PACKET = 0,
-       IEEE802_1X_TYPE_EAPOL_START = 1,
-       IEEE802_1X_TYPE_EAPOL_LOGOFF = 2,
-       IEEE802_1X_TYPE_EAPOL_KEY = 3,
-       IEEE802_1X_TYPE_EAPOL_ENCAPSULATED_ASF_ALERT = 4
+	IEEE802_1X_TYPE_EAPOL_START = 1,
+	IEEE802_1X_TYPE_EAPOL_LOGOFF = 2,
+	IEEE802_1X_TYPE_EAPOL_KEY = 3,
+	IEEE802_1X_TYPE_EAPOL_ENCAPSULATED_ASF_ALERT = 4
 };
 
 enum { EAPOL_KEY_TYPE_RC4 = 1, EAPOL_KEY_TYPE_RSN = 2,
-       EAPOL_KEY_TYPE_WPA = 254 };
-
+	EAPOL_KEY_TYPE_WPA = 254
+};
 
 #define IEEE8021X_REPLAY_COUNTER_LEN 8
 #define IEEE8021X_KEY_SIGN_LEN 16
@@ -60,11 +60,11 @@ struct ieee802_1x_eapol_key {
 	/* does not repeat within the life of the keying material used to
 	 * encrypt the Key field; 64-bit NTP timestamp MAY be used here */
 	unsigned char replay_counter[IEEE8021X_REPLAY_COUNTER_LEN];
-	unsigned char key_iv[IEEE8021X_KEY_IV_LEN]; /* cryptographically random number */
-	unsigned char key_index; /* key flag in the most significant bit:
-		       * 0 = broadcast (default key),
-		       * 1 = unicast (key mapping key); key index is in the
-		       * 7 least significant bits */
+	unsigned char key_iv[IEEE8021X_KEY_IV_LEN];	/* cryptographically random number */
+	unsigned char key_index;	/* key flag in the most significant bit:
+					 * 0 = broadcast (default key),
+					 * 1 = unicast (key mapping key); key index is in the
+					 * 7 least significant bits */
 	/* HMAC-MD5 message integrity check computed with MS-MPPE-Send-Key as
 	 * the key */
 	unsigned char key_signature[IEEE8021X_KEY_SIGN_LEN];
@@ -77,19 +77,18 @@ struct ieee802_1x_eapol_key {
 	 * RC4 key used in encryption = Key-IV + MS-MPPE-Recv-Key */
 } __attribute__ ((packed));
 
-
 #define WPA_NONCE_LEN 32
 #define WPA_REPLAY_COUNTER_LEN 8
 
 struct wpa_eapol_key {
 	unsigned char type;
- 	unsigned short key_info;
+	unsigned short key_info;
 	unsigned short key_length;
 	unsigned char replay_counter[WPA_REPLAY_COUNTER_LEN];
 	unsigned char key_nonce[WPA_NONCE_LEN];
 	unsigned char key_iv[16];
 	unsigned char key_rsc[8];
-	unsigned char key_id[8]; /* Reserved in IEEE 802.11i/RSN */
+	unsigned char key_id[8];	/* Reserved in IEEE 802.11i/RSN */
 	unsigned char key_mic[16];
 	unsigned short key_data_length;
 	/* followed by key_data_length bytes of key_data */
@@ -98,18 +97,18 @@ struct wpa_eapol_key {
 #define WPA_KEY_INFO_TYPE_MASK (WBIT(0) | WBIT(1) | WBIT(2))
 #define WPA_KEY_INFO_TYPE_HMAC_MD5_RC4 WBIT(0)
 #define WPA_KEY_INFO_TYPE_HMAC_SHA1_AES WBIT(1)
-#define WPA_KEY_INFO_KEY_TYPE WBIT(3) /* 1 = Pairwise, 0 = Group key */
+#define WPA_KEY_INFO_KEY_TYPE WBIT(3)	/* 1 = Pairwise, 0 = Group key */
 /* bit4..5 is used in WPA, but is reserved in IEEE 802.11i/RSN */
 #define WPA_KEY_INFO_KEY_INDEX_MASK (WBIT(4) | WBIT(5))
 #define WPA_KEY_INFO_KEY_INDEX_SHIFT 4
-#define WPA_KEY_INFO_INSTALL WBIT(6) /* pairwise */
-#define WPA_KEY_INFO_TXRX WBIT(6) /* group */
+#define WPA_KEY_INFO_INSTALL WBIT(6)	/* pairwise */
+#define WPA_KEY_INFO_TXRX WBIT(6)	/* group */
 #define WPA_KEY_INFO_ACK WBIT(7)
 #define WPA_KEY_INFO_MIC WBIT(8)
 #define WPA_KEY_INFO_SECURE WBIT(9)
 #define WPA_KEY_INFO_ERROR WBIT(10)
 #define WPA_KEY_INFO_REQUEST WBIT(11)
-#define WPA_KEY_INFO_ENCR_KEY_DATA WBIT(12) /* IEEE 802.11i/RSN only */
+#define WPA_KEY_INFO_ENCR_KEY_DATA WBIT(12)	/* IEEE 802.11i/RSN only */
 
 #define WPA_CAPABILITY_PREAUTH WBIT(0)
 
-- 
2.8.1
