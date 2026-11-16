Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794810576;
	b=44Pg7kF75ZBPRJqSmApxAeXibwsNodXBTLay8SSJJbZEF0EJbWMsnRqLyDoSoI2LZgRp
	 0pTAoKyFygweRzQQuLYthKDOjvICQWe73GfA4ln7u5TFbz77SFQkwolRZZbboFU4UuNXp
	 qi/Wk5j0sMG42odDB2oBddVXU88m+amWY3p5v0dEXWDDcIdNix2OyYHp48UXi4UM38vB7
	 bXe8tL9W0Zof8aZaiAmiEPDO1v8cdhLGcOt/D8SVrUh77lTVH1tMC5W/78otQTLvnJo2b
	 lF/ZP/ghscG7qAdZDe7z8Ei4gjuta98caADKFltGRedt+9JZEPTNWvnTnF3lpHmqmhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794810576;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=W5ubNBjYB7gj80s79SF+MJ9soJGkJ6wOwgYIYNtKFtg=;
	b=kVl/T5oOf7Ij51y55wCVSNODuIHvb6u8SvgMJP4zm61vZUHjO54AEDZCXfZ3kjbiKKhc
	 UYElVT3J3og+/7cUFXxkF6tQNVKO+PpFRLjKjf0pXyjrUDuMK9VDx7nf5S9op2xInHlCN
	 6KxYbBV4G2EWrYeEVcG+JsKmOcJdsBiNmI8HBgj3Sv7d0j9RS/Gg6yDjMwzXYWFvg69Vc
	 bzFebJwo0e6xe4rQs5Dk5TJtseEXx+QwYtWQp0gdNMibS88VJ4MjYDD/sJ95lxKjSBQFH
	 L1ZfrqZ8YUku5Rxgd8CARrDauLvMYcKcs4rBInLBfbtOAvqv7WnfWd+9ipdCLSdZ+GA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="in/mlC3N";
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B03606A323
	for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Nov 2026 06:29:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5B03606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=in/mlC3N
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8b6399ebb41so3627798b3a.0
        for <linux-renesas-soc@vger.kernel.org>; Sun, 15 Nov 2026 22:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810575; x=1795415375; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W5ubNBjYB7gj80s79SF+MJ9soJGkJ6wOwgYIYNtKFtg=;
        b=in/mlC3NccXXcNXQfVbNv8b15JjccC4L1zO4lkVzKYVZJj7W/+0bKewQNEK6gZEhnV
         si7O+WZnM4lPE76uV3sbBxpDAOwvJVGHCtcMZykFdaWhoLAxtAbRXtqyV918k/z7K3kA
         O8ZqxMKQj1p5j3md4WKkcs+zBjwHEnOgKzS22bqlafc6tNRLxRFfnn2NHMecQkfD3z4q
         zr3vEbe9GIQjDwzobXjA/tDYObuCUO08H7oAM6A/P86XmUGrPXwwPuLMmMvMS5owSA6z
         QR1dhL7VyrjjUC5nNQAkaODzzCdhMXbtf5QoQMrc9EfaumbUJu1JlPUTcyqTmRaSnhYB
         MtEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810575; x=1795415375;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W5ubNBjYB7gj80s79SF+MJ9soJGkJ6wOwgYIYNtKFtg=;
        b=SxZ0LeuSKBVEumC7ljswY93EHebAQVBolE2ae812r57vKC0CzQkE4g3gT07fvIw7Yb
         ik7tANpJSsd8nO0m2UyIq0kBM7X7vuAdcyCwj8OUPmXIFeWyHQQw13a4YLj16B+kmcSw
         A5mbGX8wTFMMq1YpOcG1EXN1zsGMr67t8j4F7iw4bT0OhIWCqXY83w89fouuo4eevdot
         zhRnohxaZpOs0gvxAg/ukzVhJu2mVb1ZbgglKkIDw6Cup4Or0hvpCHFkSiAUP2kgGg2s
         EDTd6TDtYR4Nr5Tj9aniwEOu3YOnRwzl2VBOP3dYfB4vaEX7gpKbuOl8SoYQDSlhOILx
         cklQ==
X-Forwarded-Encrypted: i=1; AL+hErGD5Gy/DqM+P59y7kHOuE8lVt7Y1NX8Rj9ObB1sNAT7B3kT+vZ4uxYJxIPVM/Y2/HF/xAjcocu9/K/R6HMN4iyM+Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z9PrkpKQsj4LE3OS39VAtD5FAtO2raGCPSSdqC/idNSD7xgML9Q
	tonlJmntoFY0rsAVX5N0+a74prnvfnt7xlj2jlOBOEZy5b/ME5ssXyBe
X-Gm-Gg: AYBFou189tdIr/smKkIgWoLcKflylZ4U8nfti7ffDBZL8zuy0pC/VdUwEAO3OJYAp92
	k4IZ7yopFQskckGsVc7040UbWxZlRFuyQO4JMxEOa7NL/oWtANCywKO6tA963zmeoT6i9Aqoc3L
	ztE7Yrj9SiUeaIXpS0WrPcgogwOBn8Mn7tStVW0JSFZYyqR9FWMTBtwEZNcnzFQZE14o1nChyde
	j1a7rskooEFGr/3g5i3Bcor2+SF5hZBV2wKfeVle4Ev/Y6ToDYCGU3+PeL8WJL+zcrpivLcoOdn
	RsSth8y07XfzEmjcRP3eZOfss1yAyP2AFjrsg3G5kljUhOlfZi3bwsqQJ4GN7wCOCbXtbUUzDa3
	CRuexEgfPSkbgL7+tGGxqjZ4y+dPlr6rVmpdJC7PK16tUMY8mjiMY8YA/ysDJI4HIjZp1foAn3X
	LagVjYHqWJGIdcr1LaDsFTqfaWOMOV5N3n4P0nz1RNb0ExUuty2qi1w4YdADq7agmDar4xBITCj
	r8JfFpAdeG2RxbBJSd4i1NHtE88rtC1TSN90j7ggl9rsOF9lETR+BfIiih3ytCxiGkTF69+gfQD
	tAsFBvjGdkRGryjGJhBoDnktY3Y3dQ5erf6tFvM/O3FRcAOpunIvu07GIEn9cZOzRhuV
X-Received: by 2002:a05:6a00:4b52:b0:89e:df2e:cebb with SMTP id d2e1a72fcca58-8beb7d1ce3dmr10000964b3a.59.1794810575158;
        Sun, 15 Nov 2026 22:29:35 -0800 (PST)
Received: from linux.internal.banvien.com ([119.82.142.58])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed2346e73sm3387975b3a.40.2026.11.15.22.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:29:34 -0800 (PST)
From: Nhat Tran <nhat.tranminhk2@gmail.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-pm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nhat Tran <nhat.tranminhk2@gmail.com>
Subject: [PATCH] thermal/drivers/rzg2l: Fix precision loss in temperature calculation
Date: Mon, 16 Nov 2026 13:29:09 +0700
Message-Id: <20261116062909.36618-1-nhat.tranminhk2@gmail.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

According to the RZ/G2L hardware user's manual (Rev.1.50, section
44.4.4 Procedure for Measuring the Temperature) the temperature is
computed as

  Tj = (DSENSOR - OTPTSUTRIM1) * (165 / (OTPTSUTRIM0 - OTPTSUTRIM1)) - 40

The driver follows the same grouping with integer arithmetic, so the
fractional part of 165000 / (calib0 - calib1) is truncated before it is
multiplied by (dsensor - calib1). Above -40 °C this always makes the
driver report a lower value than the real one, and the error grows
linearly with the temperature, so trip points are crossed later than
configured.

On an RZ/G2L SMARC EVK with OTP calibration values calib0 = 2902 and
calib1 = 586, the slope 71.24 is truncated to 71. The computed value is
313 m°C too low at 52 °C and 351 m°C too low at 63 °C, e.g. 62382 m°C
instead of 62733 m°C, which is reported as 62500 instead of 63000 after
rounding. With the default calibration values (3148, 503) the
calculated error is about 1 °C at 125 °C.

Multiply before dividing, as rzg3s_thermal already does, and use signed
arithmetic so that temperatures below -40 °C are still handled. The
intermediate value is at most 4095 * 165000, which fits in a signed
32-bit integer.

Fixes: 673c68bd4839 ("thermal/drivers: Add TSU driver for RZ/G2L")
Signed-off-by: Nhat Tran <nhat.tranminhk2@gmail.com>
---
 drivers/thermal/renesas/rzg2l_thermal.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/thermal/renesas/rzg2l_thermal.c b/drivers/thermal/renesas/rzg2l_thermal.c
index 90e2ba378a4b..3295eef12001 100644
--- a/drivers/thermal/renesas/rzg2l_thermal.c
+++ b/drivers/thermal/renesas/rzg2l_thermal.c
@@ -75,8 +75,8 @@ static inline void rzg2l_thermal_write(struct rzg2l_thermal_priv *priv, u32 reg,
 static int rzg2l_thermal_get_temp(struct thermal_zone_device *tz, int *temp)
 {
 	struct rzg2l_thermal_priv *priv = thermal_zone_device_priv(tz);
-	u32 result = 0, dsensor, ts_code_ave;
-	int val, i;
+	u32 result = 0, ts_code_ave;
+	int dsensor, val, i;
 
 	for (i = 0; i < TS_CODE_CAP_TIMES ; i++) {
 		/*
@@ -105,8 +105,8 @@ static int rzg2l_thermal_get_temp(struct thermal_zone_device *tz, int *temp)
 	 * Tj = (dsensor − calib1) * 165/ (calib0 − calib1) − 40
 	 * where calib0 and calib1 are the calibration values.
 	 */
-	val = ((dsensor - priv->calib1) * (MCELSIUS(165) /
-		(priv->calib0 - priv->calib1))) - MCELSIUS(40);
+	val = (dsensor - (int)priv->calib1) * MCELSIUS(165) /
+	      (int)(priv->calib0 - priv->calib1) - MCELSIUS(40);
 
 	*temp = roundup(val, RZG2L_THERMAL_GRAN);
 
-- 
2.25.1

