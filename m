Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA18C48C3FA;
	Fri,  2 Oct 2026 11:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790940533; cv=none; b=px3prmS3QQqR3qjBV4vZitx8OLmOT65Meww7BQWKzjpruovOneIqedRjfS32Famiexwtrepjdw0zqNGA+ApQY/OkZNKZK3egLEi5MIZIU8LPQzN+OVqcDtv/AnjjiptjWTDYUSqXYTckhvMvLb+hA87/4oHs85GJI1ulCA5GQH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790940533; c=relaxed/simple;
	bh=J3IYfsaAc5bEqT72C0bYBKIihCW4srsNQCWU8WiqSyE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZVOyKHyRuyi7PjCJhgK6RCfI16yYEr90TIq/WYmFYdMssn/4XapfZkfa3H7CmS3shBsi2JTb09VL6hA/p0KInSLblIPAio+CTsmaawKu0mw1g088IpDCraHV/izBIZ9bqk7IGHwYgSAf6rHL9datyN49YFs39n6CaaZ6ElrpZ0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D64621F000FF;
	Fri,  2 Oct 2026 11:28:50 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/2] Renesas SoC updates for v7.4 (take two)
Date: Fri,  2 Oct 2026 13:28:38 +0200
Message-ID: <cover.1790939711.git.geert+renesas@glider.be>
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
for v7.4.

It consists of two parts:

  [GIT PULL 1/2] Renesas driver updates for v7.4 (take two)

    - Select core functionality that will be required for proper operation
      on RZ/G2M v3.0, RZ/G3E, and RZ/V2N.

  [GIT PULL 2/2] Renesas DTS updates for v7.4 (take two)

    - Add PCIe support for the RZ/G3L SoC,
    - Add ADC DMA support for the RZ/T2H and RZ/N2H SoCs,
    - Add initial support for the RZ/G2M v3.0 SoC and the HopeRun HiHope
      RZ/G2M v3.0 board stack,
    - Add USB support for the RZ/G3E SoC and the RZ/G3E SMARC EVK board,
    - Add SPI (MSIOF) and I2C support for the R-Car X5H SoC,
    - Add support for various SolidRun boards based on RZ/G2L, RZ/G2LC,
      RZ/V2L, and RZ/G2UL,
    - Miscellaneous fixes and improvements.

Note that the second PR includes DT binding definitions and updates for
the RZ/G2M v3.0 and R-Car X5H SoCs, which are shared by the clock and
pmdomain subsystems and DT source files.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
