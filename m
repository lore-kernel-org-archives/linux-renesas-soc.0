Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3777D51CF60
	for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Sep 2026 10:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790679049; cv=none; b=LQ7XFqaZBu+99mhEIqliGFcjIavxwSCYnqtoTKvPbn2bi5xjuPgmfNghNfU2HW/USEYsSZWjrPLOqHx0gDj6NuBOySHSn0ITx+o2lWy79alJgsnytFht3kzLbuC49CeBuVilWUp1kunHEvLlcc27Y1jMv8n9gAHIxFaiQfm5HM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790679049; c=relaxed/simple;
	bh=Czj/B4Mu5LtxJXGATAgkhH7zASNuytRpX7bg+4KneUc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YzWMooglyrnbWqqFGgOHL+lidyXvpEA0Sa8FSVB6tAp4G7T/CwpX/4RB8ey57Lb3xWs0zzKGM+Ui0AWRmEzRH2t/1E25YFZYSaois55x7v9OCVbYn+c7BQIm/qy6yttP7mrMW+X4lsR2TK+xWQvf9kUIhFIQAlH8TfHHXgpEC/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nTnmHa/e; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nTnmHa/e"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49fff72474fso14780495e9.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Sep 2026 03:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790679036; x=1791283836; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TRGMZhFDi/tQ+Zc9BTj9SvYe/ZMxXrC3DzS398L4YRg=;
        b=nTnmHa/eBfFOvf6XacrikVsOIs6FBNw2K4bofZMiPOBUL50uYJerfeesvA6GCYea3v
         JHCWPWHgJWmynGhru6jBoyzLuEZ0EtLaZUdDsvxBc9wSsDSIzk3nOelckULTokIcKqdp
         6Kfvv4lpXo6L2Key8aiCUyJh2u9ncEoZd5554e1LZnt4dl2UHTNpdqwHR93nyuPq3eV6
         R4R7p/4m7JxPvZdMLXXTyWfxE/Nj9SBX4XHKfBMm7IektRafe7HPx3W5m97z8t2URjDd
         HHqJsGYc7ITDGsFCn3JGEANdXtk+23Tbk2ZAthOszSNdt11jNATh5CnsoIAGSEuI9ASJ
         r7Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790679036; x=1791283836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TRGMZhFDi/tQ+Zc9BTj9SvYe/ZMxXrC3DzS398L4YRg=;
        b=JeynKqd7Gw/1Qusjva592NGfF9vD5s4+x4qzDsx3u9OjeadMjwCZZnQHehitZUn7X2
         uqHItsfd5UExB/5GtQs4Bn8wpszw9UTkij6o9KQYTuNpt5eCmYJZK4o9rhi1FskFHD6E
         H0PZvTBJ8USwr/RcIffDmVAdOlWkWHr1h/nUumw+twOaflyUm/LE8i+S+WX6XhKqB2pY
         Jr3pCzojZNFq8fhMzYblbRxU9rcQbAqCeWSSybilgPQYlpxKYJjjKp4CHde+iJONpoGz
         jg8WGe+GchyW2iYdTHCeP8EVFvRcCgnuVEYP1SwoMiU7+ko5pw393lPI+YMrG+CZGoGB
         SPkg==
X-Gm-Message-State: AFuF++l8wEt541C+gThAJo388A63wo6a9L4K7Q+p6XfR2rZ6CKIklevp
	wUsruZebmHsEJA/mzLd3wn7eqJFl4Ya252HQrouOJQhi3+ub1h2whOU/2oh43zMq
X-Gm-Gg: AYBFou1DTv0EcgGs1epU9UuHnYq6IRAFTDcQfi63TJvGExNB0OG69p9T9OxvWZiP9U0
	t0ycHdgIH1nlRvv38LQtvWhvIb5PWPrYzP8H7CD7OH7DMGI76P12QM/LCyJIGR9TXr//DKVPLHV
	vg/Zkvd/J3ICb3JSK+RwoN5nUouRb3iTIaiODy08dnTwlJZX0eyx8voYyezudhmrmi8n24kO2Lg
	H4SCiSjiBxDLlUUD8QkLkx2IXu0StdedRcVKpt72vjz6mUepl6j2dGQH0eVKw6XVBb1DEu4ChcV
	JILc6ICGFmFtZtAjpq6pc+L1QsxAYHLVBQ3BQaGLIsju0WTnmRFYgZmh72tu+kwTxjxj33lsWdl
	8E2zrSMgOjBrqvuaWq1tIMAbLIVp3lrgHpUkHRyRC6tHbdOdPHBiNetH6d8fkWZXvZOfpC+gBxO
	KZefd13tv3t1Zzyhyy/lJNrI62JehfecM4qd3odfR53u3baxS6XM7PPq2uFNU7XmhzbzOqertfi
	gkC80ymlqhPu4DpQ8leohrbtj6yDc+o0k8lIFao1U4e6sckMeEoz8A5ej76GriBGSZWXodfH4Vm
	FV9+v7K9Pt3GRz7/xA==
X-Received: by 2002:a05:600c:348a:b0:49f:ce78:356d with SMTP id 5b1f17b1804b1-49fe6705942mr261862305e9.30.1790679035808;
        Tue, 29 Sep 2026 03:50:35 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:10d5:21e1:1aae:c9d8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af5058c52sm3516303f8f.19.2026.09.29.03.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 03:50:35 -0700 (PDT)
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
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v7 0/8] Add syscon support for Renesas WDT driver
Date: Tue, 29 Sep 2026 11:50:13 +0100
Message-ID: <20260929105021.542730-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This series adds syscon support for the Renesas RZ/T2H and RZ/N2H SoCs in
the WDT driver. The WDTDCR register is part of the CPG/MSSR block for
which the CPG driver registers SYSC regmap. WDT driver now uses this
syscon to access the WDTDCR register.

These patches were part of two seprate series [0] and [1], out of which
certain patches have been queued separately, so I have included rest of
the patches into this single series.

Merge strategy, as the WDT driver now includes renesas.h header file,
the driver patches can go via renesas-soc.

Note, patches have been rebased on top of next-20260928.

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

Lad Prabhakar (8):
  clk: renesas: r9a09g077: Add helper to start WDTDCR counter
  watchdog: rzv2h: Use pm_runtime_put_sync()
  watchdog: rzv2h: Drop enabling clocks in the restart handler
  watchdog: rzv2h: Drop WDTRCR_RSTIRQS define
  watchdog: rzv2h: Drop runtime PM handling from WDTDCR init
  watchdog: rzv2h_wdt: Add syscon based WDTDCR access
  arm64: dts: renesas: r9a09g077: Use CPG/MSSR syscon for WDTDCR access
  arm64: dts: renesas: r9a09g087: Use CPG/MSSR syscon for WDTDCR access

 arch/arm64/boot/dts/renesas/r9a09g077.dtsi |  24 ++---
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi |  24 ++---
 drivers/clk/renesas/r9a09g077-cpg.c        |  35 +++++--
 drivers/watchdog/rzv2h_wdt.c               | 104 +++++++++++++++------
 include/linux/clk/renesas.h                |   6 ++
 5 files changed, 132 insertions(+), 61 deletions(-)

-- 
2.55.0

