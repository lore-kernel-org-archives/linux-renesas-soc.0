Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B01D3D9550
	for <linux-renesas-soc@vger.kernel.org>; Thu,  1 Oct 2026 16:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790873534; cv=none; b=KUoI0UxWuMZiG4oLD+P4YcO4xNKsuUpojqgJNHEyRdw39R0OZZxiRB/QyB5cCg0bhzSpm3svgZIyIROetc1p5SSjS/2pwmsGwvJ1XWqZ1uACitkzr0TZXT4lDPZ9jpmS2sSnJxohQsW6tXUEl5Mjx97M28Rzz2X5cP44ZCa/r5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790873534; c=relaxed/simple;
	bh=HmiTbJPGI8CBAuIpsu2zSxuujJRT/UJ6KLePj6Bmmcc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ihPH/kBCd4JlRsOQMyD/a3qD2Ugx7uXScLyTL3sAT1CMnxhIUPwOPZIGbB0Pt1Pmaqpy/lW5BV6gt3+9NAbB3p38enpQZbcEANhUt0mkbr1WC1sxEGzIW9hDJgJABZ6z046Ivxe9D2bhFZQSWz+aU3+IOdEe2PJRAsC5HvIZJwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bxQULVV+; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bxQULVV+"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-4a01ff8c098so6850175e9.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 01 Oct 2026 09:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790873527; x=1791478327; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Va84SLTBXZf2YB8nUhTLf5Wd3WMjClFg5JEaqlH/ubY=;
        b=bxQULVV+Ds0vSGLyTYZphff/CgHg/O9NoRvQ34Xx4bP/NhXS7ELVsgg4tx6ddLU9tV
         iFOVYpqI2LOYJI2BYQCqYgpIwbBy4ioEvVBFlO5TYglkg3wXvispil9DGJNpkZotR7zE
         k9ai01SSZV+8Pl6EEqKWrz4CtAkLvskZxdTr7u4IiGXeuX/7dSVG9M1lZAHJWM2qU0J2
         5OlORQsgKPsPobNHO4IEJ9mzISmqN5atg9Bxm6ilNKJzIprSkwOjjPYsKyh4d/QMiFeY
         JycwZHJ6kXTvrg+A9rWLoYNVyNpWTvGcXaWjJdftKul3Fnm8KXnmsQNhQMfoRjYMaHuX
         3Wlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790873527; x=1791478327;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Va84SLTBXZf2YB8nUhTLf5Wd3WMjClFg5JEaqlH/ubY=;
        b=VlhkSylPbTtHJukwgXgkmFSwyYIoyLioxP3mSGhL/QbTHIKM3dC9syyEuqisX+C5e4
         IifHBicdnA0ZywGJchrKnkJaSaKB/5x5L3+wuPxk36tXPGJNKREwT75JYsuVTPbuf86W
         w7x/7blsJOR2mf9FvRIxoFyVhDAttRw6ywZQnbyx6G9xwElVqY35oUKeyiGTP5ZmRl6l
         89cLK/WCAIN8eFZY/bmSdxcgy3CYeSQT7J1aHMyd+KJ3WISKGzw71p1kD8oQeqPQo3YA
         Y32Fc/fpV/1NV0curXVkcYc1znytLIblZipEiXfeIf5SgWe5JU5/lLfQbiboRYxnobcu
         RuHg==
X-Gm-Message-State: AFuF++lW+hVcJDir54ej6kLIk6HokAKtszHxds8JyDOD+DvEQ3CAc/oX
	E8hxoDGLbMmGsUD4wCNHM+8RYnYdPWJz4G1PqMKQ2SpHuwhipMM1BQhh
X-Gm-Gg: AYBFou2FsZIXTKHYX/613Qn+6yLSkG/knuB+WO0S0f2zJKjhQDN4eCgC6T+a+i9Pmsc
	9524zAYD+AqftXf0mgdQXgFmyDXzlpVZRInk9DHd30q00UwIXATiTV2RcCp0iHrVtkB4ptLFfwP
	qi6ZdDJkn4djjUgR7rY/GIl9+pHL0pam2wl8/Qbe9ZEi4FV0cdSTiVcI7q10vr3q9wvspCcrS5R
	uoBDw5s5B80s2c6aCS2SpZzo51FiFzPm8NFVDDYzQUgyurJvaz87E7Y31VVIEDEvyhNUECXYLL0
	0Wt7rmawzoQ8+RecF633QqKiWaXK8e75JMZ8Nm/TocXMhTgWKGrSpbvleBa9t642RDkyLD3dHb1
	jYBQ4cJSx/f5qhPv0DDYvluduhEzRhNCPWRX38We6JVRNX2x1B5AK60GfvwtWS7jzeBU9adAO5m
	H0kePAKu/IW5bk4gSF+YV1F4D5lOSCksGQd+Zy57wYLWRbsUmst0btwlZ0ghbK2RUbb1TcSFbx+
	WxScVpH1t1dQX+aJuVVNyN4TQlIku/hmCqWGVRqSrxWEmRzlATiGC93fIV1rcr+q+xpTtczbS2f
	9ade4FIF
X-Received: by 2002:a05:600c:1d20:b0:49d:2536:402e with SMTP id 5b1f17b1804b1-4a0276affa3mr4130515e9.30.1790873526910;
        Thu, 01 Oct 2026 09:52:06 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1be5:ad57:d5e0:f854])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027ae146csm480985e9.11.2026.10.01.09.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 09:52:06 -0700 (PDT)
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
Subject: [PATCH v8 0/7] Add syscon support for Renesas WDT driver 
Date: Thu,  1 Oct 2026 17:51:54 +0100
Message-ID: <20261001165201.763882-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Note, patches have been rebased on top of next-20260930.

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

Lad Prabhakar (7):
  clk: renesas: r9a09g077: Add helper to start WDTDCR counter
  watchdog: rzv2h: Use pm_runtime_put_sync()
  watchdog: rzv2h: Drop WDTRCR_RSTIRQS define
  watchdog: rzv2h: Drop runtime PM handling from WDTDCR init
  watchdog: rzv2h_wdt: Add syscon based WDTDCR access
  arm64: dts: renesas: r9a09g077: Use CPG/MSSR syscon for WDTDCR access
  arm64: dts: renesas: r9a09g087: Use CPG/MSSR syscon for WDTDCR access

 arch/arm64/boot/dts/renesas/r9a09g077.dtsi | 24 +++---
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi | 24 +++---
 drivers/clk/renesas/r9a09g077-cpg.c        | 35 +++++++--
 drivers/watchdog/rzv2h_wdt.c               | 85 ++++++++++++++++++----
 include/linux/clk/renesas.h                |  6 ++
 5 files changed, 129 insertions(+), 45 deletions(-)

-- 
2.55.0

