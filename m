Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23EBA407CDE
	for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Jun 2026 15:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781538511; cv=none; b=pbLZypQw5LGIR9cErqToYdT3TQpdAc7Wd9eKiuD9oQEKZh6x4dXTKdJFJ5QtUxzMTUT0Cwui+9/1JugD4IxVzpXzPfMBEl57yUH1PvtTuZo46HqgoiBme+CULSFdeZXAqGFEklVesX8Lnwhnx9xsLk7q7I7hdEKYO5c/1O70Ezw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781538511; c=relaxed/simple;
	bh=huqRqcHmMj9a4UfhQ5i9f8+g9/DxQOwteszc0BZ3Xhg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dx+3QBlAncrKDfwuFx1iRlWjmHq4rmGZvk/H+flVsts1x3qGZ8pu9Fvm8JNeNJZdfC+cTFBvXtDqU9uzsM0bSHF+IBQrzNsS6Zh1gSLeMmPNW8TePBdbme/jwpEIFIcfU8Q5edPhKy8mROmd5+gLT6cKIj/HcxwFuifbhXvpnrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sjjo5qNI; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sjjo5qNI"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-460166910e6so1851892f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Jun 2026 08:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781538507; x=1782143307; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FGk/lAnBnjldzCCvGYTudMsVlU1zVHc4ZMHyv7aX4+0=;
        b=Sjjo5qNID8HeKYV+QbGfl9H7R5mpJto8R4nw3L7HIn2cmh/aemr+rC2C5V7m6qTHGn
         RfuZ9MosnVRVGODJeV8CePuSYp1SxXGNOJtizxBmvXTmOAj6N2JcCyEJ7MCuCFGEjlqT
         BmHe7fXXpzyx2yaNyls123CaPb3puXfeIrPdYXPzXBAuDUDb3zBDuvp7VGC/g4HAbE6o
         nPmkJBaHekcPDwaKdsP20F50JwHiSjG6ciiVS/mR5VoKGq44tZse4t/piCanOmYG6V+/
         AzYvk1jUF6knFl3ikL9qBWuxtbpEKAmHYxJ9XBxGIS1kFFGnObphOpF5tb6sHLVcHiLf
         6OEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781538507; x=1782143307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FGk/lAnBnjldzCCvGYTudMsVlU1zVHc4ZMHyv7aX4+0=;
        b=TiKMBAAVwPAEkl9M832MPtK/pBwJzJjMaXcFSjoQrdTt6cpXqXUhPcgup7yF4Rjlxi
         1Mu5fjanXzBSduDsxjHALyeximA6Xp3eYAlqcnRhAmnMEU24Ts8n3MgY+8peIBcWgN39
         hmBya4hN9KY0cM/INpqfyPkA90v7oXxzZICafuYJVKULcIsAJlI1En3QX3ikaO3pvNMq
         AoegTx19Ew/5wuSx8rn3awERTys2O4lESRTc8v5nQyNNCLDg0Jhf03vmu/iLXcV8vHNz
         hsD9oDqu+GUqItA9Cf3lFl64YIhaxq8d0dqQPoEuz2azJZZPPLlgMutS/guuerj+6hA1
         I6BA==
X-Forwarded-Encrypted: i=1; AFNElJ+gXxZpjVm4fWuzkGfHU5/5gEQthFRehr2aU9OeGRLe+zV2WXaYOwtEIHYEFp+IdH6/owxE0zKRM0AeUDsjESOS/g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7MFhV8KjJe754/BkugwrSL5dRpFUqBTwgtkp7o5wtlHZUx/BL
	Adu2a9Fm33qTY7iwodBvwxrWfGm13BXCmmUCqvEWKSd41xbcge2aYx7/bDLLdx7K
X-Gm-Gg: Acq92OEtQgZb/NMSj4L9z5jECeDbBzLUyb3qry/J9AprtWymuz2ABx09UJX9BTakQGu
	GniWDhgcMWWWOg3RNxTlJwoPeUzvqzg4IYlrSIWwIA+IRRGCMzt4IN3EKWBPlVf9d8T3VfFd6YA
	XzP7+uIEr9I61X4zwrIjlDdbiAK5eVU6Cvu2iRrEf6bL8sotaRsAc8hk/L7IE38rATjPowLeJR4
	qYcedQtCZ8SGD9u6dqXFfX/Ip69sJQvb1FNhbNFPpkzkJbYZ3SaTdYEcHlay3HGFyKdTvpdhrJM
	sfuV8bpEKhvff86Wrt6V691oNXhZfj/vjk6HgRqBjx7OrnTIkx4HpXejGmuodindKcLI1WZjQct
	mFWuoi02614bEYE6Ez+afghHIei5Yj1Zym7f8TsH9lpc1Myqai1RBHOfbV8NdAeSJecVd9TCiX7
	QJ/mhi1Rmfb8IDvechyZeqAWLEYJ46QfWkKmgFGdJp/x3W2bzV4fg4lqLOm4pb4XW/KnFQ9vblf
	Gk24Iyp5lGhQtOcJ8Q7vqa8cwGirOeL+H3S
X-Received: by 2002:a5d:5d10:0:b0:43c:fc5c:a9fe with SMTP id ffacd0b85a97d-46076b18cc0mr15340086f8f.20.1781538507468;
        Mon, 15 Jun 2026 08:48:27 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1e4:992f:3ad2:4f2b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26434dsm36010995f8f.1.2026.06.15.08.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 08:48:26 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 08/12] rtc: rzn1: Dynamically calculate synchronization delay based on clock rate
Date: Mon, 15 Jun 2026 16:48:01 +0100
Message-ID: <20260615154805.1619693-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260615154805.1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260615154805.1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Replace the hardcoded hardware synchronization delays with a calculated
time window derived from the operating sub-clock frequency.

The driver currently hardcodes microsecond ranges assuming a fixed
sub-clock frequency of 32.768 kHz. Newer SoC variants, such as the
RZ/T2H, drive this hardware block using a much faster clock rate
(~195.3 kHz). Hardcoding these wait windows forces faster blocks to
over-sleep, introducing unnecessary delays during clock initialization
and register configuration.

Calculate the duration of the required clock cycles in microseconds based
on the runtime clock rate, and store this value in the driver private
structure to adjust the usleep_range() and readl_poll_timeout() boundaries
dynamically.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/rtc/rtc-rzn1.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index 06339adae71f..bc6af59744e4 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -71,6 +71,7 @@ struct rzn1_rtc {
 	 */
 	spinlock_t ctl1_access_lock;
 	struct rtc_time tm_alarm;
+	unsigned long sync_time;
 	int alarm_irq;
 	int sec_irq;
 	bool alarm_enabled;
@@ -124,8 +125,8 @@ static int rzn1_rtc_set_time(struct device *dev, struct rtc_time *tm)
 		/* Hold the counter if it was counting up */
 		writel(RZN1_RTC_CTL2_WAIT, rtc->base + RZN1_RTC_CTL2);
 
-		/* Wait for the counter to stop: two 32k clock cycles */
-		usleep_range(61, 100);
+		/* Wait for the counter to stop: two RTC_PCLK clock cycles */
+		usleep_range(rtc->sync_time, rtc->sync_time + 100);
 		ret = readl_poll_timeout(rtc->base + RZN1_RTC_CTL2, val,
 					 val & RZN1_RTC_CTL2_WST, 0, 100);
 		if (ret)
@@ -433,17 +434,25 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
 			ret = -EOPNOTSUPP;
 			goto dis_runtime_pm;
 		}
-
 		if (rate != 32768)
 			scmp_val = RZN1_RTC_CTL0_SLSB_SCMP;
+
+		/*
+		 * The internal clock counter operates in synchronization with the
+		 * RTC_PCLK clock. Calculate the duration of two RTC_PCLK clock
+		 * cycles in microseconds required for operations to complete.
+		 */
+		rtc->sync_time = DIV_ROUND_UP(2 * NSEC_PER_MSEC, rate);
+
 	}
 
 	/* Disable controller during SUBU/SCMP setup */
 	val = readl(rtc->base + RZN1_RTC_CTL0) & ~RZN1_RTC_CTL0_CE;
 	writel(val, rtc->base + RZN1_RTC_CTL0);
-	/* Wait 2-4 32k clock cycles for the disabled controller */
+	/* Wait 2-4 RTC_PCLK clock cycles for the disabled controller to stop */
 	ret = readl_poll_timeout(rtc->base + RZN1_RTC_CTL0, val,
-				 !(val & RZN1_RTC_CTL0_CEST), 62, 123);
+				 !(val & RZN1_RTC_CTL0_CEST), rtc->sync_time,
+				 rtc->sync_time * 2);
 	if (ret)
 		goto dis_runtime_pm;
 
-- 
2.54.0

