Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45517143748
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Sep 2024 14:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725375124; cv=none; b=ORG1DZ5JjjLgoH+M6vEXtRNVBV7Y0OAa6/QTbXrWNYRmOQY45hBzq7DfVq35Y/XoC28jlk+OrlaBC+67kHWXyFwq+haHZelogrKvPzgGOQ3WvA0DdKSew1p23UPV3IKBp6LYmX0UsX+wFiABjUZByDClbqZODbeurxduOZDGrGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725375124; c=relaxed/simple;
	bh=txIaqTC8DhHaj91jCjO8MtFAOGFGFeWEJULdmoawAUA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Xy9UxWZclN2FwM0gooVjdgEexVUYNDLKEJVo2n127/kb4Va+gVH/G88Lwb1HaxwTK1PMHa0yj2wE0eMNy+8zxIRknuXntpVnFEmJ/Nnr8hdcshEMA/SGgzSUsxnM3B6h04A3OmCts9IX4fbWWcIsWE87HunH+lzaK4uzjzHOYvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:b015:4053:6b25:396c])
	by baptiste.telenet-ops.be with cmsmtp
	id 7qs02D0060nYyzV01qs0cZ; Tue, 03 Sep 2024 16:52:00 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1slUsv-001zei-9x;
	Tue, 03 Sep 2024 16:52:00 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1slUsx-003oRw-VJ;
	Tue, 03 Sep 2024 16:51:59 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] clk: renesas: Updates for v6.12 (take two)
Date: Tue,  3 Sep 2024 16:51:57 +0200
Message-Id: <cover.1725374868.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi Mike, Stephen,

The following changes since commit 120c2833b72f4bdbd67ea2cf70b9d96d1c235717:

  clk: renesas: r8a779h0: Add CANFD clock (2024-08-20 09:48:24 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-clk-for-v6.12-tag2

for you to fetch changes up to 3aeccbe08171b79f82fb802393a6324c7b732669:

  clk: renesas: r9a09g057: Add clock and reset entries for GTM/RIIC/SDHI/WDT (2024-09-02 10:15:38 +0200)

----------------------------------------------------------------
clk: renesas: Updates for v6.12 (take two)

  - Add USB clocks, resets and power domains on RZ/G3S,
  - Add Generic Timer (GTM), I2C Bus Interface (RIIC), SD/MMC Host
    Interface (SDHI) and Watchdog Timer (WDT) clocks and resets on
    RZ/V2H,
  - Miscellaneous fixes and improvements.

Thanks for pulling!

----------------------------------------------------------------
Claudiu Beznea (1):
      clk: renesas: r9a08g045: Add clocks, resets and power domains for USB

Krzysztof Kozlowski (1):
      dt-bindings: clock: renesas,cpg-clocks: Add top-level constraints

Lad Prabhakar (2):
      clk: renesas: rzv2h: Add support for dynamic switching divider clocks
      clk: renesas: r9a09g057: Add clock and reset entries for GTM/RIIC/SDHI/WDT

 .../bindings/clock/renesas,cpg-clocks.yaml         |   8 +-
 drivers/clk/renesas/r9a08g045-cpg.c                |  17 +++
 drivers/clk/renesas/r9a09g057-cpg.c                |  84 +++++++++++
 drivers/clk/renesas/rzv2h-cpg.c                    | 165 ++++++++++++++++++++-
 drivers/clk/renesas/rzv2h-cpg.h                    |  43 +++++-
 5 files changed, 312 insertions(+), 5 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
