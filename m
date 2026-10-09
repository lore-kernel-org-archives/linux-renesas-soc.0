Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A213B14C8
	for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Oct 2026 16:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791565043; cv=none; b=F/hxjp9uqFT1k9oacgxdYl2bzU4niYtDGpRDgi5hoGXB6Yg1BLAxEGkLlqG9P6e7mirabFvH8dWhpbkcihpE1AkuWZqTRh9STzQVuxYa620RrRSTJ922dCsGe8mDbINMCTukmcTbiMqUQ1rZts0Z6TepN5eswl+2BE+piAFRULU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791565043; c=relaxed/simple;
	bh=rZC3wFfLXh3OFzPBUj1DGSKdOdSemuPa52aNnHQOy6I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C7t38bVLwe/2AmrUif7nivqpcv7bgW23B1VwByddeqRh3kIZ72QvMoeekpywCPP57MVnUon4M1FzaCa+2hY56fwom3+yuugts+cK4W8FJ4L15UsDUH0Do1kCOqg/2iwF70l6NUhCgp9u9UWfbgCTUjHCXXKqheijfhe83cupB8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nJfUpuCy; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nJfUpuCy"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a020e65269so480695e9.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 09 Oct 2026 09:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791565040; x=1792169840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aWjLqKk0yqxiAbR3S+njyRWfevFYpE6Jwgag5MCgj+8=;
        b=nJfUpuCyTg7HLVCaZ5rL9xWznR1eWLvjrB6ldS7Rr0wVuLkIsX8RYyQ4uEUIkzVmkb
         eF+otPdD6IRv/UNbA/zUHvYyqiKR/CR1TZAxq3+Dymu8QTcwtt+80Xuq+U6XtF3NlNRV
         Bj0rFM0D8xr9U+DdD7ia0KYwTmBjzHGeYA6ya3OaxSkXrJ85cNJ1WkZeKpYFEjrDlnVp
         v3IEQDj6JC9POJldyA7CZSfSjpUv+olu1sxhYOk4T5An1qJUWWsq140O72J6u2mV8coW
         iAijmO+V1noBlwNxvvDikLhCHL8rIQm0Y1F5rOX9RUMpQ1DtE5sKbEVGZyx0mZah7T5A
         uqNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791565040; x=1792169840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aWjLqKk0yqxiAbR3S+njyRWfevFYpE6Jwgag5MCgj+8=;
        b=hf15uOEZy+EFmDnFh3TX4Shf5PRifHiDtNEtUUAb+tIHyRZBB6vZZeBISv4P7kiGFl
         97YyhQRtB2bY8mtZHzaA97wRKwThx7EwWLpiQI8HoLRiR1LcPzO2+8QeSOMTEHGfQZr1
         bWCZXGsK67CgL7pmXEoX1PSgAZ0QYQzPvOC0UC+OEhhm8XtDkz7kz0uX8L2IFef651k7
         Qi/0Zp16Eu0UBSYdu9AF8YcakgqjkPDk2//j630hOYYROhOk5X4X1x6txekYjwLl+DQj
         rVDq5vX4+qhiaVFokAnZ7TybYivWFjKI/Tempu40GbLHkt/2rXI186uI3QH88CcZTyBN
         Lj5w==
X-Forwarded-Encrypted: i=1; AKwUvBwy6XI6KDAoYVl4sslgwUnMGQP9h/evqDxGcUdNQJEB2UZT+boDlAJZNx4oH04yqlyBAY62E1XcwT7M6Z88Q4G9OA==@vger.kernel.org
X-Gm-Message-State: AFuF++kXsbrurAuahOpFC3rdmoPuufu0XFxLFY5rRjhZYlrLv+mKsEh+
	vXbmoLUcgLZf8LupvSyJlldokUA4dqiAAVEKiQCUbmHJe6G5vC+01ggNCqma86xA
X-Gm-Gg: AYBFou2XqqsJTMxAO89CrAftPuOHsVojWPzTkH8t3JRMqt5t+Lkwq14OL2a/qXBZ0GD
	8nzbD0034PrsIrIwIZPb4hsa0NP6nYWjZuC1zEcX3FtAcoWVvJQ7O7ZzNES0smhWRV94Ep1j/lC
	gQEg8Kyi+A6CFoqqD5i6Xtc+6UG3s1XHVbxwB9AGg8FCmfjvgvYnXTCU/Mx8KgGuoMfAKT9U1iM
	R6sRGDvvlVaw2fc9VYDpW7CDEPjBhmHMoUUGKaqUrhJ3w+SUCABUoEOlMZwR+5q8WaPawMC4J0L
	bpPaOe7/6svMGuACF+CkYqDCtN8n0/Ydorvu6PaHv1ScOdFXJMRle+BOWXd6axtGn/igQkdxClj
	4e4aM9Y3jY2Rj8x2PTWFntJzoVRWFG21qeyubfAsGYg7VLmadbX8APs8Q8WLXbetUGwCSg+Batn
	0TDFNvoI/2n9bUNAg5T+T1I0aozWHwfSYCVaOMh33Krqd0OukorRhgJeatjmbrEQol1o0WDgme/
	KeIUG5jI1/oPkquz1iSY6vYLyU+nAUtU/4s2KsdwBrIEtXktntQ+WTh3XprQ8AeLrJxJ+BxK0F5
	Dxb+RrFiUB6jh8CJXg==
X-Received: by 2002:a05:600d:82c7:b0:4a0:17a:8844 with SMTP id 5b1f17b1804b1-4a18e446454mr54043755e9.1.1791565039988;
        Fri, 09 Oct 2026 09:57:19 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:e93d:161b:5ff8:cb57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf1358asm70667395e9.4.2026.10.09.09.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 09:57:19 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 2/5] soc: renesas: r9a09g05[67]-sys: Instantiate power sequencer auxiliary device
Date: Fri,  9 Oct 2026 17:57:07 +0100
Message-ID: <20261009165710.1320233-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261009165710.1320233-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261009165710.1320233-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

On RZ/V2H(P) and RZ/V2N, the SYS_ADC_CFG.SY_MSTP_ADA bit controls the
power state of the A/D converter. RZ/V2H(P) has a single A/D converter
unit, while RZ/V2N has three units sharing the same bit.

Instantiate the power sequencer auxiliary device for both SoCs and
provide SoC-specific auxiliary device names so the power sequencer
driver can manage the shared power state across the ADC instances.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- No change
---
 drivers/soc/renesas/r9a09g056-sys.c | 2 ++
 drivers/soc/renesas/r9a09g057-sys.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/soc/renesas/r9a09g056-sys.c b/drivers/soc/renesas/r9a09g056-sys.c
index e6a66688423f..3895583fde07 100644
--- a/drivers/soc/renesas/r9a09g056-sys.c
+++ b/drivers/soc/renesas/r9a09g056-sys.c
@@ -86,6 +86,8 @@ static const struct rz_sysc_soc_id_init_data rzv2n_sys_soc_id_init_data __initco
 	.revision_mask = GENMASK(31, 28),
 	.specific_id_mask = GENMASK(27, 0),
 	.print_id = rzv2n_sys_print_id,
+	.pwrrdy_pwrseq = true,
+	.pwrseq_aux_devname = "r9a09g056-pwrseq",
 };
 
 static bool rzv2n_regmap_readable_writeable_reg(unsigned int reg)
diff --git a/drivers/soc/renesas/r9a09g057-sys.c b/drivers/soc/renesas/r9a09g057-sys.c
index 308492c31acb..b9def8dc73ae 100644
--- a/drivers/soc/renesas/r9a09g057-sys.c
+++ b/drivers/soc/renesas/r9a09g057-sys.c
@@ -89,6 +89,8 @@ static const struct rz_sysc_soc_id_init_data rzv2h_sys_soc_id_init_data __initco
 	.revision_mask = GENMASK(31, 28),
 	.specific_id_mask = GENMASK(27, 0),
 	.print_id = rzv2h_sys_print_id,
+	.pwrrdy_pwrseq = true,
+	.pwrseq_aux_devname = "r9a09g057-pwrseq",
 };
 
 static bool rzv2h_regmap_readable_writeable_reg(unsigned int reg)
-- 
2.55.0

