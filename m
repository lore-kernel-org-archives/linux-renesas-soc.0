Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A47A48F842
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Aug 2026 13:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787320610; cv=none; b=HLcqrdXAs1Zo+x5w2xXSE+hI4ZDipPJXLFWj6OAJDDxGA8BDI9Uf1ZZdadDl2ZJakuSrV1Pd/cEf7GU9uBTkXceKLF3Ka/BywPH2+ALOpWRwMllPPHOTEOx9SzptB0aExgW11IBKppWH+sZvlQEcBlO6/HRUq4nDkHUY14MSjM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787320610; c=relaxed/simple;
	bh=nOwCB0GUu636xzrMDwXRCKSR8TtZ4OMEI81GMCIE7vM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hasedx/ld/+aJBvqwQ07mfEl9VEDSUxQUydltsuZOaftpshtl3lJJiKkCZbwIb0ebQA0IrwBySXbMdAoKc/DZnP3RvrxTM/MRLGIvuViBdPEH3aZaX08lPXUBRAxYAEeZGT3iCyI+Br3MrnHskTyDs5xJ7IZZ35ZSGYdT9YKgx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GZlSwPEA; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GZlSwPEA"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c966b9ee9cbso712592a12.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Aug 2026 06:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787320608; x=1787925408; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d0FHwOXmdVjq/fR8LKjN0dCSgITp6opJdRR3Iv2IfwI=;
        b=GZlSwPEArMzym3mMiIDUoMBvgTPk1zsx40bWbVKQToRaXTN7Jttyz8G7pOnaLsJmKm
         eaU6JxtDXMghu5Fkb29IFtMKKYnaeY0nredMIOhYO73maawqLzAGD2NQ3YC9j+n+mGzH
         EwT9sahdv0VOz3KKn9kqsDo91KUNWBVvlHYTh60XeaN7aq35LEwIDTPKZgN2rD9xEvWt
         LguIJLZCO2IBy5+a6F9C+qN2MxJ0ZQyAipEkw9uH3sOmM6VozVMNLaysAZ7yWJ2+uTse
         bqsW6uQJi+evP/vaZqnaM2TGxhQIlF10WYooPsCnIkGBnWBxhIMZeZuMitgAGP+TWiQK
         pfSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787320608; x=1787925408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d0FHwOXmdVjq/fR8LKjN0dCSgITp6opJdRR3Iv2IfwI=;
        b=fQzUYgA79VpUB2IRpDJ3/fL7MFLtLudGhOCvOQI9jrzRTrFJTCv8S0UXmCbE6LCqQE
         PQfviL6LR7FinHRR5HUnqXTphlhiEkelVTzPuI92cgX1aSeGolRUHxSmqZCf0G5O64iE
         tpxfYLDCV8UK8NgDqfDcS6+ahR6cha9aHgwwAD5S41Sxi/KHJKNhDnNwnSw3crgDmE9s
         sgihVlPKywp/do2+MNsSykjmMaToZJ3Op/K5KX8XIGOi0joMl8SJu6XXYs2Mf3JipR50
         mAvqlJyGeGSc/4EOdwohMqNz15+KILfRCXSRVnE9C9/M+z3/5OAz+YHcRlg5OVgf1amn
         5LZw==
X-Forwarded-Encrypted: i=1; AHgh+Rq0V67MXwe7z0TINSRTn+jchsQmrELmq0EOeDH1KfkvCpIB3qMJOVt3QNATNAmFbwFQzqgVmvg+yxVDov11kyxLqw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxeS49CC9cVnGm7xZ3mNc20QJ4eWRgpkFoGvE5+o4tlsuGD5aki
	1zhbD2Y3rQZaIGEYrD7WamFl55biwlhM+7ps9MPxKMpNG/JRMuGp9V4u
X-Gm-Gg: AR+sD12i11uco8bUAKRZJgH2xM3JD7nFpOYMYbppa9oobz/F0VGTyTowTmrrH+J04OE
	oCuxtxIYuZWmY9ouIK5lO9BhKzuFeb05ozAsJh1lfg9SQRURge9C+o3W9hKzvW7D9cYPdXf+Lyu
	rahcKavH/2jZ7gQxfTM/Bx7wnlxFTn8xugoMam9k7XIWE1k69n8ftvsrLmzpbotyX5t0j2XixXK
	j9DK0gE0w3FNuz4KdtcOB2ZnlLXJrJUAeYZjL+05jPAUsp733BlrEODcR/cFNZkrhlLipdE8JnB
	FqvJVHyFfkvkTjb4njn4RcVsQI9wqtYDLU91ivpK7TG1m1cmHzBg3jXNFnRIDNvki5bHIEyKrxj
	DAuMZ85jwin/191rtxkNuxbDxhRv5dMjKXDsrzl2wxM6Q2Cxk6KqMq++5ZUOog44YaVUPZJiNcW
	O/WD5HqsuoYvdwi0iD9EFtB258mQES7TaddMcBJ7MybpX1CSTHrP/CsS5I0AzcKEHZhaKMAzCsq
	UTf35mv0Yl5GMRyCcN2kC8VtDYvSgnI09z8ukhuA7yGgAqocHpH+OkDKG6Hv6Dh4fU3/KUsdnrC
	0OzeQr7p12ORr8ZtUGxFhIgZSunNHlHO
X-Received: by 2002:a05:6a21:6f16:b0:3bf:8de9:c647 with SMTP id adf61e73a8af0-3cd2fa2dfa0mr14028111637.0.1787320608326;
        Fri, 21 Aug 2026 06:56:48 -0700 (PDT)
Received: from iku.example.org ([2401:4900:1c07:efb3:773c:1c8c:24ea:eff6])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327d01ff056sm19972277eec.19.2026.08.21.06.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 06:56:47 -0700 (PDT)
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
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: [PATCH v5 03/17] rtc: rzn1: Fix weekday underflow when alarm crosses month boundary
Date: Fri, 21 Aug 2026 14:55:54 +0100
Message-ID: <20260821135608.275233-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

rzn1_rtc_set_alarm() calculates the alarm weekday from the difference
between the alarm day and the current day of the month. When the alarm
crosses a month boundary, this difference can become negative. Since
days_ahead is unsigned, it underflows and results in an incorrect
weekday being programmed into RZN1_RTC_ALW.

The RTC core already provides a fully populated struct rtc_time for
the alarm, including the correct tm_wday. Use tm->tm_wday directly
instead of recalculating the weekday from the day-of-month.

This avoids the underflow and ensures alarms scheduled across a month
boundary use the correct weekday.

Fixes: b5ad1bf00d2c4 ("rtc: rzn1: Add alarm support")
Cc: stable@vger.kernel.org
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Suggested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v4->v5:
- Added Tested-by tag from Wolfram.

v3->v4:
- Made use of tm->tm_wday directly instead of recalculating the weekday
  from the day-of-month.
- Updated commit message.

v2->v3:
- New patch to fix weekday underflow when alarm crosses month boundary.
---
 drivers/rtc/rtc-rzn1.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index aa27ad7f5941..8c70dbf8c7ec 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -260,7 +260,6 @@ static int rzn1_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 	struct rzn1_rtc *rtc = dev_get_drvdata(dev);
 	struct rtc_time *tm = &alrm->time, tm_now;
 	unsigned long alarm, farest;
-	unsigned int days_ahead, wday;
 	int ret;
 
 	ret = rzn1_rtc_read_time(dev, &tm_now);
@@ -273,13 +272,9 @@ static int rzn1_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 	if (time_after(alarm, farest))
 		return -ERANGE;
 
-	/* Convert alarm day into week day */
-	days_ahead = tm->tm_mday - tm_now.tm_mday;
-	wday = (tm_now.tm_wday + days_ahead) % 7;
-
 	writel(bin2bcd(tm->tm_min), rtc->base + RZN1_RTC_ALM);
 	writel(bin2bcd(tm->tm_hour), rtc->base + RZN1_RTC_ALH);
-	writel(BIT(wday), rtc->base + RZN1_RTC_ALW);
+	writel(BIT(tm->tm_wday), rtc->base + RZN1_RTC_ALW);
 
 	rtc->tm_alarm = alrm->time;
 
-- 
2.43.0

