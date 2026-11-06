Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793963381;
	b=b73UzCMoxx1iL3zIQLmLSwLVlumtp7DPCMjoU0v5xCTURsydcxdWQMFSAClJ6IKoSzmR
	 lV5A7nVK1VTMF5YipRiR6sAugyjUjegEvj/jmCTLp1NYcuBWuWpwbl01huCR7BVVxQJDe
	 0dMHZq0OXs/JR0B6Yw6DfUM89sIIdyz4Fp+BZUtVNx4RKveoviQljBbAuKYj1PUXJMeN0
	 oomb0yGpolP2LjqU12iwFz7oMhRcsLbfb6s3AkuEKFWuZNeNVCqPWosKXx5GVc59Kdq3y
	 0LfJLijhOcwplNLb6cGQV6m4G8+EBV9KXoiEIdz4kSC/GYIX7T+YikYb8DysI3sjarw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793963381;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kRZnFYcOPcT7Wj77cIQssMiZxFc0z0H1rY/MUaYgSUg=;
	b=C0oG8L2tw+El3wsXMCgERqWWTA2VD3spHdfwzjITP1jHDppBkiWZP6rPY4UfWk29y0Yp
	 wcXQrc3Og5480fEVukypEOTvtv8d6mOCf7woOPdxUoHvLohotmbbZCdiRffoAUyCh8N5p
	 sWUplIGXy7+6J6jGF8Ylw/hiiqavdQmpRPYs940xGPpx//67hD+uyhCoSJAGcOSFRnrsc
	 yfEtmanWcqM2ZCkL8fvVDowhDaU4fzh+AA2pgQos4yOAnK9HGL9inlIp/Z3fZ4mr3uxZY
	 0TbYIr4uK7bWRZDuB7YQrymBtJEdltcvZ1+C0oT5QY4WF4J5yvJXD/XHjuDnJ0eBZog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DIl88d6n;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07588606A326
	for <linux-renesas-soc@vger.kernel.org>; Fri,  6 Nov 2026 11:09:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07588606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DIl88d6n
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-490585eddfcso345370f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Nov 2026 03:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793963379; x=1794568179; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kRZnFYcOPcT7Wj77cIQssMiZxFc0z0H1rY/MUaYgSUg=;
        b=DIl88d6nhmwOGknDnpQMw7CDUEcprSXVTAPuRqwC+aviu4k/vGuQALYjTSBcSCtDib
         A+O063FGBBxZSI4K4lMMq6PFNcG99PZP35ePyg+HwenKZPHBHiBPHcxuF+zuRfte1zOr
         WQ8Jgn2U0SWilYh+xF7PZ5bmOeBVb3P95PLFuVhKhy6OWmPK+yWFicrpRnEPLTyHUmZr
         7WU8uSJQ26KmrcpwBThcG1AeCk8uzvMrk0X1on+8fSFXeoX0eVFHpDprK5+Dva6bqySi
         0D9Dx13jA+Az5kGNfDHPQDwUSdxxmmQAECT+DVJGdOM8paiXQ6+gbYLKud+bdvkyUMVq
         39FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793963379; x=1794568179;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kRZnFYcOPcT7Wj77cIQssMiZxFc0z0H1rY/MUaYgSUg=;
        b=qvZZO5V2mjA3I+UsleKI3u01VnurEV9/qO60pmplmaVjcucWT2hrxJ8WXfZLbFklux
         t/YPk/yW4uI973t7RXVnRByNyY+5eRwzZVHzAyato48GD94oPCh9LSJ2uy0ubZBGedYC
         OCkPG13ZUz7zh1jdgtqTIREraOzsxulViEIZ609yoUqIIiWT3gVrm9gIy2BvxqofRBp8
         RrfsirNCq3zi8qG3w12rjqgW02mPphNq0cSLD65tSY+ThfSH0eBrmGzN/pUmDbmHV+Th
         +GPP9puaitk1wju9MmTPYLWBPMPVbx7u0pu8M9RmDvTaKgxwGQpvk8vh4keWOjpVuawK
         GgXQ==
X-Gm-Message-State: APuU4Z9z/WSUMTxiAacWRF8PQBrRXcQQQzFeP0myZ3tRIXAOE/qXG2y9
	PKeKYM2k0JTf4vpY9sEv8D+rTXKBaQAuG+ATjylK22eq4bEr2uWNpOewYlC4njbQtm4=
X-Gm-Gg: AYBFou3U92WLokmiRstRyzfzWa5tV9w6BFY1n++z6tHCtGjJxNudGKkXAGI1CYdXIvI
	l+TyH3A85pnyb9bUF6zM0JaP5xex4ucT0biL/fJJOWE1/wrjExGn3ogTMgiKdZJel+MkCOXGYTy
	TR38sV5RgY9w3vGQm6w7iUXpj8kR2QH+eAITPaC+icnqhmaPB+LvDqS5dCZAOAIO3PWDQpyjvh2
	wyTrMdCCKPv3U7ZZUNYLO2/KQb2OvZAzh4ZpGghFyGVMyHDeWY0FlYE/F41vE7iIBnC2n3SZPC8
	MxxjiOjMLgqUGQz1cXPxldzHQLukwGx0HoCmgRTLCmjFlHoVkdc2RS5GmQmSIZcdBmvgdW7oN+V
	3z1EnqRCTPdyFRUfl5JLbFSyy1iKvRqX45uTbWbIB26K665zzppmWy7eby4oa6I2gdgvly4jhWc
	D4/N9cb0v2+301x4uczpOe/VnByQ9fvYNEDaFhsm5rqkJxi+HiPc1fym7zaEbXflO6D0P9/mAQQ
	sFgGbhC6lo56W5pmT+icoUgvQv7vZZVlqqPjytt3YQ87rUJkdZVlBAh/uGrnEiQBSNErb686uLn
	tT2m/wDBOP82rWZo6xEw+dUcqKLTMK3kGEwpx+XSBFMmZAsJ204NoZuwO/cZjQiTgZ9IN5Z+drQ
	YLLx1ogA6MbdX6uh6X4eV24XL2szxLX/qv187AHBpJYKnRWFbFr3Nt7ERM2vK6nI2453GlCOm7A
	==
X-Received: by 2002:a05:6000:4283:b0:48e:3b53:e100 with SMTP id ffacd0b85a97d-492781748d7mr4732531f8f.56.1793963379122;
        Fri, 06 Nov 2026 03:09:39 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:1de5:ca41:50c1:3f2d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d087a3c5sm2768243f8f.0.2026.11.06.03.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:09:38 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 0/2] Add ADC clocks and reset for R9A09G05[6/7] SoCs
Date: Fri,  6 Nov 2026 11:09:21 +0000
Message-ID: <20261106110923.164090-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This patch series adds the necessary ADC clocks and reset controls
for the RZ/V2H(P) and RZ/V2N SoCs.

v1->v2:
- Renamed adc_pclk_gear to pllcm33_adc_pclk_gear in patch #1
- Renamed adc_pclk_gear_div2 to pllcm33_adc_pclk_gear_div2 in patch #1
- Renamed adc_adclk_gear to pllcm33_adc_adclk_gear in patch #1
- Renamed ADC_ADRST_N to ADC_0_ADRST_N in patch #1
- Renamed adc_0_pclk to adc_pclk in patch #2
- Renamed adc_0_adclk to adc_adclk in patch #2

v0: https://lore.kernel.org/all/20260929113921.119489-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (2):
  clk: renesas: r9a09g057: Add ADC clocks and reset
  clk: renesas: r9a09g056: Add ADC clocks and reset

 drivers/clk/renesas/r9a09g056-cpg.c | 22 ++++++++++++++++++++++
 drivers/clk/renesas/r9a09g057-cpg.c | 22 ++++++++++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.h     |  2 ++
 3 files changed, 46 insertions(+)

-- 
2.56.0

