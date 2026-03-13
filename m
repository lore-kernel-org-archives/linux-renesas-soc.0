Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E0133F385;
	Fri, 13 Mar 2026 11:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773400384; cv=none; b=RS+tHWkkT+GEiIigiItRkAEMIKyTJ9sC0p+wGPyl4zqEv4WhhDmFoZr3HK3s2NCE65bq6T/jKHDVlGqQAPMvaTaQGJQ7iw0ZQ4q1VhAfhYmFXnHSvjW6eEWHCHSJJO6xOCOG9okLQXUX4XA9ahLfeCxcGSvoYTZRIn1uCg0dpek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773400384; c=relaxed/simple;
	bh=L/rMt4kne8vcYLBEXWwX3TF8nVloeJq0HNQ/EyWRJMM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O2SivflQtFt90+lz7sCWaHCF5C1KegM5/AVH3GQ3NN92bC9k+M1BiacOykkd5LtZkVHvutkbslp20KKe+G5Xa1y8pyiCb7vViqKPwjKWjbDnAamDQye8OzkbJpxFsAmkvMuYbJfMSLYUJ1jXHwscbLuLC2au9MbsWMVnCzijMq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A089C19421;
	Fri, 13 Mar 2026 11:13:03 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/4] Renesas SoC updates for v7.1
Date: Fri, 13 Mar 2026 12:12:56 +0100
Message-ID: <cover.1773399669.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi SoC folks,

This is my first pull request for the inclusion of Renesas SoC updates
for v7.1.

It consists of 4 parts:

  [GIT PULL 1/4] Renesas ARM defconfig updates for v7.1

    - Refresh the ARM SH-Mobile defconfig for v7.0-rc1.

  [GIT PULL 2/4] Renesas driver updates for v7.1

    - Initial support for the Renesas RZ/G3L (R9A08G046) SoC.

  [GIT PULL 3/4] Renesas DT binding updates for v7.1

    - Document RZ/G3L SoC variants, the RZ/G3L SYSC block, and RZ/G3L
      SMARC SoM and Carrier-II EVK boards.

  [GIT PULL 4/4] Renesas DTS updates for v7.1

    - Add CPU frequency scaling and QSPI NOR FLASH support on the RZ/N1
      SoC and the RZN1D-DB development board,
    - Add PCIe slot power control on the R-Car H3, M3-W(+), M3-N, and E3
      SoCs,
    - Add USB3.0 PHY support on the R-Car E3 SoC and the Ebisu development
      board,
    - Add PCIe/USB3.0 clock generator support on the Salvator-X(S), ULCB
      King Fisher extension, and Ebisu development boards,
    - Add RTC support on the RZ/V2N SoC and its EVK board,
    - Add SPI DMA support on the RZ/T2H, RZ/N2H, RZ/V2H(P), and RZ/V2N
      SoCs,
    - Add support for the second SDHI channel on the Atmark Techno
      Armadillo-800-EVA board,
    - Miscellaneous fixes and improvements.

Note that the fourth PR is based on "[GIT PULL] Renesas SoC fixes for
v7.0".

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
