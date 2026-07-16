Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF2539FCB5;
	Thu, 16 Jul 2026 09:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784194250; cv=none; b=sSCrNUKVvZB2MNANsuuuXOgGOy8bw/cW49f+BLrFzuFLrUBzsvwJfMdGvygPglP1LbSe2zBmryx6xD8bdLdvGOOJLEnTaguksHB/YyU8aK1cMz/I370iD3A2XMIOmOlecTneKmZ0AcKDLlcBFC7Y90sS0KlwOMk2suGexMH2uXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784194250; c=relaxed/simple;
	bh=DbYTqROKt0ZROUu1d3UCfPzpK7po//WKe2L9UviI7pg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NnGN7GwgOyEvjIcihM0t/xKmQDLGWJpAUsX0LcEsDhBtP56zp3jlePY9ucE4rH6icKKTvDwqXu/CQDpFFjhE9747ifFzOAjHGC5kgBOLC614rQH8y9zp0xMaFTEGOQtQiR2lilPI6xrU+f1J5Xqfg2ca3hdkGYhoxRD+FVg0aWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 377981F000E9;
	Thu, 16 Jul 2026 09:30:46 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL]  Renesas SoC fixes for v7.2
Date: Thu, 16 Jul 2026 11:30:40 +0200
Message-ID: <cover.1784193843.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi SoC folks,

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-fixes-for-v7.2-tag1

for you to fetch changes up to 6fa6ee724d8dadf392139e242ac936b5da730c4b:

  arm64: dts: renesas: ironhide: Describe inline ECC carveouts (2026-07-14 10:34:32 +0200)

----------------------------------------------------------------
Renesas fixes for v7.2

  - Fix lock-ups on the Ironhide development board.

Thanks for pulling!

----------------------------------------------------------------
Marek Vasut (1):
      arm64: dts: renesas: ironhide: Describe inline ECC carveouts

 arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts | 41 +++++++++++++++++++++++
 1 file changed, 41 insertions(+)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
