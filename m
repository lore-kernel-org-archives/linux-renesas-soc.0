Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3A13BBFD9
	for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Aug 2026 14:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787150193; cv=none; b=Eup7j3igQqBNPtJ91Fafaxdi6nlJcC9AzavOjgbzkxGgraIdHAt3vnU/77PCIZiJwXdvR75r70lnqj3GKpwaoIfjxQkCpbjHfHmr6eSUik/tti8ukh0bKHXCKAGBaHeMdZ9tdIqr9ySIbdxWtZ5gpJs5pDeOf/Fmni0tg+JvQ9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787150193; c=relaxed/simple;
	bh=BgAw/rTfxrVoiubtEgGrhMPn7zF8kR5RDzNHbva1GEo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pxlLontMk++aLRy0RHJ1yPDwjFxFAN/X6cJoA92wU/ebnzJXWysZrgqbrjaykFOCGQxLMoE/hxbH2tXT5RzPH2RC4+Tahs0QL08jy3dwdgROJlQHf0Khg5qNWvmMSgQcSN/q/or79g+/f3w/RhRP/0Dr1AhFnhol/ABEPD3BysU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=mLcm2kAJ; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="mLcm2kAJ"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49557167508so11657205e9.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Aug 2026 07:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1787150189; x=1787754989; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tFQzFy9N4s2xQcKw/cm/7CXhwip8F6Dt3efFgFZwCwA=;
        b=mLcm2kAJKlB7mY0ZGyCjxTyq12wb3Uboi/dA4AnEKnGuxxdbkd/4GO4fTl7dqEZmng
         JzdHqqbSutI7CFHeIeSIMxg2f3lZqQQ2zyrWtqc5WsBjEBMerKrhRs7VbnMIsrm7R/xh
         qpfYQfEo7/aN0j5uYHfAhi2VcUylsG5OgTHQp1dD0E3Zi9k1iGGpqTL5xPbT774KNc0s
         /y78qfjkcH9Grj2COpzke7cVHOjpK1OvFgWbDd/n09WC8Rx/+9AF+2FoCKJHtrFm9neo
         bSEQLbpnxEyqa+wKWjeGD3Ueh78Z016n3zweYf+lYxM0HVnNUwMOQwyDxomFDuwQy/1L
         EMLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787150189; x=1787754989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tFQzFy9N4s2xQcKw/cm/7CXhwip8F6Dt3efFgFZwCwA=;
        b=qMixYQcsisAOOn3pV4qZNlvPwSPQXp0VjdDGg+Ao7tDhtd+l7xtiIu3S5YA8CkQSfL
         oJ9df48ratjUraOndIiyc4xJA6lC5oWDYD3EYbzgMW8bpzt3Gg0F7J/Cp1AhXlLztXI3
         gUHye9Uy5qH8O4p5UlmWu8YxfM7t9RUzX1Y8N/Wh5t1jfSW7qnkgE/pKkPy9w16cu+6r
         oyxumm+5h6xlOHyUEdqalgjPHKeQgSxyim1sOH7Lwx/PGJj0OmAG2XoI8F1cQQW+hEFb
         ipae3vknye88jufgigEh9Rsu0WHNJAMGlCEmaFY6iN8aAyUaj216tBNgZqkdGU5KIUEz
         oxMA==
X-Forwarded-Encrypted: i=1; AHgh+RopVy0eANf0T9S7BrCYEXBxD7Ja7NKQ67hAeUCw+p0NhCuWomK6J2p+V8TnjnUlCJ2VdgZrxMRG96rnv1zZ4K4yIA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy84LDIpfwDOS0AS900uHM20ZMiF2jI3RvCgZQzvsPWzzOx5gmr
	MThsK7FW9X/meFG/ajgG4EApAlvQxHaeag8lSQTqpZFycoycTDrgE4bEJEQ0n4LXYdU=
X-Gm-Gg: AR+sD11aaGDZzI83v4KnhMqLokAGyNIlwccdbPwsHREe6v1QwcfBaZ+wr4pq4tnY8IO
	JGZ1xQoEsu6+PosKszyqCqJs9AcmEF0Ykn8JnDh4073EWsx6DRZHSsXmdedXJURt4PUVzMxCLTO
	aKL2n9AXE6Mj+aP5Uzr9BWwbcm83aG0WpC+R6CFj/Msn8OGZGgBYh1oW4quSNmIiVtnVkD7ewFo
	rSoYuztchKUrwlH+mrKJbvrvLmyucPNAhcpUBBtwjY6snxco8LgvwKHHwAk4u+5aVoLS8KEm8eM
	09+kGapAk6/nSH2Mp+56QeyUIgqYwhdXkz3goBt0kaMgTuXy1iCS/zfZcEVV9mIRfOnywpj4OIu
	R8c67e9hh5Po/bN8nW6P8aP+dapFhmVdCZG69TjEyKoa5LKVYD1wR9gfnFb3w0SL6mIvljQvlB+
	Sl4lR7Xbe3OcI1ku5sprul4hHgab5R3Uj888kB5fPNBkzVdAdmaO30jvwYKPuDY6ZYGSvZdAK9F
	9UOg8EdXnyWRVJ77beLtGIA0nNh/LDFBfpJMyqH3S+gOvwc+Lo=
X-Received: by 2002:a05:600c:1d06:b0:498:943:ccc0 with SMTP id 5b1f17b1804b1-499aa1a8726mr77965835e9.6.1787150189247;
        Wed, 19 Aug 2026 07:36:29 -0700 (PDT)
Received: from claudiu-TUXEDO-InfinityBook-Pro-AMD-Gen9.. ([2a02:2f04:6400:1700:e978:dd1f:393f:9962])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499a9e37284sm32671235e9.4.2026.08.19.07.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 07:36:28 -0700 (PDT)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
To: geert+renesas@glider.be,
	linusw@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v5 2/5] pinctrl: renesas: rzg2l: Drop defines present in struct rzg2l_hwcfg
Date: Wed, 19 Aug 2026 17:35:50 +0300
Message-ID: <20260819143553.2478984-3-claudiu.beznea+renesas@tuxon.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819143553.2478984-1-claudiu.beznea+renesas@tuxon.dev>
References: <20260819143553.2478984-1-claudiu.beznea+renesas@tuxon.dev>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Drop the QSPI and OTHER_POC register defines, which are SoC specific and
accessible through struct rzg2l_hwcfg::{qspi, other_poc}. While at it
move the assignement of rzg2l_hwcfg->regs->qspi upper to have the
initializations as sorted (by offsets) as possible.

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v5:
- collected tags

Changes in v4:
- none

Changes in v3:
- updated patch description
- collected tags

Changes in v2:
- none

 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 72e0783d5845..9c935dc47555 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -180,8 +180,6 @@
 #define SMT(off)		(0x3400 + (off) * 8)
 #define SD_CH(off, ch)		((off) + (ch) * 4)
 #define ETH_POC(off, ch)	((off) + (ch) * 4)
-#define QSPI			(0x3008) /* known on RZ/{G2L,G2LC,G2UL,Five} only */
-#define OTHER_POC		(0x3028) /* known on RZ/G3L only */
 
 #define PVDD_2500		2	/* I/O domain voltage 2.5V */
 #define PVDD_1800		1	/* I/O domain voltage <= 1.8V */
@@ -3813,9 +3811,9 @@ static const struct rzg2l_hwcfg rzg2l_hwcfg = {
 	.regs = {
 		.pwpr = 0x3014,
 		.sd_ch = 0x3000,
+		.qspi = 0x3008,
 		.eth_poc = 0x300c,
 		.oen = 0x3018,
-		.qspi = QSPI,
 	},
 	.iolh_groupa_ua = {
 		/* 3v3 power source */
@@ -3832,7 +3830,7 @@ static const struct rzg2l_hwcfg rzg3l_hwcfg = {
 		.sd_ch = 0x3004,
 		.eth_poc = 0x3010,
 		.oen = 0x3018,
-		.other_poc = OTHER_POC,
+		.other_poc = 0x3028,
 	},
 	.masks = {
 		.other_poc_pvdd1833_oth_awo_poc = BIT(0),
-- 
2.43.0

