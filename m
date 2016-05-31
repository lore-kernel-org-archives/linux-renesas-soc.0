Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:41952 "EHLO pokefinder.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751745AbcEaK5X (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 31 May 2016 06:57:23 -0400
From: Wolfram Sang <wsa@the-dreams.de>
To: driverdev-devel@linuxdriverproject.org
Cc: Wolfram Sang <wsa@the-dreams.de>, linux-renesas-soc@vger.kernel.org
Subject: [PATCH V2 02/31] staging: ks7010: remove non-SDIO code and #ifdefs
Date: Tue, 31 May 2016 12:56:14 +0200
Message-Id: <1464692203-4180-3-git-send-email-wsa@the-dreams.de>
In-Reply-To: <1464692203-4180-1-git-send-email-wsa@the-dreams.de>
References: <1464692203-4180-1-git-send-email-wsa@the-dreams.de>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Wolfram Sang <wsa+renesas@sang-engineering.com>

I couldn't find any trace of code or even products using ks7010 with
something else than SDIO. So, remove the conditionals.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/staging/ks7010/Makefile        |  2 +-
 drivers/staging/ks7010/ks7010_config.c |  6 ---
 drivers/staging/ks7010/ks_hostif.c     | 70 ----------------------------------
 drivers/staging/ks7010/ks_wlan.h       | 10 -----
 4 files changed, 1 insertion(+), 87 deletions(-)

diff --git a/drivers/staging/ks7010/Makefile b/drivers/staging/ks7010/Makefile
index 68b7ebf57bebd6..32b0efc7bd00e8 100644
--- a/drivers/staging/ks7010/Makefile
+++ b/drivers/staging/ks7010/Makefile
@@ -1,5 +1,5 @@
 obj-$(CONFIG_KS7010) += ks7010.o
 
-ccflags-y 	     += -D_SDIO_ -DKS_WLAN_DEBUG=0
+ccflags-y 	     += -DKS_WLAN_DEBUG=0
 ks7010-y	     := michael_mic.o ks_hostif.o ks_wlan_net.o ks_debug.o \
 					ks7010_sdio.o ks7010_config.o
diff --git a/drivers/staging/ks7010/ks7010_config.c b/drivers/staging/ks7010/ks7010_config.c
index 4a8098452cdd28..e8a42077a4b381 100644
--- a/drivers/staging/ks7010/ks7010_config.c
+++ b/drivers/staging/ks7010/ks7010_config.c
@@ -268,13 +268,7 @@ int ks_wlan_read_config_file(ks_wlan_private *priv)
 	priv->reg.rate_set.size = 12;
 
 #ifndef NO_FIRMWARE_CLASS
-#if (defined _PCMCIA_)
-	dev = &priv->ks_wlan_hw.pcmcia_dev->dev;
-#elif (defined _PCI_)
-	dev = &priv->ks_wlan_hw.pci_dev->dev;
-#elif (defined _SDIO_)
 	dev = &priv->ks_wlan_hw.sdio_card->func->dev;
-#endif
 	if((retval = request_firmware(&fw_entry, cfg_file, dev)) !=0 ){
 		DPRINTK(1, "error request_firmware() file=%s ret=%d\n", cfg_file, retval);
 		return 1;
diff --git a/drivers/staging/ks7010/ks_hostif.c b/drivers/staging/ks7010/ks_hostif.c
index 402ddba400ffdd..0295bb4921fa20 100644
--- a/drivers/staging/ks7010/ks_hostif.c
+++ b/drivers/staging/ks7010/ks_hostif.c
@@ -108,51 +108,12 @@ int ks_wlan_do_power_save(ks_wlan_private *priv)
 
 	DPRINTK(4,"psstatus.status=%d\n",atomic_read(&priv->psstatus.status));
 
-#ifdef _SDIO_
 	if((priv->connect_status & CONNECT_STATUS_MASK) == CONNECT_STATUS){
 		hostif_sme_enqueue(priv, SME_POW_MNGMT_REQUEST);
 	}
 	else{
 		priv->dev_state = DEVICE_STATE_READY;
 	}
-#else
-	if((priv->connect_status & CONNECT_STATUS_MASK) == CONNECT_STATUS){
-		switch(atomic_read(&priv->psstatus.status)){
-		case PS_ACTIVE_SET:
-		case PS_WAKEUP:
-		case PS_SAVE_SET:
-		case PS_SNOOZE:
-			break;
-		case PS_CONF_WAIT:
-			atomic_set(&priv->psstatus.confirm_wait,0);
-			break;
-		case PS_NONE:
-		default:
-			hostif_sme_enqueue(priv, SME_POW_MNGMT_REQUEST);
-			break;
-		}
-
-	}
-	else{
-		switch(atomic_read(&priv->psstatus.status)){
-		case PS_ACTIVE_SET:
-		case PS_WAKEUP:
-		case PS_SAVE_SET:
-			break;
-		case PS_CONF_WAIT:
-			atomic_set(&priv->psstatus.confirm_wait,0);
-			atomic_set(&priv->psstatus.status, PS_WAKEUP);
-			break;
-		case PS_SNOOZE:
-			ks_wlan_hw_power_save(priv);
-			break;
-		case PS_NONE:
-		default:
-			hostif_sme_enqueue(priv, SME_POW_MNGMT_REQUEST);
-			break;
-		}
-	}
-#endif
 	return rc;
 }
 
@@ -750,17 +711,11 @@ void hostif_power_mngmt_confirm(ks_wlan_private *priv)
 
 	if(priv->reg.powermgt > POWMGT_ACTIVE_MODE &&
 	   priv->reg.operation_mode == MODE_INFRASTRUCTURE){
-#if !defined(_SDIO_)
-		atomic_set(&priv->psstatus.status,PS_SAVE_SET);
-#endif
 		atomic_set(&priv->psstatus.confirm_wait, 0);
 		priv->dev_state = DEVICE_STATE_SLEEP;
 		ks_wlan_hw_power_save(priv);
 	}else{
 		priv->dev_state = DEVICE_STATE_READY;
-#if !defined(_SDIO_)
-		atomic_set(&priv->psstatus.status,PS_ACTIVE_SET);
-#endif
 	}
 
 }
@@ -833,9 +788,6 @@ void hostif_connect_indication(ks_wlan_private *priv)
 		/* for power save */
 		atomic_set(&priv->psstatus.snooze_guard, 0);
 		atomic_set(&priv->psstatus.confirm_wait,0);
-#if !defined(_SDIO_)
-		atomic_set(&priv->psstatus.status, PS_NONE);
-#endif
 	}
 	ks_wlan_do_power_save(priv);
 
@@ -894,10 +846,8 @@ void hostif_stop_confirm(ks_wlan_private *priv)
 	union iwreq_data wrqu0;
 
 	DPRINTK(3,"\n");
-#ifdef _SDIO_
 	if(priv->dev_state == DEVICE_STATE_SLEEP)
 		priv->dev_state = DEVICE_STATE_READY;
-#endif
 
 	/* disconnect indication */
 	if( (priv->connect_status & CONNECT_STATUS_MASK)== CONNECT_STATUS){
@@ -1178,9 +1128,6 @@ int hostif_data_request(ks_wlan_private *priv, struct sk_buff *packet)
 	if(atomic_read(&priv->psstatus.status)==PS_SNOOZE){ /* power save wakeup */
 		if(!netif_queue_stopped(priv->net_dev))
 			netif_stop_queue(priv->net_dev);
-#if !defined(_SDIO_)
-		schedule_work(&priv->ks_wlan_wakeup_task);
-#endif
 	}
 
 	DPRINTK(4, "skb_buff length=%d\n", packet_len);
@@ -1302,14 +1249,10 @@ int hostif_data_request(ks_wlan_private *priv, struct sk_buff *packet)
 	return result;
 }
 
-#if defined(_SPI_)
-#define ps_confirm_wait_inc(priv)
-#else
 #define ps_confirm_wait_inc(priv)  do{if(atomic_read(&priv->psstatus.status) > PS_ACTIVE_SET){ \
                                                   atomic_inc(&priv->psstatus.confirm_wait); \
                                                   /* atomic_set(&priv->psstatus.status, PS_CONF_WAIT);*/ \
                                       } }while(0)
-#endif
 
 static
 void hostif_mib_get_request( ks_wlan_private *priv, unsigned long mib_attribute)
@@ -2509,9 +2452,6 @@ void hostif_sme_execute(ks_wlan_private *priv, int event)
 		/* for power save */
 		atomic_set(&priv->psstatus.snooze_guard, 0);
 		atomic_set(&priv->psstatus.confirm_wait,0);
-#if !defined(_SDIO_)
-		atomic_set(&priv->psstatus.status, PS_NONE);
-#endif
 		if ( priv->dev_state == DEVICE_STATE_PREINIT ){
 			priv->dev_state = DEVICE_STATE_INIT;
 		}
@@ -2571,16 +2511,6 @@ void hostif_sme_enqueue(ks_wlan_private *priv, unsigned short event)
 {
 	DPRINTK(3,"\n");
 
-#if !defined(_SDIO_)
-	if(atomic_read(&priv->psstatus.status)==PS_SNOOZE && event < SME_START_CONFIRM){ /* power save wakeup*/
-		schedule_work(&priv->ks_wlan_wakeup_task);
-		if(atomic_read(&priv->sme_task.count) <= 0){
-			/* schedule_work(&priv->ks_wlan_wakeup_task); */
-			DPRINTK(4,"sme task disable.\n");
-			tasklet_disable(&priv->sme_task);
-		}
-	}
-#endif
 
 
 	/* enqueue sme event */
diff --git a/drivers/staging/ks7010/ks_wlan.h b/drivers/staging/ks7010/ks_wlan.h
index c7cbde1e1d0a28..329a062419fe4a 100644
--- a/drivers/staging/ks7010/ks_wlan.h
+++ b/drivers/staging/ks7010/ks_wlan.h
@@ -62,17 +62,7 @@ typedef void irqreturn_t;
 #define pci_name(x) x->slot_name 
 #endif
 
-#if (defined _PCMCIA_)
-#include "pcmcia/ks7010_pcmcia.h"
-#elif (defined _PCI_)
-#include "pci/ks7010_pci.h"
-#elif (defined _SDIO_)
 #include "ks7010_sdio.h"
-#elif (defined _SPI_)
-#include "spi/ks7010_spi.h"
-#else
-#error not defined bus type !
-#endif
 
 struct ks_wlan_parameter {
 	uint8_t		operation_mode;	   /* Operation Mode */
-- 
2.8.1
