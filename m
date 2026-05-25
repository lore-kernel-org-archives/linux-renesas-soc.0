Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DDAF3806AC
	for <linux-renesas-soc@vger.kernel.org>; Mon, 25 May 2026 12:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779710764; cv=none; b=rH8suOVw2X0+yvlSe+kEiBiixb+8iu9nNMBofGgasxpvog3xyFbTt2Xiwi5QnyVZ2gZ9WPAa2yzHephULOBgYpa3sgMp1dyi3HWK5w0VQnSdQH0Phr7w8CRfubaXubDKZ8ujA9RKvdeG2YxMhe4qW7vQrjYzNW36LKt2fesd5U0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779710764; c=relaxed/simple;
	bh=ok2sP16qLo4aZr/R5DFzrS01EE5w5xueHNoT5cii91E=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=teUtqqSLZedfr0RpvHSd+ygMvk13yHyv1h5vvmbo3afFhGmZaNKMntA5O5RO5Tyju/pRDkiD6OC/WhhPjD4LXukhmAeZq9r/81wSxZJxHaIrEoNaVFjiXV6S5LVPJr3s41KtYVHoKWX2Nv0Pw0d827RJQ30J88hwQJ6pozYiMyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GHxKVVrt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GHxKVVrt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 157EC1F000E9
	for <linux-renesas-soc@vger.kernel.org>; Mon, 25 May 2026 12:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779710763;
	bh=Azt2psvZRVXwKUTES8gt0hR2k+lX2HKRPA9ZcIV9qDk=;
	h=Subject:From:Date:To;
	b=GHxKVVrtZ/KKcLByQGuZj/um14PUm4pXe9gafQfqjrDYA1aw8a69E/WH4GpVuwkL3
	 nYRiZCdxyXChKqCynH0s4EgRBnaVGiHM29C3MPE5Ww0kaW02RPI2bPnk4D94J8GH9V
	 HJZqPdrBNkvVApL9i1PgA2fc+scwIOsc3pujzVd6NV671UbAH56EpyUhx8K7P5jOps
	 pX9HROke8xBgEPtsqWE0lYe3u2bSNWD1goXbfcMEJRBxWVwZVcPotWPYmGlrOUyFDu
	 AWBzxK/D1G8lQExXm76b1yNjj0H79Wg5wEfI9f+wZ0itE+u4XB75HlHcTE3xfqYn+I
	 3B4mw2DlCibuQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 1C8C8380AA4E
	for <linux-renesas-soc@vger.kernel.org>; Mon, 25 May 2026 12:06:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From: patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: 
 <177971076974.2543041.12880792145981522413.git-patchwork-summary@kernel.org>
Date: Mon, 25 May 2026 12:06:09 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: Add MTU3 for RZ/T2H and RZ/N2H
  Submitter: Cosmin-Gabriel Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1079849
  Lore link: https://lore.kernel.org/r/20260410163530.383818-1-cosmin-gabriel.tanislav.xa@renesas.com
    Patches: [v2,01/10] clk: renesas: r9a09g077: add MTU3 module clock
             [v2,09/10] arm64: dts: renesas: r9a09g077: add MTU3 support
             [v2,10/10] arm64: dts: renesas: r9a09g087: add MTU3 support

Series: arm64: dts: renesas: Specify ethernet PHY reset timings
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1089589
  Lore link: https://lore.kernel.org/r/20260505034325.167797-1-marek.vasut+renesas@mailbox.org
    Patches: [01/11] arm64: dts: renesas: salvator-common: Specify ethernet PHY reset timings
             [02/11] arm64: dts: renesas: ulcb: Specify ethernet PHY reset timings
             [03/11] arm64: dts: renesas: eagle: Specify ethernet PHY reset timings
             [04/11] arm64: dts: renesas: v3msk: Specify ethernet PHY reset timings
             [05/11] arm64: dts: renesas: condor-common: Specify ethernet PHY reset timings
             [06/11] arm64: dts: renesas: v3hsk: Specify ethernet PHY reset timings
             [07/11] arm64: dts: renesas: ebisu: Specify ethernet PHY reset timings
             [08/11] arm64: dts: renesas: draak: Specify ethernet PHY reset timings
             [09/11] arm64: dts: renesas: falcon: Specify ethernet PHY reset timings
             [10/11] arm64: dts: renesas: white-hawk: Specify ethernet PHY reset timings
             [11/11] arm64: dts: renesas: gray-hawk: Specify ethernet PHY reset timings

Series: arm64: dts: renesas: r8a779md: Add support for R-Car M3Le R8A779MD SoC and Geist board
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1089328
  Lore link: https://lore.kernel.org/r/20260504144534.43745-1-marek.vasut+renesas@mailbox.org
    Patches: [v2,1/7] dt-bindings: mmc: renesas,sdhi: Document R-Car M3Le support
             [v2,4/7] dt-bindings: soc: renesas: Document Renesas R-Car R8A779MD Geist
             [v2,5/7] soc: renesas: Identify Renesas R-Car R8A779MD M3Le SoC
             [v2,6/7] arm64: dts: renesas: r8a779md: Add Renesas R-Car R8A779MD M3Le DTs

Series: [1/5] arm64: dts: renesas: draak: Rename clk-multiplier to clock-controller
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1089528
  Lore link: https://lore.kernel.org/r/20260504225704.115125-1-marek.vasut+renesas@mailbox.org
    Patches: [1/5] arm64: dts: renesas: draak: Rename clk-multiplier to clock-controller
             [2/5] arm64: dts: renesas: ebisu: Rename clk-multiplier to clock-controller
             [3/5] arm64: dts: renesas: hihope: Rename clk-multiplier to clock-controller
             [4/5] arm64: dts: renesas: salvator-common: Rename clk-multiplier to clock-controller
             [5/5] arm64: dts: renesas: ulcb: Rename clk-multiplier to clock-controller

Series: drm: writeback: clean up writeback connector initialization
  Submitter: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
  Committer: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1089557
  Lore link: https://lore.kernel.org/r/20260505-wb-drop-encoder-v5-0-42567b7c7af2@oss.qualcomm.com
    Patches: [v5,1/8] drm/msm/dpu: don't mix devm and drmm functions

Series: Add support for PCIe on Renesas RZ/V2N SoC
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1088491
  Lore link: https://lore.kernel.org/r/20260501105116.33452-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [1/2] arm64: dts: renesas: r9a09g056: Add PCIe node
             [2/2] arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable PCIe

Series: arm64: dts: renesas: Add max-frequency to SDHI nodes
  Submitter: Biju Das <biju.das.au@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1097978
  Lore link: https://lore.kernel.org/r/20260520115144.60067-1-biju.das.jz@bp.renesas.com
    Patches: [1/3] arm64: dts: renesas: r9a07g043: Add max-frequency to SDHI nodes
             [2/3] arm64: dts: renesas: r9a07g044: Add max-frequency to SDHI nodes
             [3/3] arm64: dts: renesas: r9a07g054: Add max-frequency to SDHI nodes

Patch: [v3] arm64: dts: renesas: r8a779md: Add support for R-Car M3Le R8A779MD Geist
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1099522
  Lore link: https://lore.kernel.org/r/20260522172000.15096-1-marek.vasut+renesas@mailbox.org

Series: arm64: dts: renesas: rzv2h/v2n-evk: Add alias for on-SoC RTC
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1090568
  Lore link: https://lore.kernel.org/r/20260506155804.3984418-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [1/2] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Add alias for on-SoC RTC
             [2/2] arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Add alias for on-SoC RTC

Patch: [GIT,PULL] Renesas SoC fixes for v7.1
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1089272
  Lore link: https://lore.kernel.org/r/cover.1777899408.git.geert+renesas@glider.be

Patch: arm64: dts: renesas: rz-smarc-du-adv7513: Simplify DU port configuration
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1083328
  Lore link: https://lore.kernel.org/r/20260420132211.1350656-1-prabhakar.mahadev-lad.rj@bp.renesas.com


Total patches: 34

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


