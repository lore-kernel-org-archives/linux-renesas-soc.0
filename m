Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr0-f196.google.com ([209.85.128.196]:46410 "EHLO
        mail-wr0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756747AbdLOPQa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Dec 2017 10:16:30 -0500
Received: by mail-wr0-f196.google.com with SMTP id x49so8317554wrb.13
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 Dec 2017 07:16:29 -0800 (PST)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com, magnus.damm@gmail.com,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH 6/7] drm/img-rogue: init_timer() -> setup_timer()
Date: Fri, 15 Dec 2017 16:15:44 +0100
Message-Id: <1513350945-2642-7-git-send-email-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <1513350945-2642-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1513350945-2642-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
---
 services/server/env/linux/osfunc.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/services/server/env/linux/osfunc.c b/services/server/env/linux/osfunc.c
index c222095..b529c63 100644
--- a/services/server/env/linux/osfunc.c
+++ b/services/server/env/linux/osfunc.c
@@ -492,7 +492,7 @@ static inline IMG_UINT64 KClockns64(void)
 {
 	ktime_t sTime = ktime_get();
 
-	return sTime.tv64;
+	return sTime;
 }
 
 PVRSRV_ERROR OSClockMonotonicns64(IMG_UINT64 *pui64Time)
@@ -1135,9 +1135,9 @@ static void OSTimerCallbackBody(TIMER_CALLBACK_DATA *psTimerCBData)
 @Description    OS specific timer callback wrapper function
 @Input          uData    Timer callback data
 */ /**************************************************************************/
-static void OSTimerCallbackWrapper(uintptr_t uData)
+static void OSTimerCallbackWrapper(struct timer_list *t)
 {
-	TIMER_CALLBACK_DATA	*psTimerCBData = (TIMER_CALLBACK_DATA*)uData;
+	TIMER_CALLBACK_DATA *psTimerCBData = from_timer(psTimerCBData, t, sTimer);
 
 #if defined(PVR_LINUX_TIMERS_USING_WORKQUEUES) || defined(PVR_LINUX_TIMERS_USING_SHARED_WORKQUEUE)
 	int res;
@@ -1219,12 +1219,8 @@ IMG_HANDLE OSAddTimer(PFN_TIMER_FUNC pfnTimerFunc, void *pvData, IMG_UINT32 ui32
 	psTimerCBData->ui32Delay = ((HZ * ui32MsTimeout) < 1000)
 								?	1
 								:	((HZ * ui32MsTimeout) / 1000);
-	/* initialise object */
-	init_timer(&psTimerCBData->sTimer);
-
 	/* setup timer object */
-	psTimerCBData->sTimer.function = (void *)OSTimerCallbackWrapper;
-	psTimerCBData->sTimer.data = (uintptr_t)psTimerCBData;
+	timer_setup(&psTimerCBData->sTimer, OSTimerCallbackWrapper, 0);
 
 	return (IMG_HANDLE)(uintptr_t)(ui32i + 1);
 }
-- 
2.7.4
