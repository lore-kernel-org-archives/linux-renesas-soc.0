Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8D44078F0
	for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Aug 2026 19:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787166814; cv=none; b=r4XghjkcKzUMKfMPC2lsF0tnf37FS/Y33Eq7CmeEQnm8H6z9BAe15sk8X9vGzREuUlxbJ63PsKvJ7VkfpRZ2SdJohmxTlwYYVWwGW9Jl/euTS7B2j/BL3QoqgIPERkFUinNBsGMBAHIJcopWED6DwATjyET/GnS131dyG4Nnt0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787166814; c=relaxed/simple;
	bh=qcmjD640uwftv+pkhaEtJ2oGth7+CawUN9CiaQ28ork=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lry4oIDb88cRrWz24H7jylVJyPsDgYV+qexX5wMQquj9Oj1vomUN55uoGqqmTqD1gH5EKmi9IqGjluzjkdVPwSLgO01WV6I6jnREr25Y2R2eA2GwJ/p8chRULFs/vrwqqcjWS51oCXhLMp/yOQJxRcwHEt8UM1Vw/bgB3fKMPHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DKtEaq3F; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DKtEaq3F"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-480033bdcf4so804807f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Aug 2026 12:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787166809; x=1787771609; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yP6MN524JLMFiJo4TvqPgz9O1+vEC2UrRKt6aF5ISr4=;
        b=DKtEaq3FMk6QA452zB5bjNIqPprVi5vnbzr8TG/Ubo3w+U710bHSoJNUV+fRK+EEYH
         B/2SM0h0wy/+yy/0hYaZF5ifGLMeBNvIhfvoUOFZ1VYbOxJxkfabLMu/9MtHHu37DpTx
         hF9/IEVC5hYGCbFEFrUOPLbl/VYcwSRQsNBU5vDgiDXhyfR1n5j2suZjEAGAuj3cdwcY
         DHd04uyRB4jFTZCc8GZlZEr1XEx14h2ywS2tX0dJ/NovkdRWaTRrAyAH5hSIWS8vjRXp
         a/e8lQNJO/GdEh/D/Qqmz6aYJkI2o1G8iWQNbtT0vq96gwFgsCjwDxrFoNJxlbZyPJzm
         KF1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787166809; x=1787771609;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yP6MN524JLMFiJo4TvqPgz9O1+vEC2UrRKt6aF5ISr4=;
        b=ndKhA1K9Ss+EdMAo6rf5cYRrraq9qgL/mzZerz1lrYe4aKtzLiJva68W+RDixobIog
         BemkBr6lovSJTwYnEk8De+sReCec+CIX1nn6xB263DcMTweicCpIQjhY5YT2KN3O4iL8
         7kyFbFkxxbG6r6J1GCMNazmlwkiPRzZ2U0tV7gWYwUnJWyum9Slnr7kf7+Q6klFwpOlX
         IXnrbFlbwKFWvjzHFQrRwACw7uAugt3fs7oVl8Ef+CAuSDhVLsW04TkEEXEs3XRfI1F2
         V1hl8Tezjs1J3AxkNwZhj0plTEhDqR/aJbq6kuhgt98o/aB5EDthl4QsO4RVVIS24uEB
         0raw==
X-Forwarded-Encrypted: i=1; AHgh+RqyjXmm+Guz6NG/dZgjXkE8jBbPWBQrF+eGjQxCh63ENKS7q+cYMQP5KtMJyrz2BfLofhihWxrmEK5gR3dwOnHB/w==@vger.kernel.org
X-Gm-Message-State: AFuF++kskOr1cpAKCK0XgSCtNRwHNsIUVmLCcRiNGkOVnH6VL/K2E969
	Kh4/wm0OHpK8apyKsNYd18MlGYBOZSJhGnvZUxMll/j8lPQ6PEiiylyh
X-Gm-Gg: AR+sD131bYqTfaZ514AQamI1EQyVv6qni2mwD3ybYDVVqIU2XjnZ1BD4FDpGLEsp5Ie
	bDPu+v9GLiRIhxwsTlzR2YvOjvUbkm/b1zNZuNkg8gDNKtJS+o+eS7J1IVB5mj0hewTHcwyKcG+
	4fPJ+zUKIH3C3qYStdFlRZhVht6iSTkuafkemeoJBsTsdyqXcqKMp+yTg2ldsTWZwOy+DCWx0fs
	cScCv6dog7S+10q3XkL3oIxqWfbN9ydRwoOaovhg3XWLTjE9R5Zj4gWrf2DPtVC3fPaUI17NXVS
	39dV8BBfEDSL5kNc0zv4syRrB53/yX/tyM3JDt+eJX4Q5KT8lj5sEEd6qShND5D3vcExn1nex7h
	iRkjmJulgW8hBejEHPUH2f5QOQt9FOmFtb7p1Vh0p9CuLjv+XQmY6BzYchf1lQwBdmLnrfehNOs
	F4N9opeTCrm2koFCUf6v2yDuiSbUTqE+P9l8JJsSJZx+4/hel7Fau4IoV1Y470AOmivPFq
X-Received: by 2002:a05:6000:2405:b0:45e:e1a4:c4c3 with SMTP id ffacd0b85a97d-482b1fd970fmr10191823f8f.15.1787166808625;
        Wed, 19 Aug 2026 12:13:28 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a702:d301:c7e0:8c9b:65f0:4aef])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14c338dsm6153398f8f.25.2026.08.19.12.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 12:13:28 -0700 (PDT)
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
Subject: [PATCH v4 0/4] Add RZ/G3L PWRRDY power sequencing support
Date: Wed, 19 Aug 2026 20:13:17 +0100
Message-ID: <20260819191325.217809-1-biju.das.jz@bp.renesas.com>
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

This series is based on proposal for power sequence driver [1]
for USB PWRRDY signal and DSI PWRRDY signal[2].

v3->v4:
 * Dropped rz_sysc_pwrrdy_pwrseq_init()
 * Collected tags.
 * Fix build issue with COMPILE_TEST for POWER_SEQUENCING_TH1520_GPU
 * Replace the large of_device_id structures by C strings, and
   using of_device_is_compatible() will reduce kernel size.
 * Replaced of_device.h -> of.h
 * Dropped local variable pwrseq from pwrseq_rzg3l_pwrrdy_probe().
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


Biju Das (4):
  soc: renesas: rz-sysc: Register auxiliary device for PWRRDY power
    sequencer
  power: sequencing: Fix build issue with COMPILE_TEST
  power: sequencing: Add Renesas RZ/G3L Power Ready driver
  soc: renesas: Kconfig: Select POWER_SEQUENCING_RENESAS_PWRRDY for
    R9A08G046

 drivers/power/sequencing/Kconfig              |  12 +-
 drivers/power/sequencing/Makefile             |   1 +
 .../power/sequencing/pwrseq-renesas-pwrrdy.c  | 137 ++++++++++++++++++
 drivers/soc/renesas/Kconfig                   |   3 +
 drivers/soc/renesas/r9a08g046-sysc.c          |   1 +
 drivers/soc/renesas/rz-sysc.c                 |   5 +
 drivers/soc/renesas/rz-sysc.h                 |   2 +
 7 files changed, 160 insertions(+), 1 deletion(-)
 create mode 100644 drivers/power/sequencing/pwrseq-renesas-pwrrdy.c

-- 
2.43.0

