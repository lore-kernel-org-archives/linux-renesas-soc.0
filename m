Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC516495039
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Aug 2026 13:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787320688; cv=none; b=Q9jqHLaq0zfGHQMcarT9vtDJrRJJlnFIGcAO1X1iCPiqgHUsKtTT6kSONWL/0ZVc8YSDPrM4LVcrYybK/vtxaOPUPg9IONbTmBEAs96RVDNa6xdTumxOR0IewKqOIS7etKVWauoCWqgkR75S26xXEYR9HCYQZMLgBS/nYgLvsXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787320688; c=relaxed/simple;
	bh=s467x5BITEEd5Yvk33pvjHg4Q7phFZ4tY0bKBjCHYug=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cB8NwL6mTw6VYLf/Ac/HGll+Jh/t4Gu4zttz243F+UvGDpVYEKWOT+eN4n+7fbI3ztdtFdfvou9xU5i8YWO6hU1BvRmUko63wLB0/MFdo0WnuyUnKxBhZeKYV0mE6zjFMjBDvLHJoVQfb9UlfgpdkWpHt7Oqqx4ieun6JZQaU70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ymvp3gwH; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ymvp3gwH"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cbedbaba5fdso637382a12.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Aug 2026 06:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787320686; x=1787925486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cnH4Er9TSQRm4rDEAqO5Z8IUygxN15a86ai14kfQ5IQ=;
        b=Ymvp3gwHYST52LYXiFG3P0xhk8nFKbkrsn5EZx12H5E5fly9F2g2hKr14zUBqq+Pec
         3/8adjigG1Suy23BEEmzGsTVcDs8nR1oPVh/YnhkTx6kaWRxAjNm45j/8pz/3h9qw/LN
         uTag+ydD9BuSetwR7bztKKI78ngMiPIARA0NQGUOtrea7fSbrTkIS2qewx11wLcT5hjI
         6DaqE6nzbK9vYF1j5ylE2CYTuBwQmRgRXoubvyyaHQ7JQ1B9MgMN6gn1w+OB2/X4XJK1
         h0PbKU5VZ/LriECU4/Hy9BdZMeYBaJOj8lotXMFsU+GfnnqExcn51mv/hVpDB+mikCNs
         +Twg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787320686; x=1787925486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cnH4Er9TSQRm4rDEAqO5Z8IUygxN15a86ai14kfQ5IQ=;
        b=hSAyPivrBy+jmwD3OXyJCVP6EsN9f3bMvEvrFmo8q4ZywoWsTglXdHtBYSsmxhrxjI
         aB3+MKPA3OQTMHIfwCRh/860Jk/8eB7YW+nb9yQLe32SOpWgWKRUgderYBjoc8vNi5KW
         QFave7j7zK0VO3akTjOE16crMgITgAWmBzed+QKD7i2IiFN6q+yZp5GA9GahU8W4u03u
         vnext8GQoV5tacTSBX7pxTlqdhS2zkeb1CD26vJK2XtSJI7CIhR8FZ3cXw5lSYfonbWy
         OvdP4FZGmz+DOB6UlI51WA8OBvK3XiPpFN5U5KbGnM55n/uHsyH98Mda0wrx2hxn0s6S
         HlhA==
X-Forwarded-Encrypted: i=1; AHgh+RqjwkweLVqx+ncg5Zi4eat8OOrW3q4t/Iq5YTcEzxjtZgHnNxwU1AF/YCq4N18I+aZd/I0dsfPTky4tjcri6sdQJg==@vger.kernel.org
X-Gm-Message-State: AOJu0YykPTBEIVLFy9oshGpJ9HfXucuXInYm51d4VeFo5acZpFHKms9b
	aAYnJdoPZbFZ9k3lkyswdxiCdgpIHSmEW+HewqVDePhNCcTG7Ne95ZwT
X-Gm-Gg: AR+sD11VjMIy32szSdW++ZJWZCow9Q5ie5ya2rN5/8Ons29ZJ91O+te3/GN2qip3HM7
	cqWlthZ8hHJoNzl0Js2ci9LArj31uewQuF/OS8Kh7RKdWXXIWVvCicoG1Qj6C1DlKXpCOGKweCQ
	v25O49Db1hArG7ZS9BW0AAc9XTuZRExKKrcb/1w67b0ICM10oB7mPMXkDDXJH3ZV/YhhTDLRS1B
	/whrFH8udV7X/MgMz+N2mC01cpYGG26BxlwrucJVJASAeFdLZ4vqNvt4cDdTbl9G4UeKIO+cZoC
	KuvrGnJoOAZCUWDqlTq9Q4jMQs2Txg4h0HlK+u1nPDADaTzuObfFtNWjn1bjMpAZ4XhCJzyAW9Z
	UFW94wsEH4psCf+ycpBjDzhnSn3w6U+hqw+xBPP0ULNyEGyMKQrUHr0oe8PEhZjX5S4RGvXZIkB
	F+Z69ZCqRjEaSWaBM/0Y4nVnhFPCrF47eABLXYx2dnAESfMHqOJBinlqJ9O3PlLO38K5JC581Zv
	1JO4tDHO0eGbVvZ0Z0vuLLxPssp4AQviv9V7W5XtzVEUrbqKU4X74lr0R5IwpKJWmR9CMinyHDr
	XUhCRL8DRXM4H/k=
X-Received: by 2002:a05:6300:67c8:b0:3cc:3d08:da3e with SMTP id adf61e73a8af0-3cd2fdd1cfcmr12809142637.2.1787320686119;
        Fri, 21 Aug 2026 06:58:06 -0700 (PDT)
Received: from iku.example.org ([2401:4900:1c07:efb3:773c:1c8c:24ea:eff6])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327d01ff056sm19972277eec.19.2026.08.21.06.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 06:58:05 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
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
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 15/17] rtc: rzn1: Add OF match data to gate SUBU register access
Date: Fri, 21 Aug 2026 14:56:06 +0100
Message-ID: <20260821135608.275233-16-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821135608.275233-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260821135608.275233-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The RZ/N1 RTC driver selects SCMP mode only when an optional xtal clock
is provided at a valid rate other than 32768 Hz. Without an xtal clock,
or when it runs at 32768 Hz, the driver uses SUBU mode.

However, the RTCA0SUBU register used by SUBU mode is not present on all
SoCs that integrate a similar variant of the RTC block. Allowing SUBU
mode on those variants would expose RTC offset operations that access a
non-existent register.

Add OF match data to describe whether the RTC supports the SUBU register.
Reject probe with -EOPNOTSUPP when SUBU mode would be selected on a
variant without SUBU support.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Suggested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v4->v5:
- Renamed rzn1_data to rzn1_rtc_rzn1_data
- Added a print message to indicate that SUBU mode is not supported
  on the variant.
- Added a comment to indicate that the xtal clock is NULL when SUBU
  mode is not supported.
- Added Suggested-by tag from Wolfram.

v3->v4:
- New patch
---
 drivers/rtc/rtc-rzn1.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index 8b68a5ad19c0..35770bff129f 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -18,6 +18,7 @@
 #include <linux/init.h>
 #include <linux/iopoll.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/rtc.h>
@@ -65,6 +66,10 @@
 #define RZN1_RTC_TIMEC 0x68
 #define RZN1_RTC_CALC 0x6c
 
+struct rzn1_rtc_data {
+	bool has_subu;
+};
+
 struct rzn1_rtc {
 	struct rtc_device *rtcdev;
 	void __iomem *base;
@@ -404,6 +409,7 @@ static void rzn1_rtc_disable_hardware(void *data)
 
 static int rzn1_rtc_probe(struct platform_device *pdev)
 {
+	const struct rzn1_rtc_data *data;
 	struct device *dev = &pdev->dev;
 	unsigned long rate = 32768;
 	struct rzn1_rtc *rtc;
@@ -411,6 +417,10 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
 	struct clk *xtal;
 	int irq, ret;
 
+	data = of_device_get_match_data(dev);
+	if (!data)
+		return -ENODEV;
+
 	rtc = devm_kzalloc(dev, sizeof(*rtc), GFP_KERNEL);
 	if (!rtc)
 		return -ENOMEM;
@@ -454,8 +464,12 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
 		if (rate < 32000 || rate > BIT(22))
 			return -EOPNOTSUPP;
 
-		if (rate != 32768)
+		if (rate != 32768 || !data->has_subu)
 			scmp_val = RZN1_RTC_CTL0_SLSB_SCMP;
+	} else if (!data->has_subu) {
+		/* xtal is NULL here */
+		return dev_err_probe(dev, -EOPNOTSUPP,
+				     "No valid XTAL provided and SUBU mode not supported\n");
 	}
 
 	/* Calculate the duration of two RTC_PCLK clock cycles */
@@ -508,8 +522,12 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
 	return devm_rtc_register_device(rtc->rtcdev);
 }
 
+static const struct rzn1_rtc_data rzn1_rtc_rzn1_data = {
+	.has_subu = true,
+};
+
 static const struct of_device_id rzn1_rtc_of_match[] = {
-	{ .compatible	= "renesas,rzn1-rtc" },
+	{ .compatible	= "renesas,rzn1-rtc", .data = &rzn1_rtc_rzn1_data },
 	{},
 };
 MODULE_DEVICE_TABLE(of, rzn1_rtc_of_match);
-- 
2.43.0

