Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45EB23CC7EC
	for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Aug 2026 18:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787164731; cv=none; b=btNbeAAnAhHMV9Nglm/uLsujkw44je50I+Ubkf0bGaqFkspuvXdA0dC1nnTKy7kVLaUfAyclIp9G5I2Z55j9bJCGeLcmSHgHZfw7keXaz0a3G/MYCUMeBCz+JUXmU4JdhlcwEJ52Hgu1nI4O/eEcW6bTKJ/jNvCWuP1XKwwOuCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787164731; c=relaxed/simple;
	bh=IG/Zg0y7WX+QKBNuOJ43nVYfbWnWioJuM6oIgzalyVY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U/696MjXaS8cwTls4O1aS1s+CfkBHhTGaSp9xDxmRUxVV51qY1lfk88d5jpL9m0hisnVEOceosOqkxLbEXkD7J3XG6xw8fubrrdnw0kb0GOmHDpDsaXzjlPpJm9skB2STnNebe0oP85X41hWxd/zxHAtkNX8vr4bFkdyi7V4qR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=csIxv3R+; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="csIxv3R+"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2d049069377so12466205ad.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Aug 2026 11:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787164730; x=1787769530; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3rx7cG2wGRCGFpxahrByh+f6gRHLl5YGGcuDupieAFw=;
        b=csIxv3R+cbv0bgZfsAHA2IGQVwTtRSvLOfxJWz375Vbb3c2FoZXKD7XbkaxrePyCyB
         l/Jk8LjXCbLOIqLow9ECISG4TQ/eIGhEKdl+j3IvmISXnwK7zVTaC5ONO/jHWkk+Y/QJ
         eLIwXGpij6N5abpmUA3+GbA4hCIIjFKfxZtgOLx/FIA0xhzdb+WyrsnltMR9zSjzDbem
         1lZMx4wjV/8T3s2+Jbzbct2fZq20ZB0HQvaEWj4HmQvnJik4k6eTQ/Ks/ir0JJ6q65Uo
         EZ2r7IJ/zP06TzkV6DCIdkRFjW6mmd5FSTO2y3/rpDT4dEHkB7OFjkN4sdgolZqMBDP1
         hi2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787164730; x=1787769530;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3rx7cG2wGRCGFpxahrByh+f6gRHLl5YGGcuDupieAFw=;
        b=UWUt39UeY0nKAdGiYW3xGER8/XZL8tUOuD79bcRKNCDAmI84AhWvBc89Z/ok7g76Ce
         lfrDMZPAc+5vQvuWPn8fSK99z5NfSEptWqpzQJnap+UpGaGEuPXMR/AlIevHunIRcgqC
         9PZcJgZPdcWTBV2pHlxa8qJNP5H6/zZj56rTkEtRAg5w0JIFi8uClKygw2ath803ok1H
         +2li5dR+/yeuZ9eDdPzhP6fL5AmcJyeKbqEHTf5qkL40F5sh381W7B9vcJJdjT1nOKcV
         HqBo9tFPg7CkKtUG+VOgVZWk35CHseLoLnUetx3v68eEc6wlKviNyFlCRNgYMz9qqTzp
         LGUQ==
X-Gm-Message-State: AFuF++l+bLaZdmCQeKPz35Tk1w60plXE3Yk2LcurcwWqrtAbig5W7rx8
	bFqfBCYqWKxs2gq/V49VONLDcG2D1KsCfe5G/Ct2bTWhm3jIZ1eOsYfK
X-Gm-Gg: AR+sD13q392p1eYmBuKqrqLEvIaKZULGGygkq0hlPIYfJC079FIDS57v2f+IqK13g2V
	D77q8fU/Rx8kbM1T0U0gD+sBH1E6MklYgG5cFFPho0LFABfwVurMTtAS2MlaQOazo8QsXnXHn2k
	j0RSllfprFst2vBcn2ryLODYjjdstTPTSUXL6vgLjAxDp5b7THVNJ/E4jfGPIbFtjwQEiPiS0TA
	69sT55aQsg7CGwKsuSB2/huR4PRGnAVHQSzxjQtLQ1NydIAGBtCL1sqXZzeSfxQUT1xOvMbr+fB
	bMgNceT4Ru+fOefWTbm3VgQQiit57jQlgb0/w3Ov6WMuNb0uEDR7jyJqftAzTtFYKbRAuzYRapJ
	3tRPV2ouDjCmjI6moT4Squ37i3Jzomokwas8AFXA6978udNLuTP1DcU7kamB1PWKxnBkLLFswTe
	Hvp2bpOFTt5HPpgNhqGMbhj/cZf1iXUPaCsuMRjqDV+C0cX69RVI3/QycFjRW0FzYhcdOTAu01d
	P4ouOJsrWmTYTAzsXgFUYqb0BRMgA0apx+C/Ft4SeAWW+tDVmpNTcAoPGXGmE0+93lfHlEkwap8
	DbEJEszQXQ==
X-Received: by 2002:a17:90b:164c:b0:381:28e0:6259 with SMTP id 98e67ed59e1d1-3958107fcd8mr11329842a91.9.1787164729541;
        Wed, 19 Aug 2026 11:38:49 -0700 (PDT)
Received: from iku.example.org ([2401:4900:1c07:efb3:a897:a9b5:e171:c935])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327cb5a9831sm1759393eec.21.2026.08.19.11.38.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 11:38:48 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 0/2] arm64: dts: renesas: rzt2h-n2h-evk: Add LCDC overlays for RZ/T2H and RZ/N2H EVKs
Date: Wed, 19 Aug 2026 19:38:27 +0100
Message-ID: <20260819183829.3953529-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This patch series adds Device Tree overlays for the LCDC on the RZ/T2H
and RZ/N2H EVKs. The overlays configure the necessary pin multiplexing
and settings for the LCDC to function correctly with the ADV7513 HDMI
transmitter.

Note:
- patch #2 is from series [0] as rest of the patches are already merged
  in renesas-tree sending this patch as a v3.
- patches apply on top of renesas-devel/renesas-dts-for-v7.4 branch

v2->v3:
- patch #1 is a new patch
- Renamed HEADER_IRQ8 to IRQ8
- Added irq support for the ADV7513 in the overlays
- Corrected the DIP switch settings for I2C_SDA1/I2C_SCL1
- Added missing DIP switch settings for LCDC_DATG3
- MOved the header include at the end
- Added a comment for i2c0 as to why it is disabled in the overlay
- Split up the du_pinctrl into a group of pins as only sync/de pins
  needed to set slew-rate=0, the rest of the pins can use slew-rate=1
- Updated commit message for patch #2 to reflect the changes in v3

[0] https://lore.kernel.org/all/20260615115455.1412098-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (2):
  arm64: dts: renesas: rzt2h-n2h-evk: Use consistent switch notation
  arm64: dts: renesas: Add LCDC overlays for RZ/T2H and RZ/N2H EVKs

 arch/arm64/boot/dts/renesas/Makefile          |  6 ++
 .../renesas/r9a09g077m44-evk-cn15-lcdc.dtso   | 53 ++++++++++++++
 .../dts/renesas/r9a09g077m44-rzt2h-evk.dts    | 18 ++---
 .../renesas/r9a09g087m44-evk-cn20-lcdc.dtso   | 63 ++++++++++++++++
 .../dts/renesas/r9a09g087m44-rzn2h-evk.dts    | 32 +++++----
 .../dts/renesas/rzt2h-n2h-evk-du-adv7513.dtsi | 72 +++++++++++++++++++
 6 files changed, 221 insertions(+), 23 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g077m44-evk-cn15-lcdc.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g087m44-evk-cn20-lcdc.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-du-adv7513.dtsi

-- 
2.43.0

