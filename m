Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3793C42A7B1
	for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Jul 2026 14:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783435012; cv=none; b=RUEU2HKgUbiZVDeFT+ISFJI+IO/QJPLP7IRwrUHm11261q73QaX59+bkd0novVmPfd5fq6T9rgt/W3atFHd6ibplApuP/NF+oE0UT6hhVVFciznKLEfqXHgHO7T3rG2oS+e8qvYXStz3zz3Sm0RPZt6m9/UKoC0kgufOitGkNsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783435012; c=relaxed/simple;
	bh=AWf4f1fccc3WX4YJerl/zTzQZ4RYydGgaTr5BvT7kW8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fEMIMKqcJcedq92VqKvVkseHIx9ZSjm84PjiBfxVwSa264XrhUwZz9JzB+Q/kSPNxUz+7aJxD1lQwnExYvYZIHtZPEcYNQTgDuB5awtSEBNdCF0Yp0SWBh2jirR+8Q/lxn3zj3P/nDj0QUvTxndCUDqHeSAxMcXaoy/NFtu/iO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fhMMqhM8; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fhMMqhM8"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47362928f65so4052076f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Jul 2026 07:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783435009; x=1784039809; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j87aWoEjcLuafOmB8vgFoabIK1D/6OW6JgEE0djzGj0=;
        b=fhMMqhM8JLfOLLwPv8iQb1NdlUD03naL7+7osfHUet8dbLUeVmOyBtfdhNYsLoLKCg
         nWAkMTtlVrOqOO9GW7YV1uuHfZDw3WoZKArAOdZJ6BKLHjzJI9gbb/4aUKrComStZJoM
         ch6WEC33lotC02VwvUtbwNYtAgvJBe52zl7WqdLe3iYKcz/Q74S4NYBM2/HYLD973YAH
         +BfMay7bBXOVRNnrMN1SlEBDS5p63nF5YQ8eN9bBUfqMl1DsUTibB2TnIdTxiHoZMHku
         hF0DqbVjMPffnGUsTG/p9LvFdeIoGzqujv0WNODfU1L7uJK32ZvqVYRks38O5Mfw3bsz
         LrQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783435009; x=1784039809;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j87aWoEjcLuafOmB8vgFoabIK1D/6OW6JgEE0djzGj0=;
        b=hha2foc280gyiQIl5pUpHxk2hj6YrfNSJtibM1zhFt02hzgB8RSG0kdhUT4HgRmHCc
         PixGssYMTfJAgvRJGw0mMQWDnbJOvnTG2gT8HqHFvlEwK/paWOH1rOnIB9FEmMyKxkQM
         E3brykbHqlMGgMEDPQr+Mxjet0qt9YlJOhjyMMVj1AgwRjNo5iaB3WbqavE24UEvDrFl
         ptBTPM74MGE27U4R2aNKoxb9RgMGQ5PRvdUkNiT4c80vxFb2075Y8Rxrs2l4RyXuQr4h
         ejiDgZjlEbQIpO0oyqJ/iUFM0/slj/QvbzLxMHsD9J/JQynFT2Jn9PKf892bNGYSyrBL
         pAMA==
X-Forwarded-Encrypted: i=1; AHgh+Rpl5L0G+eyHW+VMDFYzem6QX20McFQIDwh/XV80JC48icWifroGCXgXvZwozbviCBUlSIPo9QBLYNTkJPSN/QTF2g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2sdtP9Wbiill9Uwy5vzpiVCAcEc6mITqf+SWDGan62dndaTxJ
	zwGqFcgkJHmPiVPLit1kPGHPAyKSACnJEC582MeteRbugVqj20dhuJrV
X-Gm-Gg: AfdE7ckSSON3lvaxi6AwfilZ97LD37VLOm7dGN9AhhtetdxsYnTINMFXFCfeekFZfsb
	5ofbdRQX/YQBLG4KqtIIi24X8Wai+2mAev0NlGb4srgRF6rL5CaExpfoGMq6Y8zLvjEeOliEUnC
	P312z2ka34ZXevKg/zpv5dH2LlNDmgSlAOuCZTNAi+XdfeKuo5aq/0N6zLUMfxlp44loIV91fpt
	76ZiQQzLn5pp0Nn4oMTIe9nXOQ+0KNZu3mccSQLtNms58+abAud5COofSs4+jnibi03PwNbqh+K
	v4mrhedCjo9rXSoP2+DXJlzdfgU9uXC2bvQCoR/3zBURkUeugt5ghx2ZCdDz1FYC467JOGWehik
	5/TE+3bEPPB1RP3Ft+o5WS706Rd2pkBhjSW4rMwU5TWpVTAm5tZCs8vRRtSQdh+DHlmOMxUbbzN
	ys2Rg9gK3kQUmB/kJQafHyrryDByFEVaRqdGIoUg==
X-Received: by 2002:a05:6000:1aca:b0:43b:498f:dceb with SMTP id ffacd0b85a97d-47de660346bmr6435337f8f.9.1783435009312;
        Tue, 07 Jul 2026 07:36:49 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:a4ac:4e7f:194a:852e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039ae44sm33228611f8f.23.2026.07.07.07.36.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 07:36:49 -0700 (PDT)
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
Subject: [PATCH v3 0/9] Add RZ/G3L USB2.0 host support
Date: Tue,  7 Jul 2026 15:36:32 +0100
Message-ID: <20260707143646.245177-1-biju.das.jz@bp.renesas.com>
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

v2->v3:
 * Replaced items->enum in reset controller bindings.
 * Collected the tag for reset binding patch.
 * Dropped clock patch as it is accepted.
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

Biju Das (9):
  dt-bindings: reset: renesas,rzg2l-usbphy-ctrl: Document RZ/G3L support
  dt-bindings: phy: renesas,usb2-phy: Document RZ/G3L PHY bindings
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
 .../reset/renesas,rzg2l-usbphy-ctrl.yaml      |  48 +++++++-
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi    | 105 ++++++++++++++++++
 .../boot/dts/renesas/r9a08g046l48-smarc.dts   |  49 ++++++++
 drivers/phy/renesas/phy-rcar-gen3-usb2.c      |  20 ++--
 .../regulator/renesas-usb-vbus-regulator.c    |  53 +++++++++
 drivers/reset/reset-rzg2l-usbphy-ctrl.c       |  44 +++++---
 7 files changed, 296 insertions(+), 25 deletions(-)

-- 
2.43.0

