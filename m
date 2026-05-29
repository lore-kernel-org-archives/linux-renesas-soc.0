Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A501A6803
	for <linux-renesas-soc@vger.kernel.org>; Fri, 29 May 2026 13:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780060208; cv=none; b=sVe1rNWF+AG5Qn5YMPtVi6G6DLVDw9SVyJbJeV+7qOl3s9oNXC0+p65on7crS5YWMNSlLufve/Z/iKIOCUcg+Xu7qXIFYaCSfFKWB7En07ff4/dQ/Zevc67Lpy69hM6dEyTrExqJnGJaod1d7Fbc5KMcgod7AAE5Gvt4Ma76a8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780060208; c=relaxed/simple;
	bh=9rmaXi2trjF2ylO/sbuTiX+UrkTaJRdQanwWOdXfgKA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=vFB6eeC99IEhoZ8cRU2SLik6zCtZo/3cOxaLFUwcuutZs+giAdp5ZAypzbcl+zZwbxJ/gejLr1nIQheqp8vIoCsyzAiMVUo5TriJZGKdyGp2N48VKjxKbX46CFs6WW2XUJ/NGSDn32dRl5csuZpIF+NnmNGc1XRdENZJeXzPsng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E18AnxTo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E18AnxTo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 927811F00893
	for <linux-renesas-soc@vger.kernel.org>; Fri, 29 May 2026 13:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780060207;
	bh=mQvcpHPOiJSPVqnYNylSoo3vxdEx9ZZUCKSfLhNnF6s=;
	h=Subject:From:Date:To;
	b=E18AnxToTL8b78Ck2VsBcuQif7019cGVXMqRt4ZjHjN/GG7EbT8n3HoPG5mx2S7gX
	 iHRnQ5tIB5WTA+Sm+K/ZJbeWYgCCekdua01vOsk7TRhnJeaUT4ycTU1WBoShvTMTUu
	 Ij7bwezZ5Oa0LRnS/0WNYN4c+GbqVegmiH+bVMgYOzSM3dz5wOt7iSOsVbed1n4q/7
	 ZN9chQb9uBrhElfjlkoKxYw4K6bCtGjzWCo+A8EWVC5gVltKmKPYLwfB4hk1OVlIPX
	 3AfNL1wfpp2f/vMdVZDzg2pDEZGCVkt2t1hXxBb17QATljxcjB+63DgdGg9/DKS/JF
	 nFBOnrcKnmXpQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 9643D393003A
	for <linux-renesas-soc@vger.kernel.org>; Fri, 29 May 2026 13:10:12 +0000 (UTC)
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
 <178006021108.1794095.2650976941922339778.git-patchwork-summary@kernel.org>
Date: Fri, 29 May 2026 13:10:11 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: soc: renesas: mfis: add R-Car V4H/V4M support
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1097134
  Lore link: https://lore.kernel.org/r/20260519075620.4128-1-wsa+renesas@sang-engineering.com
    Patches: [v2,1/2] dt-bindings: soc: renesas: mfis: add R-Car V4H/V4M support
             [v2,2/2] soc: renesas: mfis: add R-Car V4H/V4M support

Patch: [v2] arm64: dts: renesas: rzt2h-n2h-evk: Enable xSPI nodes
  Submitter: Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1101851
  Lore link: https://lore.kernel.org/r/20260527202430.606341-1-prabhakar.mahadev-lad.rj@bp.renesas.com

Series: Add support for DU and DSI on the Renesas RZ/G3E SoC
  Submitter: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1078608
  Lore link: https://lore.kernel.org/r/cover.1775636898.git.tommaso.merciai.xr@bp.renesas.com
    Patches: [v6,01/21] clk: renesas: rzv2h: Add PLLDSI clk mux support
             [v6,18/21] arm64: dts: renesas: r9a09g047: Add fcpvd{0,1} nodes
             [v6,19/21] arm64: dts: renesas: r9a09g047: Add vspd{0,1} nodes

Series: Add RZ/G3L SMARC EVK support for I2C and GPIO keys
  Submitter: Biju <biju.das.au@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1102015
  Lore link: https://lore.kernel.org/r/20260528070239.33352-1-biju.das.jz@bp.renesas.com
    Patches: [v2,1/2] arm64: dts: renesas: r9a08g046l48-smarc: Add gpio keys
             [v2,2/2] arm64: dts: renesas: r9a08g046l48-smarc: Enable I2C{2,3} devices

Patch: arm64: dts: renesas: Simplify AA1024XD12 display DTO
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1089322
  Lore link: https://lore.kernel.org/r/20260504143751.42753-1-marek.vasut+renesas@mailbox.org

Series: Add audio support for RZ/G3L SMARC EVK
  Submitter: Biju <biju.das.au@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1102044
  Lore link: https://lore.kernel.org/r/20260528074615.91110-1-biju.das.jz@bp.renesas.com
    Patches: [v2,1/2] arm64: dts: renesas: rzg3l-smarc-som: Enable versa clock generator
             [v2,2/2] arm64: dts: renesas: r9a08g046l48-smarc: Enable audio

Patch: arm64: dts: renesas: r9a07g044: Add DMA properties for serial nodes
  Submitter: Claudiu Beznea <claudiu.beznea@kernel.org>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1098031
  Lore link: https://lore.kernel.org/r/20260520132315.944117-1-claudiu.beznea@kernel.org

Series: Enable RSCI interfaces on RZ/G3L SMARC EVK
  Submitter: Biju <biju.das.au@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1097235
  Lore link: https://lore.kernel.org/r/20260519100022.116318-1-biju.das.jz@bp.renesas.com
    Patches: [1/2] arm64: dts: renesas: r9a08g046: Add rsci{0..3} device nodes


Total patches: 13

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


