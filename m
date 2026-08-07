Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1883140BCD4
	for <linux-renesas-soc@vger.kernel.org>; Fri,  7 Aug 2026 10:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786097008; cv=none; b=fWjW9TM16q1Yvb3STStc1w1ij0Ehp9esi4I+7MQkeMIzh1+bKQ9jHMn8zwdt2Oa3KEdy/Ijvbg6o1iWY53ZQ9LR3oav4Nq3+Zs09DXrPdG6XFjBddkjsPyWNDprXkp5eGvy6qFOT6dUUO7LKFgmxPKli69aEtpx79oYuf80Trkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786097008; c=relaxed/simple;
	bh=pc/WzeeeJ6wBSTAG7SEULchghvROlW3G3xEf1OAypWU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Psg+zys6MnwGGx4cC6EJ9lYvttywFDNRA7p3RTuNZ10KI3PvtUMbRjCiPZYSxR+EwShT/ZdZXT1QUXivuHVZUqbvdKl6/f7f47PbetAbMZvZhrok/+L4OhJR9coY0Q3z7HOFJrM4p/CEGD7HJ+I/aycZwajUOPuTdnCLmfFqnaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MQ2+PF5d; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MQ2+PF5d"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6a1a546a6bbso2299609a12.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 07 Aug 2026 03:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786097003; x=1786701803; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FhRStw61Ep8uRkimVCxquEUsUzeWSHfcLBMZIDMSAKw=;
        b=MQ2+PF5d6bYgAQQB6hCPFyRU4HVeygsSEZIkoT11cd5H+Znd7VTMXYvg8TdyumAIWZ
         NJkhzu//oBi5lJh7lQFZ6ouDpWMD+453VGmtR1Q8ONP9I6PefXCQYPkE8qSCDy6p6v3C
         nPsZ+Ap2hYdfBC9JWw7wmxZ/jz0gEJMbejz9nu/FyeC655c72UJo/Lm1dSXO+m1JzEFD
         Eg18QYP4QSCEhrukTInD7sClbGQCNQihOVijuHY6cYbeEQn/9eUEgaVUgCMrPe6ODtmt
         hCfDmRmIWxHxo9/nTy3MggL+srgPEG8BzOmtDfBLM0A/qQE4xNGxbYxY3ZNaOMSNjelp
         0TBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786097003; x=1786701803;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FhRStw61Ep8uRkimVCxquEUsUzeWSHfcLBMZIDMSAKw=;
        b=Pnx6OeKRS/sAEIdx3b/Wg9/wFW+03ti3EFgsHrp08/Pisq2JrWk4x4NptB16REbQjy
         P0FXbVJ2g1hVlOnNKg5PA/mzeXlVvhFNz3rHnTwp/WsPdGdf+xwKeY72Bq2nnObiakkd
         tHQxzuSFxEBIdtUgqTmJDiG1nRjanfrmLlpMH/XZC461/238mv1Afe+9xHO72XCSM00P
         BBIDucA0hvjvAbPFthGw2iu2WetaswIdfAoXJT3jHhFUwUoD+R1tgT6ZNSYVVUPoX+b8
         lnTS8KB2Z0dtiukNPsQe5PyrQHqbp1m4V6vaLH4jvTcE11fdCNhNmtM8JTpBPUDKsWGO
         9TwA==
X-Forwarded-Encrypted: i=1; AHgh+RpMxBznz7FzwS1uq7UH0bRl/vE4+mIK77+zV5L0s16fFrLIS1mqvCDUfszfZS4ZiOkR2QRY8uSC6oTT0v56Hk3LwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/CZWot4i6UPd3jxhetstdm5ebsTBuaZEAvJGPyWkMDBfI9s7t
	yxFre1vZBsd6zO0Qdj0jcl19Wtm+8+FdfS01gL64G3HIYm1aA166luHo
X-Gm-Gg: AR+sD10mfg0lZXOzaTariRUsnxvnynYo/vHVUZaRfPn3aKRFqb3qvcLcmzZrO+gFK5j
	hdHogOsiqS6VM/q6fjHqP/qcf4nFtAIbV0G3rFWSQerOAKq8XQkUIAnS9U38d6V3LPI7+UeKWub
	L4kQ2hLkXu2tyAXtvOgGfKCfSAxHGHqJIiVrvIJZCODa7BSJpJcwl/LziuXo3GkoIoZkAWaIn6F
	MaK2YPm+Ju1McgywZrbyYlbTfEeCVgdNWL5Gqcj3d977AgFJPHAeto+rWC50PH6exIkGEOf04wz
	7KPjs+tqc53RknMW20pglGjjm4ILYDGI2zb/2xQ0Lq99nTODZNZo3LnPOA7JZiA440l+hPsid0e
	mOx/q9d4lHjY4b32K8vsonJUCj1Dghh7knC9tkDIb4fXNo21J3Uxy9RRCjUv8UoUysdnrl2d3ot
	onLRRxFj0d734mJW7W7psta3kOPNrcQJuo5MVFMSdC47dm3ywBgsqKwhOuUqSRiY3TSc5Q1Ksa9
	CVGRchEzEw19Q==
X-Received: by 2002:aa7:ccc9:0:b0:6a1:1bea:8ea0 with SMTP id 4fb4d7f45d1cf-6a1b4a9f052mr3101232a12.3.1786097002616;
        Fri, 07 Aug 2026 03:03:22 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:9a0d:6e0a:2fe5:1ceb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4800214557esm4261107f8f.2.2026.08.07.03.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 03:03:22 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] PM / devfreq: Convert to seq_buf
Date: Fri,  7 Aug 2026 11:03:17 +0100
Message-ID: <20260807100320.121108-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

The devfreq transition table sysfs attribute (trans_stat_show()) builds
its output using manual sysfs_emit_at() calls with hand-rolled length
tracking and PAGE_SIZE bounds checks scattered throughout the loops.

On SoCs with large frequency tables, such as Renesas RZ/G3L, the
resulting table can exceed PAGE_SIZE. In that case the function bails
out entirely and returns -EFBIG, logging:

  devfreq transition table exceeds PAGE_SIZE. Disabling

which makes the attribute completely unusable on affected platforms.

Convert trans_stat_show() to use struct seq_buf instead. seq_buf_printf()
tracks the buffer position and handles overflow internally, removing the
need for manual length checks before every write. If the table still
overflows PAGE_SIZE, truncate the output to PAGE_SIZE - 1, NUL-terminate
it, and log a rate-limited warning rather than failing the read outright,
so the attribute still returns a usable (if truncated) table instead of
nothing.

Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/devfreq/devfreq.c | 64 ++++++++++++++++++---------------------
 1 file changed, 30 insertions(+), 34 deletions(-)

diff --git a/drivers/devfreq/devfreq.c b/drivers/devfreq/devfreq.c
index f08fc6966eae..3c4c6fa23cfe 100644
--- a/drivers/devfreq/devfreq.c
+++ b/drivers/devfreq/devfreq.c
@@ -28,6 +28,7 @@
 #include <linux/hrtimer.h>
 #include <linux/of.h>
 #include <linux/pm_qos.h>
+#include <linux/seq_buf.h>
 #include <linux/units.h>
 
 #define CREATE_TRACE_POINTS
@@ -1661,9 +1662,10 @@ static ssize_t trans_stat_show(struct device *dev,
 			       struct device_attribute *attr, char *buf)
 {
 	struct devfreq *df = to_devfreq(dev);
-	ssize_t len = 0;
-	int i, j;
 	unsigned int max_state;
+	struct seq_buf s;
+	ssize_t len;
+	int i, j;
 
 	if (!df->profile)
 		return -EINVAL;
@@ -1672,6 +1674,8 @@ static ssize_t trans_stat_show(struct device *dev,
 	if (max_state == 0)
 		return sysfs_emit(buf, "Not Supported.\n");
 
+	seq_buf_init(&s, buf, PAGE_SIZE);
+
 	mutex_lock(&df->lock);
 	if (!df->stop_polling &&
 			devfreq_update_status(df, df->previous_freq)) {
@@ -1680,47 +1684,39 @@ static ssize_t trans_stat_show(struct device *dev,
 	}
 	mutex_unlock(&df->lock);
 
-	len += sysfs_emit_at(buf, len, "     From  :   To\n");
-	len += sysfs_emit_at(buf, len, "           :");
-	for (i = 0; i < max_state; i++) {
-		if (len >= PAGE_SIZE - 1)
-			break;
-		len += sysfs_emit_at(buf, len, "%10lu",
-				     df->freq_table[i]);
-	}
+	seq_buf_printf(&s, "     From  :   To\n");
+	seq_buf_printf(&s, "           :");
+	for (i = 0; i < max_state; i++)
+		seq_buf_printf(&s, "%10lu", df->freq_table[i]);
 
-	if (len >= PAGE_SIZE - 1)
-		return PAGE_SIZE - 1;
-	len += sysfs_emit_at(buf, len, "   time(ms)\n");
+	seq_buf_printf(&s, "   time(ms)\n");
 
 	for (i = 0; i < max_state; i++) {
-		if (len >= PAGE_SIZE - 1)
-			break;
 		if (df->freq_table[i] == df->previous_freq)
-			len += sysfs_emit_at(buf, len, "*");
+			seq_buf_printf(&s, "*");
 		else
-			len += sysfs_emit_at(buf, len, " ");
-		if (len >= PAGE_SIZE - 1)
-			break;
-		len += sysfs_emit_at(buf, len, "%10lu:", df->freq_table[i]);
+			seq_buf_printf(&s, " ");
+		seq_buf_printf(&s, "%10lu:", df->freq_table[i]);
 		for (j = 0; j < max_state; j++) {
-			if (len >= PAGE_SIZE - 1)
-				break;
-			len += sysfs_emit_at(buf, len, "%10u",
-				df->stats.trans_table[(i * max_state) + j]);
+			seq_buf_printf(&s, "%10u",
+				       df->stats.trans_table[(i * max_state) + j]);
 		}
-		if (len >= PAGE_SIZE - 1)
-			break;
-		len += sysfs_emit_at(buf, len, "%10llu\n", (u64)
-				     jiffies64_to_msecs(df->stats.time_in_state[i]));
+		seq_buf_printf(&s, "%10llu\n", (u64)
+			       jiffies64_to_msecs(df->stats.time_in_state[i]));
 	}
 
-	if (len < PAGE_SIZE - 1)
-		len += sysfs_emit_at(buf, len, "Total transition : %u\n",
-				     df->stats.total_trans);
-	if (len >= PAGE_SIZE - 1) {
-		pr_warn_once("devfreq transition table exceeds PAGE_SIZE. Disabling\n");
-		return -EFBIG;
+	seq_buf_printf(&s, "Total transition : %u\n", df->stats.total_trans);
+	len = seq_buf_used(&s);
+	/*
+	 * If an overflow occurs, seq_buf_used() can return a value greater
+	 * than PAGE_SIZE. Clamp the return length to PAGE_SIZE - 1 and
+	 * ensure a null-terminator is written to prevent the sysfs
+	 * "bad count" or out-of-bounds warning.
+	 */
+	if (seq_buf_has_overflowed(&s)) {
+		pr_warn_ratelimited("devfreq transition table truncated due to PAGE_SIZE limit\n");
+		len = PAGE_SIZE - 1;
+		buf[len] = '\0';
 	}
 
 	return len;
-- 
2.43.0

