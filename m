Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:57038 "EHLO pokefinder.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751628AbcEJNym (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 10 May 2016 09:54:42 -0400
From: Wolfram Sang <wsa@the-dreams.de>
To: driverdev-devel@linuxdriverproject.org
Cc: Wolfram Sang <wsa@the-dreams.de>, linux-renesas-soc@vger.kernel.org
Subject: [PATCH 04/27] staging: ks7010: remove checks for WIRELESS_EXT version
Date: Tue, 10 May 2016 15:52:17 +0200
Message-Id: <1462888360-21649-5-git-send-email-wsa@the-dreams.de>
In-Reply-To: <1462888360-21649-1-git-send-email-wsa@the-dreams.de>
References: <1462888360-21649-1-git-send-email-wsa@the-dreams.de>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Wolfram Sang <wsa+renesas@sang-engineering.com>

We are by far newer than that anyhow.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/staging/ks7010/ks_hostif.c   | 23 -----------------------
 drivers/staging/ks7010/ks_wlan_net.c | 14 --------------
 2 files changed, 37 deletions(-)

diff --git a/drivers/staging/ks7010/ks_hostif.c b/drivers/staging/ks7010/ks_hostif.c
index 0295bb4921fa20..6bea699655eec4 100644
--- a/drivers/staging/ks7010/ks_hostif.c
+++ b/drivers/staging/ks7010/ks_hostif.c
@@ -22,12 +22,7 @@
 #include <linux/if_arp.h>
 
 /* Include Wireless Extension definition and check version */
-#ifndef WIRELESS_EXT
-#include <linux/wireless.h>
-#endif /* WIRELESS_EXT */
-#if WIRELESS_EXT > 12
 #include <net/iw_handler.h>	/* New driver API */
-#endif	/* WIRELESS_EXT > 12 */
 
 extern int ks_wlan_hw_tx(ks_wlan_private *priv, void *p, unsigned long size,
 			 void (*complete_handler)(void *arg1, void *arg2),
@@ -121,10 +116,8 @@ static
 int get_current_ap(ks_wlan_private *priv, struct link_ap_info_t *ap_info)
 {
 	struct local_ap_t *ap;
-#if WIRELESS_EXT > 13
 	union iwreq_data wrqu;
 	struct net_device *netdev=priv->net_dev;
-#endif /* WIRELESS_EXT > 13 */
 	int rc=0;
 
 	DPRINTK(3,"\n");
@@ -190,7 +183,6 @@ int get_current_ap(ks_wlan_private *priv, struct link_ap_info_t *ap_info)
 		ap->wpa_ie.size = 0;
 	}
 
-#if WIRELESS_EXT > 13
 	wrqu.data.length = 0;
 	wrqu.data.flags = 0;
 	wrqu.ap_addr.sa_family = ARPHRD_ETHER;
@@ -203,7 +195,6 @@ int get_current_ap(ks_wlan_private *priv, struct link_ap_info_t *ap_info)
 			(unsigned char)wrqu.ap_addr.sa_data[4],(unsigned char)wrqu.ap_addr.sa_data[5]);
 		wireless_send_event(netdev, SIOCGIWAP, &wrqu, NULL);
 	}
-#endif
 	DPRINTK(4,"\n    Link AP\n");
 	DPRINTK(4,"    bssid=%02X:%02X:%02X:%02X:%02X:%02X\n \
    essid=%s\n    rate_set=%02X,%02X,%02X,%02X,%02X,%02X,%02X,%02X\n    channel=%d\n \
@@ -338,9 +329,7 @@ void hostif_data_indication(ks_wlan_private *priv)
 	struct ieee802_1x_hdr *aa1x_hdr;
 	struct wpa_eapol_key *eap_key;
 	struct michel_mic_t michel_mic;
-#if WIRELESS_EXT > 14
 	union iwreq_data wrqu;
-#endif /* WIRELESS_EXT > 14 */
 
 	DPRINTK(3,"\n");
 
@@ -412,7 +401,6 @@ void hostif_data_indication(ks_wlan_private *priv)
 							mic_failure->counter = 1;
 					}
 					priv->wpa.mic_failure.last_failure_time = now;
-#if WIRELESS_EXT > 14
 					/*  needed parameters: count, keyid, key type, TSC */
 					sprintf(buf, "MLME-MICHAELMICFAILURE.indication(keyid=%d %scast addr="
 						"%02x:%02x:%02x:%02x:%02x:%02x)",
@@ -424,7 +412,6 @@ void hostif_data_indication(ks_wlan_private *priv)
 					wrqu.data.length = strlen(buf);
 					DPRINTK(4,"IWEVENT:MICHAELMICFAILURE\n");
 					wireless_send_event(priv->net_dev, IWEVCUSTOM, &wrqu, buf);
-#endif /* WIRELESS_EXT > 14 */
 					return;
 				}
 			}
@@ -754,9 +741,7 @@ void hostif_connect_indication(ks_wlan_private *priv)
 	unsigned int tmp=0;
 	unsigned int old_status=priv->connect_status;
 	struct net_device *netdev=priv->net_dev;
-#if WIRELESS_EXT > 13
 	union iwreq_data wrqu0;
-#endif /* WIRELESS_EXT > 13 */
 	connect_code = get_WORD(priv);
 
 	switch(connect_code){
@@ -791,7 +776,6 @@ void hostif_connect_indication(ks_wlan_private *priv)
 	}
 	ks_wlan_do_power_save(priv);
 
-#if WIRELESS_EXT > 13
 	wrqu0.data.length = 0;
 	wrqu0.data.flags = 0;
 	wrqu0.ap_addr.sa_family = ARPHRD_ETHER;
@@ -802,7 +786,6 @@ void hostif_connect_indication(ks_wlan_private *priv)
 		DPRINTK(3,"disconnect :: scan_ind_count=%d\n",priv->scan_ind_count);
 		wireless_send_event(netdev, SIOCGIWAP, &wrqu0, NULL);
 	}
-#endif /* WIRELESS_EXT > 13 */
 	priv->scan_ind_count=0;
 }
 
@@ -904,7 +887,6 @@ void hostif_adhoc_set_confirm(ks_wlan_private *priv)
 static
 void hostif_associate_indication(ks_wlan_private *priv)
 {
-#if WIRELESS_EXT > 14
 	struct association_request_t *assoc_req;
 	struct association_response_t *assoc_resp;
 	unsigned char *pb;
@@ -944,29 +926,24 @@ void hostif_associate_indication(ks_wlan_private *priv)
 
 	DPRINTK(3,"IWEVENT:ASSOCINFO\n");
 	wireless_send_event(priv->net_dev, IWEVCUSTOM, &wrqu, buf);
-#endif /* WIRELESS_EXT > 14 */
 }
 
 static
 void hostif_bss_scan_confirm(ks_wlan_private *priv)
 {
 	unsigned int result_code;
-#if WIRELESS_EXT > 13
 	struct net_device *dev = priv->net_dev;
 	union iwreq_data wrqu;
-#endif /* WIRELESS_EXT > 13 */
 	result_code = get_DWORD(priv);
 	DPRINTK(2,"result=%d :: scan_ind_count=%d\n", result_code, priv->scan_ind_count);
 
 	priv->sme_i.sme_flag &= ~SME_AP_SCAN;
 	hostif_sme_enqueue(priv, SME_BSS_SCAN_CONFIRM);
 
-#if WIRELESS_EXT > 13
 	wrqu.data.length = 0;
 	wrqu.data.flags = 0;
 	DPRINTK(3,"IWEVENT: SCAN CONFIRM\n");
 	wireless_send_event(dev, SIOCGIWSCAN, &wrqu, NULL);
-#endif /* WIRELESS_EXT > 13 */
 	priv->scan_ind_count=0;
 }
 
diff --git a/drivers/staging/ks7010/ks_wlan_net.c b/drivers/staging/ks7010/ks_wlan_net.c
index 546a256093978c..185630cb423d5e 100644
--- a/drivers/staging/ks7010/ks_wlan_net.c
+++ b/drivers/staging/ks7010/ks_wlan_net.c
@@ -50,7 +50,6 @@ static int wep_on_off;
 #define WIRELESS_SPY		/* enable iwspy support */
 #include <net/iw_handler.h>	/* New driver API */
 
-#ifdef WIRELESS_EXT
 /* Frequency list (map channels to frequencies) */
 static const long frequency_list[] = { 2412, 2417, 2422, 2427, 2432, 2437, 2442,
 				       2447, 2452, 2457, 2462, 2467, 2472, 2484 };
@@ -74,7 +73,6 @@ static const struct iw_handler_def	ks_wlan_handler_def;
 
 #define KSC_OPNOTSUPP /* Operation Not Support*/
 
-#endif /* WIRELESS_EXT */
 
 /*
  *	function prototypes
@@ -174,7 +172,6 @@ int ks_wlan_setup_parameter(ks_wlan_private *priv, unsigned int commit_flag)
 	return 0;
 }
 
-#ifdef WIRELESS_EXT
 /*
  * Initial Wireless Extension code for Ks_Wlannet driver by :
  *	Jean Tourrilhes <jt@hpl.hp.com> - HPL - 17 November 00
@@ -1090,7 +1087,6 @@ static int ks_wlan_get_range(struct net_device *dev, struct iw_request_info *inf
 	range->avg_qual.level = 186;	/* -70 dBm */
 	range->avg_qual.noise = 0;
 
-#if defined(WIRELESS_EXT)
 	/* Event capability (kernel + driver) */
 	range->event_capa[0] = (IW_EVENT_CAPA_K_0 |
 				IW_EVENT_CAPA_MASK(SIOCGIWAP) |
@@ -1104,7 +1100,6 @@ static int ks_wlan_get_range(struct net_device *dev, struct iw_request_info *inf
 			   IW_ENC_CAPA_WPA2 |
 			   IW_ENC_CAPA_CIPHER_TKIP |
 			   IW_ENC_CAPA_CIPHER_CCMP);
-#endif
 	return 0;
 }
 
@@ -1229,7 +1224,6 @@ static int ks_wlan_get_aplist(struct net_device *dev, struct iw_request_info *in
 	return 0;
 }
 
-#if defined(WIRELESS_EXT)
 /*------------------------------------------------------------------*/
 /* Wireless Handler : Initiate Scan */
 static int ks_wlan_set_scan(struct net_device *dev, struct iw_request_info *info,
@@ -1452,7 +1446,6 @@ DPRINTK(2,"aplist 0\n");
 
 	return 0;
 }
-#endif	/* WIRELESS_EXT  */
 
 /*------------------------------------------------------------------*/
 /* Commit handler : called after a bunch of SET operations */
@@ -1469,7 +1462,6 @@ static int ks_wlan_config_commit(struct net_device *dev, struct iw_request_info
 	return 0;
 }
 
-#ifdef WIRELESS_EXT
 /*------------------------------------------------------------------*/
 /* Wireless handler : set association ie params */
 static int ks_wlan_set_genie(struct net_device *dev, struct iw_request_info *info,
@@ -1951,7 +1943,6 @@ static int ks_wlan_set_mlme(struct net_device *dev, struct iw_request_info *info
 		return -EOPNOTSUPP;  /* Not Support */
 	}
 }
-#endif /* WIRELESS_EXT  */
 
 /*------------------------------------------------------------------*/
 /* Private handler : get driver version */
@@ -2915,20 +2906,15 @@ static const struct iw_handler_def	ks_wlan_handler_def =
 	.get_wireless_stats = ks_get_wireless_stats,
 };
 
-#endif /* WIRELESS_EXT */
 
 static int ks_wlan_netdev_ioctl(struct net_device *dev, struct ifreq *rq, int cmd)
 {
 	int rc = 0;
-#if defined(WIRELESS_EXT)
 	struct iwreq *wrq = (struct iwreq *) rq;
-#endif /* WIRELESS_EXT */
 	switch (cmd) {
-#if defined(WIRELESS_EXT)
 	case SIOCIWFIRSTPRIV+20: /* KS_WLAN_SET_STOP_REQ */
 		rc = ks_wlan_set_stop_request(dev, NULL, &(wrq->u.mode), NULL);
 		break;
-#endif /* WIRELESS_EXT >17 */
 	// All other calls are currently unsupported
 	default:
 		rc = -EOPNOTSUPP;
-- 
2.8.1
