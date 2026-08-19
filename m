Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703CA393DDB
	for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Aug 2026 10:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787135987; cv=none; b=kkFiSCRDoKuBWflP8fYI/5X9MpRDiyLc+c2Nlpi+tUgRXONcHHSVg6SC5xEc6jCrdgvpIcUc1eg6+bowxZBLMl3ZF+JmsAAAZbi9UKHG4+gXxh6DjihVRvgbP7xQFako5RuAH4bUA+IqAFY8ByKBf7qo7qZORpT9oRogl0lA/cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787135987; c=relaxed/simple;
	bh=X/eM8N+ZiWpG1k9EW2SG6VSJGAC5cgZXhhGFpGB3Nqg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q7PXGUrGXGTXUuxvgsRDclWOvPAeBW5mqq/zCGbLAV0pS5Km5n06HV9k4liCXXc295snsZ9Td597QgvaiQMQEyIEVsuZJuWdiW4WlKz50SD1znWjj8ajWKOlgNBC8qXLxxXVOZoBV6Bu2MlT7OnyjilrsvvCn1lQCqkKvuvtrBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PVGbRlAL; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PVGbRlAL"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2caea3f742bso12107015ad.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Aug 2026 03:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787135985; x=1787740785; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+wGjeeNszQHWmnGaEh/6lnk77mM0dthBmjem3skz/pc=;
        b=PVGbRlALISkuZT8EhdD22Z7sLMR7t8x08k4js9oBznxkqEo85H8t39lkVGNFYfmNgq
         P+xE41x2iS4jgaLtHfP+Y4uNd4MPBQOCrivPsRo/mOD9TqovGr6CQJW/yVfzmlcNtDn8
         SeozlVOiZXUe5tloSFdOSCPKUiY6WuEhoMFr8mpjoMmD+ImcNxSBUXcTyBNWaor/7UXn
         6gcTiJ134HbDfvnvSMSkeKnANGDCtQyEYGKbEIwBgRgEVd34ZgpS5zuSWG4ti8SngN52
         a3nBd7CS994SBORSO12MYIZbtQJ6aX9az0S74cdv4jXMaQStsWnVmvm+vKXIhLF0KYAB
         CkWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787135985; x=1787740785;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+wGjeeNszQHWmnGaEh/6lnk77mM0dthBmjem3skz/pc=;
        b=eXgBtw+NDHJWA9aFqzMljnkXKFr6oPVgjuJj2ze5vVsoO0Wc2mjaiOteuQJK1ue9dL
         uyMTuvu0EdOKs/s1z+g9VgLvjbTDbSGW5+GwiBenwSErrJGgeqFX/klju1TcApUHuDqG
         6GCUti6Ml5hwIAWbWwtdsTnaI5qgZz+G3fZfNTaZ0tdoaEtbooJW2wcNTIROqJTtLeXj
         +SQ3dGL4uw6pd/zeQUHnE+poKjsG7mAjOaR6nCrZDyixdjy9ZNaow+uwR51YfkFsvgpj
         drAxuTpV4cdJaDMGv/aJPYiIF6VoWtsWRfANpACx7FFk5rpcrCuDwXzFPhsaBQBgt1Bc
         Ldow==
X-Forwarded-Encrypted: i=1; AHgh+Rphb+qB1vQKQpNRVY8/i+3XIMZwT9TdUHjKUb8uGld7pEJLma4CEOCJ7ZO15+OgP0lGtk7Jjb1U7V+ivErxlXprGg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwdupgdWQs8FKuTsxT815myapVIzGqFr5pzzymdTQ0JpvBGyuip
	BPvmnlQFZcPDR+b9imKh939N+Ga51itH5TafsC8mfLAmGjMpEnhG1cHY
X-Gm-Gg: AR+sD13FwoUHewnXOHYa7YfR5wBQjTfgCkVtERB0+HUE6MJuj5a5Kd6lBe/e28yo56o
	hS4WqQWYxRZLJfZVVc/jZg/mPhUjVKVPLkVTJFFGkk6qiZUzPuAA+dKdS1Mwjp096BRJCKK1Nyg
	efdJ3PQm0nghPKg8ybvIC+0aN9wiH1naoo6nEPcal7OHTe584tI6vmpcFGrCgzjkS3Dvs1fB8/f
	pIEpCpRqlB5y5x/o4+obVjemf1+Glzi4MxT613tZFKUj1dEeL8oQgXDk9SJp8pAhnPgHBRHlkGr
	xuJTmPb4R4DKBXImi2dzviWOctY5+VcDDe6L1XjhSXcwCLS5Mi4gfPOumW11yN/NfiSC9WYTjQx
	OvQ4Wac8UYVB94Z7f9hkUWlZ0i0QbB1NfMI50t8cqibRWlYgFw5zCoXIQolxv/oRJBpKxoiZW/T
	nu1OvN89YTwGFpyANMah3w8MU8s4mwd2tyaVxbNuGjrlAmT3VN3Zmik98AWqcWPupxx0uUCg9ja
	L6d34qB8eI6uzdibv7ySXpXlmSOFndxXZiMo2PMgde46EOcG/QUTii4Pe7GzicbPwHQa0nBwtd4
	00OHlIXNDBmh31mqE5Ej
X-Received: by 2002:a17:903:b4e:b0:2d5:ea01:429d with SMTP id d9443c01a7336-2d60197e7b6mr71176115ad.14.1787135984648;
        Wed, 19 Aug 2026 03:39:44 -0700 (PDT)
Received: from iku.example.org ([2401:4900:1c07:efb3:a897:a9b5:e171:c935])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bef77fc0sm11169630eec.8.2026.08.19.03.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 03:39:44 -0700 (PDT)
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
Subject: [PATCH v4 00/15] Add RTC support for Renesas RZ/T2H and RZ/N2H SoCs
Date: Wed, 19 Aug 2026 11:39:11 +0100
Message-ID: <20260819103926.2136712-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This series adds support for the RTC IP found on the Renesas RZ/T2H and
RZ/N2H SoCs.

The RTC block is closely related to the RZ/N1 implementation and can
reuse the existing driver infrastructure when operating in SCMP mode,
which is required on these SoCs due to their 195.3 kHz RTC input clock.

While the RZ/T2H and RZ/N2H variants do not implement the RTCA0SUBU
register present on RZ/N1, this register is not accessed by the driver
in SCMP mode, allowing support to be added with minimal changes.

The RZ/T2H RTC variant also supports a 1 Hz output signal on the
RTCAT1HZ pin, controlled by the RTCA0CTL1[RTCA01HZE] bit. This bit is
marked as reserved in the RZ/N1 hardware manual, making RZ/T2H a
distinct RTC variant despite its overall compatibility with the RZ/N1
implementation.

Patches have been rebased on top of next-20260818.

v3->v4:
- Added Reviewed-by tags from Wolfram.
- Made use of tm->tm_wday directly instead of recalculating the weekday
  from the day-of-month.
- Updated commit message in patch #3
- Shortened the comment describing the calculation of RTC_PCLK.
- Updated usleep_range() value to use 2 * rtc->sync_time.
- Added new patch to gate SUBU register access based on OF match data.
- Added new patch to make use of pm_runtime_put_sync() in rzn1_rtc_disable_hardware().
- Added new patch to drop trailing comma from OF match table sentinel.
- Added OF rzt2h_data for OF data
- Updated commit message for patch #15

v2->v3:
- Added new patch to fix weekday underflow when alarm crosses month
  boundary.
- Make use of devm_add_action_or_reset() to simplify driver teardown
  and remove the .remove() callback.

v1->v2:
- Dropped wakeup capability support patch.
- Dropped header sort patch as it was already fixed upstream.
- Updated commit message to drop reference about RTCA0TCR register.
- Added Acked-by and Reviewed-by tags.
- Updated Kconfig help text to keep it generic and not specific to
  RZ/N1 SoCs.
- Initialized rate variable to 32768 to avoid timeout_us of 0.
- Made use of RZN1_RTC_SUBU_RTCA0FX mask for SUBU register access
  instead of 0x3F.

v1: https://lore.kernel.org/all/20260615154805.1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (15):
  dt-bindings: rtc: renesas,rzn1-rtc: Add RZ/T2H and RZ/N2H support
  rtc: rzn1: Handle EPROBE_DEFER for optional pps interrupt
  rtc: rzn1: Fix weekday underflow when alarm crosses month boundary
  rtc: rzn1: Fix malformed MODULE_AUTHOR string
  rtc: Kconfig: Broaden RTC_DRV_RZN1 dependency to ARCH_RENESAS
  rtc: rzn1: Fix alarm range check truncation on 32-bit systems
  rtc: rzn1: Replace remove callback with devm_add_action_or_reset()
  rtc: rzn1: Use pm_runtime_put_sync() in rzn1_rtc_disable_hardware()
  rtc: rzn1: Dynamically calculate synchronization delay based on clock
    rate
  rtc: rzn1: Use temporary variable for struct device
  rtc: rzn1: Consistently use dev_err_probe()
  rtc: rzn1: use FIELD_PREP/FIELD_GET and GENMASK for register access
  rtc: rzn1: Add OF match data to gate SUBU register access
  rtc: rzn1: Drop trailing comma from OF match table sentinel
  rtc: rzn1: Add support for Renesas RZ/T2H and RZ/N2H SoCs

 .../bindings/rtc/renesas,rzn1-rtc.yaml        |  35 +++-
 drivers/rtc/Kconfig                           |   5 +-
 drivers/rtc/rtc-rzn1.c                        | 175 ++++++++++--------
 3 files changed, 129 insertions(+), 86 deletions(-)

-- 
2.43.0

