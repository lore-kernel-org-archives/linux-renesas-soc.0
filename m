Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F3B444E043
	for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Aug 2026 10:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787136067; cv=none; b=mGxueX+azA5CVDTOz+IYhT//R1hbwYqNXhPWA5pM8GpTaTEDi9KwNjqhLrEKLVJ3aOSKFKcoN7DtgTsJN4ECOJ9tcDSuWI64Jfvff8wy4rt20aG+7fPmv8/zXxgF4JmscpRVoz+IhgjggE8/nInsPdy230YAu21OHO5QL6ds16U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787136067; c=relaxed/simple;
	bh=fqDxLMxq201J5OX95IYuNjtL/jRJH0w03O9tgHXacaE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=trU7cBwbX16nPx6NK1bJIS+JQ4TXffZs5tbzzkOdjH73MaPl8Io4C5PvHokKFACTnBch7pdynVLYlm2+kp/VSXDs+Ai89omc2aTX/FaSMN1xHLT0++JuktSBVJBUM3Kfg79hwK0EbdPDoFOZOmLLX/oZGZDRrfiqF7QIfPnSV48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pivtkAR2; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pivtkAR2"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3811f512167so1294744a91.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Aug 2026 03:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787136064; x=1787740864; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jRmLRFgoYJjChjT5n0JT9k4wL4AVamUoFR+vPjRw0Ag=;
        b=pivtkAR2FTl9ASI3TlSP6ypSo/PXw7UiqIUxrKAhToGSaQUSqx027LitLNhGBZ0f9a
         e13ZfBAcgOTISk8wXS83GdYouhUYkQpexMSr8B9izIaXqOKtJL+Ryx5FDUZLMpTmIs7k
         yKtyov5jSxriF3HtDGkLNW31H0QXoLg74st+hQLesJJeRpjehTH8CLVHZzZ81qcpozHM
         PybrbyLAPCu7n6iRuWhgPTn0U1Gpx1o7X4BIxof8xS9s2tvIXCispV8SQWDTnI/DGlhT
         wQHA8sSA/pCpnN5cKqH7ReEmrCJLqpdPRJ05sLTwQyTXzPRV+XUVJQbHH8h3EiHShdoG
         k9hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787136064; x=1787740864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jRmLRFgoYJjChjT5n0JT9k4wL4AVamUoFR+vPjRw0Ag=;
        b=hY5ULBmPQLUx2WKf3UH4kgPGAzPW4ff+lxjpMQGFbpmob6RCVsk67nGj/by5rpEIe4
         ElhhTIkSv9QOXNw/1bOHrv+zAH/uS9eJ+vPDkWNJQ6vJqUXcjnaBQ0I4cMl/azwybMQp
         QiDNNTN8B2Y6H839C2a8YInDSJ6dFc3MZjat3jZGBGWQRmuJctTucvU7WH03q3B8NVpH
         pHIYUwBnBlhv77/qSA2jWk2lznSe4vfx6F1bbBaUnzmUiTUvVOW63/BKPxnBTamePp4U
         iLg5gMESC0jPN6dC/p3AJ4IQ4o3WAopoBBdzmx8ijTgx0wpVx3MY4L7RenpvToeZwW0L
         d94A==
X-Forwarded-Encrypted: i=1; AHgh+RpD4LNFgtOSFeNCgSUjtzFQkwjGy7Uv7+N1SEgqiEuB0YKntOiy7Q32uL39puORXLcuihSF4tqKZum+Apb639RLtQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mUappCqA9H04t3OMdtkbDT5np+P32e2lUBx6tr6mWo+pDQzx8L
	FSKPquVOPi03abv0AH7bAjeX239wS62OPEYEeyV9OBD7wsWmQ+OivWVG
X-Gm-Gg: AR+sD10CtjfF4g7CTm/E/NFzlkOESI5xb/bl+7ECA+MxzHM5aOc5UT9DEvSlp8msO+L
	W3VWZbEGaiB3snCygQ8Z68k4tufUkyxvnMfVxoeuKWq8jAojYyiIDhlRuJdkQDpM+Y2v90TtVgb
	GUcYG1n3dr0SNy0j50BXSnzdW9GvvHaFBu+ly7e3gDzvIqLTo6P7XfgD9Nd0Ei9nFZ6hyhJxBOq
	9tAEW25+Ha1K9OwakQsrckaHKXqQeiUx6LpEKL30yFUkqfxEbN5NMP1wgy9Pmb9xoJhEtZGIb8Q
	8iyVWDNM5cfWQ/L27rpXkTzfWpHWZOMU9SE0HiTAm4yAVJrauc6rtXYzDSevWU9nzAAdi5NRZNl
	GVfkVCUZgopu5tDcDsLn4AKBJmqN9F6NogkgwmWSUGOonQ2Tllar5ALvJ3pURTh410t0L3g70Lp
	Ewb5SdZyS9viQoQRh7ApPdQ9Izc8wwTFbuh5oQXo1KaLpOYl0CXBx/UfZ1FdaOfa/pOhQPm1oni
	oqDoRnn3N0fDCsM/TQEwFWL+XkfuX3GNwTtwWj8D0h2D1v+0rJu82fiuMkwYViqlrH3oLkTSAxW
	PGCBMtjtFw==
X-Received: by 2002:a17:90b:1e4a:b0:37f:c97a:939f with SMTP id 98e67ed59e1d1-39580ace5fcmr6816160a91.7.1787136064030;
        Wed, 19 Aug 2026 03:41:04 -0700 (PDT)
Received: from iku.example.org ([2401:4900:1c07:efb3:a897:a9b5:e171:c935])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bef77fc0sm11169630eec.8.2026.08.19.03.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 03:41:03 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 12/15] rtc: rzn1: use FIELD_PREP/FIELD_GET and GENMASK for register access
Date: Wed, 19 Aug 2026 11:39:23 +0100
Message-ID: <20260819103926.2136712-13-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819103926.2136712-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260819103926.2136712-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
---
v3->v4:
- Added RB tag from Wolfram

v2->v3:
- No changes.

v1->v2:
- Made use of RZN1_RTC_SUBU_RTCA0FX mask for SUBU register access instead of 0x3F.
---
 drivers/rtc/rtc-rzn1.c | 50 +++++++++++++++++++++++-------------------
 1 file changed, 28 insertions(+), 22 deletions(-)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index 7e2177f46313..02cff5fe117a 100644
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
@@ -294,12 +300,12 @@ static int rzn1_rtc_read_offset(struct device *dev, long *offset)
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
 
@@ -341,7 +347,7 @@ static int rzn1_rtc_set_offset(struct device *dev, long offset)
 		subu |= steps + 1;
 	} else {
 		subu |= RZN1_RTC_SUBU_DECR;
-		subu |= (~(-steps - 1)) & 0x3F;
+		subu |= (~(-steps - 1)) & RZN1_RTC_SUBU_RTCA0FX;
 	}
 
 	ret = readl_poll_timeout(rtc->base + RZN1_RTC_CTL2, ctl2,
-- 
2.43.0

