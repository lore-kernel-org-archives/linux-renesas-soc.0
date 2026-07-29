Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1669E40BCB2
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jul 2026 09:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785317479; cv=none; b=B+f6xa04HCwwD2s0d0IL2y3DUlDeI+/5YiIqrLNA6omxRsG1xcHVMvsb9ECVkXXUlD9oIX6nhnBBbrAbp6/wxiOk8o1k9KtshdM6bzSZ+J1kpufQP2WRnmDBs3MghE1c8fCyj9nnE4b3rwmmba83hDPuXjssHQ/d0/kpcY4F8iI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785317479; c=relaxed/simple;
	bh=15u40+pLhi5x+nQz+zpktr5A2OAGYH76zS0ua8GK5p8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d41beL8nOTHVEnOufzmNEJg4seOX/cAh2ouFwp/5QLUN4sh3jsqWh7IRpcKytgpb9Swk4Klm9sztrfZ8L5gNIKj47w4EzbE2Hg+yYIhIIWyYF3I5Kvw/Df6IeY5WyFhBw0HDpciBWRgVKYunB29PgXMS8RRE0oYy1/i6tMi8jGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HYVv7qnr; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HYVv7qnr"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47f3b39f2a1so729372f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jul 2026 02:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785317475; x=1785922275; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NGw4acqsR1sAad4BEmjY+ommPVLQEZy4kdT8lCYhgs4=;
        b=HYVv7qnrLbAWnaSwGHh5Z+EwIz1FgWscKEIyFtDqJZqGApn+a1c2s4Xhjs68trV8eQ
         K362ZO4jtlrDq6CG4tlctabrFVx6V6+ao2chbXbzVo9DU1kUsLETBQrD85344JYKK8bt
         E4rzD8VnnO1YhZNteQAxS/XVyWnQkKpI6l5LZwnYP6CkB4a5BPx5xmj2MYRrBpuxYCy+
         RspaNk53O4XZ/SRgBQPKYzKhCpYM5ec1uq01P4W9v8ADfWBql1iFjATQhOoB4ualTrrv
         ug0U3UrfqQjGtrkm7RWWThtY1/gEmvM1Rt0pCDDaowHG5OM+4zWxb8k+jFSYcqeJ217d
         GMrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785317475; x=1785922275;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NGw4acqsR1sAad4BEmjY+ommPVLQEZy4kdT8lCYhgs4=;
        b=Iuk+jD0wozKcrhuMj5cFXJvpUFFmxNWFo4zCDL+8kDWivNTyTlJmnOZgN19S2A1xEN
         Zz6VuXw2vl5KcYbdUmNGfPOT/9+2wr8GJXAFQrVgAJMBQeiy8G1sEikN8YhE/A20wwTL
         tB3HyIPOIGihnbXISs+XHcW+7zMgV62nuE005mnd2ICfwMT0i2CS4GUuFtq6RuI6aw+m
         GHPLTGLvD5EEiKt3Sye9Wea3587LmC1DHL/+2y3zCN1lcH2xouqISnYEVbGUU0UBlTPW
         ONrkpP/vvsvX2taawQv+5VU91VpwZ0bgXjz/OuZzvO1xcW1qhGHxg24vAb3eaHi35IPn
         1Qkg==
X-Forwarded-Encrypted: i=1; AHgh+RpEp1QbulZ2+YYgJFOj5AchwIqmVw33niwYN28LQKq9ll2My+faDNFlz01Xl8Q3RXA6xYZBevm3ca3hyACGXT2t8A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJOzT78T1r+FRL5wL6snstNNeSb3tNl1NEJIEnw/9AVe4o6GBG
	GmfdeHpKI6JmV6LlPzWKty+0VYQ81wCljzR98zypbRnaWhZTrV0/qb9m
X-Gm-Gg: AR+sD11ZMDaqOM1ldF4drjSlFg2YbNTXHgYspC1UBEXh6aDLYk/oVRk+AFPyUmp7JAc
	CxZuRB/FbLrm0Hz4nZ4eNh1AwGnXgN0nd4FP6E6qiMTNaopgvo36f0hwGXHd0nEBamgsaLngur+
	FoquynkDA8s7GYn1xXqlr+Y6D3RTFIhQzLANPeVQZhfYuo0Z2/byjD+5UMnrLF9tZAtE6VHsolb
	QdyNbKyzmdybjuY95gqijpOf+lSRnz82cl4c7YZbQWC74IwA0ivEeO6uGrCw0qR/MSzViel/KWJ
	CHR2CRQ35+mHYub8DXXBTMfXBCPZHiHtBrl52gZ/g8bPEUz4r/AyNI8M8A9SNA3J3f10mk3s+xM
	iU/ZFnDOaEY9V7XSupEtMUtM/QZkD/7eI22XASqfJOp7EUScpA/c5biKlgz8ZAhyQ47I7o8+69f
	hdqxwXmkBLu7uINFtERhRrXPYRFRLR0QTtYUF6x/zIMDZjYrJkydXVFoSIvBdh+rid4F1b8MNyl
	/1GIfim7D6+CMQ=
X-Received: by 2002:a05:6000:2403:b0:47f:9661:6766 with SMTP id ffacd0b85a97d-47fb1ec4d77mr7367485f8f.61.1785317475006;
        Wed, 29 Jul 2026 02:31:15 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:10b8:4461:ee04:15e2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6aa3935sm6766388f8f.4.2026.07.29.02.31.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 02:31:14 -0700 (PDT)
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
Subject: [PATCH v2 0/3] soc: renesas: rz-sysc: Add RZ/G3L PWRRDY power sequencing support
Date: Wed, 29 Jul 2026 10:31:05 +0100
Message-ID: <20260729093112.98324-1-biju.das.jz@bp.renesas.com>
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

I will send USB/DSI/CSI driver patches based on this series soon.

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
 
 [1] https://lore.kernel.org/all/CAPDyKFpLnREr4C=wZ7o8Lb-CZbQa4Nr2VTuYdZHZ26Rcb1Masg@mail.gmail.com/ 
 [2] https://lore.kernel.org/all/20260704093433.273672-1-biju.das.jz@bp.renesas.com/T/#mb6f18d8fa9a194fc0a15db5f4938df420da7b6b5

Biju Das (3):
  soc: renesas: rz-sysc: Register auxiliary device for PWRRDY power
    sequencer
  power: sequencing: Add Renesas RZ/G3L Power Ready driver
  soc: renesas: Kconfig: Select POWER_SEQUENCING_RENESAS_PWRRDY for
    R9A08G046

 drivers/power/sequencing/Kconfig              |   8 +
 drivers/power/sequencing/Makefile             |   1 +
 .../power/sequencing/pwrseq-renesas-pwrrdy.c  | 139 ++++++++++++++++++
 drivers/soc/renesas/Kconfig                   |   1 +
 drivers/soc/renesas/r9a08g046-sysc.c          |   1 +
 drivers/soc/renesas/rz-sysc.c                 |  21 +++
 drivers/soc/renesas/rz-sysc.h                 |   2 +
 7 files changed, 173 insertions(+)
 create mode 100644 drivers/power/sequencing/pwrseq-renesas-pwrrdy.c

-- 
2.43.0

