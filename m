Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69CC42E00D
	for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Jun 2026 10:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781606706; cv=none; b=Fz+YfOX47eBBe230ND9xNEsj2JlNyHV7Mm6fYGZMFa5e6C1FfMOZTfPN1O9V3zpqylpyjGI9lVi06Fwj0VprA6ZbO+fSgr4hXpjQ0FwcyW4+42dnfSb+4YMw7Q3ezUMKPItzjsrOZw658NDsdzF9Rf8w/mYKHaJ4cfsl2p24qGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781606706; c=relaxed/simple;
	bh=sKtKuInWWgkpnwOdLL4P+tLnyENjTquK40r7C4btG6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ns3NMDIY18Jo48x2vftGQ4/OnqwO+RtAVcsMCeBTSALe77hSbp4ZIE6KAn8Apoa2kLYf7W0PjFfB8UQGBj/88SyQUAdqwmOStTUWqQwlmO25xEN0nZs+L3VojXeGKE5BpZWw51b45xi3fgyYyZaJ29TFmx1rIdIm2x6v4q/XoA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i/Ru7QiU; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i/Ru7QiU"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490b12270b3so27109835e9.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Jun 2026 03:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781606703; x=1782211503; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v+W3gkJdUSVWqcMXGqjt/1kOI7XTiovzDDxctkwEQPc=;
        b=i/Ru7QiUzfKr3YVecRZc1fd/7oKYU+TowVY2i1EcwBmTicUWOFluN09vik4kKTzsS3
         fhgIRk0U93iLfRkgxbodCbhdXw9qHdCokWn8TT1sQwdE62jxNrfldjTWzkl26hx/U8iG
         Hfa74vvt88RxV0CDNVbgvwncpPxa3Ziz2/Oj6P2OybOWJQL0HmQ9TR873JbUKsmfRPmH
         OZ+qrHrKCz/6BQzHDGluetj4nBtcLIck2/YxXHV2qUFtZpiwVzxMOCEqW3wUQR/WJRuP
         /aAJOhqUgnQTw1LZUqzD8DBFZ+bihaUBwwEOywSe3r+rOoU1HEHSAGRN3gHTIunN+3zU
         PacA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781606703; x=1782211503;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v+W3gkJdUSVWqcMXGqjt/1kOI7XTiovzDDxctkwEQPc=;
        b=a/1aYPDckhL8l5C/mc5pL/Rji8W0nEJmK8hrScV/VjSMd28G9KVKKK9k4xG3yZxDDt
         e52D8NAGx/UQJvXbJIv/TT4eKOcdFB+3QrQSEuN+qISbWO6pX8uRKM4D2sAERTRQjZuH
         7pdURPN+dtB9xHK4INVDmxh+Aks1njHCN2VL/mQ+XKTqIbrcDbaKdbWIviy7xagvhol/
         89QRJJjurvCS4/7FVYrze/61uGJ+fOTOaXeIM9aB0syd5rSedqx5Qr6x5ZbapWYXFVJD
         bWwEuOqEcXdXZQbLsV6e75u0mYnFndjg0Q59bsm/o7TFkSgZG0kY+byeWh0jgrpEItFW
         azWQ==
X-Forwarded-Encrypted: i=1; AFNElJ9V1/C0uE8d9m7Fm8RNawb0itJNOKDSgnmXnVeVAsK4spS3EVZZsJb/QU0jjc0RgNrkEDBd9hcMCgw9bq/7FKBrfg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzO0t8nSF2r1SpvUYoUrHdZYWMDF8Xj1UY8tEZaL9AudgqhZmS3
	1td0eIJKjYrDmq3+mTEwf4dlLvbfHj9ugxiP4/65X20EolP/I+4oS2Hd
X-Gm-Gg: Acq92OHI9LKCmQ+D7BIrekguz1FD12TiNPy148NVAnPE5LVeX3A4OPGKh/0j7UHpUZ1
	arFbR3SyWqRr170lmnenc/0MZxlN7zoVV8kVWTXysNehQ6dOzlK/XN9FUcPyFPuAq/plJY81Zvw
	mAm4aCTxXW7889UkK6rKK/Sgl/niJLGFRaudd88XUawQmnVkHGLdUTvE2fMYpaA/SgL9rTZ7CR7
	F/mJ6iJRIw1HlSckD205bDeQz73MblT2GoHtyD3RdUzNPfY4jv9/CSJkfyWDdo1F+rzIHUDXqGm
	xjUtbIFeuytBDlWUC42YfFmcDm76GzK4l+W92DdgzdDMNOYba76eHJms3vE8N/tU2nssOKJWuSt
	VH9bB41OOMHEfUvSsqhheITQ/TlcooeDu/eqshLbS3vwPOXBkymtnIAhDG/ZOc0jN9H6+K8KXpz
	6lk/bfyOblkehuLmLNCx451nFI2iiDEe8XVePznmogugDtVIOw
X-Received: by 2002:a05:600c:190b:b0:490:bcf6:469f with SMTP id 5b1f17b1804b1-490ec33898fmr239045165e9.0.1781606703064;
        Tue, 16 Jun 2026 03:45:03 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:7499:34c3:598b:e20c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922fa47da9sm82458485e9.5.2026.06.16.03.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 03:45:02 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 00/10] Add RZ/G3L USB2.0 host support
Date: Tue, 16 Jun 2026 11:44:42 +0100
Message-ID: <20260616104459.410743-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add device tree binding support for the RZ/G3L (r9a08g046) USB PHY
controller. The RZ/G3L USB PHY block is similar to RZ/G3S, but each port
has an OTG controller, unlike RZ/G3S, which has an OTG controller only on
port 1.

v1->v2:
 * Dropped patch#6(Introduce helper for regulator registration)
 * Passing pointer to an array of regulators to make it scalable.
 * Dropped regulator1-vbus and added a regulators group node.
 * Updated commit description for patch#1,#4,#6,#7,#8,#9 and #10.
 * Added enum instead of const in the compatible section.
 * Updated schema check.
 * Collected tag for PHY binding patch.
   in the regulator driver.
 * Added regulators group node and its children in SoC dtsi.

Biju Das (10):
  dt-bindings: reset: renesas,rzg2l-usbphy-ctrl: Document RZ/G3L support
  dt-bindings: phy: renesas,usb2-phy: Document RZ/G3L PHY bindings
  clk: renesas: r9a08g046: Add USB2.0 clock and reset entries
  reset: rzg2l-usbphy-ctrl: Introduce info struct for match data
  reset: rzg2l-usbphy-ctrl: Add RZ/G3L support
  regulator: renesas-usb-vbus-regulator: Add RZ/G3L VBUS regulator
    support
  phy: renesas: phy-rcar-gen3-usb2: Add RZ/G3L support
  phy: renesas: phy-rcar-gen3-usb2: Fix devm action registration for
    disabled VBUS regulator
  arm64: dts: renesas: r9a08g046: Add USB2.0 device nodes
  arm64: dts: renesas: r9a08g046l48-smarc: Add USB2.0 support

 .../bindings/phy/renesas,usb2-phy.yaml        |   2 +
 .../reset/renesas,rzg2l-usbphy-ctrl.yaml      |  49 +++++++-
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi    | 105 ++++++++++++++++++
 .../boot/dts/renesas/r9a08g046l48-smarc.dts   |  49 ++++++++
 drivers/clk/renesas/r9a08g046-cpg.c           |  15 +++
 drivers/phy/renesas/phy-rcar-gen3-usb2.c      |  20 ++--
 .../regulator/renesas-usb-vbus-regulator.c    |  53 +++++++++
 drivers/reset/reset-rzg2l-usbphy-ctrl.c       |  44 +++++---
 8 files changed, 312 insertions(+), 25 deletions(-)

-- 
2.43.0

