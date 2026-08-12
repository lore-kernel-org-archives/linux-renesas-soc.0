Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D7D35AC12
	for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Aug 2026 14:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786546266; cv=none; b=q/NRtlfB9WToBJMJ49tCKcJLCThaBm8lSB5oxVNdw3Zd4stUJlbT9PbaZ7BxcW+HxUZvIppXyGNuY8kfJ7b0TzUqw0JZz8J5zfBiUfbZtLf3gMXSYdElQBx6vS2XxpzVpoLBkjPgUUc4unrE8NSwKVOYftppyYAo037VVc2rVPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786546266; c=relaxed/simple;
	bh=H8wkrYollu56HJf8xnMVkT/nfn2p1kydXY9Oy9K3atU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=Z6Smqbyl1+q5guSfW5Eiw1hMAiy4+WksT0DduvklI6b+VCFr8lBpnm58x7XEdTAbsgyzkF6X80nbo19YFUjSRrrJPBxzMajn4ZLnmfsnbM5oG/UcndSCB9OkBCl+pCXHPC0zCgEaXZZPm5Aq1b2cy9THjB9RTfMvkNwa5vbTm2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h+7sChbX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h+7sChbX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45F791F000E9
	for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Aug 2026 14:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786546264;
	bh=O/5p5GtgJsSIua50HU8WOd9HA3wRe2siQz/CAx6wM2k=;
	h=Subject:From:Date:To;
	b=h+7sChbX4cQpxb8u2fCBowKY0p+o904rhFEbIk8B9MaJmJX00iJm7Ja57e2fcHuge
	 lMUy+X3i6t4Nw5AwZK2aejr3qiYMaziQt0S0aDGd/9y+LKTQKh4BKxQypBNtpYarFp
	 AFyrjU7FsmVlP29VuE0GPS9h6g2Ze8DoQml32IFK1m7vZEsgAXUiQf3Mdx8HXdrQ0x
	 /iJH/uw35zpf0c9BEJY3qM8w3DpsLluazc2yg2S+VK46mUetTxKyxlX8Xxd/i6jPgr
	 o92Lqt1jw7+OjU1Rb+SmVByaIy5oNb+j5AfEsznbkqhV4Qzld3qaLXSP6/W2Z9A9RO
	 jI7U23EEywEwA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D342E380AA60
	for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Aug 2026 14:50:20 +0000 (UTC)
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
 <178654621933.1517176.14772668363850287584.git-patchwork-summary@kernel.org>
Date: Wed, 12 Aug 2026 14:50:19 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: [1/9] arm: dts: renesas: lager: Specify ethernet PHY reset timings
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1127437
  Lore link: https://lore.kernel.org/r/20260714130429.11214-1-marek.vasut+renesas@mailbox.org
    Patches: [1/9] arm: dts: renesas: lager: Specify ethernet PHY reset timings
             [2/9] arm: dts: renesas: stout: Specify ethernet PHY reset timings
             [3/9] arm: dts: renesas: koelsch: Specify ethernet PHY reset timings
             [4/9] arm: dts: renesas: porter: Specify ethernet PHY reset timings
             [5/9] arm: dts: renesas: gose: Specify ethernet PHY reset timings
             [6/9] arm: dts: renesas: alt: Specify ethernet PHY reset timings
             [7/9] arm: dts: renesas: silk: Specify ethernet PHY reset timings
             [8/9] arm: dts: renesas: sk-rzg1m: Specify ethernet PHY reset timings
             [9/9] arm: dts: renesas: sk-rzg1e: Specify ethernet PHY reset timings

Patch: arm64: dts: renesas: beacon: Specify ethernet PHY reset timings
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1127439
  Lore link: https://lore.kernel.org/r/20260714130539.11287-1-marek.vasut+renesas@mailbox.org

Patch: soc: renesas: Expand MFIS acronym in RCAR_MFIS help description
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1120506
  Lore link: https://lore.kernel.org/r/b92a4b39a18aec7cdffdfdfbc75de4ecadb0395d.1782998764.git.geert+renesas@glider.be

Series: ARM: dts: renesas: lager: corrections for the i2cexio0 bus
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1128071
  Lore link: https://lore.kernel.org/r/20260715105306.25147-4-wsa+renesas@sang-engineering.com
    Patches: [1/2] ARM: dts: renesas: lager: specify correct connector for i2cexio0 bus
             [2/2] ARM: dts: renesas: lager: use inclusive wording

Series: [1/2] arm: dts: renesas: gr-peach: Specify ethernet PHY reset timings
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1127436
  Lore link: https://lore.kernel.org/r/20260714130325.11080-1-marek.vasut+renesas@mailbox.org
    Patches: [1/2] arm: dts: renesas: gr-peach: Specify ethernet PHY reset timings
             [2/2] arm: dts: renesas: armadillo800eva: Specify ethernet PHY reset timings

Series: RZ/G3E: Fix dtbs_check failures
  Submitter: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1139413
  Lore link: https://lore.kernel.org/r/20260803132828.3249424-1-tommaso.merciai.xr@bp.renesas.com
    Patches: [1/3] ASoC: dt-bindings: renesas,r9a09g047-sound: Document audio_clkout clock-frequency
             [3/3] arm64: dts: renesas: r9a09g047e57-smarc: Set I2C1 clock frequency to 1 MHz

Patch: ARM: dts: renesas: r9a06g032: don't set status to the default value
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1128719
  Lore link: https://lore.kernel.org/r/20260716101030.15252-2-wsa+renesas@sang-engineering.com

Series: [1/2] arm64: dts: renesas: cat875: Specify ethernet PHY reset timings
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1127438
  Lore link: https://lore.kernel.org/r/20260714130515.11262-1-marek.vasut+renesas@mailbox.org
    Patches: [1/2] arm64: dts: renesas: cat875: Specify ethernet PHY reset timings
             [2/2] arm64: dts: renesas: hihope-rzg2-ex: Specify ethernet PHY reset timings

Series: ARM: dts: renesas: r9a06g032-rzn1d400: GPIO updates
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1128703
  Lore link: https://lore.kernel.org/r/20260716095935.13329-4-wsa+renesas@sang-engineering.com
    Patches: [v2,1/2] ARM: dts: renesas: r9a06g032-rzn1d400: don't enable gpiochips which are always on

Patch: arm64: dts: renesas: sparrow-hawk: Always enable edge connector I2C busses
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1121780
  Lore link: https://lore.kernel.org/r/20260705125324.13519-1-marek.vasut+renesas@mailbox.org

Patch: [PATCH/LOCAL/RFC] arm64: renesas: defconfig: Enable basic SCMI support
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1120504
  Lore link: https://lore.kernel.org/r/fbc22f38ff46ce2d662b4ae7fef3cda538198ca9.1782998043.git.geert+renesas@glider.be

Series: [1/2] ARM: dts: renesas: Correct white-space style
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1138754
  Lore link: https://lore.kernel.org/r/20260801210321.383773-3-krzysztof.kozlowski@oss.qualcomm.com
    Patches: [1/2] ARM: dts: renesas: Correct white-space style
             [2/2] arm64: dts: renesas: Correct white-space style


Total patches: 25

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


