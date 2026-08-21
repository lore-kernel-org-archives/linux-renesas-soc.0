Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8B7499F08
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Aug 2026 13:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787320681; cv=none; b=qZeDWtLSab5PbTECZJHA8qA5csQ34a9q/6lqwF7W8iImDfbQdb7T4BeH/iVZmpXH+zt4zBe6IKbxnJflFvz4kfTY9MRsXB5X3ncttE14EMFTOxNgCTUSEKtHx7jL35xM1ItokPf/FxpY3pjeYCSmlsMl7v3D6blo14jTyvHMGI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787320681; c=relaxed/simple;
	bh=zhnl8YLIlQ4utT3JT2vKNwCvLziZtCJGZk/rhl8bdj0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NkJbSygvU7OQGFSKmZmx8Y1YNOXudzdPeBKr0HJLz5LgKVRARDOW2tjkKpxOGED7Qw8M95Vzh7sImUZKq84I21xyHAwFCIilpmh5jqcn36snHC7aUG4wpMrDXTYtwdfJHy06l5j3fUFgmaXkBF8NsjkhgoQJ1x9PFEPt/knBcRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wh/om1zo; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wh/om1zo"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-ca7bea5e5b3so850236a12.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Aug 2026 06:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787320680; x=1787925480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qj9P03d1ymDbOhIBXqu+dDsa+eCWHeVye4sMzpPS870=;
        b=Wh/om1zoCuhYQIt+vWNh8foNXi0WTximxFKo5UFKUOjQyeydxM76v+KxE4FlOzb+Qg
         FDO+fAoF+pN2H8BNzpge7iMPlHvl+Qq3d1RG39QaPwVFd1nxT8PlkcHR9Shyr+JlcnDo
         H0I1/bJj8LQgUo99SP66zvIYGnnDeU10ddDX2Vsz+DIMr2rlVdeGXO7r8hNQ8iHuPVT6
         D4HcyQ2ydmSs2e+RiIo1hP0jyapplm1cjVMnvqnJI2Ihb3RleVsF4hwjTIecxpZe3IyQ
         wCnMqkhzVYF/JjmzFoW7Z6hV+YLKtyJZa6TmSiWb2cUOFzKhMqAFt2dxZXJC2GuYh9GA
         O/VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787320680; x=1787925480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qj9P03d1ymDbOhIBXqu+dDsa+eCWHeVye4sMzpPS870=;
        b=hPEZmjl6qboY7GsnG/xuh6SlpHNJ2wkBMKholF8Nkbb0z2+bFAk+kdR45JYKlv6893
         qT2MalUhZhiqXgSsQVGmrUn5y6VPQj3a8hO65uQTj3ZXuA/XgO/AJvGANKOBGZe8bykx
         61O4yqE1QXoi/7UaTyTm4k9BfRPS4atv/YJKW9V2e3OSIo/K/2ttwATVyEgTwNTFMuEr
         FxgoGK0r71UHNasB9GwW0t8X3r0jpF18dv0Ex/sd9+htuID+eBTFR+7mt9ulDlCJQQ2O
         rbRd55LLYhOynOitX3BotEIxrTTvz8Zq5yTBQWxJWrpOSbfSpAHZRnnVrhiAhs0E8Hkb
         NMEw==
X-Forwarded-Encrypted: i=1; AHgh+Rp9fJcBplCVx80Rv3hMhpf3QvRZBI9JtysmGkyvBUouDeGB/XXoamyZu05v9ncyDTyugiq73wVnclzUvWJ0Eh0QGw==@vger.kernel.org
X-Gm-Message-State: AFuF++m+f8GG+4XY15aCX33oRCJVy3kTscFk1A3vN3os0TiPur95KzuR
	u5A2L4RWGb6GG51V30cSrdngXyZBtS0hsjfBrLcqixblyPX+Ft02Hwd8
X-Gm-Gg: AR+sD117ITRgBeY4XbCDTA5A3ECHnzHA+HZvQw9qllEZDNKEmUnqLvQ3UdW7SEbJq2G
	nrCHpFNwHERYvP7h67jFofe8XulWNS1Oj8DEszRzS2P4pKE3EUswKaE/FqU4d3rKJ5Ix3GGGuAG
	eundAh5EZDjxfZjtF2r2iQvygDNKBKOpd6Jp3dxhW4O1GOt8jdDXFumVR4kaLatbm0CKCKRalxa
	/ISsS2gaLPYDp1R6r+WPLbwtZ6QkLr+J/yvRgKEI47DHNK+faVd+ZoLB9v+Sj8sGyPWyxD/dX2G
	HZ2P4i8U7Q2DlEMuCVCyIG4PqxGNLszys6P9X5HlH5kSaKFMOWjjZOtkVNGOSOaj1mVxn4pmQnJ
	LygGgCPGuZjX0e2OOiqSRm9tDcB0VJUD5JklMeyqZrJ5/J0wttlpRAZwRBdGYMY/N8XY58cpmp8
	097x8IeOU7A8NN7hgIzrisw+f4JE5ytJNXrMWwrYciG+P9+m+8OxwJJPzjENJc3vGXUQM2Tc6Tp
	AuzdAOcuFIzJ5P/qQbXihQ6a1RUVa2iC7+CB8HGyZxODa+nm5NrLFXxhcTmg7n3om7sB7BhMtpN
	53JjeigfIw==
X-Received: by 2002:a17:90b:3912:b0:392:e5b1:d833 with SMTP id 98e67ed59e1d1-395c3738b35mr10836523a91.13.1787320679624;
        Fri, 21 Aug 2026 06:57:59 -0700 (PDT)
Received: from iku.example.org ([2401:4900:1c07:efb3:773c:1c8c:24ea:eff6])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327d01ff056sm19972277eec.19.2026.08.21.06.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 06:57:59 -0700 (PDT)
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
Subject: [PATCH v5 14/17] rtc: rzn1: use FIELD_PREP/FIELD_GET and GENMASK for register access
Date: Fri, 21 Aug 2026 14:56:05 +0100
Message-ID: <20260821135608.275233-15-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Replace open-coded shift and mask operations with the bitfield API.

Note that the weekday field is changed from an explicit 0x0f mask to
an 8-bit field definition, matching the hardware manual. This does not
change behaviour, as valid weekday values cannot exceed 7.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v4->v5:
- Added Tested-by tag from Wolfram.

v3->v4:
- Added RB tag from Wolfram

v2->v3:
- No changes.

v1->v2:
- Made use of RZN1_RTC_SUBU_RTCA0FX mask for SUBU register access
  instead of 0x3F.
---
 drivers/rtc/rtc-rzn1.c | 50 +++++++++++++++++++++++-------------------
 1 file changed, 28 insertions(+), 22 deletions(-)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index ea3906d1f868..8b68a5ad19c0 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -12,6 +12,8 @@
  */
 
 #include <linux/bcd.h>
+#include <linux/bitfield.h>
+#include <linux/bits.h>
 #include <linux/clk.h>
 #include <linux/init.h>
 #include <linux/iopoll.h>
@@ -38,14 +40,18 @@
 #define   RZN1_RTC_CTL2_STOPPED (RZN1_RTC_CTL2_WAIT | RZN1_RTC_CTL2_WST)
 
 #define RZN1_RTC_TIME 0x30
-#define RZN1_RTC_TIME_MIN_SHIFT 8
-#define RZN1_RTC_TIME_HOUR_SHIFT 16
+#define RZN1_RTC_TIME_SEC GENMASK(7, 0)
+#define RZN1_RTC_TIME_MIN GENMASK(15, 8)
+#define RZN1_RTC_TIME_HOUR GENMASK(23, 16)
+
 #define RZN1_RTC_CAL 0x34
-#define RZN1_RTC_CAL_DAY_SHIFT 8
-#define RZN1_RTC_CAL_MON_SHIFT 16
-#define RZN1_RTC_CAL_YEAR_SHIFT 24
+#define RZN1_RTC_CAL_WDAY GENMASK(7, 0)
+#define RZN1_RTC_CAL_DAY GENMASK(15, 8)
+#define RZN1_RTC_CAL_MON GENMASK(23, 16)
+#define RZN1_RTC_CAL_YEAR GENMASK(31, 24)
 
 #define RZN1_RTC_SUBU 0x38
+#define   RZN1_RTC_SUBU_RTCA0FX GENMASK(5, 0)
 #define   RZN1_RTC_SUBU_DEV BIT(7)
 #define   RZN1_RTC_SUBU_DECR BIT(6)
 
@@ -77,15 +83,15 @@ static void rzn1_rtc_get_time_snapshot(struct rzn1_rtc *rtc, struct rtc_time *tm
 	u32 val;
 
 	val = readl(rtc->base + RZN1_RTC_TIMEC);
-	tm->tm_sec = bcd2bin(val);
-	tm->tm_min = bcd2bin(val >> RZN1_RTC_TIME_MIN_SHIFT);
-	tm->tm_hour = bcd2bin(val >> RZN1_RTC_TIME_HOUR_SHIFT);
+	tm->tm_sec = bcd2bin(FIELD_GET(RZN1_RTC_TIME_SEC, val));
+	tm->tm_min = bcd2bin(FIELD_GET(RZN1_RTC_TIME_MIN, val));
+	tm->tm_hour = bcd2bin(FIELD_GET(RZN1_RTC_TIME_HOUR, val));
 
 	val = readl(rtc->base + RZN1_RTC_CALC);
-	tm->tm_wday = val & 0x0f;
-	tm->tm_mday = bcd2bin(val >> RZN1_RTC_CAL_DAY_SHIFT);
-	tm->tm_mon = bcd2bin(val >> RZN1_RTC_CAL_MON_SHIFT) - 1;
-	tm->tm_year = bcd2bin(val >> RZN1_RTC_CAL_YEAR_SHIFT) + 100;
+	tm->tm_wday = FIELD_GET(RZN1_RTC_CAL_WDAY, val);
+	tm->tm_mday = bcd2bin(FIELD_GET(RZN1_RTC_CAL_DAY, val));
+	tm->tm_mon = bcd2bin(FIELD_GET(RZN1_RTC_CAL_MON, val)) - 1;
+	tm->tm_year = bcd2bin(FIELD_GET(RZN1_RTC_CAL_YEAR, val)) + 100;
 }
 
 static int rzn1_rtc_read_time(struct device *dev, struct rtc_time *tm)
@@ -128,15 +134,15 @@ static int rzn1_rtc_set_time(struct device *dev, struct rtc_time *tm)
 			return ret;
 	}
 
-	val = bin2bcd(tm->tm_sec);
-	val |= bin2bcd(tm->tm_min) << RZN1_RTC_TIME_MIN_SHIFT;
-	val |= bin2bcd(tm->tm_hour) << RZN1_RTC_TIME_HOUR_SHIFT;
+	val = FIELD_PREP(RZN1_RTC_TIME_SEC, bin2bcd(tm->tm_sec)) |
+	      FIELD_PREP(RZN1_RTC_TIME_MIN, bin2bcd(tm->tm_min)) |
+	      FIELD_PREP(RZN1_RTC_TIME_HOUR, bin2bcd(tm->tm_hour));
 	writel(val, rtc->base + RZN1_RTC_TIME);
 
-	val = tm->tm_wday;
-	val |= bin2bcd(tm->tm_mday) << RZN1_RTC_CAL_DAY_SHIFT;
-	val |= bin2bcd(tm->tm_mon + 1) << RZN1_RTC_CAL_MON_SHIFT;
-	val |= bin2bcd(tm->tm_year - 100) << RZN1_RTC_CAL_YEAR_SHIFT;
+	val = FIELD_PREP(RZN1_RTC_CAL_WDAY, tm->tm_wday) |
+	      FIELD_PREP(RZN1_RTC_CAL_DAY, bin2bcd(tm->tm_mday)) |
+	      FIELD_PREP(RZN1_RTC_CAL_MON, bin2bcd(tm->tm_mon + 1)) |
+	      FIELD_PREP(RZN1_RTC_CAL_YEAR, bin2bcd(tm->tm_year - 100));
 	writel(val, rtc->base + RZN1_RTC_CAL);
 
 	writel(0, rtc->base + RZN1_RTC_CTL2);
@@ -307,12 +313,12 @@ static int rzn1_rtc_read_offset(struct device *dev, long *offset)
 	val = readl(rtc->base + RZN1_RTC_SUBU);
 	ppb_per_step = val & RZN1_RTC_SUBU_DEV ? 1017 : 3051;
 	subtract = val & RZN1_RTC_SUBU_DECR;
-	val &= 0x3F;
+	val = FIELD_GET(RZN1_RTC_SUBU_RTCA0FX, val);
 
 	if (!val)
 		*offset = 0;
 	else if (subtract)
-		*offset = -(((~val) & 0x3F) + 1) * ppb_per_step;
+		*offset = -(((~val) & RZN1_RTC_SUBU_RTCA0FX) + 1) * ppb_per_step;
 	else
 		*offset = (val - 1) * ppb_per_step;
 
@@ -354,7 +360,7 @@ static int rzn1_rtc_set_offset(struct device *dev, long offset)
 		subu |= steps + 1;
 	} else {
 		subu |= RZN1_RTC_SUBU_DECR;
-		subu |= (~(-steps - 1)) & 0x3F;
+		subu |= (~(-steps - 1)) & RZN1_RTC_SUBU_RTCA0FX;
 	}
 
 	ret = readl_poll_timeout(rtc->base + RZN1_RTC_CTL2, ctl2,
-- 
2.43.0

