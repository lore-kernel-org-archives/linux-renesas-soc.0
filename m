Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D84442AFAA
	for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Aug 2026 11:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786535422; cv=none; b=dIjGl1yaLmeQGaJpWYInBbVpDr319puqo/AOoCRb4Z0s1ed6N/q19vToU7uNIbsVkGxekhEa57W/Pscs9uw4ZDOYXAgEkOAhU0miwz5w+i1s0Q2d9TTAyYOkE4uiSntcyX349B+XH+Yb8f7l4pt+Zvq5NXtm0+4aHM02qqbaW8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786535422; c=relaxed/simple;
	bh=8/0nwJ5lnRn3Y3yl0yFRYA7zxu5zVJ7w96ZSy/sAiRw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FR3zOa5nWiOSnX/ujcm2eewCG3muuz6xcaQngGXlNrquiB1YICA9GWZ+jdITCra6HS0sRP5VwbWMPUxbvwgtq8FAEX4Q56eaVg4YIP8JHieRVH6UAibqWE+7J54icVWxHl5dosp1MnE9XKL7Br5JJExVqCFe2yx6GDRyo1NCQ6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RyRAyDzD; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RyRAyDzD"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47ffaa8ebbdso704313f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Aug 2026 04:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786535418; x=1787140218; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=A999a1eUHTXyHyUaTUVFT56YXEqwnzjX5/b3MG+b7Ls=;
        b=RyRAyDzDyQ/eK0pZ/JLRIdRnGb6lVVbBFl5l1scLO3dIypxoaD6+IPmz0VrYxz7icB
         rQxGAG+l0/gDfxWzxZ+zrHl/dJgcvPav+A9gK0JQQz4M7pqpOQoCe6ocsU4kLYpDMaMj
         nR/vvauM/jab6NKU3+Mq8tvpFtiqsukCpfGoituZIva5jOj/gbUrawkDCl2/QNCdj5sH
         8HD2Ya1i49A8ALOcMsH7NAqjBqKXwwPgMyi7/ElUCg/5VE6yIkfLocO7pQgCJaJPWYIz
         EmcVz08VeAjzgAI1Q+Z4Ir7TkhoMsTV7LxAHgPGG5K17qCzTXPlrDiCWEiX8Mrpz5dDM
         +Ppg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786535418; x=1787140218;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A999a1eUHTXyHyUaTUVFT56YXEqwnzjX5/b3MG+b7Ls=;
        b=c+CKDmGDI4WfrUwbNv3blCboqFqGXif9gd9x0JyCDGAA2RJDN9s4jwlu4ZJ9FfipkJ
         qtOmNDIn+ezhtK5ad/7ksinAPlvV5Ut6A70c8yrIsBTxFajW9kRyYe5FAuMRFR1u/Hs1
         WUrnPnRaeRYRjom/pX9tU5g6XqKRADSiB/oQPvAFp5ADZWauKPLVOATHGwJKNGPgNo0q
         aAg2IhZooTFJYPgAg7ebWLmcjedu7ixyugkzheOAH6njkZ8M4Gql1TKDh996GQM2Wyfu
         /+kXTk3304J+lOYgDALMoG3nbjq9OkaFdOt04HrdI5igrmYDoR7k4J3ohhT5rTt+gzfC
         1vUw==
X-Forwarded-Encrypted: i=1; AHgh+RoVBq528gSs2XitlwuAQJdrJ4ARd0MhkeC4rBL4pT12q22qMTzWeWR+AnB6wJQRtWjtoAyAUQA5sMNERswIWtAjew==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPMcNZ6UGxL2kj1SuUWMynAlpjUmPdtoFgOQAZ960guSFQFCeU
	Mtz7FnmrrTcV8yYCn+4xvBwPrChIEZX8Ss87YqWVaDrv5aqehiCGiZJW
X-Gm-Gg: AR+sD10GGRHclZRf6xR2wTY6zvr31HcP6tubteje7ASbZN6Yu+GbkWuFzbR74rhcQKt
	zSDO61q1r6Vuvkdcgv5eyaQEdZQxILqLkAWax+UIata3yeL8VPqgrmEbLjO18jOnFZn5/dQEvbs
	Un6SDpkhJRvBl8frghR3zvjrnbeVu++1uGL0aOqviAKUTShtEfqHn6xQXU0uHze3Gfm98zhj6FT
	zgYdtMecX3J799zkUCbdW5rxZX5DoRWAji/dNWr9xA+ceKPYRhajMgNMpUzPcOu/d1Npzu6VHIF
	Pctp8Rf9AcXD1c7zfxEfiejo51mZ/2tp9ZOo9rCsPxFSlhL2Xjp5WQpmGJiHcBrmSRYrT/1kuDl
	plPz4KeqsxH6qhh4IBR9Dc535jFjMhAgvYTceRgeOEiLkHUnCMRDJ2LFLZP383nybyvK+vhGCOc
	i2pAJ3BC8PLhZaDnTSRYyYpV67JtGdqbQgGflqoVtdDWB1oZy7m+2ViM2ybaN480VwOlYb+8eAt
	jnIH3S52dFefw==
X-Received: by 2002:a05:6000:2903:b0:47f:eb80:ff42 with SMTP id ffacd0b85a97d-481528abe08mr5741601f8f.4.1786535413564;
        Wed, 12 Aug 2026 04:50:13 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:94c0:1825:d248:50ae])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815231c308sm6219090f8f.11.2026.08.12.04.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 04:50:13 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v3 0/3] Add RZ/G3L PWRRDY power sequencing support
Date: Wed, 12 Aug 2026 12:50:02 +0100
Message-ID: <20260812115010.108322-1-biju.das.jz@bp.renesas.com>
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

Some RZ SoCs (e.g. RZ/G3L) have a PWRRDY register that signals power
readiness for various IPs (USB, DSI, CSI, etc.) to their respective
controllers. This register is part of the SYSC IP. Add a dedicated
power sequencing driver to handle these signals.

This series adds that support:

- Patch 1 adds a pwrrdy_pwrseq flag to struct rz_sysc_soc_id_init_data,
  sets it for RZ/G3L, and has the SYSC driver register a
  "pwrseq-pwrrdy" auxiliary device when the flag is set, so a
  dedicated driver can bind to it and handle the sequencing.

- Patch 2 adds that dedicated driver, pwrseq-renesas-pwrrdy, which
  binds to the auxiliary device exposed by patch 1 and exposes
  usb-pwrrdy, dsi-pwrrdy, and csi-pwrrdy pwrseq targets, toggling the
  appropriate bits in the SYS_PWRRDY_N register via the parent SYSC
  driver's regmap.

- Patch 3 selects POWER_SEQUENCING_RENESAS_PWRRDY from
  SYSC_R9A08G046 so the new driver is built whenever RZ/G3L SYSC
  support is enabled.
  
This series is based on proposal for power sequence driver [1]
for USB PWRRDY signal and DSI PWRRDY signal[2].

v2->v3:
 * Updated commit description by dropping devm_add_action_or_reset().
 * Config now selects AUXILIARY_BUS to avoid compilation issues.
 * Dropped the cast in devm_auxiliary_device_create().
 * SYSC_RZ and POWER_SEQUENCING_RENESAS_PWRRDY config selects
   AUXILIARY_BUS to avoid compilation issues.
 * Added match for consumer device and added of_device.h header file.
 * Replaced regmap_update_bits()->regmap_assign_bits() and updated
   the function parameter of pwrseq_rzg3l_set_pwrrdy().
 * Simpilfied probe() return with PTR_ERR_OR_ZERO macro.
 * SYSC_R9A08G046 config selects POWER_SEQUENCING as 
   POWER_SEQUENCING_RENESAS_PWRRDY is defined inside an if
   POWER_SEQUENCING block in drivers/power/sequencing/Kconfig.
v1->v2:
 * Switched to devm_auxiliary_device_create().
 * Added regmap parameter to rz_sysc_pwrrdy_pwrseq_init(),so that regmap
   can be passed as platform data.
 * Added a comment in pwrseq_rzg3l_pwrrdy_match().
 * Dropped dev_get_regmap() from probe as regmap is now part of platform
   data.
 * Added a blank line before devm_pwrseq_device_register() in probe.
 * Dropped the error message devm_pwrseq_device_register() as probe prints
   failure message.
 * Dropped local variables dev and regmap from probe().
 
 [1] https://lore.kernel.org/all/c7fc31f1247332196516394a22f6feef9733a0b4.camel@pengutronix.de/#t
 [2] https://lore.kernel.org/all/20260704093433.273672-1-biju.das.jz@bp.renesas.com/T/#mb6f18d8fa9a194fc0a15db5f4938df420da7b6b5

Biju Das (3):
  soc: renesas: rz-sysc: Register auxiliary device for PWRRDY power
    sequencer
  power: sequencing: Add Renesas RZ/G3L Power Ready driver
  soc: renesas: Kconfig: Select POWER_SEQUENCING_RENESAS_PWRRDY for
    R9A08G046

 drivers/power/sequencing/Kconfig              |   9 ++
 drivers/power/sequencing/Makefile             |   1 +
 .../power/sequencing/pwrseq-renesas-pwrrdy.c  | 147 ++++++++++++++++++
 drivers/soc/renesas/Kconfig                   |   3 +
 drivers/soc/renesas/r9a08g046-sysc.c          |   1 +
 drivers/soc/renesas/rz-sysc.c                 |  21 +++
 drivers/soc/renesas/rz-sysc.h                 |   2 +
 7 files changed, 184 insertions(+)
 create mode 100644 drivers/power/sequencing/pwrseq-renesas-pwrrdy.c

-- 
2.43.0

