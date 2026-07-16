Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C9427732
	for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Jul 2026 12:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784205285; cv=none; b=SWZunQx2A5wGzc++gN9SmbwjaCfq4Fdl7ZDr4MFdi3lPP+yyEiJ5HkTMYYAlohBmdCjcgeU20iL91Jp15CLKWK9IvJm1rLPj4E9zMmH/sLociDjkOMdBAgW6LD3qY1qySGDLulkgSzwcxA+Im8rRa/uPI2EUmUAbq+NxGPO29Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784205285; c=relaxed/simple;
	bh=pNG4dt1MuDjJS2FfJJY5eOAN0jDemnvGolZRu57PMXc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FlvXCQIriaSTdbLu4DasLLMuefTJVaBNwhzMOtvoto+H7/pPf55RNMSbK9SYJbK4y1xujq8Klzy71c04TQdsDYW91jpZ0gtDkuHEybd+GPLv0NtuoObOBlHotgbpy6Wuj5cb47wNhnV8IMGfnsqmMD4QM4+40erTQutwzgnXxYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=awBjLE8z; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="awBjLE8z"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-493ae59eca6so17236765e9.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Jul 2026 05:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784205282; x=1784810082; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ABw2degQi5xUj2ybacHY09V1CX8wIMU9fYlZ9atLanU=;
        b=awBjLE8zMVDvEu2pyl2e0dDH3EVisLp+Wg13MSE8GnJRWj32EQtWzI4zn4F0z2xEru
         Lh3287pA6+FVcjYoHgvSSgeO2DxA5/F5DQjL0FcajsdLKLymSQQFHz4sfYHQrTXIFltw
         jM05oTiAa7jF5NNVW4UfUboX5/YDp7NgMqAQJ3dhWzgT/dUfCOrqmw9r59AzqE6Uu0yL
         BfmjrM0w7Pff9QdrPm/DGMoR8/s8t3YCCndcHWJo1QGG1CvkvoV9e8v2Yd32Bnui8m75
         HfRO10FjblC8sEZFJtPBx4EWlqCTI1Rxo6x7TpQ4ILPKusDUl/p94k/15mmTcGyL5hlT
         G9aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784205282; x=1784810082;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ABw2degQi5xUj2ybacHY09V1CX8wIMU9fYlZ9atLanU=;
        b=Lc7w5KWCva2PtPf19SdtabBpv/l1Tnf8HH1UkIgAKcQsWxX6+JqMtwjEHq03WQ90Hj
         331qjqqf88D+s3belRyOpmrJNiV71HID77UYk3fDDvYHGTDIM8NTXKYBRQW+XQWWCvyB
         IB6uMN0L6BAsyhs/FkaT6v+nqkETKuLALnCRTvMz7akplOBjfi/w1SuDoNKFeAqyoZ0m
         sy69np2z7vYcjYUSOxrJZom5EjAieF5NiZx2K4hXlNELBiCcgDR5ibWGNlSKEkWjc7cx
         1x3TxHi8xFXhTnp170TeLzgsug1nB0bIeKdoshQfOLvfbgMbp4IWHNESnbt0anS03gNJ
         O37A==
X-Gm-Message-State: AOJu0Ywrm64D20fwehanL3ts0/ycnIqedZkirGG+ihoK3SeYtFIEDDds
	mLTkCw5/vLQl3KmtOs5kzNpTqIFFcRj6COK+Z0mcKUTgPtvUgsoWZnGZ
X-Gm-Gg: AfdE7ckHieEGRBoq3riK/5Agf6fHZA6lG6xtuCaKqKbLq3ZjE6wwcFp+m1sBM2RmQFL
	CYMf0P1W42lggFKiqIySkRCWAMImJEVOVqj6j/BGSVKKxvAGNyWltI7yWadK7krbHc3qu1PxMv6
	l7Z5wiLPfadiJN5hJ3C7HEgZKhSEpVL7iv+Ub+9uCxlNAI3lLefSvKvgK9VMf5vvtFKr7rMTkNN
	WM9LEie8Wa+ZM4ymVE0MnpPqJe33EAnRUFkjskUpKxTvVcmSZY5rZX7PUyHIhR1rradMn6awa+p
	sz2+qxbzPZBBFUfHxBSs9uAOrHHytJ+EsCgV6yki12rOJn/uxbj3gTAVFFrGF7bXbTB+kU2lGOK
	wBxMeg4spNIagIaxWMoWpiEjHpnuFUSRZVBn+72Rp1o37pFzslyWl3AJJYR0jan+fzw+IJa2ihG
	jmTGavLni9o2Ypk7HlPke6my01wteKhqkSJuxgKLHmOfsK4aRZZT9QaOeM6rYdtxQK4UcPha7Oq
	mUmrBWtGIR+nPtvrRAQzzP7C3s=
X-Received: by 2002:a05:600d:8444:10b0:493:bd2a:93bb with SMTP id 5b1f17b1804b1-493f87d7eefmr180396215e9.3.1784205281874;
        Thu, 16 Jul 2026 05:34:41 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:4150:a2d7:2b6b:840e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49541e83d05sm48582645e9.6.2026.07.16.05.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 05:34:41 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 0/8] Add syscon support for Renesas RZ/T2H & RZ/N2H in CPG/MSSR driver
Date: Thu, 16 Jul 2026 13:34:26 +0100
Message-ID: <20260716123434.2576253-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This series adds syscon support for the Renesas RZ/T2H and RZ/N2H SoCs
in the CPG/MSSR driver. The CPG/MSSR block on these SoCs is a
multi-function block that integrates several system-level features beyond
clock and reset control, including clock monitoring, write protection,
and peripheral configuration registers.

For the other IP blocks to be configured a syscon support is provided in
the CPG/MSSR driver. This allows other drivers to access the CPG/MSSR
registers via a regmap interface.

Note:
- Patches have been rebased on top of next-20260715.
- The WDT driver patches apply on top of series [0].

[0] https://lore.kernel.org/all/20260715133922.2129340-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

v2->v3:
- Switched to non-RFC patches for the series.
- Added new patch to split out the RZ/T2H CPG binding from the generic
  Renesas CPG/MSSR binding.
- Dropped WDT driver refactor changes from this series. These has be
  submitted in a separate series which makes use of regmap.
- Dropped registers from writeable_readable list.
- Renamed sysc_init to post_init and updated signature to take
  cpg_mssr_pub struct.
- Created a single regmap covering both SYSC register regions
  instead of two separate regmaps.
- Updated commit messages

v1->v2:
https://lore.kernel.org/all/20260702123112.161160-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
- Updated commit message for patch #1
- Made use of for_each_child_of_node_scoped
- Moved sysc_init() to the end of the probe function

v1: https://lore.kernel.org/all/20260511185058.1926869-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (8):
  dt-bindings: clock: renesas: Split out RZ/T2H CPG binding
  clk: renesas: r9a09g077: Register SYSC regmap
  arm64: dts: renesas: r9a09g077: Adjust CPG register region sizes
  arm64: dts: renesas: r9a09g087: Adjust CPG register region sizes
  dt-bindings: watchdog: renesas,r9a09g057-wdt: Add CPG/MSSR syscon
    support
  watchdog: rzv2h: Add syscon support for WDTDCR
  arm64: dts: renesas: r9a09g077: Use CPG/MSSR syscon for WDTDCR access
  arm64: dts: renesas: r9a09g087: Use CPG/MSSR syscon for WDTDCR access

 .../bindings/clock/renesas,cpg-mssr.yaml      |  27 +---
 .../clock/renesas,rzt2h-cpg-mssr.yaml         |  87 ++++++++++++
 .../watchdog/renesas,r9a09g057-wdt.yaml       |  29 +++-
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi    |  28 ++--
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi    |  28 ++--
 drivers/clk/renesas/Kconfig                   |   2 +
 drivers/clk/renesas/r9a09g077-cpg.c           | 130 ++++++++++++++++++
 drivers/clk/renesas/renesas-cpg-mssr.c        |  18 ++-
 drivers/clk/renesas/renesas-cpg-mssr.h        |   5 +
 drivers/watchdog/Kconfig                      |   1 +
 drivers/watchdog/rzv2h_wdt.c                  |  56 ++++++--
 11 files changed, 342 insertions(+), 69 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/renesas,rzt2h-cpg-mssr.yaml

-- 
2.54.0

