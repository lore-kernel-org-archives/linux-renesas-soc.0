Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460253A255A
	for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Aug 2026 09:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787219695; cv=none; b=fLtNU2KyhBX/AeNFJ32e21VPJUJrbdldL5M3yvYe0Vt4CYH9GX58wi9Pyk3R6BCIZZudMjlACLOwp6U4my+sOBU2yYMjE0N0OYYZbkyGvJvH5TKMd9aioNHjfFiqRM6jDAdas6DzS2/hBjsrdirDrpsEOoVUs2OJOI+Q5QTCSgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787219695; c=relaxed/simple;
	bh=/DhO7zFg6yyGsG3ef/ZLgZH2m8TW5PiW9nEKXC5/Ofo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rbI+m/sa99sppHc+oP6JD1JWgioy4PyXeYCQ6lbNAAEelqbu0679EliovPgBNN6nidY7TYlyB2fM69ys0BZsyMFmUVsVf4J5eMt/G728ZZd/id6JHd5jeJ7Zz/VXWDBNfEbMiUNVTs13ezo24aJigRI/mBtkfwd+A2ukyJGjifY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aPDQQ9l0; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aPDQQ9l0"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so18897775e9.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Aug 2026 02:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787219691; x=1787824491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IgbKi+IjJPrk4GtW2Ufu1ND7MPHdT58xQ0Q0aiwlQFo=;
        b=aPDQQ9l0gcZEdYP7a9SyH8sQI622lYveiPuspeQNQP2tC/KvpmzGtM/n//JnVQHkIN
         OobvH4WBWtLS7Z9v7pOIPzWRJlMBee60GdfSTkdOJuC1lSc0Dw1nYJm4p7voOUA75Mwp
         OMnxm+Omj7PzLgBloPraBxVsF4p3gvr9jbh2FbmNnIV+FvGZsty+f+GK7IOcHoidSfyy
         U8Kkaa0YSpJAaCqQCJsypZCusQqj5fh7l9hePV4DHWozvDSnDvHbLT6wsm1u/tygBnSI
         mUIgbI3/wWI1R/vCChwNdStq2fuzTF+Y7Yo5AnVdT9Q8zOZHJKuagE6d1ySxG5XsNkcN
         bZJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787219691; x=1787824491;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IgbKi+IjJPrk4GtW2Ufu1ND7MPHdT58xQ0Q0aiwlQFo=;
        b=axMHPlDyEeodi8RR4xpYfEsPWeyoa6lxhkhtYHK4+77OMyxVnQssRllm3VRearCOe/
         btKPLJ5zYd0hjrv4B4PVeHgHoKJ136Pmp5L0krw+JTKDr/M88JZe8z1zHdY560FN1aVy
         O+vMpbkbYFK3FlLckc3AAqhVgb+ktP+zo0g4XSYJK7qKJ+2O89CCElU0XImc5tX22QXR
         8G83xav2+o43JF8v/FMdCkA9sewJnnRXkP6JDIIRgc+Tlf1AKakE7m/fA6A2YFxHED03
         HVGYb+nFt3VNGYZAwWiSoy+RkJruo403wlc7dxAufQQqJEd/hzhLuRl3AdBhGgWQAJR6
         dGoQ==
X-Forwarded-Encrypted: i=1; AHgh+RolEDkLBwgXkcNlpT16p8jdANKAmY9hRTW4BdfxTJUhgRBs1nK9fUVYtQg+vrZe65YBfFpLzaFfxU2x8jFMelR9sQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm4b0LwzvILWf3hjbcUzY9VYcrs0Gk2CpZpPPTXsvN6UewIZbP
	P60sUQNtLcEGZkMQC+OK4VvEQPJlfPWZbFWk3AoqXj15+k+WXaK/IfgT
X-Gm-Gg: AR+sD10rOx1Sl8rLenG4MpjKp5MFgqDfXFo+rq7+W6O+XEPVaURsyqR2zpbtIccJw75
	MO7OuO1YRofJq3KL+jpCqu5rhUEn1SkS0ISCUd3rM9lRzAMa8dEz7iZMTcyhK4LFh567eJYwuKp
	47amf8D0Y9bFX8EADbzEeJrYpBXF2qJCAgJaaUjXdGjyklgK/LBXFUXKQZmhNsBq6OAcS6ysiHw
	KVgzQsRYCZOlVsOOGgR44l6jndticuQxBvL7E++Ejza6KvZ4+UrTvdv1uv6xSk5tDWGUzJH0ceE
	sT4gTqLhRAJ8tzMA03ohxE7cijKLThJF30A4JEkpJciN2/dbA5Y0NCYrFPqOMHSv/dRxPmDYOM2
	jNdtZ1RMCbkQWcVBvH4odfiHbj1c/cnPqmZ9cwM5YLSWwIPEVrjAfartMzKs97j2MHg5lwuWb4h
	xTMMW0Z4krife9obitJe+btEzqgWsmOo9hUUAdpFbFQLby5HqwLSaHe85P+eApVKsJMYtG
X-Received: by 2002:a05:600c:34d1:b0:499:49f3:77b1 with SMTP id 5b1f17b1804b1-499aa14a6a6mr197783335e9.3.1787219691320;
        Thu, 20 Aug 2026 02:54:51 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a702:d301:eda0:8ef1:e1ab:c2b1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa0d6721sm172069675e9.11.2026.08.20.02.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 02:54:51 -0700 (PDT)
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
Subject: [PATCH v8 0/5] Add RZ/G3L USB2.0 host support
Date: Thu, 20 Aug 2026 10:54:38 +0100
Message-ID: <20260820095448.20930-1-biju.das.jz@bp.renesas.com>
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

This patch series has functional dependency on [1]
[1] https://lore.kernel.org/all/20260819191325.217809-1-biju.das.jz@bp.renesas.com/

v7->v8:
 * Dropped SoC dtsi patches and will post later.
 * Collected tags for regulator driver and binding.
 * Avoided code duplication by moving devm_add_action_or_reset() to
   rzg2l_usbphy_ctrl_pwrrdy_init().
v6->v7:
 * Dropped PHY subsystem patches as it is accepted.
 * Merged patch series [2] to here
 * Collected the tags.
 * Added additionalProperties: false in regulators node.
 * Updated commit header of patch#6
 * Moved the host enable patch.
 * dr_mode changed to 'host' as function is not enabled yet.
 * Updated commit description for patch#9
 * Updated dr_mode = "host" to "otg" in {e,o}hci0 device nodes.
 [2] https://lore.kernel.org/all/20260707145135.247565-1-biju.das.jz@bp.renesas.com/#t
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

Biju Das (5):
  regulator: renesas-usb-vbus-regulator: Rename platform device to
    rzg2l-vbus-regulator
  dt-bindings: reset: renesas,rzg2l-usbphy-ctrl: Document RZ/G3L support
  reset: rzg2l-usbphy-ctrl: Introduce info struct for match data
  reset: rzg2l-usbphy-ctrl: Add RZ/G3L support
  regulator: renesas-usb-vbus-regulator: Add RZ/G3L VBUS regulator
    support

 .../reset/renesas,rzg2l-usbphy-ctrl.yaml      |  41 ++++++-
 .../regulator/renesas-usb-vbus-regulator.c    |  75 ++++++++++++-
 drivers/reset/reset-rzg2l-usbphy-ctrl.c       | 105 ++++++++++++++----
 3 files changed, 197 insertions(+), 24 deletions(-)

-- 
2.43.0

