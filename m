Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8D83B2FD9
	for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Aug 2026 19:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786994754; cv=none; b=Y3xw2Ix6puUbRXmM3K91HU/aUFhBs21iiSBeDXq7YjKI0qQUjT9wGcU/3KyVrfMU/o8mui8+91ARuHGVhpTqZLmZc7N7HWkiZo2oWDepkE+eECLQNkd0F4P5LNuaksXMMhZ4kiI05ipxiU6tBIWANOAzTAp5mwzvE7zNHU4uc0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786994754; c=relaxed/simple;
	bh=z4DT6dN/jk9zq+6dKLH26w7v70HEmqs7syBrbJ8So2s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ezTfAAqVx+J363eNflMH+Bg7W+RhDmuQHbP4DJH8JQhVXtPWOrQPQTvwnPe2UNhWIiTRKshEHKE4Dr4jhA2PTmLPBCIowy9kppsAQUQLJmjlmRB4tq5GaCVHiuNslcwSWyhAQ3Kt+/ahJ8ph9uGGpvG4qO9huFoNijvYdhXc8Lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RtswwQEZ; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RtswwQEZ"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-384930ca5e2so4251469a91.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Aug 2026 12:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786994753; x=1787599553; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7mcvMe3XH85aCVxTOzu3XLPa8g4zrrCk8XeaSRvsHMk=;
        b=RtswwQEZ98Nfq/BlwLuk3U5MYmPlGUyKdqlruyRyo2NIBoKJpaGihvUfTtZyFhpiD0
         4lHhJejnGVmIQcL8hjgOR89ErQfdpChDDrE+WDQ0Z8do9dunwrl4xuXM/S36mIsYp1ui
         klCqAXax0fBF/ZdBMaL2PrmOAjKvGotuSqFdK3G4auJLUZCvEs21ecdNgM1TM4mr30lw
         LLBith5oqkYt097uTXCrgn0aAtPxIeL5uKljhnvq556nwTl2SUOKI4uLqzbSUFrtKOmp
         fn80WVhcXMVvF/fbL7w1MpzNqcFP+ZKWAesVhuYoW9YttSf13Khz5LJeZ0JhxCZKUGtW
         AB8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786994753; x=1787599553;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7mcvMe3XH85aCVxTOzu3XLPa8g4zrrCk8XeaSRvsHMk=;
        b=KSGSFebOIB947NGbgJvyENb2rflG+oT0kXHXqtYm+LbPtgo1rfANL24xdy0r2et/m1
         yriOHqRP9Ldkx5xgc3/WnyonSwDlPQYLh9Mg9ecXEUS5c3d3G1/p7WE0bzTZavqYZkjV
         0M8bHiSR8xD5U8wMRQjkADouCw6wckiv/iqYGzbGHqnQMCxxTHq464upkxddeqOY2MTl
         uC37R/WQqEZqS4rCNDF5p6Q9+HEhX+vkkduj13OAlaA+r25hudOFxHujkJFYoTUEPTlE
         idavZH8K1O2zt1nrcYl593a0WJ8QNE8kISL1bVn6QPO5MlCIy+v0JwRD3CNYWuwJPJIh
         gAwg==
X-Forwarded-Encrypted: i=1; AHgh+RoX+NKd8u0r/emYy/K61XOx0ns9kpCxJbV8O5En53MPC3lvEOXs+WRus371iH0a55A039kfT+n+vBmDfRlS/LTgvA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKFirTk19NrfchU8eAYD6vOxcQcepEBLcahUHMt6TSF7MR/fl6
	8ey9GIudvGupTf3ZcNU3GH/aVPjv4a58iub2w0jVe7KroVvDKUcNBdRQ
X-Gm-Gg: AR+sD12BEZnc9g/TxfBpZm29qSWY7Z8REKxnOur3rjSJ70MHLXvuAI+a2JYeF+yhWau
	QywV1dBcHqqo1+xefL41Do156MYNIJLy8fCASyxLiiJ3LcW3b3xKq8imycx6FCkKRSVgt9JkDDD
	vVLBDVbzS6cP06iKu2uYEaELMN+fGZkq5Ekjj73CrZ7D3QDfiS2pvM6XSP+mhJnjsWj/K0dSBO+
	DSQtXAKoDqh24ad+geE775tXOvSg/mtBJkJgolCqBPVj3qHG/AtyEkPmoE7NiECcTUGQzlSDzTE
	aV8qwpHZO70l9v9WeDLDPRP+wCrif9pv0ZuBwGCnxvBc4viJreZ3E/MpYXuZruKok88sPckT/kA
	O7Op+po105vfkPbCbjvQqb077gokX9W0saIAYrDxNErH8JuAVInhPBkrhhB7mfuWkOixU6y//1i
	xnKRKQULpENOoknIW/OWWgsKnpMxz9wyR9lIz0aXiu3dJDDEVBpu34Prw2H6nNp5SKRlkh2qMNe
	oX0q9HrAAY93SGG4+SUkZSKaVp9M8X3JiDL4wJRG3yqjqG36dcFdoNzva1Oz5My148x5eP5EI4K
	NkC78fJv+5rxuZEBlqjs
X-Received: by 2002:a17:90b:3908:b0:381:5bd6:eb19 with SMTP id 98e67ed59e1d1-3933e74e1bbmr25944829a91.18.1786994752447;
        Mon, 17 Aug 2026 12:25:52 -0700 (PDT)
Received: from iku.example.org ([2401:4900:1c06:2735:f886:32ae:1e17:ec13])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-326798cb9f5sm10218757eec.13.2026.08.17.12.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 12:25:51 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 0/7] Add syscon support for Renesas RZ/T2H & RZ/N2H in CPG/MSSR driver
Date: Mon, 17 Aug 2026 20:25:33 +0100
Message-ID: <20260817192540.423994-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This series adds syscon support for the Renesas RZ/T2H and RZ/N2H SoCs
in the CPG/MSSR driver. The CPG/MSSR block on these SoCs is a
multi-function block that integrates several system-level features beyond
clock and reset control, including clock monitoring, write protection,
and peripheral configuration registers.

For the other IP blocks to be configured a syscon support is provided in
the CPG/MSSR driver. This allows other drivers to access the CPG/MSSR
registers via a regmap interface.

Note:
- Patches have been rebased on top of next-20260817 + renesas-dts-for-v7.4 +
  renesas-clk-for-v7.4.
- The WDT driver patches apply on top of series [0].

[0] https://lore.kernel.org/all/20260814191415.2110732-1-prabhakar.mahadev-lad.rj@bp.renesas.com/


v3->v4:
- Dropped DT binding patch that split up the renesas,cpg-mssr.yaml file
- Dropped RZT2H_SYSC_BASE macro
- Added array of base pointers to the r9a09g077_sysc_reg struct to
  support multiple SYSC regions
- Merged r9a09g077_writeable_readable_sysc0 and
  r9a09g077_writeable_readable_sysc1 into a single function
  that checks the SYSC block and offset to determine if the register is
  readable/writable.
- Added RZT2H_CPG_REG_SIZE macro
- Updated r9a09g077_post_init() to call of_address_to_resource() to check
  the size of the mapped CPG register regions
- Dropped changes from cpg_mssr_common_init

v2->v3:
- Switched to non-RFC patches for the series.
- Added new patch to split out the RZ/T2H CPG binding from the generic
  Renesas CPG/MSSR binding.
- Dropped WDT driver refactor changes from this series. These has be
  submitted in a separate series which makes use of regmap.
- Dropped registers from writeable_readable list.
- Renamed sysc_init to post_init and updated signature to take
  cpg_mssr_pub struct.
- Created a single regmap covering both SYSC register regions
  instead of two separate regmaps.
- Updated commit messages

v1->v2:
https://lore.kernel.org/all/20260702123112.161160-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
- Updated commit message for patch #1
- Made use of for_each_child_of_node_scoped
- Moved sysc_init() to the end of the probe function

v1: https://lore.kernel.org/all/20260511185058.1926869-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (7):
  clk: renesas: r9a09g077: Register SYSC regmap
  arm64: dts: renesas: r9a09g077: Adjust CPG register region sizes
  arm64: dts: renesas: r9a09g087: Adjust CPG register region sizes
  dt-bindings: watchdog: renesas,r9a09g057-wdt: Add CPG/MSSR syscon
    support
  watchdog: rzv2h: Add syscon support for WDTDCR
  arm64: dts: renesas: r9a09g077: Use CPG/MSSR syscon for WDTDCR access
  arm64: dts: renesas: r9a09g087: Use CPG/MSSR syscon for WDTDCR access

 .../watchdog/renesas,r9a09g057-wdt.yaml       |  29 +++-
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi    |  28 ++--
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi    |  28 ++--
 drivers/clk/renesas/Kconfig                   |   2 +
 drivers/clk/renesas/r9a09g077-cpg.c           | 140 ++++++++++++++++++
 drivers/clk/renesas/renesas-cpg-mssr.c        |   3 +
 drivers/clk/renesas/renesas-cpg-mssr.h        |   1 +
 drivers/watchdog/Kconfig                      |   1 +
 drivers/watchdog/rzv2h_wdt.c                  |  56 +++++--
 9 files changed, 247 insertions(+), 41 deletions(-)

-- 
2.43.0

