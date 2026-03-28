Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D03378D86;
	Sat, 28 Mar 2026 12:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774699871; cv=none; b=tCC264r5uMVipwxJn6GD61LL37BeVqwfT9y2UnpoBmVE0uxr7KdqoaKEgzTPW1NRZ41E7fzACvACDb0ZJRGQlG2H4vueIEb3jtpnPF9F2drKtH7l7cmpUDfg1FowzFcPX+yrVOomfaqjagJ4EYStBduCFDLAiz7cxaqfJ7MBrdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774699871; c=relaxed/simple;
	bh=uR2BM0hVutRP5M5yInGuUpfr3Ps6x8wD9jYWSweSY7I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cFt+n2xsKfCbe0qknNrBVik7PAHsgS6tIB/bobEflBVKzRvWrxww9+r7lATO4ZyDk3tQrAuonYU6icX40A/sbX0Q74AmNevKMaVDGhW/Qv8H3dwAR0o/QVAW07zrnorFLhgvXZJt5pjxxHfqeQ0TKkbi426QHgrXKZf/wu9mgeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CF20C4CEF7;
	Sat, 28 Mar 2026 12:11:10 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/3] Renesas SoC updates for v7.1 (take two)
Date: Sat, 28 Mar 2026 13:11:03 +0100
Message-ID: <cover.1774606536.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi SoC folks,

This is my second pull request for the inclusion of Renesas SoC updates
for v7.1.

It consists of 3 parts:

  [GIT PULL 1/3] Renesas ARM SoC updates for v7.1

    - Use the of_phandle_args_equal() helper.

  [GIT PULL 2/3] Renesas driver updates for v7.1 (take two)

    - Mark remaining rz_sysc_init_data structures __initconst.

  [GIT PULL 3/3] Renesas DTS updates for v7.1 (take two)

    - Add DT overlay support for the MayQueen PixPaper display on the
      Yuridenki-Shokai Kakip board,
    - Add Ethernet PHY interrupt support for the RZ/T2H and RZ/N2H EVK
      boards,
    - Add SPI and PCIe support for the RZ/G3E SoC and the RZ/G3E SMARC EVK
      board,
    - Add DT overlay support for the WaveShare 13.3" 1920x1080 DSI
      Capacitive Touch Display and the Olimex MIPI-HDMI adapter on the
      Retronix Sparrow Hawk board,
    - Drop several superfluous C22 Ethernet PHY compatible strings,
    - Remove WDT nodes meant for other CPU cores on the RZ/V2N SoC,
    - Remove unavailable LVDS panel support for the Beacon ReneSoM base
      board,
    - Add initial support for the RZ/G3L (R9A08G046) SoC, and the RZ/G3L
      SMARC SoM and EVK boards,
    - Add Versa3 clock generator support for the RZ/V2H EVK development
      board,
    - Miscellaneous fixes and improvements.

Note that "[GIT PULL 3/3]" includes DT binding definitions for the
RZ/G3L SoC, which are shared by clock driver and DT source files.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
