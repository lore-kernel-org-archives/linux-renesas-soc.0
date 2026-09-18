Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B50B3DFC8F;
	Fri, 18 Sep 2026 09:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789724236; cv=none; b=FRKVVgvlLwD7zIv1evkp1cHGTirxp3dvGQUZrFnWSitZupeTZK5ppo4Lgpggzmf1jGU8tsWrwKeXO2fMpCZjL8DaJFqakNCCyIshPz/TXaqz6leQTk/Bb4P6sHBQrN8eppMU5i8sV7Ex5xCAWf65dmFApk+1CacBY58XNpOqfOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789724236; c=relaxed/simple;
	bh=fM7l5RaZ8dadMj8h+qydP5X0015oqsxUPr6nE7Skrx8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fklnYlrxMW/5Qnza6Q1pIpLob7/h35I53gmTKqRcGeAYGMAMrnTaNQtmPwLV/uHIP9jzcNBE7MGluIO+G8Ki8zwYS1E67Q6HFUIXPT+zebWME3ujd9PRrSMgkGjdL1xYI+bhhRoPdp66XaTiQoZCMGM3ZGrcpknhuV5V71iMvkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 230621F000FF;
	Fri, 18 Sep 2026 09:37:13 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/3] Renesas SoC updates for v7.4
Date: Fri, 18 Sep 2026 11:37:02 +0200
Message-ID: <cover.1789722868.git.geert+renesas@glider.be>
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
for v7.4.

It consists of 3 parts:

  [GIT PULL 1/3] Renesas ARM defconfig updates for v7.4

    - Refresh the ARM SH-Mobile defconfig for v7.3-rc1.

  [GIT PULL 2/3] Renesas driver updates for v7.4

    - Register the SYSC power sequencer on RZ/G2L,
    - Add hwspinlock support for R-Car V4H, V4M, and X5H,
    - Add initial support for RZ/G2M v3.0,
    - Miscellaneous fixes and improvements.

  [GIT PULL 3/3] Renesas DTS updates for v7.4

    - Add GPU and display support for the RZ/G3L SoC,
    - Add display and RTC support for the RZ/T2H and RZ/N2H SoCs, and
      their EVK development boards,
    - Add I3C support for the RZ/G3S SMARC SoM,
    - Specify ethernet PHY reset timings on various ARM32 boards,
    - Add Clock Pulse Generator (CPG) and Module Controller (MDLC) support
      on the R-Car X5H SoC,
    - Add GICv3 Interrupt Translation Services (ITS) support on the R-Car
      V4H, V4M, and S4-8 SoCs,
    - Add GPIO support for the RZ/N1D-EB Expansion Board,
    - Add Display Stream Compressor (DSC) and (more) DisplayPort support
      for the R-Car V4H SoC and the Sparrow Hawk and White Hawk
      development boards,
    - Add WaveShare dual-channel CANFD HAT support for the Sparrow Hawk
      development board,
    - Miscellaneous fixes and improvements.

Note that the third PR is based on renesas-fixes-for-v7.3-tag2, for
which I have just sent a PR.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
