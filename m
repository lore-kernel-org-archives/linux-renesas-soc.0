Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8049527280A
	for <linux-renesas-soc@vger.kernel.org>; Wed,  9 Sep 2026 13:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788961869; cv=none; b=TTgsn0cDX0yQsxJo279h0Fy5IJsk036I3LoRE/57MI1Ee93mBqmN+RKh+A4pN+oOLJ/FRCpavEjfa0HE+dL9FWXUSy6KoYYztDszih6U0xGaNP81W7Gsx+lqD3Aixbh5yupYym/H6TgNKQSE0VgZ1hTxf8jExKWFttHkkqWsYuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788961869; c=relaxed/simple;
	bh=Pa9c8W9tDWCe1qLYwO9PaGeQEZBMSHtp/7laPCLdxKo=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=ECwsPpvRSnVoEK84U2yI0tOGocp12LC1I8JHA4DHH8Ah92xNjLgHivNjoK3p7em3OTVfMVadHHxNuXj84NO1A8bmiZ5rJwdyzeYWyKAWzkuzPskdGWCczng+IEIwXoyu7wbqGOg05w67QyxifLc8QX/Udwbwfz1PcdHwq2DjMKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MI7tvdHe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MI7tvdHe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68A7D1F00A3D
	for <linux-renesas-soc@vger.kernel.org>; Wed,  9 Sep 2026 13:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788961868;
	bh=BmzY5q7TiEP36eYB7fpiELO1Bsfr6xgzq8KoJ80LIUo=;
	h=Subject:From:Date:To;
	b=MI7tvdHeSFUNs+7y1WAVFMT7pFgtyhr+kOouDyugyvQEdE1reqHmwzmqhR+sEFUf3
	 ctWSbw1RRprxV29zN4jMFDF7LsHCpp7AvuJVQm9Yt6VOsfMqLZ3w1+8950/PvUamnU
	 E49v/we5MJp2okue1VKYgc0EvBy5kPhuk0ikAPQYB8vbbC0gz5dPuA+mQCel/2xMIf
	 ulNbi3N2f3lnRNw/siVdsBUki7VTxM0xRv8637sXV9NGOKyUUa78vMD0mUEyQ0bs5D
	 I84qIN1QmHTfHS22TTbkxtwDJ8CkjkoWEWebkJtqHycyEY7jj0fbf3lwRcbNOIxXwS
	 Zq8YZVTY7u4KQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 9680B380A942
	for <linux-renesas-soc@vger.kernel.org>; Wed,  9 Sep 2026 13:50:07 +0000 (UTC)
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
 <178896180635.408006.15208810151387061258.git-patchwork-summary@kernel.org>
Date: Wed, 09 Sep 2026 13:50:06 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: [PATCH/RFT] arm64: dts: renesas: r9a09g047e57-smarc: Update CAN transceivers
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/series/1151591/
  Lore link: https://lore.kernel.org/r/2a759a486337e4cc8156bc94079471a6552faefc.1787669487.git.geert+renesas@glider.be

Patch: [PATCH/LOCAL] arm64: renesas: defconfig: Refresh for v7.3-rc1
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/series/1159750/
  Lore link: https://lore.kernel.org/r/f9a3c0f715be9a0884d56078d4a1486b6e485c26.1788784410.git.geert+renesas@glider.be

Series: Add syscon support for Renesas RZ/T2H & RZ/N2H in CPG/MSSR driver
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Patchwork: https://patchwork.kernel.org/series/1147373/
  Lore link: https://lore.kernel.org/r/20260817192540.423994-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [v4,1/7] clk: renesas: r9a09g077: Register SYSC regmap
             [v4,2/7] arm64: dts: renesas: r9a09g077: Adjust CPG register region sizes
             [v4,3/7] arm64: dts: renesas: r9a09g087: Adjust CPG register region sizes

Patch: [LOCAL] arm64: renesas: defconfig: Increase NR_CPUS to 32
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/series/1160292/
  Lore link: https://lore.kernel.org/r/75f583a7ffc9896d2f3a3b1bdf48d79897629d4c.1788857660.git.geert+renesas@glider.be

Series: Add support for DU, LVDS and DSI on the Renesas RZ/G3L SoC
  Submitter: Biju <biju.das.au@gmail.com>
  Patchwork: https://patchwork.kernel.org/series/1152226/
  Lore link: https://lore.kernel.org/r/20260826174854.199139-1-biju.das.jz@bp.renesas.com
    Patches: [v3,01/13] drm: renesas: rzg2l_mipi_dsi: Add dphyctrl0_init_val to hw_info
             [v3,08/13] arm64: dts: renesas: r9a08g046: Add fcpvd node
             [v3,09/13] arm64: dts: renesas: r9a08g046: Add vspd node
             [v3,10/13] arm64: dts: renesas: r9a08g046: Add DU and DSI nodes
             [v3,11/13] arm64: dts: renesas: r9a08g046: Add LVDS node

Patch: arm64: dts: renesas: r8a779h0: Add GICv3 ITS and update PCIe node
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/series/1159051/
  Lore link: https://lore.kernel.org/r/20260906140134.492084-1-marek.vasut+renesas@mailbox.org

Patch: ARM: shmobile: defconfig: Refresh for v7.3-rc1
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/series/1159749/
  Lore link: https://lore.kernel.org/r/6aa72dc7c7d5f9e7a1e38b4247c202db0bd190f7.1788784378.git.geert+renesas@glider.be


Total patches: 13

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


