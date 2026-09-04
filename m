Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B8A35200F;
	Fri,  4 Sep 2026 13:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788528094; cv=none; b=hmY9Z6sp17OHlj088syndP+YGXWOY3fQOTbm3Z/jEz5xGU+C9ND2srTI57TKZEjcz4wMUoab1tOiZdxCT/v9MKgGoIIjfCA/GDuIUqXulZi4ZsLE2A3LVKt2dNPREuyNkcmR4/2zppM0GlheyKdI4S+YkhtKnREvcpg6+r0kyPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788528094; c=relaxed/simple;
	bh=i3jzcEDjTp6IHGkPQn57ADzdFhYZdRIvfOuNLsDtWRo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jMkiK1SiOWDwsTekyOFiyY3kt26v0cUqkJF6Pae7EvYbbJ8GoRwxj6wgHjShodM/UUtHwk4PTS9bzRRn94mqK/EYzy1vIMXBTKxuZY84nM27SEqWJM1jCzU/8LOCg/yIp7Qwk81olwXRu+jvAA2GH7ybG99KzyEkXkQmcb4ZV38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 007DD1F00A3E;
	Fri,  4 Sep 2026 13:21:27 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL]  Renesas SoC fixes for v7.3
Date: Fri,  4 Sep 2026 15:21:23 +0200
Message-ID: <cover.1788527983.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi SoC folks,

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-fixes-for-v7.3-tag1

for you to fetch changes up to 2ac7bad110be6ebe478d6bd57821f7f5259a1f54:

  arm64: dts: renesas: r9a09g087: Switch GBETH TX queue scheduling to WRR (2026-09-02 14:32:37 +0200)

----------------------------------------------------------------
Renesas fixes for v7.3

  - Fix Ethernet stalls on RZ/V2H, RZ/V2N, RZ/G3E, RZ/T2H, and RZ/N2H.

Thanks for pulling!

----------------------------------------------------------------
Ovidiu Panait (5):
      arm64: dts: renesas: r9a09g057: Switch GBETH TX queue scheduling to WRR
      arm64: dts: renesas: r9a09g056: Switch GBETH TX queue scheduling to WRR
      arm64: dts: renesas: r9a09g047: Switch GBETH TX queue scheduling to WRR
      arm64: dts: renesas: r9a09g077: Switch GBETH TX queue scheduling to WRR
      arm64: dts: renesas: r9a09g087: Switch GBETH TX queue scheduling to WRR

 arch/arm64/boot/dts/renesas/r9a09g047.dtsi | 10 ++++++++++
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi | 10 ++++++++++
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 10 ++++++++++
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi | 27 +++++++++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi | 27 +++++++++++++++++++++++++++
 5 files changed, 84 insertions(+)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
