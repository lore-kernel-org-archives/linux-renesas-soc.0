Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24184495ACD
	for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Sep 2026 13:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790775197; cv=none; b=RuuNIzIcw5CJAOwG94y+Vo4eAU0d2oPRSGiXRmolMq1fwslcSdpWurTGhjq8BOm2nIA8+rVpAeIK54kTaqUFVik1Co7UxyAxN7Swbo/fI9S0D0qYlWdkeBR6ChYgGgfEZPieP8vgYkGmuVZe5i1LVFcl8nc2gAnQ2duKkCN/zPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790775197; c=relaxed/simple;
	bh=utYFrsJuYprZoOmQmX3B9K4bkwMAYjAAh3GJlDRTg+w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qCK5JNBJe4yctOm7Hlbx6GnKYBV2slC4yRGvR1zirew+U8ILKsI6u739EGDW8Rv20igbv9lzjylKuWbxmtrIC6H9NawzfSKvOLee7Y2v4g8rcUZ9F9Qziq7N8r2FYkcVoWnnoiNtWNjhaVte+I7jM+7hUxpvj52Tky7S+dsHPKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UQ4TVQmr; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UQ4TVQmr"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48b01d89b23so385087f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Sep 2026 06:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790775181; x=1791379981; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=z7TzL9qAFKtaS7vfznZL2zUVepTC6ZMh9+7GhOWKsog=;
        b=UQ4TVQmrqNzBtgx8JCm7wkP51uD4J8fasnzDOqhTKGv/4p3/tsWjMu47mX2/4uzhc2
         bdR3uG//mDNivpjSCYCbK/VHtQg8VE+SfBBfvdnf50LpncIRSSGZ5du3pRoYHD0et1RW
         UmakFeFX/7xSXZBmcFHsklf23CKqGRefy/v/XUmziWlrB5DmUw+HjTVzN1u5r7umlhCR
         wkPHS9M0fElbNHSoojtcaJ+DR8U//oeoNFaqrfwlri9Lsiiz1EVf1J/k/2UNdOnwPMDQ
         +xFD3DX9NrdnjNCiwGBvXiSNOIrsYF4jYgzOAhuX/xvYnbFswr7oO/i8De9SFVTyZHJ8
         0Q/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790775181; x=1791379981;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z7TzL9qAFKtaS7vfznZL2zUVepTC6ZMh9+7GhOWKsog=;
        b=n4weonnBizDFE7J/Zf0UdH8bRnTHYcRzGlDwjQgTcoHFOJiwly9P4we05n3aCBCPNw
         mEfFmfmwbTl08iGjj9ZnvgrFMh2HudhcYzewY/8Ge2g8GTlDUFOgQLskB0VEgSglIu5v
         NvZbmwcs2f//mix5UQO2GwLkCZBgBEcd18OY5i24j8Cdd2Fe3YsiYOqZtXFR7ilOdU2r
         Lo8zvkwLFWH9n7B88NeUbQjO5eo99LYLhoBZ+MD+OtbfQcDqHz6wXyI4sMK+nTCIqn1N
         Ogn78LjUA7SkBySfBVgH0eCm2txq0r8a1pl0ryq5lKBehe5gMANmyAL/IleS17ztNIRW
         p2jQ==
X-Forwarded-Encrypted: i=1; AKwUvBz8r4if6Vk6VL7B1kbkS7JZjPIP2FTa1cLK/niYcGfzA1cbOwEWdwnQaSOL0WJt31Oe5HAihrim+9k5e4VaEX3gKA==@vger.kernel.org
X-Gm-Message-State: AFq9FYL3Qoh/YejSxlEl8yf5nIn3szhvB29THK5n37WYgIUdLrCgm2NP
	PuQCN55so0eW1jzxZqfL0Kt4XJJlDIOHGXdytb4igM11rUAPTiRrYRyl
X-Gm-Gg: AYBFou09pnTeL7OgC60QCF6W/zhdwSH8RaQsScQCBx7E/hAhd9nP5/4L6HCIzLjUfCs
	DRfr3Ct93LMgjiIU9t/NnpPk6P6TnoR89tWX4ltC8oipq7eINuJSDIIZpuzitREn25QuF8Cu3qJ
	YnZ7/LbGbBmK4dr80RSZcQ9UIJ6fqvnXVTWaO39/Aapp7UXmsSV+///JxMblK79zExP13nsvxpZ
	TMUHt5C/ht52Mcfj3xJbl22THZUM1G7nsAMo6Bk4oxWyN6MUwASo85E0xX/Tq2O4898PRFKO5nD
	iV/2yIMS0SLb3uNnrQaxp7/+m9a5DQ92kcUb/q0ThYm5xk2mbexbAI6y8bl2XGmLsV69u8HFC/w
	xsahMB4U56JE77WxnmKdZ3Vsx9vp8+cWI05sjVdpj1VD4WLbyLryzMOsyZ7YILVCkAlXcgXGXGy
	GhuiOvAFSvm8RjfRnzbewLI3HTFeaDe1w0w5+zaWq9ekFfK17FuIc7n8T9zLVdyFoTMX52nmk/n
	yl7zpiovXBPdpaTEm6vUe8=
X-Received: by 2002:a05:6000:989:b0:48b:174:eab1 with SMTP id ffacd0b85a97d-48b02511718mr2875334f8f.36.1790775180889;
        Wed, 30 Sep 2026 06:33:00 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:bade:1500:bcd:b3ec])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b029f2b02sm3685582f8f.24.2026.09.30.06.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 06:33:00 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v4 0/9] Add support for DU, LVDS and DSI on the Renesas RZ/G3L SoC
Date: Wed, 30 Sep 2026 14:32:42 +0100
Message-ID: <20260930133257.23210-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Hi All,

This patch series aims to add DSI, LVDS and LCD support for the RZ/G3L
SMARC EVK. The RZ/G3L LCDC is similar to the one found on RZ/G2L, but has
LVDS support.

The LVDS series [1] is merged here to get an overall picture.

[1] https://lore.kernel.org/all/20260625172359.292631-1-biju.das.jz@bp.renesas.com/

v3->v4:
 * Collected tag.
 * Dropped pwrrdy variable from struct rzg2l_mipi_dsi_hw_info and instead
   using feature flag RZ_MIPI_DSI_FEATURE_PWRRDY
 * Dropped rzg2l_mipi_dsi_pwrrdy_off() as it is taken care by
   devm_pwrseq_get().
 * Updated mode_clock_min from 5440->5400 kHz.
 * Added resets in pair for simplification.
 * Added comment in probe() for asserting resets.
 * Updated commit description for patch#8 and #9.
 * Updated license header  for patch#8 and #9.
 * Added HDMI audio support.
 * Dropped reg_1v8 and reg_3v3 nodes as they are redundant.
 * Renamed it6263 node name from it6263 to hdmi.
v2->v3:
 * Dropped binding patches as it is accepted.
v1->v2:
 * Dropped renesas,sysc-pwrrdy property as it is modelled as power
   sequence.
 * Switched to power sequence for handling pwrrdy signal.
 * Dropped header file regmap.h and mfd/syscon.h
 * Added header file pwrseq/consumer.h
 * Replaced syscon_field->pwrrdy in struct rzg3l_mipi_dsi_info.
 * Restored ports in DU bindings.
 * Replaced endpoint with port in ports node.
 * Dropped the macro RZG2L_DU_FEATURE_SMUX2_DSI_CLK and RZG2L_DU_MAX_LVDS.
 * Dropped the variable rcdu from struct rzg2l_du_encoder.
 * Dropped the variable lvds from struct rzg2l_du_device.
 * Dropped renesas,sysc-pwrrdy from dsi node.

Biju Das (9):
  drm: renesas: rzg2l_mipi_dsi: Add dphyctrl0_init_val to hw_info
  drm: renesas: rzg2l_mipi_dsi: Add activation_dly to hw_info
  drm: renesas: rzg2l_mipi_dsi: Move global timings into hardware info
    struct
  drm: renesas: rzg2l_mipi_dsi: Add support for DSI PWRRDY
  drm: renesas: rzg2l_mipi_dsi: Add RZ/G3L MIPI DSI support
  drm: renesas: rz-du: Add RZ/G3L (R9A08G046) DU support
  drm: renesas: rz-du: Add support for RZ/G3L LVDS encoder
  arm64: dts: renesas: Add DSI overlay for RZ/G3L SMARC EVK with ADV7535
  arm64: dts: renesas: Add LVDS overlay for RZ/G3L SMARC EVK with
    ITE6263

 arch/arm64/boot/dts/renesas/Makefile          |   6 +
 .../r9a08g046l48-smarc-dsi-adv7535.dtso       | 138 +++++++++
 .../r9a08g046l48-smarc-lvds-ite6263.dtso      |  86 ++++++
 drivers/gpu/drm/renesas/rz-du/Kconfig         |  13 +
 drivers/gpu/drm/renesas/rz-du/Makefile        |   1 +
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c  |  24 +-
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h  |   3 +-
 .../gpu/drm/renesas/rz-du/rzg2l_du_encoder.c  |  24 ++
 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 162 +++++++++-
 drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.c    | 282 ++++++++++++++++++
 .../gpu/drm/renesas/rz-du/rzg3l_lvds_regs.h   |  25 ++
 11 files changed, 756 insertions(+), 8 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc-dsi-adv7535.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc-lvds-ite6263.dtso
 create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.c
 create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg3l_lvds_regs.h

-- 
2.43.0

