Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 590A5378D86;
	Sat, 28 Mar 2026 12:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774699857; cv=none; b=lhIh8WPe6sGzYU/F57p9k2fSumgCw/mlpTS9533KVVRLoFzv2AT4Cdp3qUyHB8q9IjILQVequxAtjWaRG+qfMS7VnGN50TnyDochZuiNs/1+1KWVt8EiFlKv1Edt7ycECcPMYaId8hg6/wHRQuA1EaJ+EtoNLfmIQi1SdAdWiCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774699857; c=relaxed/simple;
	bh=XFhvW4GWrk9btT5W9zW4ChZWw8fj2/A37PrP+tca6Xo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MrGTWgNIEFIxUWghgcde6nLwjMypl7we8nPZsxOU3G6HCY7nAhtYzJct/nADgIXPZcjRHthzyyqtfKvO0qVwDmgZv1nZI3B9+hYY/igtZiUbS5/e/dDJyMvPPzwgzmj419jD490xeGfPXJnwyMSYvIzqsw2YtT1fcsnZ5OH6gDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C07FEC4CEF7;
	Sat, 28 Mar 2026 12:10:55 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] Renesas SoC fixes for v7.0 (take two)
Date: Sat, 28 Mar 2026 13:10:48 +0100
Message-ID: <cover.1774606482.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi SoC folks,

The following changes since commit 85c2601e2c2feb60980c7ca23de28c49472f61f1:

  arm64: dts: renesas: r8a78000: Fix out-of-range SPI interrupt numbers (2026-03-06 13:15:21 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-fixes-for-v7.0-tag2

for you to fetch changes up to ed8444006df9863ffa682e315352c44a49d9f4cb:

  arm64: dts: renesas: sparrow-hawk: Reserve first 128 MiB of DRAM (2026-03-25 18:26:10 +0100)

----------------------------------------------------------------
Renesas fixes for v7.0 (take two)

  - Fix TFA BL31 memory corruption on Sparrow Hawk.

Thanks for pulling!

----------------------------------------------------------------
Marek Vasut (1):
      arm64: dts: renesas: sparrow-hawk: Reserve first 128 MiB of DRAM

 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
