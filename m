Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDDCB32C924
	for <linux-renesas-soc@vger.kernel.org>; Thu, 24 Sep 2026 13:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790256153; cv=none; b=We3CS2WyPeQUHuhvbbi+gsGsaB1SUT1v3DBSvzdcYjPRaCd09sWj7Tdlw9x0/Z1r97cbYMD5JxjAowNBkb+zqr9c4u5apqV7p8JxbCYnDyDEM20eVJA0aFvKMNfBgLGBynbuxqNnnzpX6CYr2ZSQTDNCo+2Uvon7ujYs3s6hkN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790256153; c=relaxed/simple;
	bh=eSqxTGop1wP6haR7ohADv9zPgll55yj8D+V0sKY+3II=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=WM2vkK3yJPhbABo2BUhX59Iabie6yKcr3G/SCfveMhDUvWc2V3q3xocOaM0x6fEqM1PAjgCEtVdVpN8G5dfMCj0ivmiheErm19btEIII7zE4Vkdm6GNLVZFWL0R4O+rRPGgVNWjAPuvCZe7koYOHY4N1+hG27Rx9f8Vse3H6GKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lziw1pf3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lziw1pf3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 663EC1F000FF
	for <linux-renesas-soc@vger.kernel.org>; Thu, 24 Sep 2026 13:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790256145;
	bh=UATSr9dx4NpFjQhZvyPhY+TCJ7w6PvxxVJsIydDkd7g=;
	h=Subject:From:Date:To;
	b=lziw1pf3bdLV4Dt3BJBF8FIi/nI9gppLtdR82iy919vjPQO9XFXOxHvvC5HCiAhJJ
	 cI06eXGR5B7AFDoCo5jQp05aJqFOmbSQB/IxrI5DLN66ZPKDhUH3MJkMInigLK3kRR
	 TtliaX4eT3gYQh0mZrVYWaLuZVC/k0NYUhHe46f8N7MfF22hQdRYC17dS63274jKzZ
	 MiaT5Ditceoa7tNYT4BVu2CD+myo7048iFx+fNLEfICzA0xCNKf9CNwFp/KUflFTDd
	 fb7TX6L3Ma6Y+WnrW7eTL6lsZO7cYykBuNgQVwUfKXspEP/qgDegIgeJHIucsG67Gn
	 9NwYiCpNDDWmw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 9638239F38C4
	for <linux-renesas-soc@vger.kernel.org>; Thu, 24 Sep 2026 13:21:15 +0000 (UTC)
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
 <179025607407.1542893.17483701828508261387.git-patchwork-summary@kernel.org>
Date: Thu, 24 Sep 2026 13:21:14 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: Add support for Renesas RZ/G2M v3.0 (a.k.a R8A774A3) SoC
  Submitter: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
  Committer: Ulf Hansson <ulfh@kernel.org>
  Patchwork: https://patchwork.kernel.org/series/1170420/
  Lore link: https://lore.kernel.org/r/20260921134432.50338-1-ayman.chaudhry.kc@renesas.com
    Patches: [v2,1/9] dt-bindings: power: renesas,rcar-sysc: Document vendor-prefixed header paths
             [v2,2/9] dt-bindings: power: Add r8a774a3 SYSC power domain definitions
             [v2,4/9] soc: renesas: Enable SYSC driver for r8a774a3
             [v2,5/9] dt-bindings: clock: Add r8a774a3 CPG Core Clock definitions
             [v2,7/9] arm64: dts: renesas: Add initial SoC DTSI for RZ/G2M v3.0
             [v2,8/9] arm64: dts: renesas: Add HiHope RZ/G2M v3.0 SoC main board support
             [v2,9/9] arm64: dts: renesas: Add HiHope RZ/G2M v3.0 SoC sub board support

Series: Drop unwired ADC interrupts for RZ/T2H and RZN2H SoCs
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Patchwork: https://patchwork.kernel.org/series/1170291/
  Lore link: https://lore.kernel.org/r/20260921110144.44425-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [1/3] dt-bindings: iio: adc: renesas,r9a09g077-adc: Drop unwired interrupts
             [2/3] arm64: dts: renesas: r9a09g077: Drop unwired ADC interrupts
             [3/3] arm64: dts: renesas: r9a09g087: Drop unwired ADC interrupts

Patch: arm64: dts: renesas: ironhide: Align inline ECC carveout sizes with bootloader settings
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/series/1166936/
  Lore link: https://lore.kernel.org/r/20260916220801.240796-1-marek.vasut+renesas@mailbox.org

Series: Add USB2.0 support for RZ/G3E
  Submitter: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/series/1170744/
  Lore link: https://lore.kernel.org/r/cover.1790005703.git.tommaso.merciai.xr@bp.renesas.com
    Patches: [v4,1/3] arm64: dts: renesas: r9a08g046: Add USB2.0 placeholder nodes
             [v4,2/3] arm64: dts: renesas: r9a09g047: Add USB2.0 support
             [v4,3/3] arm64: dts: renesas: r9a09g047e57-smarc: Enable USB2.0 support


Total patches: 14

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


