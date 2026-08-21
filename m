Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2533936494F
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Aug 2026 21:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787346684; cv=none; b=ZZhjuszz8HPlfEEbM1ch0Rj5MJTGm4/s438JxkonNjnM7aOowrCaWsH8TRH2jCvu9FU69INfTjmhDeLG90wjMfuVwme27w8XdwxAHs5xszy+LRFKClGqykgh4tH+gLldA+pi5MxzG52bb2gwhQHQtp1EJfbXRL5pdgQlCzOKnAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787346684; c=relaxed/simple;
	bh=4qPzU1qyixVbSt/2x/vRlwNrYljQ8mnf/LV2SZCpJyg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b3jugfG3v4sQbpB21QF1O2YstQ1vtuB4THVvDm1FX2tWK4GjTOP+rZWchhspTIXB0vg4Efc+ERLKX1XPyC3hSBt2DfJ1hTJgKZ+alWmtAlkVATQeSRS5fALRxvrZJt4DRnht+WyTJqw1fSNGbSOdqb+ttE+QLtdMKcMwpCD2rQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s5zR8mai; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s5zR8mai"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2d032846c95so17718795ad.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Aug 2026 14:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787346680; x=1787951480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yn9Flz79IoiVRVBjWq6xrtU5CbtD7DazplXOHiCs9RY=;
        b=s5zR8maipP+0MMv0lyPDQXbcWWrvQokpqP8HaTs8t8mlphvkOyTK4h+9XnHnkguFXc
         dD0zrMCz5FyKGsYywOnPcAdTgvkux1rDDegMEKC80p3Sil0DO6ua1YPdXqyGYDuyDXQR
         N1OJx4Z+F9N3kDbb8c39LGhbbO1bV9oxhVKYLaqK4cmPBMmmKdrrGcqhRefhmWrPXS1U
         7FcVURB1jj2rki6XnDM/wUa9C5mkkXWHOrl9z9c17HiQQPeyU6UcycfjAjtDOQYHPUI2
         mMLJ2+RC1i6AnQ0Wvk0piwlS66vZnRJEMvA996XFQV5zj1Aqua7cLgiYnG0sG9J6QSrJ
         cbjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787346680; x=1787951480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yn9Flz79IoiVRVBjWq6xrtU5CbtD7DazplXOHiCs9RY=;
        b=eFl0wZQXt2rnZQ2wU573zBWI664qjP/UGzB+gUBLWJ4fszrmtl3VipLMTCdRnAOBHw
         +vRIw/+0GD0S0UtblkNY/tJef4Oxiin5DgdS+gtK+2KCabGqxfAZgia4UvUqbioVTMCd
         TR+c3Em+FI6KU3iEIJdlSDtB50vJwaW8BFr8G75D7TJlg2hJ8dJSU9gnCpl7sU58OxfP
         scvtL/zjnQYhdCI52YelIzcWDS/5aa237n/J6RQ3zvELNEYdj74qwfYpLnA1cuJq2KRI
         AST9Pp1SLZzhHvrZ2P1tpJDefDitxDeyvhNxkABeaJhNB8X7E3TsIQRe3GrAhTBt0TiH
         OGSA==
X-Forwarded-Encrypted: i=1; AHgh+RoitR2+gwckJpRDqif8mb/rJJOdtLp1lJVUAfZtDOa9PVSo3gbM6yiSZ2KZxp+TQb2dYwjOwj8IcL/1bnGRxxUMUw==@vger.kernel.org
X-Gm-Message-State: AFuF++keJYRC441m89+VvHvNrDSJ4vYTksOd7sYe43z1B+RKdyZZCX0B
	ZPmmHX4i30aH4lFcK3zmqWdsUUPMsCGUmCkS1dJfOIsdxHJj1jMHTy+Dcb6sSr0l
X-Gm-Gg: AR+sD13ny2lh0zvkBGguTcP30wRm73mkWywRYNG8qazL/S/rsgZ8/EQezr7CGKxQRk9
	XZ1qjvylqFMvJb92DNn+YCpS7z4dKG1JSk35r5ibcBn6zS3mQuMfluQwcp331CEoKXQWD4cDw4q
	j99iGRlNuIACqJnkMitmK6Swhw2eWCbo0oVvMtJ7ZkkP3YcuOk1sOKqEC6vqNnW4SZYgTu3SeF5
	W0IHDRR4rv4rV4/Gbaz5KziUMMxuedeEY11u2xvoIRW+Nav3EIodnVFC0oyklFi5vWaK4RCWenm
	MN78RVvxNR5TS9WyIzWYvsgOl+LHYlnNkWcsTLAMeiDtQRyLE+CUwBMp1xoC0Jzd/uWKUP71Wjb
	y21ZPIMb2qb0BOMNNrsjbun19xBxpw9MR+Vj7yfyGppfQwBAMeAfPcqQWSx2JI9MPFUduCiNVk/
	F4H2DHKF2SOBczlH0TbG+r7Og+JS+suDqzPwG2UVXo3MI79RqQEW2Q99zbuBFy3sDGFomozbMIX
	FU+eZl6g3v6IjLAbPSQxnBfS5USPA0v/XEaWyfLgbPYBw3CnlYstIIIAcar2ZST69ilp8nlgIj7
	GYTEO/XppoU1
X-Received: by 2002:a17:903:354b:b0:2d3:2e86:647a with SMTP id d9443c01a7336-2d64af6f896mr181704325ad.5.1787346680507;
        Fri, 21 Aug 2026 14:11:20 -0700 (PDT)
Received: from iku.. ([2401:4900:1c07:194c:dba4:ea1e:d7d1:affe])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf175399sm49755257eec.26.2026.08.21.14.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 14:11:19 -0700 (PDT)
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
Subject: [PATCH v6 05/17] rtc: rzn1: Fix alarm range check truncation on 32-bit systems
Date: Fri, 21 Aug 2026 22:10:20 +0100
Message-ID: <20260821211032.13554-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821211032.13554-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260821211032.13554-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

alarm and farest were declared as unsigned long, but
rtc_tm_to_time64() returns time64_t (s64). On 32-bit systems where
unsigned long is 32 bits, the assignment silently truncates the upper
32 bits of the timestamp.

Fix by declaring alarm and farest as time64_t and replacing
time_after() with a direct signed comparison, which is correct for
time64_t values that will never realistically overflow.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v5->v6:
- No changes.

v4->v5:
- Added Tested-by tag from Wolfram.

v3->v4:
- Added Reviewed-by tag from Wolfram.

v2->v3:
- No changes.

v1->v2:
- Added Reviewed-by tag.
---
 drivers/rtc/rtc-rzn1.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index d4cba0d415b6..f3268655fd37 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -268,7 +268,7 @@ static int rzn1_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 {
 	struct rzn1_rtc *rtc = dev_get_drvdata(dev);
 	struct rtc_time *tm = &alrm->time, tm_now;
-	unsigned long alarm, farest;
+	time64_t alarm, farest;
 	int ret;
 
 	ret = rzn1_rtc_read_time(dev, &tm_now);
@@ -278,7 +278,7 @@ static int rzn1_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 	/* We cannot set alarms more than one week ahead */
 	farest = rtc_tm_to_time64(&tm_now) + rtc->rtcdev->alarm_offset_max;
 	alarm = rtc_tm_to_time64(tm);
-	if (time_after(alarm, farest))
+	if (alarm > farest)
 		return -ERANGE;
 
 	writel(bin2bcd(tm->tm_min), rtc->base + RZN1_RTC_ALM);
-- 
2.43.0

