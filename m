Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794395243;
	b=4PNpGQ1N/Q933FRhM5Jpcd9VMfGBbl5UwQ8vQrbg8Ief37nB2S/h3QbuSXOtz7h5ItAt
	 yP1x/vphigPO8qNu8YCc5tvjof45J3FWX6yg5SpmMdymlmURP2Qmi/hQ6EnAwhUqydQiD
	 k7Kz6QA1QYHuM72xYh2ITJ0D+uWIl6l3K81hISNKgEiFpy/aKaSVj273ku9rrvAYVHr1I
	 p/G+HxyWA3ZA0P61xCU53GFgFTK8syCBqw40iUucw3GmBkSanI5cav+puHPfB7cCOeE+e
	 9kQ8U+eGxwvVgDzqQ4TVgpQ9xeNJaGgs0gDVmCkluiDvo5zEXyCTZgMPrrFM2bT48Mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794395243;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8Q2NFx7nPmxyH6HT1mTdHW9zn6FjnTMuVSCUO/8QAwg=;
	b=p73SB3NqCS+rzifJd84MQr0zkCz9wxjE4vESrB+sVsSeCAjNf55kf2ec133DjUuwWmWL
	 JCEhG/pl/92uzs3UijYEin56inQzktDYJiq5cNGJAN59YTNBSPkFgA39cfyP6+7A5kyE9
	 7xCJ56PyLgPrNfSjpKyLMDokfTwTe8aFRb+XskpJGyU4I8cwI+ZPzX2sm5qYbgalxTmBG
	 CF3Eck812a+lIY9k0f5S3eEnxcjsd7o8klaGYMQA31j8wHIKA7bDkAytvqUCr/URMdC82
	 6g9vns6OSyJTrLeSqOvlA+Cr+Xy0++eY7vl8PilS2ykX3gM9XRgwqKi0pWwkCWLJIuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="en/3dGrF";
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2648606A32D
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Nov 2026 11:07:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2648606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=en/3dGrF
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a208d93758so32625585e9.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Nov 2026 03:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794395241; x=1795000041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8Q2NFx7nPmxyH6HT1mTdHW9zn6FjnTMuVSCUO/8QAwg=;
        b=en/3dGrFdvJrBqQhikOW+PJ42oaQqIk3OzHx9RLAfQDkUDn1aTsV7YsOZ0bPdfl4bQ
         pGNdLFmbTpKjWEAow8OWp0470oYPNjsmPTKJO5OttZRd5Hgmpfs+N1lRF21K7PdlkRQe
         xjFDWY2cvDZIIadt6edcvzW42VU4opvLx2F6Lf75Zexq6WKtFVrdD8O2g5SWjQg5f7b7
         rMgTdL09UL8EWI4FsvF9Jg45Wy3hHi0vdp8QKobs4CXFQp0EUyIURJXlBSTMQuEcW2Re
         BiyOeIuI9QRrChoN+zNRxRIDgPX1CpvkfePHqsIxEaQU8W428VzcuqWOVtk61X7cWXH5
         v1YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794395241; x=1795000041;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Q2NFx7nPmxyH6HT1mTdHW9zn6FjnTMuVSCUO/8QAwg=;
        b=PwoIFKpQ0zTKFkXGS0hLsJuyRETe779a8SRMrKqQHuMi0P1gYDWZ7hgWEdBCKbr62Y
         GOb9JkIQYO9aF3uPLIHO2fttdD1PVVrDCQ7k/0j5tsf8sm0agC1+HPG/j5RLj1WUd8IB
         ebrbeBuAByV7El4fbC3QTGLYX5oVEj8gTGWl7B0YeYovOqzLt8vsS6hvQ9OLt9Kc/vyP
         BHE7KSGscT+koUxnXVyodZ4a5UKT4zXTQvZ7qlf38loVO6DLYxDLaLyT5lWnwrOXMhIQ
         /yxFp4IuAdvtIcf4yJIiqfwduR9FhM/lgdIPBD+6eZHwadQfA/aSWjJcQBNYO1JcqHXa
         T4KA==
X-Gm-Message-State: APuU4Z+DqbUHBu8jNdI3qFbPbDrae0Z15p726aanemZ4glbcMqW5ViHB
	ENXkK4QX6/WDnlGCy27zTwg8k0+eN0hiVVewP6LnFzm79AQoY78C6yrt
X-Gm-Gg: AYBFou2M/IftnwlgrJE84z6Zsic7L6WTJO2dcVMiGIRoNWsXJGXcadBTIIKwRi3dqDX
	W2vrXdFJaFdjPsrNfob86OWYilFIkMCUCU04L5Sf2fb4Mkttt0CXiS/mFPwPjWw3yd6o/snpdXq
	ISa+bgycU2yhiPXCfyR2ZVz+0ZGTiM5qhxUo39+NP9K17EXlb+bRwG9jz9n0a9yhaKjst3TITZF
	ECpuZTezXF0VS6Qm10gM9G3FzxvQj8aELbxLfj1wet5SkwJR1Hno4kmip76qsW3WoH9uMKzY1Q1
	jO6ObSH8kSBzrkAow3KelOykqzESeFu7s63hRQ3QAsrAt2TPXTf6iNQRHBNiJp+oaLT/PAzX87X
	buLWzXa4YPLc/4gi5TzGRSNwI5Uab6guEO49pcdFZ2DkQvuw67yN1F/mQtVONmfeUpuFE3FT4m6
	rfmSqBOg5uwXbQQkzmoOi4McZYcB59v8K8xnuoyBcRa8g8+v10S8xy/ejYr+ghMC3MBiTYG7FDq
	BwmgSVOXMFswnpBs//KAPpVrvjFMyplYKWK/xzXhRxdjYCQeVUEvQZbNjx2+RnrBAmDc/i5xt2O
	GN96SyOhIfnNseTQ/auQcaoKqAYCUC5wLioIlVelUXfWcR4NN9WMpG5enSATnt+bUhuonNO1h3a
	edCw/BFI9kTHs7F+o1HFJPV8v80HUuZxhfYeWEod/o+DNL5NxDq2aHfWe7tnN8lbblJdoOwTqc0
	H/cumEJ7pP
X-Received: by 2002:a05:600c:5247:b0:4a5:5fb9:5d35 with SMTP id 5b1f17b1804b1-4ba0937f143mr36040755e9.21.1794395240926;
        Wed, 11 Nov 2026 03:07:20 -0800 (PST)
Received: from iku.example.org ([2a00:23c8:254f:fd01:783d:786e:fe55:f40d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0203a6b0sm146727295e9.5.2026.11.11.03.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 03:07:19 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Guenter Roeck <linux@roeck-us.net>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v9 0/4] watchdog: rzv2h_wdt: Access WDTDCR through CPG/MSSR syscon
Date: Wed, 11 Nov 2026 11:06:56 +0000
Message-ID: <20261111110700.3331225-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.56.1
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

On RZ/T2H and RZ/N2H, the watchdog debug control registers (WDTDCR) are
located in the CPG/MSSR SYS block rather than the watchdog register space.
This series exposes those registers through the CPG/MSSR syscon and updates
the watchdog driver and device trees to use that interface.

Normal start and stop operations use the syscon regmap. Since the watchdog
restart handler runs in atomic context, the series also adds a lockless CPG
helper for restarting the counter. Existing device trees using the separate
WDTDCR register region remain supported.

The device trees for R9A09G077 and R9A09G087 are updated to identify each
watchdog's WDTDCR through a `renesas,sysc` phandle.

v8->v9:
- Rebased on -next due to devm_kzalloc_obj change
- Added RB tag from Guenter for patch #2
- Dropped WDT driver patches as they are now queued in WDT branch

v7->v8:
- Dropped patch "watchdog: rzv2h: Drop enabling clocks in the
  restart handler" addressing Sashiko's comments

v6->v7:
- Added a new patch to introduce rzt2h_cpg_wdtdcr_count_start() function
- Added new patch to drop pm_runtime_resume_and_get() &
  pm_runtime_put_sync() calls while accessing the WDTDCR register.
- Dropped propagating WDTDCR access errors.
- Dropped converting WDTDCR handling to regmap as this would require
  resource address comparison to get WDT index to call
  rzt2h_cpg_wdtdcr_count_start().
- Made use of rzt2h_cpg_wdtdcr_count_start() in restart handler
- Added if regmap is available, use it for WDTDCR access
- Updated commit message

v5->v6:
- Used pm_runtime_put_sync() in rzv2h_wdt_stop() function.
- rebased on top of next-20260922

v4->v5:
- patch #1 is new addressing Sashiko's comments to avoid potential deadlock
- patch #4 is new addressing Sashiko's comments
- Dropped checking rzt2h_wdt_wdtdcr_count_start() return value in
  restart path.
- Handled the regmap locking in the driver and introduced nolock
  version to be used in the restart path.
- Added review-by tag.

[0] https://lore.kernel.org/all/20260817192540.423994-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
[1] https://lore.kernel.org/all/20260814191415.2110732-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (4):
  clk: renesas: r9a09g077: Add helper to start WDTDCR counter
  watchdog: rzv2h_wdt: Add syscon based WDTDCR access
  arm64: dts: renesas: r9a09g077: Use CPG/MSSR syscon for WDTDCR access
  arm64: dts: renesas: r9a09g087: Use CPG/MSSR syscon for WDTDCR access

 arch/arm64/boot/dts/renesas/r9a09g077.dtsi | 24 +++----
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi | 24 +++----
 drivers/clk/renesas/r9a09g077-cpg.c        | 35 ++++++++--
 drivers/watchdog/rzv2h_wdt.c               | 77 ++++++++++++++++++++--
 include/linux/clk/renesas.h                |  6 ++
 5 files changed, 130 insertions(+), 36 deletions(-)

-- 
2.56.1

