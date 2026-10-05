Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58DA02D6E58
	for <linux-renesas-soc@vger.kernel.org>; Mon,  5 Oct 2026 11:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791199141; cv=none; b=gCdSpO0YCNfEqc78M4cXERzldMF+fQuQTs5e925wAH45o0w6wpQ/P/oUFwIltxGNudA4WaZJZA9S4f+SRTAPunC/jkdUIDe8yjD8DmKgUXCmUhEbK/hPl7Co2naMJkl2WTVmMVmYw27NmCMWasDHR+MKyFyx/Y9/yvLC+iOSjTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791199141; c=relaxed/simple;
	bh=Ig2ZTvrqWtYt8Sbpvk7HzIITGUNhqQLhN/AOoYzV1K0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NSgkW6G+bMVKAGIa+V6HObUMl8jnN6FqwLPnzbev67Se2CkEm74EECCHbjRyCbRT5+tD4RQniyDBlOTdAwyFk1F7J/adDwraielB7NNmuCcP364iYjOmPaIJ0KnFl034555PcVgi4LPQOXbil5UhDhrDdkqpDMylracc1aJbY7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ilcNPExu; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ilcNPExu"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48c4649b35bso1654532f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 05 Oct 2026 04:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791199138; x=1791803938; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HoEztf6mwP8dfjWxbR9MjyoyPhSyxBCL6ZxHjbnwW6Y=;
        b=ilcNPExuhocG9ltsOuMbzfcbefzCf8QRAy/jaLHt7M719U/yaYwIofa81axDtALXuz
         CimzPpOjL29MTOB42Mp3OCVj2hlyCkOnSPdf3LJezNxwEJL4Mrna+d6ed6MeZ30oBUVC
         2YdYc12s17sLwPXDcwOJ9Sdalxi+mg6/72ldEW/4giTnTJ7vvpsQgDKkASdQKvAU+l0a
         yeYp/0WMltRkjplzWtv3PEIBKuaWwHluJRDt7udxTpSQ/N/0fhBuD6tMSoN95gc9hTP5
         s3u0CKy4nCZ1mnLrMnO8NJEkIGN6hC6iiqiUjaZSCCfcEttk+fwMQGJ9tQ5kDuj90dJQ
         RPsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791199138; x=1791803938;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HoEztf6mwP8dfjWxbR9MjyoyPhSyxBCL6ZxHjbnwW6Y=;
        b=U/WGcRSk1c/1WT4HhKUCFGFTac9OyhLRz4oiAFFZVblgXjYNTOom5UIlmDdpoyPwhI
         xUo+jYOi1XE6fi5Hki4p/GPSDg5M6IsLZ6LQZ7uij5CAtWdKmQKiffl2tm7l33p5zttu
         51GPOZwZa8BAakRlcbm/vwv+ujmlC9ZvSXyJvK9LBdJPGGVKYCkvfZ0TflL5G7kwC6zx
         F11uJONI9isp0zOxXmbghmCcyYbtQVKnYgVh9MDWPWltrccoXz3OcWHb0ZvzUvfY99V6
         aSMa9vo0agEItrbaZt6SuQyWaIIbyJrmAFuKKRol7EFBWgt9m2eiW0i2kL8vmkZYDXAM
         LinA==
X-Forwarded-Encrypted: i=1; AKwUvBx4wW8klySk4wpSlRaQVgifI0Q5XZrSnHOWQJqEwkVEyDiT+mk+ExvPkDi5hNZlYIoLxQQibsdqiIizfOTr997eaw==@vger.kernel.org
X-Gm-Message-State: AFuF++n+NLqYzEm9gnzY+opUDBkl1t83WP3GTQmBYF2VEUqpyQg7oNmW
	yj4aB2ZZQ11PfHu9IFaDu8Ee/s0r3t3oPbVvbzVavJIqUQcFOftpXeTW
X-Gm-Gg: AYBFou3HTQ1E9CmligIQQxsd4/p8zMc7L//PynzYz/n4UlihzKpik/wo5UdDUTsYP8G
	QrfE5ub2+UAgYWISI7W+LI28z4KglS+n7YhHQGIh7wq+lLYXZveNdpE1mAqIW0Bzw75ZG6MyvgY
	wJF7UeH62LugUJ69Vee25jpw9p42aj3dzbdkOc9pnkMNylCEdFz2gVVGPC3NTas0f70JMRTfE/y
	eo0l6IfaKI3AF0gAiy6Ug0q+nLuhiIuG3jYwt33og2NMlL2SqFAKUSQ1FgVaB6v/ZDvFK7cl3Gm
	of3KfCUwiwvAz3lVKHHF1Ml7leir/WYRYhlyVxepvEmYMK7bSuVgS0iz1CTfBEoN0SrIcHdl97T
	CUiKOOdYKPlx5xRJzmTJoESDvkVrQLXsmv/hJaZdrsGeXu0RfB9NPeRPvNavtoOngiK5VhnKSd+
	tUf4D9by7ei2GJBj4+C70upPgqzFhaOgF6Br89K6wwY23sLaGJppxjVlZWP8x1yVydh9AQCribW
	Lsb6MlFpcKQWbGIXrwGuHI=
X-Received: by 2002:a05:600c:34c2:b0:4a0:23f:8b0d with SMTP id 5b1f17b1804b1-4a176c949d4mr9168955e9.2.1791199138185;
        Mon, 05 Oct 2026 04:18:58 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:ddf5:4eec:313c:43f0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280bfafasm355884865e9.8.2026.10.05.04.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 04:18:57 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Chris Paterson <Chris.Paterson2@renesas.com>,
	Biju Das <biju.das@bp.renesas.com>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v11 0/5] Add RZ/G3L USB2.0 Phy reset support
Date: Mon,  5 Oct 2026 12:18:26 +0100
Message-ID: <20261005111854.275120-1-biju.das.jz@bp.renesas.com>
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

This patch series aims to add USB2.0 phy reset support for the RZ/G3L
SMARC EVK. The RZ/G3L USB PHY block is similar to RZ/G3S, but each port
has an OTG controller, unlike RZ/G3S, which has an OTG controller only on
port 1. This series migrates regulator driver to use id-table so there
is hard dependency between reset driver and regulator driver.

Merge strategy:
  An Ack/Rb tag from Regulator Maintainer for patch#1 and #5.
  All patches - Reset subsystem

v10->v11:
 * Fixed the build issue on loongarch as reported by kernel test robot [1]
 [1] https://lore.kernel.org/all/202610050445.WP4OvIgZ-lkp@intel.com/
v9->v10:
 * Updated cover letter header and description.
 * Updated commit description for patch#4.
 * Simplified rzg2l_usbphy_ctrl_pwrrdy_init().
v8->v9:
 * Replaced pwrseq_power_on() with pwrseq_enable()
 * Replaced pwrseq_power_off() with pwrseq_disable()
 * Dropped redundant devm_add_action_or_reset() for pwrseq.
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

 .../reset/renesas,rzg2l-usbphy-ctrl.yaml      | 41 ++++++++-
 .../regulator/renesas-usb-vbus-regulator.c    | 75 ++++++++++++++-
 drivers/reset/Kconfig                         |  2 +-
 drivers/reset/reset-rzg2l-usbphy-ctrl.c       | 92 +++++++++++++++----
 4 files changed, 189 insertions(+), 21 deletions(-)

-- 
2.43.0

