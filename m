Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CAD836494F
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Aug 2026 21:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787346689; cv=none; b=ay/rlU5vwbfcm5dlXHvKEArlKWgkD+Qxm+7/hcuzv5+lupOwu6ktFAHTceL8GWARfi3AyQVxGGd05NpsJ9lkRNTBBgX0Ea6nNONw15zpEA5yFjDp2vnrWbtyRGLmExoc7iXp3Smi+No5I0CJqDSHnYoqg+cUXiaJxzy9icVXV8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787346689; c=relaxed/simple;
	bh=OCvICYb+/dgelt4iCQOW0q7NZ8lOQA6YG4zyM/aRMjo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IcQrid44ONZ+5sjocD512Wlge3CPB3DHLAza+Oji4apQX2lc4q7FCCz1tF9UTGotlYIGzLc7YePnW5z0awmO4oIZSPxQyEghsaoGA0zscFQFPOtPW1O09lKYpkpqxu+mJQEWIsNai56eSnUf9KTOPMs0Wbi2hx3dQC1ka46tN9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hyHYUmVo; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hyHYUmVo"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c9b373d5af0so1143835a12.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Aug 2026 14:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787346688; x=1787951488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qu7PJFtPksXhb1y6jab3sxIPaMUT5D7gnfgKv2YPKow=;
        b=hyHYUmVotRVla/v4zr4RPIjQGXvdP+vlvD3nhSjPgkQdOxOyP22xZbBQyqbjv0fpeJ
         I4jB6zrqeoNXhj+x4/T2CFXQJ1eOLRvuIrWYMkvIpTICRSmUC3L1uNCrPN40wr6K7dSD
         /5xx8FD48e4BWg76P796ge+E5lVZHY+WZV7C9pGyV+s/kBaV3fSsdJEflyfi+aw+2avg
         qVRMBIH6YtYveKxJ1+bYkez5NHAxqdeVbQtIwE6cfnjvmrP9UwIZyG3a3Dh2yMseqycl
         f26C2cXMxV0yLLyOpfMZpgF1Tstu9I+uCKyDIx29YZhRRyMr+v7p8MJbNVzAnni5Isbr
         JazA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787346688; x=1787951488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qu7PJFtPksXhb1y6jab3sxIPaMUT5D7gnfgKv2YPKow=;
        b=qTyFXrFhVfgsomiH/iIwsrapQiuk1SMaW4Inz4qxf6+HqvzeuH8DsN/5U5Rggwo36i
         ANKRtTIaTO9oGMzgbMhKmeovGbQOmCQdCjRrYUIbmeMhGHl1qH+HbnGVsHIgz10sYe3B
         xAARHqVmTq+lTtmCbnnbq9fiW4yQjhIEHiPaurOXxy0AF1T7xh164m9pL+H7M1SiwQQO
         1AO5mAeylARfn5fi1AvEneySpwB+0pXDWS/QuEYVX0CwvlD04hsVZSVBp2rGWiIwRyf1
         cFNRZJhhCZPz/mircpLS0Acdai+mh5jHmE4QmWGjwJ49xj8XZtPq/dRvEOi6lI0QtbVs
         13RQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp9YX+la5DFlILO45feOA5YcBJMhezO5h9ndIf6sxnpDGe6GIO7Ne4OTw64Bdz9T81mNXxfaeCsBJPmWkf9kpafHg==@vger.kernel.org
X-Gm-Message-State: AFuF++kKFoemm9HQBx6OrTaXmXZZIt0HLB7Lql+S3MEh3w4UEUGgtojW
	FowMjdW0oIHE5K7MFVBmVgECVEdeQ/v9m9JMRlewc1vgfmEaky8I3dBl
X-Gm-Gg: AR+sD10BwIea0V76IfTL3qA2IxMjA/W+a0auaVcL2rnVYVmJyW22RZ2Uzi7l9iWKC+o
	CZVBJNg482aYUYPn0Pv6cIa1k0eUoHjegiVScjcFtgNvyBw2LGlAl4q72uR82f6K1Y0l4DX3iI2
	MkJWzmhW5kh90hvAEWHj8VNelyA7NDSWnzlwEeWTlQ5lih2/lySM/XMcILccob5h8M3pIW1UeOG
	RuO/ciSwKOlJeSESBdF9KV0W09UlO5X6buuZfibMKlliymdamFGYr6N72y9lXDmqNk+xpg9GZ+1
	y5b6VwaB6JDJ+Yp3pAwIlq8yiigELpd/vp9cM+qeJUDM3MB0CJXeEmUOQPNOElAMPVam5x0eDF+
	4XzbUXdLmeLVBkH87+pTwhGeF2y2+labpm+uA5/6cl6a1qw1Ak6PUNcgDklaVEtKtyCUoQILRVz
	PusTjp9wT+13Y80qTWSAER1BXrMY32IAa5K0sZA4KPT0YVxlLrgxDjl8xhoppcnELkVEGRkq6xg
	G6MYZwb74BYop2BaLFAI46N8zPpxTIMbkVMGeMtrIWFHP50bKQDdjmkHiLBDb9X2wpl2X7r
X-Received: by 2002:a05:6a21:a93:b0:3c3:a140:9392 with SMTP id adf61e73a8af0-3cd4b6850aemr3354970637.0.1787346687662;
        Fri, 21 Aug 2026 14:11:27 -0700 (PDT)
Received: from iku.. ([2401:4900:1c07:194c:dba4:ea1e:d7d1:affe])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf175399sm49755257eec.26.2026.08.21.14.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 14:11:27 -0700 (PDT)
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
Subject: [PATCH v6 06/17] rtc: rzn1: Disable alarm interrupt before reprogramming alarm registers
Date: Fri, 21 Aug 2026 22:10:21 +0100
Message-ID: <20260821211032.13554-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

rzn1_rtc_set_alarm() updates RZN1_RTC_ALM, RZN1_RTC_ALH and
RZN1_RTC_ALW using separate MMIO writes without first disabling the
alarm interrupt. If a previous alarm is still enabled, the interrupt
can fire while the alarm registers contain a mixture of old and newly
written values.

Fix this by disabling the alarm interrupt before reprogramming ALM, ALH
and ALW with a call to rzn1_rtc_alarm_irq_enable().

Fixes: b5ad1bf00d2c4 ("rtc: rzn1: Add alarm support")
Cc: stable@vger.kernel.org
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v5->v6:
- Added Reviewed-by and Tested-by tags from Wolfram.

v4->v5:
- New patch
---
 drivers/rtc/rtc-rzn1.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index f3268655fd37..42e57bf0b4aa 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -281,6 +281,11 @@ static int rzn1_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 	if (alarm > farest)
 		return -ERANGE;
 
+	/* Disable alarm interrupts before reprogramming the alarm. */
+	ret = rzn1_rtc_alarm_irq_enable(dev, 0);
+	if (ret)
+		return ret;
+
 	writel(bin2bcd(tm->tm_min), rtc->base + RZN1_RTC_ALM);
 	writel(bin2bcd(tm->tm_hour), rtc->base + RZN1_RTC_ALH);
 	writel(BIT(tm->tm_wday), rtc->base + RZN1_RTC_ALW);
-- 
2.43.0

