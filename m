Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C664078EF
	for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Aug 2026 19:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787166817; cv=none; b=H9hAmBXHM39B64ii+JOzPr5KDx6NfXg4zHNVujd9OPEjPHbd1fUDc5/0U31DpqH8kijOfm1sanS5hyIt/7XhSa4eAjjJxO8ZFzXZKdUDiOba+dsVNebclGn7xvVuw7om85aT2MSyIp0kNYh3NUtmgwonkkLZbHKV/+G+ffG/SY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787166817; c=relaxed/simple;
	bh=Vpy/FThwdseYT0BX4lUFJc9MYlA/ysWKL+dPFvNGlmw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DzJhIB/glwhzhP5E1gavFQ4hnqQabkDvSB+oDE/3nn9HdqI5a8eSJSYp5RtXwZi4/xAG4LYh3+NhDdx+L3OaFXv6S3iQ++gF1/msuyUDzwtLLhhJXolk8KCQSpYdPpSn2RX2F2n2qSA2M8hh4ZRx+9SnmpYOE+fT1O7UqhWdxno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DbmSoRGw; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DbmSoRGw"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4954a2e73a9so9395555e9.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Aug 2026 12:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787166809; x=1787771609; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ICoRWoMyfL9zpRXtDOngC771nFxeDcZvDixSXS5luWI=;
        b=DbmSoRGwqA0Gk6IHsCM7L5KXtGmlEM8VB6z/ekfhIGmjcYjFgzbMqFKOuoN6eUhzdz
         AedGcgPx3Jx45uyQJNaZitmf2rL446Cp1SJ9Y8A4WUEOSBVSuGcEVoWjmVoGSJSzZbt/
         0FFDujqp6T3hX0sf0CVY5N6ycJX7Ko5bFE0Qe7y17wlg5dNLxjdVmcPW0J43ZiGYE4JD
         5AwOWIqD0P067lyzQoUhcFu8P/dtZEKs5D0ORN9+2VtgFT/pVo5ZKCyH8+F3F9S9o28K
         L3F8xrsAnYUO/mTsa6EQ9g56aU2Cda6fajR4cGOsH7VugRE+odEsgJaFxZcax2wldU9Y
         0Eow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787166809; x=1787771609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ICoRWoMyfL9zpRXtDOngC771nFxeDcZvDixSXS5luWI=;
        b=omATYvsWOV9Gzd4OZyaJidNTC2ZssFhgjAHK6TLs8Ye3gywg3Ra/zeh3kV5CdEinhu
         Vq9eFMfrpup5WHtP83Z8FVCeWmvEhxUWL6TCgQkP0wbtnYeMZhoOj7Ko5OscjXkxa86K
         CeIFqaBIzBRJ9iSHnIWDCvfAKwKEku02F6a2vR5rfmnkNWrkLifnZz5+AV3MgeUv9Ylf
         ngpsoj597jyB60KVKWgHOF67Vlq/FTFLu8oZDK9qc5wiPV//pHPap+hJYpi2j43NCC8r
         6XjO/XIlI7C8WCUAK8NDO8QQjfEzop3b9ZBEEY6JBXAENQYiNb56LoiUyznjjnSHDsQW
         KwpQ==
X-Forwarded-Encrypted: i=1; AHgh+RpGlYwLqNBjpx0k0lWD1GQkYekkOVWIyIlumq45QK7RhOgTOz+KIiLrwmZ8nX5fkD88YLQUdq6fywMpKAAKZSY0wA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzdCcv553atRHdW4xIZjrSWtGx7lNdt6RDat5NvNaE16EDHTWXr
	FPb3Kq5OeES+YlzcwczFT4YSczzXcDI015GqX/GTxFj7pKg67jfMlIpT
X-Gm-Gg: AR+sD13AtrfqVYbtchSRIMUDem6TiTkqhme63qufxyNJs/ykFspA4EXDEDO1CuxU4X9
	/3FwvXtXJ78eZhRJforKC6ILK7nBGAYsCyfOKIBvhDIsJdepR1sW2LeeatDtwZCx4XqYh+hnk04
	/91MtWHFboQk1T/hI+iW5nNyB2BGgM3vPFh+knDj/S7EYfIH5e5tBSMD5TiliPGhdtO+riIgK6X
	YOW1Bhbj+lwmmzs413n3OqzN0Scp2aGN03ra9OUtP1EjwWKh3NQaGLvmRM4zi7kvijD0uZmGkFH
	V872rYq6NWRJ+RlQc2ioi+7+MKXs0LsIyG3sUSF/rKNasTGRNzwiiw5AaozwgpvPCoEZl2s+17o
	1i2RcbBUJJPMdZR4h6QqI7bX5GriEkUu2RMbGvMjH8grR7pZM8tFBl0iIoQSqwf6qd7VO27donk
	v34EVxs7YBRMW91+Jk6kA2cR1I64MY8glEamBLZgb+x65C5wsG5srwXUzaKi+VRT2V2wV6
X-Received: by 2002:a05:600c:4ec9:b0:495:52a5:8829 with SMTP id 5b1f17b1804b1-499aa1e26d5mr122591545e9.11.1787166809171;
        Wed, 19 Aug 2026 12:13:29 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a702:d301:c7e0:8c9b:65f0:4aef])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14c338dsm6153398f8f.25.2026.08.19.12.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 12:13:28 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v4 1/4] soc: renesas: rz-sysc: Register auxiliary device for PWRRDY power sequencer
Date: Wed, 19 Aug 2026 20:13:18 +0100
Message-ID: <20260819191325.217809-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819191325.217809-1-biju.das.jz@bp.renesas.com>
References: <20260819191325.217809-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Some RZ SoCs (e.g. RZ/G3L) have a PWRRDY register that is controlled
through a power sequencer rather than directly by the SYSC driver.

Add a pwrrdy_pwrseq flag to struct rz_sysc_soc_id_init_data to mark
SoCs with this property, and set it for RZ/G3L. When set,
rz_sysc_probe() registers a "pwrseq-pwrrdy" auxiliary device so a
dedicated driver can handle the PWRRDY sequencing.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->v4:
 * Dropped rz_sysc_pwrrdy_pwrseq_init()
 * Collected tag.
v2->v3:
 * Updated commit description by dropping devm_add_action_or_reset().
 * Config now selects AUXILIARY_BUS to avoid compilation issues.
 * Dropped the cast in devm_auxiliary_device_create().
v1->v2:
 * Switched to devm_auxiliary_device_create().
 * Added regmap parameter to rz_sysc_pwrrdy_pwrseq_init(),so that regmap
   can be passed as platform data.
---
 drivers/soc/renesas/Kconfig          | 1 +
 drivers/soc/renesas/r9a08g046-sysc.c | 1 +
 drivers/soc/renesas/rz-sysc.c        | 5 +++++
 drivers/soc/renesas/rz-sysc.h        | 2 ++
 4 files changed, 9 insertions(+)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index eb8ac0d47d9d..4929ea350cec 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -486,6 +486,7 @@ config RZN1_IRQMUX
 config SYSC_RZ
 	bool "System controller for RZ SoCs" if COMPILE_TEST
 	select MFD_SYSCON
+	select AUXILIARY_BUS
 
 config SYSC_R9A08G045
 	bool "Renesas System controller support for R9A08G045 (RZ/G3S)" if COMPILE_TEST
diff --git a/drivers/soc/renesas/r9a08g046-sysc.c b/drivers/soc/renesas/r9a08g046-sysc.c
index 90db9d383539..cd129c727461 100644
--- a/drivers/soc/renesas/r9a08g046-sysc.c
+++ b/drivers/soc/renesas/r9a08g046-sysc.c
@@ -76,6 +76,7 @@ static const struct rz_sysc_soc_id_init_data rzg3l_sysc_soc_id_init_data __initc
 	.devid_offset = 0xa04,
 	.revision_mask = GENMASK(31, 28),
 	.specific_id_mask = GENMASK(27, 0),
+	.pwrrdy_pwrseq = true,
 };
 
 const struct rz_sysc_init_data rzg3l_sysc_init_data __initconst = {
diff --git a/drivers/soc/renesas/rz-sysc.c b/drivers/soc/renesas/rz-sysc.c
index 161e8c38eea6..0e92c415d4be 100644
--- a/drivers/soc/renesas/rz-sysc.c
+++ b/drivers/soc/renesas/rz-sysc.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2024 Renesas Electronics Corp.
  */
 
+#include <linux/auxiliary_bus.h>
 #include <linux/bitfield.h>
 #include <linux/cleanup.h>
 #include <linux/io.h>
@@ -149,6 +150,10 @@ static int rz_sysc_probe(struct platform_device *pdev)
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
+	if (data->soc_id_init_data->pwrrdy_pwrseq &&
+	    !devm_auxiliary_device_create(dev, "pwrseq-pwrrdy", regmap))
+		return -ENODEV;
+
 	return of_syscon_register_regmap(dev->of_node, regmap);
 }
 
diff --git a/drivers/soc/renesas/rz-sysc.h b/drivers/soc/renesas/rz-sysc.h
index 921ee0d26c47..e55f3258d703 100644
--- a/drivers/soc/renesas/rz-sysc.h
+++ b/drivers/soc/renesas/rz-sysc.h
@@ -20,6 +20,7 @@
  * @revision_mask: SYSC SoC ID revision mask
  * @specific_id_mask: SYSC SoC ID specific ID mask
  * @print_id: print SoC-specific extended device identification
+ * @pwrrdy_pwrseq: has pwrrdy register controlled through power sequencer
  */
 struct rz_sysc_soc_id_init_data {
 	const char * const family;
@@ -29,6 +30,7 @@ struct rz_sysc_soc_id_init_data {
 	u32 specific_id_mask;
 	void (*print_id)(struct device *dev, void __iomem *sysc_base,
 			 struct soc_device_attribute *soc_dev_attr);
+	bool pwrrdy_pwrseq;
 };
 
 /**
-- 
2.43.0

