Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB7E43B483
	for <linux-renesas-soc@vger.kernel.org>; Thu,  6 Aug 2026 10:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786011734; cv=none; b=W3PxLoPX6iNdnElPKAOxgk81ZVZRQdrynadaJ2XwTJoiKJzIg18LdpDvCZ6goIVN36/kZFSUtfHLUy/ZCijMQ/kwGW4Tyj7C640UQ8Uiz8QcdDIgQG3yhSaKfPjrUQ3EQsoVpxjyzlByieGm2HBHnvJ1Md9JWYc4pKbGfRlpJBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786011734; c=relaxed/simple;
	bh=BhNchIMHagP5LNiH58a3QPrktwpAXLbNmtJZy3kytRk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=skCkrGhbu+rQRH6qG5qROvpGlg3AzBz6XQA53suQ0eTWHJo3XjxGUdWW6QZ27QSYNEmtkBIH5zgGuNZSrGBSLdNeCt/9h2+ccqZBDL88mqB7qmnkc2YTQTi7C1BOBoNj33Fp26dIfJqiGCCwnZMVOUbxXQlXKuFr4x1qzcwG/Ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PH3P3bt6; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PH3P3bt6"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49553515a8bso30105135e9.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 06 Aug 2026 03:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786011731; x=1786616531; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XNH7C3+W1iQuetjKu7PHcF0eka/FhNKK8WPnZOjuhC0=;
        b=PH3P3bt6Hf3iiq0uXf9D31jPLqsO/DuyrEn+81iZZsPo1+qBRuJ9Ch7NIJXAQa1uZN
         SQs+XuRLbQWkUz3K6b2o7ZddSP5ryKSWfxcLPkuJ5ZG7e84kf9+fGXdE/1189X0aIK1n
         rRmRJ5Ey0NaGVVrR9OirxkbrfNyqDgmYJtZ/W1mxU3GMlKSo27OelNPIPj1jxIfTXZpX
         7H/G0IjInc6X0cvDimzC185OU0QaX/CEmi4qJ4vwh1ftTR3SGVLLZrKqIG52JNDUzBzb
         JwdnzlgLappTdPT2ubxz16sY1K6rNLrFzKU5x6BRwjpz9fiHMibB0hYABfkixAqHSS1F
         z4jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786011731; x=1786616531;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XNH7C3+W1iQuetjKu7PHcF0eka/FhNKK8WPnZOjuhC0=;
        b=ssehRdwBVCumGhACi7E6dXIECm0CD/lig+NL0pxcVpvb/FeLMocmcLKmCSIpd9CfM3
         MxmRVfR7OaxpmYSOok2bIcZ8jRkNGYxGWB2slHLZTh54iPCrbFP5HnVxz0/XcQeiE+Fh
         yBx8ogPg3YlpFduCfY1KOzZVcMxA/7h7GBIts62PU+qY8zxCjCjbE/SgswsDX9SqkvwM
         Qaw2TNHXJLUJVx9/SAJfJf4yO3ZZcD6cvOG/0b7wcx81uFTB4cOd3P4ywlDC0JbgbHN7
         Cq8U30iO4Erp3mvuCWJZTHeFJr9PTAaz6mTkJQQnodA19BQVw8obwMnlj+WdEWFH7bPt
         F7xQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr+njVscmtpuIsCvs+5uZwe3WuZ5KSIZ0hud6qXo/WIu6Xg7zt92bmjR3PLajCIwcKYOilxolAu6d9IHhQcMf6Juw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5FrI2uQjF2pROSJaRRFi2G0hBQz/Y1G8bFvr5jTm90Y+Csbmx
	Ok9bUX9yo5V7sMkGs9O9aTAJlGCtDeBPKxQgHvWVKABnpNi4pDFaV8js
X-Gm-Gg: AR+sD13pbxmYOfLydOFYRhheTtx6iVZ+TQ+sm7FAoi36wW2hQq++RwTYnA9+iu9QV2x
	mekzdXLZRTv1DhO46EFz0TuhB+JgHS0Edo9eNl13VY7ke8z0oz7WK6XJ53rJ0QOggChMGOVMzfg
	4zLkQl1PH+aoGRs8H/3vJT5wQd+1nxh9uWkakwV1uENpNpXlD35k3iDCtj+wU/SBetYu29eE8fX
	Z3vpYHH2O4XLIzfOkOThkeA2xlg6Xn89hWWHAgGiu3GJ1kJOo64dFuNtUI36jhNDrHGNyQICEPP
	jU+N/VumkjLCZO1LoipAPaG9HxfuyctG2MPm2ntgCdQhWg2lvK4MTxy8pvUJ2HTAlHkhCc0K70X
	sZbY4jBnpluu5ihlvr/FpsLls+dNOWf2iD9D/3EiMACgkHVGOYjDsS0gfhhEMq76r/fwaBfKMQO
	DZSZaxeOq6z6+zHzt1GStZ1AX9W5uTacBz4uJ1Rad6BzdRWT3w+JAuullIAlDs6Qso0b0ghchpe
	Z5HGxKAvqoM
X-Received: by 2002:a7b:c38a:0:b0:495:7538:d4ea with SMTP id 5b1f17b1804b1-49959d790ddmr3341015e9.0.1786011730787;
        Thu, 06 Aug 2026 03:22:10 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:a173:17cc:14ec:8d1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499542851d6sm58729205e9.12.2026.08.06.03.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 03:22:10 -0700 (PDT)
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
	Bartosz Golaszewski <brgl@kernel.org>,
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
Subject: [PATCH v6 00/10] Add RZ/G3L USB2.0 host support
Date: Thu,  6 Aug 2026 11:21:48 +0100
Message-ID: <20260806102206.149110-1-biju.das.jz@bp.renesas.com>
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

This patch series aims to add USB2.0 host support for the RZ/G3L SMARC
EVK. The RZ/G3L USB PHY block is similar to RZ/G3S, but each port
has an OTG controller, unlike RZ/G3S, which has an OTG controller only on
port 1. This series migrates regulator driver to use id-table so there
is hard dependency between reset driver and regulator driver.

Merge strategy:
  An Ack/Rb tag from Regulator Maintainer for patch#1 and #5.
  Patch #1,#2,#3,#4,#5 - Reset subsystem
  Patch #5,#6,#7 - PHY subsystem
  Patch #8,#9 - Renesas SoC

v5->v6:
 * To avoid breaking bisectability, prepared a single patch that
   does the "rzg2l-usb-vbus-regulator" -> "rzg2l-vbus-regulator"
   rename in both regulator and reset drivers and that could be
   merged into both trees.
 * Replaced dev_err->dev_err_probe() in error path of
   rzg3l_usb_vbus_regulator_probe().
 * Retained the tag as the change is trivial.
v4->v5:
 * Collected Ack tag for regulator driver changes.
 * Dropped renesas,sysc-pwrrdy for RZ/G3L as pwrrdy signal is modelled as
   power sequence.
 * Dropped the tag from Conor due to above change .
 * Replaced the variable regulator_driver_name->regulator_name in struct
   rzg2l_usbphy_ctrl_info
 * Switched to power sequence consumer for controlling pwrrdy signal.
 * Updated commit description for patch#3.
v3->v4:
 * Updated cover letter with merge strategy
 * Reorder the phy binding patch for easy merging.
 * Updated the commit description for patch #2,#3, #4.
 * Moved the handling of regulator_driver_name to patch #3
   in preparation for id_table match.
 * Migrated to id_table match using driver_name and reduced the length
   < 24.
 * Dropped rzg3l specific platform driver.
 * Dropped the tag for regulator driver,
 * Added id_table handling by introducing a common probe().
 * Dropped renesas,sysc-pwrrdy property for usbphy-ctrl node.
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

Biju Das (10):
  regulator: renesas-usb-vbus-regulator: Rename platform device to
    rzg2l-vbus-regulator
  dt-bindings: reset: renesas,rzg2l-usbphy-ctrl: Document RZ/G3L support
  reset: rzg2l-usbphy-ctrl: Introduce info struct for match data
  reset: rzg2l-usbphy-ctrl: Add RZ/G3L support
  regulator: renesas-usb-vbus-regulator: Add RZ/G3L VBUS regulator
    support
  dt-bindings: phy: renesas,usb2-phy: Document RZ/G3L PHY bindings
  phy: renesas: phy-rcar-gen3-usb2: Add RZ/G3L support
  phy: renesas: phy-rcar-gen3-usb2: Fix devm action registration for
    disabled VBUS regulator
  arm64: dts: renesas: r9a08g046: Add USB2.0 device nodes
  arm64: dts: renesas: r9a08g046l48-smarc: Add USB2.0 support

 .../bindings/phy/renesas,usb2-phy.yaml        |   2 +
 .../reset/renesas,rzg2l-usbphy-ctrl.yaml      |  40 ++++++-
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi    | 104 +++++++++++++++++
 .../boot/dts/renesas/r9a08g046l48-smarc.dts   |  49 ++++++++
 drivers/phy/renesas/phy-rcar-gen3-usb2.c      |  20 ++--
 .../regulator/renesas-usb-vbus-regulator.c    |  75 +++++++++++-
 drivers/reset/reset-rzg2l-usbphy-ctrl.c       | 109 +++++++++++++++---
 7 files changed, 370 insertions(+), 29 deletions(-)

-- 
2.43.0

