Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7521418340
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Aug 2026 21:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787346766; cv=none; b=P568zPtpdDm396L54XoNB1YKivu2DuXL9dcnkEnmZUp6BHZYwbKo4IkF0bc2c16lHqAC3MxP+rByjMuVvOr0F6bHZGgeqx39F031EU3RxVc58LLl8coIOVTOxNnBaOp4AADkEXZD5As8Buf8CP1hbfYlYG6M+FoBrI3VUgzcNEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787346766; c=relaxed/simple;
	bh=A+v7mWu+wCAlwX2apMuc3TGMtMv4ggi9HrGbcDSLrQQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JAadwaao9CbiL+Q7rbM55wq6mQ7UREiwU9RbXa3d3y8hKxZRcXrVk6kqFjyfaf51ZbwXblUKHBl3mZs82bbtnbUQxPjjTrl7eZK4hEGpAR95vQgRjioGoqthgy+2T0Q6IFXqYDAvcUbL1ou4Dk7lZHpEKIBUe4sQpM/3ABxMg5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G+bsGhnt; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G+bsGhnt"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cc891373e0so17479665ad.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Aug 2026 14:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787346763; x=1787951563; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4l8YNQk41/fppyfIDksrLwHHQ57AKnk38Us5hixv6DA=;
        b=G+bsGhnt7HVIcww9MuoR89rkzMxJbcgAtccPBw601hymCbaRQRh/KN5v+f9fGDvSjZ
         FTgLuxIC8kWJdS5wyRHtCO+NY9oCNgoN8IOzEGKmokLT0dR6yjx6CcsfrqB0i6ze60DS
         fcPxos/90zpHWD9VGW67r9tOZdYNHv59GOt6dDpm+2Y2QZeX7jc3DKrHcim3C0TJIMxO
         Mlm4YUFgD6BLGeWXRCR9LCcZMomHRjOQfU4Tw2Dy47XUp+owI0P3ckmUlZVWjSGKxjZo
         OYDrKasf9df7Rp8Hcgqm8G91YjoERtzyRupa+L8T3oahFcpoigsXYdD/LvkIeJLpeGmx
         kiZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787346763; x=1787951563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4l8YNQk41/fppyfIDksrLwHHQ57AKnk38Us5hixv6DA=;
        b=W+2j4BXUD2CKQ3RjmpA5/wxoaA+hVXXha8ly2ngDxM7ER1Go50xHQ2gTP2MRE19wrp
         7se3YskjJeycsPDd9ChKOFc46CUR3YvxzAdSDG9zFqSVjL2AmDlxMAKOZe3j+HfCfzzQ
         JBnZf46FreWU3mkI42Cr3AGQ6UubmhMuktwrlBdTHFbSGL4SuecF4xrRSDo3Ckfw8nSV
         o94TfL0rsRS3Z///GeO65wfkwfVEfsKuzoOqD5OJc0F8WsiN4UC+ao26iDZ/oxNRUZ6a
         TJJoV0q0E6wl1rGzbziGYL4mUd0wCkNvSlwPxUtp36OsjzLFHQ7AmGt9K2fD/hIqixpm
         FfQQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq37zl33Zvhus1HZui/oWyyNLe81WBdiREa7RjkR51Vf0XPMla9MCAe0o8EVPSDTdEaL4MVqpcRkPIMjJdMRfvhqA==@vger.kernel.org
X-Gm-Message-State: AFuF++liXL2G7xlkLjWwEZ6pB9YHJu7d5Lrg1bR3P8X9af8ttAqS2cuq
	qEn1ga1jL9OqfXn/6ztEw8UoPiBMIF3wF4Wc43gJUqbWlpAMHz5qqy1j
X-Gm-Gg: AR+sD10Fd5XiC61DtAGT9QNPh/Vmqc1p9RZfopC9eAcg+UXw8p+QjKBytz43WKJGK8r
	NumfS4dm/evbTIv1eLAPZhsEF+4X2WNblqDyJmEWO3CVl0upyzcaNkQPQBvJ/MYgRJW41+2bmA1
	wocf4c3xJKlxMImdWLHT5vO1Utm4eu5GRtfuCjlPrNWmMNKxQhWINYXlEN9t0IdRBDq1Gmt7tbE
	06diTNP4FYfN82VP9VXyvB1zhJX7+Sd7yjGxvgT3Tv+pyZEmZZE9IEXfzAvYoFOwMJzz2PP+ae3
	JWW2IW+PPs5H/hjs0R0D+SwCHiNSlQ1VYBQQ4WMBoO6KaFU67VzrWbZ5on9K33MRHuso7SqhJq+
	TZKMUWEtjBaq3MeD1l9BFyE8qRAMZXefmZHC/pApRp8S5u00beSVRac0qhnMph6X7L61DW7tSrN
	vI0BcnknKEDnZTnis20WcHcAd8ZuQsjG5EKr8hPd1HUeuYBqKd8xUP2MxGddAZ07T/oeobUOcnx
	rsljBjZNEVep7E2INnqz43s+AX6QpF14InK0umw75TItlR0JJ2bNDn3Q/JN2boVq455WhxT
X-Received: by 2002:a17:90b:3dc5:b0:37f:be6c:f3f2 with SMTP id 98e67ed59e1d1-395dee7e2dfmr2594815a91.2.1787346763290;
        Fri, 21 Aug 2026 14:12:43 -0700 (PDT)
Received: from iku.. ([2401:4900:1c07:194c:dba4:ea1e:d7d1:affe])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf175399sm49755257eec.26.2026.08.21.14.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 14:12:42 -0700 (PDT)
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
Subject: [PATCH v6 17/17] rtc: rzn1: Add support for Renesas RZ/T2H and RZ/N2H SoCs
Date: Fri, 21 Aug 2026 22:10:32 +0100
Message-ID: <20260821211032.13554-18-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Add support for the RTC block found on the Renesas RZ/T2H (R9A09G077)
and RZ/N2H (R9A09G087) SoCs.

These SoCs integrate a closely related variant of the RZ/N1 RTC IP, but
do not implement the RTCA0SUBU register. Use variant-specific match data
to disable SUBU support for these SoCs.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v5->v6:
- No change

v4->v5:
- Renamed rzt2h_data to rzn1_rtc_rzt2h_data
- Added Reviewed-by and Tested-by tag from Wolfram.

v3->v4:
- Dropped RB tag from Wolfram.
- Added OF rzt2h_data
- Updated commit message.

v2->v3:
- No changes.

v1->v2:
- Updated commit message to drop reference about RTCA0TCR register.
- Added Reviewed-by tag.
---
 drivers/rtc/rtc-rzn1.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index 906d03c65df3..1e1676a7f3cc 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -523,11 +523,16 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
 	return devm_rtc_register_device(rtc->rtcdev);
 }
 
+static const struct rzn1_rtc_data rzn1_rtc_rzt2h_data = {
+	.has_subu = false,
+};
+
 static const struct rzn1_rtc_data rzn1_rtc_rzn1_data = {
 	.has_subu = true,
 };
 
 static const struct of_device_id rzn1_rtc_of_match[] = {
+	{ .compatible	= "renesas,r9a09g077-rtc", .data = &rzn1_rtc_rzt2h_data },
 	{ .compatible	= "renesas,rzn1-rtc", .data = &rzn1_rtc_rzn1_data },
 	{ /* sentinel */ }
 };
-- 
2.43.0

