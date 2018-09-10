Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f194.google.com ([209.85.208.194]:35576 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726043AbeIKBSH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Sep 2018 21:18:07 -0400
Received: by mail-lj1-f194.google.com with SMTP id p10-v6so19032332ljg.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Sep 2018 13:22:19 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] clocksource: sh_cmt: fix clocksource width for 32-bit
 machines
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-renesas-soc@vger.kernel.org
Cc: Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
        Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>,
        linux-sh@vger.kernel.org
Message-ID: <749e6480-aed6-041c-0209-8dc74c07f344@cogentembedded.com>
Date: Mon, 10 Sep 2018 23:22:16 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The driver seems to abuse *unsigned long* not only for the (32-bit)
register values but also for the 'sh_cmt_channel::total_cycles' which
needs to always be 64-bit -- as a result, the clocksource's mask is
needlessly clamped down to 32-bits on the 32-bit machines...

Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
This patch is against the 'tip.git' repo's 'timers/core' branch plus the fixup
for the 64-bit machines reposted last Saturday...

 drivers/clocksource/sh_cmt.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

Index: tip/drivers/clocksource/sh_cmt.c
===================================================================
--- tip.orig/drivers/clocksource/sh_cmt.c
+++ tip/drivers/clocksource/sh_cmt.c
@@ -108,7 +108,7 @@ struct sh_cmt_channel {
 	raw_spinlock_t lock;
 	struct clock_event_device ced;
 	struct clocksource cs;
-	unsigned long total_cycles;
+	u64 total_cycles;
 	bool cs_enabled;
 };
 
@@ -613,8 +613,8 @@ static u64 sh_cmt_clocksource_read(struc
 {
 	struct sh_cmt_channel *ch = cs_to_sh_cmt(cs);
 	unsigned long flags;
-	unsigned long value;
 	u32 has_wrapped;
+	u64 value;
 	u32 raw;
 
 	raw_spin_lock_irqsave(&ch->lock, flags);
@@ -688,7 +688,7 @@ static int sh_cmt_register_clocksource(s
 	cs->disable = sh_cmt_clocksource_disable;
 	cs->suspend = sh_cmt_clocksource_suspend;
 	cs->resume = sh_cmt_clocksource_resume;
-	cs->mask = CLOCKSOURCE_MASK(sizeof(unsigned long) * 8);
+	cs->mask = CLOCKSOURCE_MASK(sizeof(u64) * 8);
 	cs->flags = CLOCK_SOURCE_IS_CONTINUOUS;
 
 	dev_info(&ch->cmt->pdev->dev, "ch%u: used as clock source\n",
