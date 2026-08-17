Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC8C3F7ABE
	for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Aug 2026 10:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786963277; cv=none; b=q8k054r2mPBwwEcI5yJDReVWbupsvNMmrq1YkOWIsFFYjbG/DvxeS6LihZgsRPAE8t1zOHzY9AM7Oh7plN26prQdNha6M+oSaSMt9u1KpN+Uy7N7aFT5KDDc330wcQmzUs42b3bNRx7LB6wnkyK+TfCmk6fPvcr4ZhL0i08rtXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786963277; c=relaxed/simple;
	bh=zatRVTjiMokpkHQmQYCpt4JqJHudYip9t7eW+Da+rpk=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=MFYWRucf6Mi3w9JdSw+SO4pnNXNH/oni8AcL7TABXHIk6FXvI0SuxxwWWROiW3kbh8epUkJGrLBn8NJhaEDCT7FVLLt5py/VuJbTDaphrN1jNoc2P/hmbJcAsIXa5kcZKAIncSsqFs9tKpbcNkHDbHkjQhqYEhKGrptJ76j52dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UWdNzd28; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UWdNzd28"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA6191F000E9
	for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Aug 2026 10:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786963275;
	bh=hRWXz9YbZGxiIZyHw/CVRxTq6VBCqKvGLePDLMUSxYM=;
	h=Subject:From:Date:To;
	b=UWdNzd28j77qjANLxVy+FMIAY8WFWvJAl4WOF0CpPZ4HqZ8e/oEAtG37Vl7P5NBzj
	 J+2bWpHKKnoKU/0gYgXU3eyJYb4NErVNCd3iRtjGdnNCvM5Pqp5203jherqnd85y0A
	 HVn3U/xEML7gBnwrIlFpYH+CUuOcxAGPIsYQn8iERaeIW2nhpxKzpNj5zHRddB6NrN
	 98ilLw0EioE/jyqwe2sycOc74HhsJ5xfuoONphCRXZNNP/dRZEQkWHfYH4R+lSMJFv
	 kOOUUOA7hEC8WQagVl047ddaOAfWnGGnIAHwCAyVSWAKLBwvIw2tZ3okvggV4swIpd
	 QOI93ylx2PwHw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 5991539253D1
	for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Aug 2026 10:40:29 +0000 (UTC)
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
 <178696322796.1067832.4453063453232887588.git-patchwork-summary@kernel.org>
Date: Mon, 17 Aug 2026 10:40:27 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: Fix GBETH TX scheduling policy for RZ/{V2H, V2N, G3E, T2H, N2H}
  Submitter: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1132269
  Lore link: https://lore.kernel.org/r/20260722085353.136986-1-ovidiu.panait.rb@renesas.com
    Patches: [1/5] arm64: dts: renesas: r9a09g057: Switch GBETH TX queue scheduling to WRR
             [2/5] arm64: dts: renesas: r9a09g056: Switch GBETH TX queue scheduling to WRR
             [3/5] arm64: dts: renesas: r9a09g047: Switch GBETH TX queue scheduling to WRR
             [4/5] arm64: dts: renesas: r9a09g077: Switch GBETH TX queue scheduling to WRR
             [5/5] arm64: dts: renesas: r9a09g078: Switch GBETH TX queue scheduling to WRR

Series: soc: renesas: mfis: add hwspinlock support
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1130131
  Lore link: https://lore.kernel.org/r/20260718182355.50045-1-wsa+renesas@sang-engineering.com
    Patches: [v2,1/2] soc: renesas: rcar-mfis: convert spinlock to raw_spinlock

Series: Add DU, VSPD and FCPVD support for RZ/T2H and RZ/N2H SoCs
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1111646
  Lore link: https://lore.kernel.org/r/20260615115455.1412098-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [v2,1/5] arm64: dts: renesas: r9a09g077: Add VSPD and FCPVD nodes
             [v2,2/5] arm64: dts: renesas: r9a09g077: Add DU node
             [v2,3/5] arm64: dts: renesas: r9a09g087: Add VSPD and FCPVD nodes
             [v2,4/5] arm64: dts: renesas: r9a09g087: Add DU node

Series: Add GFX support for RZ/G3L SoC
  Submitter: Biju <biju.das.au@gmail.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1106059
  Lore link: https://lore.kernel.org/r/20260604151855.307772-1-biju.das.jz@bp.renesas.com
    Patches: [1/3] clk: renesas: r9a08g046: Add clock and reset entries for GE3D
             [2/3] arm64: dts: renesas: r9a08g046: Add Mali-G31 GPU node
             [3/3] arm64: dts: renesas: rzg3l-smarc-som: Enable Mali-G31

Series: pinctrl: renesas: rzg2l: Add support for RZ/G3S I3C
  Submitter: Claudiu Beznea <claudiu.beznea@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1105399
  Lore link: https://lore.kernel.org/r/20260603151642.4075678-1-claudiu.beznea@kernel.org
    Patches: [v3,1/6] pinctrl: renesas: rzg2l: Use raw_spinlock_irqsave() on power source update
             [v3,6/6] arm64: dts: renesas: rzg3s-smarc-som: Enable I3C

Series: pinctrl: renesas: rzg2l: Add support for RZ/G3S I3C
  Submitter: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1125378
  Lore link: https://lore.kernel.org/r/20260710113637.1328000-1-claudiu.beznea+renesas@tuxon.dev
    Patches: [v4,1/5] pinctrl: renesas: rzg2l: Generalize the power source code
             [v4,5/5] arm64: dts: renesas: rzg3s-smarc-som: Enable I3C

Patch: arm64: dts: renesas: r9a08g045: Move max-frequency to SoC dtsi
  Submitter: Biju <biju.das.au@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1113802
  Lore link: https://lore.kernel.org/r/20260619075621.126961-1-biju.das.jz@bp.renesas.com


Total patches: 18

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


