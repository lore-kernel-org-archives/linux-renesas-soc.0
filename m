Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4714485CF5
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jul 2026 12:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785329736; cv=none; b=lINhWv60d2GU3Qw/AX1COOP7CcRxDz2RTPd6Zqs2G20K0t/RTsay810hFRJbZNGr4p05K5JXEiBqrVKe2t3kOqwJL/XAn+MtH7GSU5XyaXPm05gPi4CKu53wMDt7iQUIcS4c3rRwEbEfkBYAGZ2/QnWZ/2l7/OC/iTlyycDkKxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785329736; c=relaxed/simple;
	bh=Bx0Vs+iueJGyB6GEqn43qo8+5IZiDTGORo1LWg+9v8M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RLt3i/noHsG+WV1Fmw9BjXkY57ubpoim+7wJyj1QtnPIsS5CKuIZHbFwOLR7MwU3SUA4Pj8Dwk4HOjqurVyYQtrWogJQuxfPvNq1g2MH+21sWYeLxrN/Duk51I1i3xBW9qeHOlxQ/S8Rnz1EjJ7PlGDPxdBHGEBy48ynag7aYL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k47Om4JU; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k47Om4JU"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47f71156e1aso521204f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jul 2026 05:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785329723; x=1785934523; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z1wP4pta5UyofIbZoGK/pLyizl12pGGfGAIOeMl3uuI=;
        b=k47Om4JUcn9s7ZHfm3ihLX02z8xan71uLcVXRZ54UjBx6xZOj34dm2m011QU9B0fZv
         XgQJg6vF7c7kal1Mv4nJ1VNythwpapkthpXDRLw+8l+1rc2iuwh7IJBNfXxwZduFQs81
         eyOwQH5H50drIkOhuW9Exp3RGxvygJ7oSJMjTOJPdBUX544iEkQJcrPFbDNeCZhDf4lT
         j/J49OTUIDCSdg3c/a/Sigg/tgFj1/TZYZJZE1G1IzmEFPAnjqckE1duI1DBAsyOECK2
         wfzpbaCLV3/dEu/WlSi+RHtKHO8wjCN3Tn/zdrABGj08Ti7xMI5lMOmx48bM4/r97SYB
         OyFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785329723; x=1785934523;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z1wP4pta5UyofIbZoGK/pLyizl12pGGfGAIOeMl3uuI=;
        b=M6Q0zrlOC4QiR8Zp/10YEPWNZnrSLZTHpMjlDcVcpH1O6Rskp3zm7X0mdHAoNpi1iF
         xt8MrZeYXQclmqDS44GQjapwF2t7HtnUmD3Gk5+IvM404K5X5bsAIICbURQcVl25Yksi
         aIjwuiAHqqGyQ8SYk0aVTJXcSbtAJQjZykQGNgG71i6QhUGSxNvRuD1l2/EVlrXyLT3e
         JGXin9NcV1Zrc33tjTeV3yCf1s8pkZZGXvrQ3LKyPQ+3xGwncAN7QUQg9ZvHJiA31tEx
         zn88UfN+kLBVmfM4U4dDH6KExfjbscfV4wdWd5aBP+0EyM6TcoLOTRugVS09OyzDj41Y
         o/9A==
X-Forwarded-Encrypted: i=1; AHgh+Rox2kCOLc77GHFIvC9SG+DHWkchbeyn7hbGq3qZQxEVaL5hMZR6Tut6Xet09YGPmOBLCx4WEKOrCcjJNYO81fV68g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxaZfdmXo3TYVEMVSjtVIInRWr2fSUYetUsqObwvpUbjr18v2Oi
	TG5sydze7xCWxUHdxl0L9+JPPrAptFzpU9AqRjx1TNWxxWdM71LTh9rS
X-Gm-Gg: AR+sD11ZVs5x2yfUtNMzt0OwS8RbJn1ofFhor2astM+SrfARbsTsI8fnbIyrYEQ/raA
	OgcT9mJx2+nkFSs1+r0ChuAvFAG6Kxvuufijprd9JLKT9QSPWKciSODVIx1EQ9OO8TxZqxjVOso
	6tmuktiUwlIBcsofwlKmDHmZL0WmznqQdn/f+LXXvz0aPBWtur7AyRxaJkVUS5aPTgzdjU5E+5h
	RHVpxvLC5y8zD3ac8gKB/B5MZ30yL+Q691W44HC7sejtHGwEsM4L73Ubj5mr8bfbj9o86S6WzRf
	V2zyFkuOaTNaxLSWzsRZ5F9lnwoPV6hPiIO+SImIbAcPM/Fc+KX9THI6BQi2ET6YZlk2pc4QG78
	2nocg2NHIUcVYUNHdUlzKMYBnd/akhrF5XIddcwgtNSo/aQt8B1t2lw09CgIYRYUPVzbCZyfcZv
	1rPP0yMn52nHwYqrzX8as3Ff0K6yTOoKccBxkeBPbhwnMHD6ljGn4rYJlTjdCXZrS2wevUreH5V
	nocOEVY5HUfJQ==
X-Received: by 2002:a5d:6f13:0:b0:47f:7fd1:9602 with SMTP id ffacd0b85a97d-47fb1e87636mr7709094f8f.11.1785329722702;
        Wed, 29 Jul 2026 05:55:22 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:10b8:4461:ee04:15e2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6b189e5sm9264645f8f.27.2026.07.29.05.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 05:55:21 -0700 (PDT)
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
Subject: [PATCH v2 00/16] Add support for DU, LVDS and DSI on the Renesas RZ/G3L SoC
Date: Wed, 29 Jul 2026 13:54:52 +0100
Message-ID: <20260729125516.230757-1-biju.das.jz@bp.renesas.com>
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
LVDS support. It is simpler compared to RZ/G3E [1], hence sending
this series to get review feedback. Based on the discussion on [1],
will rebase this later.

This patch series has a dependency on [2].

Also, the LVDS series [3] is merged here to get an overall picture.

[1] https://lore.kernel.org/all/cover.1770996493.git.tommaso.merciai.xr@bp.renesas.com
[2] https://lore.kernel.org/all/20260619164030.380098-1-biju.das.jz@bp.renesas.com/
[3] https://lore.kernel.org/all/20260625172359.292631-1-biju.das.jz@bp.renesas.com/

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

Biju Das (16):
  dt-bindings: display: bridge: renesas,dsi: Document RZ/G3L
  drm: renesas: rzg2l_mipi_dsi: Add dphyctrl0_init_val to hw_info
  drm: renesas: rzg2l_mipi_dsi: Add activation_dly to hw_info
  drm: renesas: rzg2l_mipi_dsi: Move global timings into hardware info
    struct
  drm: renesas: rzg2l_mipi_dsi: Add support for DSI PWRRDY
  drm: renesas: rzg2l_mipi_dsi: Add RZ/G3L MIPI DSI support
  dt-bindings: display: renesas,rzg2l-du: Document RZ/G3L SoC
  drm: renesas: rz-du: Add RZ/G3L (R9A08G046) DU support
  dt-bindings: display: bridge: Document Renesas RZ/G3L LVDS encoder
  drm: renesas: rz-du: Add support for RZ/G3L LVDS encoder
  arm64: dts: renesas: r9a08g046: Add fcpvd node
  arm64: dts: renesas: r9a08g046: Add vspd node
  arm64: dts: renesas: r9a08g046: Add DU and DSI nodes
  arm64: dts: renesas: r9a08g046: Add LVDS node
  arm64: dts: renesas: Add DSI overlay for RZ/G3L SMARC EVK with ADV7535
  arm64: dts: renesas: Add LVDS overlay for RZ/G3L SMARC EVK with
    ITE6263

 .../bindings/display/bridge/renesas,dsi.yaml  |   1 +
 .../bridge/renesas,r9a08g046-lvds.yaml        | 120 +++++++
 .../bindings/display/renesas,rzg2l-du.yaml    |  26 +-
 arch/arm64/boot/dts/renesas/Makefile          |   6 +
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi    | 139 ++++++++
 .../r9a08g046l48-smarc-dsi-adv7535.dtso       |  95 ++++++
 .../r9a08g046l48-smarc-lvds-ite6263.dtso      | 104 ++++++
 drivers/gpu/drm/renesas/rz-du/Kconfig         |  13 +
 drivers/gpu/drm/renesas/rz-du/Makefile        |   1 +
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c  |  22 +-
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h  |   1 +
 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 182 ++++++++++-
 drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.c    | 299 ++++++++++++++++++
 .../gpu/drm/renesas/rz-du/rzg3l_lvds_regs.h   |  25 ++
 14 files changed, 1025 insertions(+), 9 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/renesas,r9a08g046-lvds.yaml
 create mode 100644 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc-dsi-adv7535.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc-lvds-ite6263.dtso
 create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.c
 create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg3l_lvds_regs.h

-- 
2.43.0

