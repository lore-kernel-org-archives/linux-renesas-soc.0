Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05035320A04
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Aug 2026 13:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787320591; cv=none; b=nM9g2aMrFx6Rc+NP0C1XGgwwenQ0znm/xwW0yqft20U0K0Zmw2p8Lf1IOCO7W8d5CwviN0K20wVBd/c7rcijicmD9EFRLGPMwZclqnrURjf6Q15t6YYgaO5CUMkUC/hvrdDMvLFqpCdAFCbKbQcM587JGWC4etHmJGxhzV73aBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787320591; c=relaxed/simple;
	bh=vHAi/gXphbzoMm9HuKjxDfy5UrgPe4gkwnPHtUQDRUc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nGvI2DY7vzRUPY6KWmpHzNf3vg0Ht0jgcVIPBZ3PaAlY3v+UEKaIBAuqsed72pfSVZBOTI8C4rNW55aa7hGlYVbl8iLQSQbMTYvjVdedAuhgxVXjn3CK8YR4Ttnp2+4VxIzEGwHCj7Pi8JNNbyA3xxFOfOH9879juOAA4dkh2Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nwOYjNID; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nwOYjNID"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cace91f112so11363465ad.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Aug 2026 06:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787320588; x=1787925388; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=l0RbJVteeJBqsBLUXL7P6JuNFv3els3B6tVFis877SA=;
        b=nwOYjNIDRkr+wEtqSe9GMTEDPyBALZpXXbgADjMT+d+YO/aXvR7W156lwVzSm2NYQG
         LR3XlYoJy2cdD2nvNEHIHKOVaYCbpsdzoG7Zp9oeFVcAvjIX3i32WBCfwqphiPkTuWzP
         CE/+toTFVjxgMjl8s7Cf4YouMW5P3sLQEwPTbwouHOw0f/XxQc4pDVqKOrPsIDhPuFs0
         ghBXE1UuiPmiLeX8b5bOmIllLE/aKmsgkM6kDpE6ML8ud5uvick6h5rvkQjj5G3QzDMn
         o/A2+PMfqTTm3BSTXKXrfrBdPity0ksbp29WIIG1YhjM2qlqlRONFY5Lb8qGPflBvg3l
         Y0oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787320588; x=1787925388;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l0RbJVteeJBqsBLUXL7P6JuNFv3els3B6tVFis877SA=;
        b=MPm1Dfv9vnNmLnrjhQf/UTwn5//FPZ/+M06Soh6DgNIZVqV2auIM13OBFdWWVeXaDZ
         FvhufnHNLjsPeRwYLIySoURZj4CoP0U+qTh1r/FphoPv5GWtWjxMf4C8Z4CPCHrmHZBo
         UsswWjHmlTnonC68CX1O8baA7JCi9y8oGcffdxh/wCd3JvCjDsNFdlyYYKT0MDz0JAuE
         kQO5CEdFaNOIFSSUuzcriR9+oJbBsO+Dc67/OTJ3Rwv03x2lLZDCkyV6FuyCNLrHjM5F
         unn5/qDOCH5dxlDZlTZJz0AmmNeCXJIRpSViFSwGYykqvrfJElC7P6iVi98EMrLYWfL4
         3PHg==
X-Forwarded-Encrypted: i=1; AHgh+Rp7iHqqUVP90Q1anH5pkRYAX+irxchRYqIpCmxxewuqSPH4P7W+JBg1b3oG9Edsi2CBtxvD6GApVEFpSl0wO1uQjA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzktgzVOS0HtE9wuBrek6xUk/we+TyxJd2q8MsMPByEqZGJrwBt
	QFxen+OdXMHFqzaQ/gEpVrHZ9Z2jFcHvAojzIz2rM6dyTWYkVrXMzQJ1
X-Gm-Gg: AR+sD11CVfvflqxJwKhTwrUWlP6SOHiPspJe9NIyHT+owb6HZDgxurRSoPiyhLn2xyl
	AczGm4Vf8cEusZYOyhRTbbQ1Sc26CxRCUTXv6B+0DXHYadczTFDG627TFHB8MT+ttPsMoPQQ7K+
	qe5Phm63xjdk3o45CjF4xegsT48kDLwQ9C7HgSRrsW/APK/7M+IVBY18rsD4nItgSEHu5OUHSYW
	c1U9PwEOK8KYnA2L00/2CxjP16Kh/LNFZqS2+a3oAO0FVXY3JZS998oWsiwDgroluV2bh86szz7
	aa5wHwzAiDIc7vogSrSyjy46VQk923878O73tG0O0PqLj49LfVJFk2n2dgypgbNb1PnLVM8BsFS
	Vy0zYnheLb+8lR+IcwFP+vxutcAXuyfHj8jeleiQ6z5iAWySIPgORzuUqmwcfuSX7dBpMv80jCn
	1myceIIjWX3jXoqYaU+T3G9Aevcq+OFXx62ImohTlmclSaNyrB5ck/OhXWatL/JXQBH1t876lEO
	0SxsY0PHye36e7Um2vfgB66Yyg94x41C+7FtoHFTqQxgaRuwxK9RWVdZJXBgJBZ+drueohNrrw9
	0uB8/RU5uII=
X-Received: by 2002:a05:6a21:e081:b0:3c8:f342:132c with SMTP id adf61e73a8af0-3cd3000a342mr11854453637.11.1787320588171;
        Fri, 21 Aug 2026 06:56:28 -0700 (PDT)
Received: from iku.example.org ([2401:4900:1c07:efb3:773c:1c8c:24ea:eff6])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327d01ff056sm19972277eec.19.2026.08.21.06.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 06:56:27 -0700 (PDT)
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
Subject: [PATCH v5 00/17] Add RTC support for Renesas RZ/T2H and RZ/N2H SoCs
Date: Fri, 21 Aug 2026 14:55:51 +0100
Message-ID: <20260821135608.275233-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Patches have been rebased on top of next-20260820.

v4->v5:
- Collected Reviewed-by and Tested-by tags from Wolfram
- Added Suggested-by tag from Wolfram.
- Added a new patch to disable interrupts when arming a new alarm
- Added a new patch to handle unset alarm weekday in rzn1_rtc_read_alarm()
- Shuffled the pm_runtime_put_sync() patch to be applied before the patch
  that replaces the .remove() callback with devm_add_action_or_reset()
- Renamed rzn1_data to rzn1_rtc_rzn1_data
- Added a print message to indicate that SUBU mode is not supported
  on the variant.
- Added a comment to indicate that the xtal clock is NULL when SUBU
  mode is not supported.
- Renamed rzt2h_data to rzn1_rtc_rzt2h_data


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

Lad Prabhakar (17):
  dt-bindings: rtc: renesas,rzn1-rtc: Add RZ/T2H and RZ/N2H support
  rtc: rzn1: Handle EPROBE_DEFER for optional pps interrupt
  rtc: rzn1: Fix weekday underflow when alarm crosses month boundary
  rtc: rzn1: Handle unset alarm weekday in rzn1_rtc_read_alarm
  rtc: rzn1: Fix alarm range check truncation on 32-bit systems
  rtc: rzn1: Disable alarm interrupt before reprogramming alarm
    registers
  rtc: rzn1: Fix malformed MODULE_AUTHOR string
  rtc: Kconfig: Broaden RTC_DRV_RZN1 dependency to ARCH_RENESAS
  rtc: rzn1: Use pm_runtime_put_sync()
  rtc: rzn1: Replace remove callback with devm_add_action_or_reset()
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
 drivers/rtc/rtc-rzn1.c                        | 197 +++++++++++-------
 3 files changed, 147 insertions(+), 90 deletions(-)

-- 
2.43.0

