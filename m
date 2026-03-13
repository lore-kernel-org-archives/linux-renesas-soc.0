Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35F934A79D;
	Fri, 13 Mar 2026 11:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773400337; cv=none; b=o5o3RXt1jTAk2UmvMwRhOU6ZKZkJdZAvx1al2ZgPgNZPlmdBrYD2K7XqKnYa9I5dZDjgMTWBpqEBRw4jqJPMqdbfS9qt96NHryoRWWMlcsqPXb1poBAiOxQemF4bJoO89oOKN3jRClU8lM5mlcbdSQVZr0YGyqQIKQF28WPXXOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773400337; c=relaxed/simple;
	bh=goLSVpJZbH5gmuwsXKkPPSZikbusu4LocscWzE3r2pk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RdjRDX1flRvdh8AFnM9474XMGWuWNOdGLSLYcv+YFYdogVCNLrnmWIC8Lsyu8vplgQJmvXJnt+og3dtBeyo2xpbAuzvPsjsmxFphKQdomuq8awlaSL0PJG+lQIogEwZdiNTpWLn91H4V/FbEBGZw3L/YzBaS3xOumwhQwfHvKbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24881C19421;
	Fri, 13 Mar 2026 11:12:15 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] Renesas SoC fixes for v7.0
Date: Fri, 13 Mar 2026 12:12:09 +0100
Message-ID: <cover.1773398984.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

	Hi SoC folks,

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-fixes-for-v7.0-tag1

for you to fetch changes up to 85c2601e2c2feb60980c7ca23de28c49472f61f1:

  arm64: dts: renesas: r8a78000: Fix out-of-range SPI interrupt numbers (2026-03-06 13:15:21 +0100)

----------------------------------------------------------------
Renesas fixes for v7.0

  - Fix SD card initialization on the RZ/T2H and RZ/N2H EVK boards,
  - Remove WDT nodes meant for other CPU cores on the RZ/V2H(P) SoC,
  - Fix Clock Pulse Generator registers on the RZ/T2H and RZ/N2H SoCs,
  - Fix Versa3-related boot hangs on the RZ/G3S SoM,
  - Fix Extended SPI interrupts on the R-Car X5H SoC.

Thanks for pulling!

----------------------------------------------------------------
Claudiu Beznea (1):
      arm64: dts: renesas: rzg3s-smarc-som: Set bypass for Versa3 PLL2

Fabrizio Castro (1):
      arm64: dts: renesas: r9a09g057: Remove wdt{0,2,3} nodes

Geert Uytterhoeven (1):
      arm64: dts: renesas: r8a78000: Fix out-of-range SPI interrupt numbers

Lad Prabhakar (4):
      arm64: dts: renesas: rzt2h-n2h-evk: Add ramp delay for SD0 card regulator
      arm64: dts: renesas: rzv2-evk-cn15-sd: Add ramp delay for SD0 regulator
      arm64: dts: renesas: r9a09g077: Fix CPG register region sizes
      arm64: dts: renesas: r9a09g087: Fix CPG register region sizes

 arch/arm64/boot/dts/renesas/r8a78000.dtsi          | 16 ++++++------
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi         | 30 ----------------------
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi         |  4 +--
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi         |  4 +--
 arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi   |  2 +-
 .../boot/dts/renesas/rzt2h-n2h-evk-common.dtsi     |  1 +
 arch/arm64/boot/dts/renesas/rzv2-evk-cn15-sd.dtso  |  1 +
 7 files changed, 15 insertions(+), 43 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
