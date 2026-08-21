Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8EC43CECB
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Aug 2026 13:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787320630; cv=none; b=B2fLqMmkNotHwjcs2X/wfxEVlebQnYabTZdP1W4doqgszxWqtqhiopg36eOg9sNeMgTd9IhOvZ9su/JEY4bU5xYg4NM0M6A7/ElnyjDP4QX2ImYYfm24IcmWOHxGwiHLpQd0Lp1bFqHVvBSs7Gfqel3GGBJl9Ern6fXhtdzRkxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787320630; c=relaxed/simple;
	bh=bbhgCz/PoN/VYdzPfW9SJ8KfnpB9xgPHLKXOVw3ZwZg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dhkhpRVvnbLEiZE0j5mN7CzvRTOROS8xxygwvwimiXdqwWyblQiMtG/+arQuXmigEQnxCCr8hUEG0MNIgQG0PNd+AXcqzJQGh2Ka0nesdfExMiqFZprAYcKb88KEKibaEPrGNjNfF3ToT/BpcoRP1ect0Pn9qGtqgVSBidkBh/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gZiWBeC0; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gZiWBeC0"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cc7ef7ec27so14272465ad.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Aug 2026 06:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787320629; x=1787925429; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gyOnyMmEXCZBKLQwxjb8ydf3Caf3mgLgb333lC5gOLY=;
        b=gZiWBeC0bNZZc8Um0ba82DQvLE2/79GxbL1RK6D+w/OqbYVvzHRum6X1BL+87376qD
         HwKpsUEsS2HQO1QWJx0OMIwXXqxPiVGuJmWFsOgPmffNYnmFLXLR+TBgK/VfosN9Tk05
         26RJJkvZpRPz+8ZocjOzpr+kvEilzXv+t+0a2uISg2hf/udZ7scI4FHrCw9OCEJ0IuLw
         lDjCZ5Qg13xQweFnVi2MHcyfsX8m4keJUjyLV5zG8Lk6s1X36sfxm4XAkVt5hd5R2XC4
         TUv/l1Kt5ZkeIK+gOTefF69q7tQVndDQCMqnyfv9XMg1j/DtyxfDp8AKo0Oub9V0in+K
         FZeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787320629; x=1787925429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gyOnyMmEXCZBKLQwxjb8ydf3Caf3mgLgb333lC5gOLY=;
        b=TiVXpJTqzWJtOY4gxM93rAg/3XlnG9+SWQoIUKlGMTpokpWrVE9C+bfh8fyLaWTO5R
         pZYhIEOku2drAiwlm9QXMsRFg+5GHx/N9LGrdoY9JmtH5h7jgfoI7kmBBvRluEMEnzOq
         jtusJfTz41V6RG9D4NXv2/Ba+YCQ8oPON2oKVWfJYjJJAHCi99LF/LsiFQLq3KuL39Nl
         X6uGCYDJa4c6sGozQgiG7AU1dDmwH/0Wj0Nj6RMFsYxpMOiKuciJBRIcifYL+vVIvNB6
         zYEK08Ra5k9CEkTija7nrFJ7RoM9C8biIFVJ3K5o0ga6oXJVuYkvjG+ZTCax0Ckrrym0
         4oDw==
X-Forwarded-Encrypted: i=1; AHgh+RrqSF1hAHmSX547Xq5zxWnRU94aE9vURrRa+bTANO/HpaxV9fBIF4QsWsEV7mfsC0+6NNFsgAR9mDq1IfkkSaK45A==@vger.kernel.org
X-Gm-Message-State: AFuF++k9hg6hXomkqw7bgEqoVL/ArmXdQ0mka+fQ4MUMNKkYGb+Ah+hB
	fvoRN9sej/o5WQWwVcCGqM6NfcqkWUCT1NYxTlJJ+CxBLmo5JScldFyO
X-Gm-Gg: AR+sD1239vR9fw3E2dU47cnFQ8S3VRJ+jWLIxqooZ+GRTE57ZHFfYfvs+B7iPSlrPpe
	QQ68rO59Kym2SUQBPou/jfABxkJko8vTnlqP+0WOM65kIlK0h0GSm/Moc8lWFpygfQ3n/QOVHsM
	lYIYCn5AryO2c+akr6lUMo1CVX8Qmk+vX5kUkPx5n9AdQXFMhK5HIxc5m0+1qz1jXGOOxdRTqV4
	XPDBK1YTbKmob8PdSTIXvQb70KQ4WfD5wIs3/m8OXbsMjZ9Rp/yil8AYGLBZUB28q5tlKL6u1nK
	gLj6vHGiPMBa+K7LR4nt7r2KiaDeBCHWSHc60fg/6WmAW9bpYGR2ZWK1glSX5FKcFyVB7q2ycBP
	b1nXhRkjxJwqYx7Tm24Xof1sr1z2F3CfkwbnyXkO1HXrdvafxSC3a+WBz219kvICDn33t28toAV
	EcYXxT3kZxEela/PFhH6vYUutctFPq3wFt40lWpOcc/O8sU5H26tgw2Sc3wLW2i1MbAS2wlqAGZ
	BWQRnQdWz1tF4fLuQ5auLrsfLpFxMoqIFvlCt5Dw8XoXQjSJR7bffHMtmiY7i98UB5VP44/edgK
	FecmUdRFHdHyzE50yEf9Cg==
X-Received: by 2002:a17:90b:314a:b0:37f:eafd:3505 with SMTP id 98e67ed59e1d1-395c3522213mr11052450a91.6.1787320627942;
        Fri, 21 Aug 2026 06:57:07 -0700 (PDT)
Received: from iku.example.org ([2401:4900:1c07:efb3:773c:1c8c:24ea:eff6])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327d01ff056sm19972277eec.19.2026.08.21.06.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 06:57:07 -0700 (PDT)
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
Subject: [PATCH v5 06/17] rtc: rzn1: Disable alarm interrupt before reprogramming alarm registers
Date: Fri, 21 Aug 2026 14:55:57 +0100
Message-ID: <20260821135608.275233-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
---
v4->v5:
- New patch
---
 drivers/rtc/rtc-rzn1.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index 44e8db466cb7..09631a3a5134 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -280,6 +280,11 @@ static int rzn1_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
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

