Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:41958 "EHLO pokefinder.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752184AbcEaK50 (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 31 May 2016 06:57:26 -0400
From: Wolfram Sang <wsa@the-dreams.de>
To: driverdev-devel@linuxdriverproject.org
Cc: Wolfram Sang <wsa@the-dreams.de>, linux-renesas-soc@vger.kernel.org
Subject: [PATCH V2 05/31] staging: ks7010: remove code for old kernel versions
Date: Tue, 31 May 2016 12:56:17 +0200
Message-Id: <1464692203-4180-6-git-send-email-wsa@the-dreams.de>
In-Reply-To: <1464692203-4180-1-git-send-email-wsa@the-dreams.de>
References: <1464692203-4180-1-git-send-email-wsa@the-dreams.de>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Wolfram Sang <wsa+renesas@sang-engineering.com>

No need to be backwards compatible.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/staging/ks7010/ks_hostif.c   |  9 ---------
 drivers/staging/ks7010/ks_wlan.h     | 28 +---------------------------
 drivers/staging/ks7010/ks_wlan_net.c |  3 ---
 3 files changed, 1 insertion(+), 39 deletions(-)

diff --git a/drivers/staging/ks7010/ks_hostif.c b/drivers/staging/ks7010/ks_hostif.c
index 6bea699655eec4..146a1357909b39 100644
--- a/drivers/staging/ks7010/ks_hostif.c
+++ b/drivers/staging/ks7010/ks_hostif.c
@@ -2103,11 +2103,7 @@ void hostif_sme_multicast_set(ks_wlan_private *priv)
 
         struct net_device *dev = priv->net_dev;
 	int mc_count;
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,35)
 	struct netdev_hw_addr *ha;
-#else
-	struct dev_mc_list *mclist;
-#endif
 	char	set_address[NIC_MAX_MCAST_LIST*ETH_ALEN];
 	unsigned long filter_type;
 	int i;
@@ -2131,14 +2127,9 @@ void hostif_sme_multicast_set(ks_wlan_private *priv)
 	else {
 		if (priv->sme_i.sme_flag & SME_MULTICAST){
 			mc_count = netdev_mc_count(dev);
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,35)
 			netdev_for_each_mc_addr(ha, dev) {
 				memcpy(&set_address[i*ETH_ALEN], ha->addr, ETH_ALEN);
 			}
-#else
-			for (i = 0, mclist = dev->mc_list; mclist && i < mc_count; i++, mclist = mclist->next)
-				memcpy(&set_address[i*ETH_ALEN], mclist->dmi_addr, ETH_ALEN);
-#endif
 			priv->sme_i.sme_flag &= ~SME_MULTICAST;
 			hostif_mib_set_request(priv, LOCAL_MULTICAST_ADDRESS,
 					       (ETH_ALEN*mc_count), MIB_VALUE_TYPE_OSTRING, &set_address[0]);
diff --git a/drivers/staging/ks7010/ks_wlan.h b/drivers/staging/ks7010/ks_wlan.h
index 329a062419fe4a..6bd016414a4f1d 100644
--- a/drivers/staging/ks7010/ks_wlan.h
+++ b/drivers/staging/ks7010/ks_wlan.h
@@ -18,9 +18,6 @@
 #define WPS
 
 #include <linux/version.h>
-#if (LINUX_VERSION_CODE < KERNEL_VERSION(2,6,24)) 
-#include <linux/config.h>
-#endif
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
@@ -35,32 +32,9 @@
 #include <linux/timer.h>	/* struct timer_list */
 #include <linux/string.h>
 #include <linux/completion.h>   /* struct completion */
-
-#include <asm/io.h>
-
-/* Workqueue / task queue backwards compatibility stuff */
-#if ((LINUX_VERSION_CODE > KERNEL_VERSION(2,5,41)) || (defined _MVL31_) || (defined _CELF3_))
 #include <linux/workqueue.h>
-#else
-#include <linux/tqueue.h>
-#define work_struct tq_struct
-#define INIT_WORK INIT_TQUEUE
-#define schedule_work schedule_task
-#endif
 
-/* Interrupt handler backwards compatibility stuff */
-/*
-#ifndef IRQ_NONE
-#define IRQ_NONE
-#define IRQ_HANDLED
-typedef void irqreturn_t;
-#endif
-*/
-
-#if LINUX_VERSION_CODE < KERNEL_VERSION(2,4,23)
-#define free_netdev(x) kfree(x) 
-#define pci_name(x) x->slot_name 
-#endif
+#include <asm/io.h>
 
 #include "ks7010_sdio.h"
 
diff --git a/drivers/staging/ks7010/ks_wlan_net.c b/drivers/staging/ks7010/ks_wlan_net.c
index 185630cb423d5e..776a544031495f 100644
--- a/drivers/staging/ks7010/ks_wlan_net.c
+++ b/drivers/staging/ks7010/ks_wlan_net.c
@@ -13,9 +13,6 @@
  */
 
 #include <linux/version.h>
-#if (LINUX_VERSION_CODE < KERNEL_VERSION(2,6,24))
-#include <linux/config.h>
-#endif
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/compiler.h>
-- 
2.8.1
