Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f196.google.com ([209.85.208.196]:34697 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725836AbeH3XXI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Aug 2018 19:23:08 -0400
Received: by mail-lj1-f196.google.com with SMTP id f8-v6so8190403ljk.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Aug 2018 12:19:27 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] clocksource: sh_cmt: fixup for 64-bit machines
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-renesas-soc@vger.kernel.org
Cc: Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
        Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>,
        linux-sh@vger.kernel.org
Message-ID: <8aa6d2cd-68f9-eae4-cba0-222c1511eb9d@cogentembedded.com>
Date: Thu, 30 Aug 2018 22:19:24 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

When trying to use CMT for clockevents on R-Car gen3 SoCs, I noticed that
the maximum delta (in ns) for the broadcast timer was diplayed as 1000 in
/proc/timer_list.  It turned out that when calculating it, the driver did
shift left 1 by 32 (causing what I think was undefined behaviour) getting
1 as a result. Using 1UL instead fixed the maximum delta and did even fix
switching an active clocksource to a CMT channel (which caused the system
to go non-interactive before).

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
This patch is against the 'tip.git' repo's 'timers/core' branch.

I am not sure whether the CMT driver was ever used on SH64; on R-Car gen3
(ARM64) I'm only enabling this driver now, so not sure how urgent is this...

 drivers/clocksource/sh_cmt.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: tip/drivers/clocksource/sh_cmt.c
===================================================================
--- tip.orig/drivers/clocksource/sh_cmt.c
+++ tip/drivers/clocksource/sh_cmt.c
@@ -891,7 +891,7 @@ static int sh_cmt_setup_channel(struct s
 	if (cmt->info->width == (sizeof(ch->max_match_value) * 8))
 		ch->max_match_value = ~0;
 	else
-		ch->max_match_value = (1 << cmt->info->width) - 1;
+		ch->max_match_value = (1UL << cmt->info->width) - 1;
 
 	ch->match_value = ch->max_match_value;
 	raw_spin_lock_init(&ch->lock);
