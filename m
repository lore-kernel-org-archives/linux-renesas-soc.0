Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C13C202963
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 18:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774462221; cv=none; b=iesdTxD5xQ31qgv5esKpfUUasiTjowrq++uroYnQTuObHF73IaBOcOGfXf5lkfQ2i5t5ERoASRSMZtztOTR1RWqJH9SaWlrAbiCMVQZ13JMYGL8QNfL34W4ZUoEHEXz+VCBxfziDIO52VKgtNmSkqKR1BOPM0BGXvxSDKvCvLA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774462221; c=relaxed/simple;
	bh=x5JdKRKij5J+F3Tur+SK4UcHYGXOZBZACgDRljMmNHA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=kyvVMBag4o8mMd/TfRYvPwd2mGNefOA0Tvn1Sg4rE4YY/UHaVnq3nrm+0F6xBMZ28LfMmtnLlUwXCWAW/Jek3LVhSAHSRLbzqLXsjPU9vaOu1eQup3yxacKctJE5N/h45OGD+koFr0Gk3rWCYYv34+6DL/zZll3dUYnpyPzJ7MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fWyXew+2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fWyXew+2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8DEEC4CEF7
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 18:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774462220;
	bh=x5JdKRKij5J+F3Tur+SK4UcHYGXOZBZACgDRljMmNHA=;
	h=Subject:From:Date:To:From;
	b=fWyXew+2GwmLwGgqjnvvEG4AIl8XbWQlfmhsQNbatKVJAI3+8KfQbkgOWETOQN5Sy
	 Vq9mQ2kS423FhbsMGJ73Dabbx9qHhUQRC0Yd9+SZxw19ZUW7gsCyYo8P++YEjSkVvm
	 6R0JBVsbbc/EBJcvCTjIR2FwbTDdNMNVMaZAYV1CUtFplxMvk0Eh+gggxGdxC3L7cK
	 lXx9/YR0O/Obc2nIzXLUfcBWf+bbYLOMZqCWZRh8OweDQFlu00CBby/UP++kACIYW0
	 gh7Emnm4XGeal2NQTZ2SUC+AQowu+N6GmL4haKW+QtPwcrG92Sv2SzmKAFl6Ino/ip
	 hfd6l/8ycthlg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 0556B3809A04
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 18:10:09 +0000 (UTC)
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
 <177446220746.1745070.11837570517448242905.git-patchwork-summary@kernel.org>
Date: Wed, 25 Mar 2026 18:10:07 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: arm64: dts: renesas: Fix PHY C22 compatible strings
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1066471
  Lore link: https://lore.kernel.org/r/20260313164008.40933-1-marek.vasut+renesas@mailbox.org
    Patches: [1/4] arm64: dts: renesas: Drop RTL8211E PHY C22 compatible string
             [2/4] arm64: dts: renesas: Drop RTL8211F PHY C22 compatible string
             [3/4] arm64: dts: renesas: Drop KSZ9131 PHY C22 compatible string
             [4/4] arm64: dts: renesas: Fix KSZ9131 PHY bogus txdv-skew-psec property

Series: PCI: renesas: Add RZ/G3E PCIe controller support
  Submitter: John Madieu <john.madieu.xa@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1068516
  Lore link: https://lore.kernel.org/r/20260318085119.44717-1-john.madieu.xa@bp.renesas.com
    Patches: [v9,1/4] clk: renesas: r9a09g047: Add PCIe clocks and reset
             [v9,2/4] arm64: dts: renesas: r9a09g047: Add PCIe node
             [v9,3/4] arm64: dts: renesas: r9a09g047e57-smarc-som: Add PCIe reference clock
             [v9,4/4] arm64: dts: renesas: r9a09g047e57-smarc: Enable PCIe

Patch: arm64: dts: renesas: sparrow-hawk: Add overlay for Olimex MIPI-HDMI adapter
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1069621
  Lore link: https://lore.kernel.org/r/20260320025328.509003-1-marek.vasut+renesas@mailbox.org

Patch: [v2] ARM: dts: r9a06g032: Add #address-cells in the GIC node
  Submitter: Herve Codina <herve.codina@bootlin.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1072169
  Lore link: https://lore.kernel.org/r/20260325095718.388157-1-herve.codina@bootlin.com

Patch: [V2] arm64: dts: beacon-renesom-baseboard: Remove LVDS Panel
  Submitter: Adam Ford <aford173@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1072424
  Lore link: https://lore.kernel.org/r/20260325162735.24467-1-aford173@gmail.com

Series: [v3,1/2] drm/panel: simple: Add Waveshare 13.3" panel support
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1043562
  Lore link: https://lore.kernel.org/r/20260117005028.126361-1-marek.vasut+renesas@mailbox.org
    Patches: [v3,1/2] drm/panel: simple: Add Waveshare 13.3" panel support
             [v3,2/2] arm64: dts: renesas: sparrow-hawk: Add overlay for WaveShare Display 13.3"

Patch: arm64: dts: renesas: sparrow-hawk: Reserve first 128 MiB of DRAM
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1071705
  Lore link: https://lore.kernel.org/r/20260324143342.17872-1-marek.vasut+renesas@mailbox.org

Series: Remove WDT{0,2,3} support from RZ/V2N
  Submitter: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1071954
  Lore link: https://lore.kernel.org/r/20260324225239.19136-1-fabrizio.castro.jz@renesas.com
    Patches: [1/2] arm64: dts: renesas: r9a09g056: Remove wdt{0,2,3} nodes


Total patches: 15

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


