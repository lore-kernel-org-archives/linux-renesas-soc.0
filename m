Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5676F4052CD
	for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Aug 2026 10:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787136002; cv=none; b=tje7yhjGHwsN2rI8O+DI3YcmlOaU+/NDqBNbN8Yi4Axl3mPN8UiaT7dBaQWvkholbXmNNgFcefKSHuRYeptMjntHHw10bwEv8tu7hidHBsG86Ycj/l39XLnRdKHaTeiyqi9yvypg3MVgWwcJi+lPW0cKs5JDsX4gkSK1dh3SxiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787136002; c=relaxed/simple;
	bh=qDcB+Mkl6hrvJLtzWJ/l4rkGLgqhuvNTVfKWLhnH62Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YBVKsJJtI4wc/As9S54vJuVihJ66TUwEVPwFWd+1qpXvhQlgy99qGsxKRsdQ8GWs5p5wOYQbtm6Vxj4f99QkDye9k+K8bhRaOODP+BGSybJWqnuCjfSTaXJ+8BquKfZ5kwWOR73tCgdMmgtqwDdwVfsqQytZ6lv7xa8mD0wIJiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UH58KPQe; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UH58KPQe"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc149372c14so478297a12.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Aug 2026 03:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787135999; x=1787740799; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X3zcIIt2Vy30AFXeLDvAuFYCcKu6Lcu6lcEJtD928ow=;
        b=UH58KPQeMapf4Mg1NDvvrOGP4mPYNynntmy16iMgpLqrc5U1n67XiMFwKybHsrsBDF
         kfDYeAbyK29QxZICSQDDXjzpdclRr11RMXWo8+R+dm0C792q58oWD7CFflVkuKxDMUn6
         K5tq06CQSCcFhc/ipFFU63eNWqFTcVH9J1SmhURPOIam9du41v7wUCD+9UD2sBvuj8Pi
         jzYS6GKLmTs5FxD6CdqcmmLAwDlSsOtQNwXpHgKCnpis/sYMVyMZ/WWsc0C6YKA8/5RP
         maFDR0+XILcu0jX2OgIcNmbOXMZgz8qm8dG5DjGTFiQQuGr+pnG2gJisZctfgedsvLVq
         4yJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787135999; x=1787740799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X3zcIIt2Vy30AFXeLDvAuFYCcKu6Lcu6lcEJtD928ow=;
        b=BU4IdiDUJzW4wtTQUHWhdohl+rmVqR4aXHdhBJnYntDUBDvCVqH9qIaeihYRXojAC0
         813CYiFJX+/X0CWqsN9IdsPLsbxBFs2ZxJxhD1CwJw7fvUEDsjSAKNbGrcjs6heKsCxX
         N/jBK9IIRN3VE/UYzV4fZbzVGWVCtuvqmqEn4OLNwyxSsPJuc7Qftm77fSWlwXb+uoX9
         McNOIxBU0zjpzRVOhYfEo8y2rx71EF/0wcgcFug3Dp3fqauK2yHLqoNIE2maTzmjpjT0
         JZNhaR4oAZNMjut+kvwc28tCSFDdU1NCyAd05HiwBlqmeYseOg6XmN6ZHEQoBXTz1x5C
         SHGw==
X-Forwarded-Encrypted: i=1; AHgh+RqniBiSLwfo67vrqpBwrFJzsZ3x2EGJFWORVF8JeoVbxEv/B3MyilH/7li8fX7CNqw14tY/rP2Y72QDUI3nCuFeAg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7iS8RUdDodtAmZNSJsswdEYZh8l3UCMQ4O3higysUBUnhG71S
	1hGjnRFe//ZcutYrfdNfohl2vsAAafOwj0QTBUY9NA4ZcpQ+anPxZ01p
X-Gm-Gg: AR+sD13l6h+u4MDL90frJPM76SagdDvleQZNYaXE3eb+emLw+9E/XBa1GxRFPp1Gs8r
	hFGDitfeLAAWefWwMcNo0kJ8zr7MUpMmEpFIUYAaeNy+FgL+mRUrEmHLO8/cVVQb0CmrdMPQaFV
	4AZQx6Y6Jo8Sr/7e2e6Dv9T8lOPRx8w0d3vlnJHHbtd4o4yoTgcOtnBYvWYViRzEm9qCjYLJsyN
	C39xpyS/xNwhitgWEjVtIFNOWMM7Akg6Ru6r8eYxO+lEew3PMIK5iGbf3f4aVWLDSh4w4ywS2qr
	AIDPonCoo3RI+qJdmJ7Ff/EI29gRslcjW0LuX3O7VUPU4UTtt5iJqsrzPb/zn5/QdE+Eay2T7WF
	NPDVnYhb+oVWnyrthXXa+ESIuwqa3PveE92INPi5+2BdHPYvJgzY9lu4KpdRDrA0pKcGEcC5D+5
	YnY4989PjW+Co651SW3s34WtmwfR0rGhvnTfUCy0USo1d3Yn0JB6V6gNOAq4Q71x8J2ReYzDVlr
	afWocqP3pe9A4nIDLHNjsvF12CYnYjeRad/CZdyGJ6Ar0h9ZQ/xahJUYe+oq2Cem4Orf057Cd3M
	UFSkR3AHRW6ixm02nVfV
X-Received: by 2002:a05:6a21:3398:b0:3cb:8280:71f8 with SMTP id adf61e73a8af0-3cd0130416emr6883921637.18.1787135998592;
        Wed, 19 Aug 2026 03:39:58 -0700 (PDT)
Received: from iku.example.org ([2401:4900:1c07:efb3:a897:a9b5:e171:c935])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bef77fc0sm11169630eec.8.2026.08.19.03.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 03:39:58 -0700 (PDT)
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
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: [PATCH v4 02/15] rtc: rzn1: Handle EPROBE_DEFER for optional pps interrupt
Date: Wed, 19 Aug 2026 11:39:13 +0100
Message-ID: <20260819103926.2136712-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Check for -EPROBE_DEFER from platform_get_irq_byname_optional() and handle
the deferred probe request properly.

Although the "pps" interrupt is optional, an error code of -EPROBE_DEFER
indicates that the interrupt subsystem is not yet ready. Intercept this
specific error condition, assign it to the return value, and jump to the
dis_runtime_pm label to avoid ignoring a valid probe deferral.

Fixes: eea7791e00f33 ("rtc: rzn1: implement one-second accuracy for alarms")
Cc: stable@vger.kernel.org
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v3->v4:
- Added Reviewed-by tag from Wolfram.

v2->v3:
- No changes

v1->v2:
- No changes
---
 drivers/rtc/rtc-rzn1.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index 305f10a8a85b..aa27ad7f5941 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -464,6 +464,10 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
 	}
 
 	irq = platform_get_irq_byname_optional(pdev, "pps");
+	if (irq == -EPROBE_DEFER) {
+		ret = irq;
+		goto dis_runtime_pm;
+	}
 	if (irq >= 0)
 		ret = devm_request_irq(&pdev->dev, irq, rzn1_rtc_1s_irq, 0, "RZN1 RTC 1s", rtc);
 
-- 
2.43.0

