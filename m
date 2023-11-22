Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 190FCBD
	for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Nov 2023 08:12:48 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:d60:3031:68fb:d1ad])
	by andre.telenet-ops.be with bizsmtp
	id DUCm2B00G3EmSSH01UCm0e; Wed, 22 Nov 2023 17:12:46 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1r5pq4-009ylB-95;
	Wed, 22 Nov 2023 17:12:46 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1r5pqI-00GzNM-6U;
	Wed, 22 Nov 2023 17:12:46 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 0/3] ARM: dts: renesas: r8a7740/armadillo800eva: Add LCD support
Date: Wed, 22 Nov 2023 17:12:40 +0100
Message-Id: <cover.1700669207.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi all,

This patch series adds support for the two LCD Controllers (LCDC) on the
R-Mobile A1 SoC, and for the 5" WVGA TFT LCD panel on the
Armadillo-800-EVA development board, using the shmobile-drm driver,
which gained support for DT recently.

Changes compared to v1:
  - New patch "ARM: shmobile: defconfig: Switch to DRM_SHMOBILE",
  - Add Reviewed-by.

To be queued in renesas-devel for v6.8.

Thanks for your comment!

Geert Uytterhoeven (3):
  ARM: shmobile: defconfig: Switch to DRM_SHMOBILE
  ARM: dts: renesas: r8a7740: Add LCDC nodes
  ARM: dts: renesas: armadillo800eva: Add LCD panel

 .../dts/renesas/r8a7740-armadillo800eva.dts   | 28 +++++++-
 arch/arm/boot/dts/renesas/r8a7740.dtsi        | 65 +++++++++++++++++++
 arch/arm/configs/shmobile_defconfig           |  5 +-
 3 files changed, 94 insertions(+), 4 deletions(-)

-- 
2.34.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
