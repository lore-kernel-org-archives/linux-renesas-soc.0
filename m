Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D5C9384CE5
	for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Sep 2026 08:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790670610; cv=none; b=SJMT9WO3RoCTux/q4r0tRtA0aflna7MLOeoU0SDqX2UZOovf3Z79Bo7KpVJgsnzEruiOrRwCvK+Y/Bop0SGzOxCxCsQT3N26GveO3yuHjR45nBoMON06yMY0RBovNlK6Yaz2rnjhCCVjUxxfC+pZ+pQIWGPQAx4ukOVALiZ0WSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790670610; c=relaxed/simple;
	bh=Efgunz+ZsZe7XFx0szrFsfwhNXT5TKInPi6Uh1PxAoA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=f74Lrimf8KY55nr/i9+MJZAxrjtrR1VHQ2GaLWxn5Tes/73OYufrU27IlyENF+kPjlyf/0UoRa/Lma1xuZ2HIVWRqI3mOab+K8j/0UP0kAVqyyP840dw4T+pDpQu8k5Z4grb2OmB1kTuh4IGo2wwsPLvJlrkqTlcAs5C+w3Oszw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZimpBURA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZimpBURA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60CEC1F000FF
	for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Sep 2026 08:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790670609;
	bh=2UYj57gOKLmxKTFYJ3auPnbOsMjA/yTSah3M+FxFwnQ=;
	h=Subject:From:Date:To;
	b=ZimpBURA80zhfrnqiiH7x5QhgKA/HuRH5YhgEQ4xP2jx1gHd5Sst72bRlwTQ9hXo8
	 9iuyTsUO8ZJ3czSYWhnNsJ5ZfD+hgjnwtoJDw/QAQBO8oCH0gwE3CDfd1Mqu47Cc13
	 txm29ox0mGXHG1UudK3WiOLp1fOzw0EQ2dx54NgzaGV+Z9S+FJuOb6h3aX6BC0Hscz
	 KO6L+vUeFvQXyrpUgfAkE4Bdo9aJL585HKeeOXdZJNqpeLio8TbwwMGFpeFd9XvZ2G
	 OfqmonJFRhfggjPZHsljm93WdFOPvMM6/UA9o4UkViZfcZ0I6HrJOFggjPX5bruPcS
	 AoKSUlNRDT9Qg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3CA0D392625A
	for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Sep 2026 08:30:09 +0000 (UTC)
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
 <179067060791.352944.4641597026945726126.git-patchwork-summary@kernel.org>
Date: Tue, 29 Sep 2026 08:30:07 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: arm64: dts: renesas: Add various SolidRun RZ/G2 based boards
  Submitter: Josua Mayer <josua@solid-run.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/series/1175460/
  Lore link: https://lore.kernel.org/r/20260928-rzg2-sr-boards-v10-0-91752ea39cbc@solid-run.com
    Patches: [v10,01/11] dt-bindings: soc: renesas: Add various SolidRun RZ/G2 based boards
             [v10,04/11] arm64: dts: renesas: add support for solidrun rzg2l som and hb-iiot evb
             [v10,05/11] arm64: dts: renesas: add support for solidrun rzv2l som and hb-iiot evb
             [v10,06/11] arm64: dts: renesas: add support for solidrun rzg2lc som and hb-iiot evb
             [v10,07/11] arm64: dts: renesas: rzg2l(c)/rzv2l hb-iiot: add dsi panel dt overlay
             [v10,08/11] arm64: dts: renesas: add support for solidrun hb-ripple with rzg2l som
             [v10,09/11] arm64: dts: renesas: add support for solidrun hb-ripple with rzv2l som
             [v10,10/11] arm64: dts: renesas: add support for solidrun hb-ripple with rzg2lc som
             [v10,11/11] arm64: dts: renesas: add support for solidrun rzg2ul som on hb-ripple

Series: [1/6] dt-bindings: PCI: rcar-gen4-pci-host: Document Application/Local register reset
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Patchwork: https://patchwork.kernel.org/series/1157397/
  Lore link: https://lore.kernel.org/r/20260903205153.283553-1-marek.vasut+renesas@mailbox.org
    Patches: [1/6] dt-bindings: PCI: rcar-gen4-pci-host: Document Application/Local register reset
             [4/6] arm64: dts: renesas: r8a779f0: Add PCIe Application/Local register reset
             [5/6] arm64: dts: renesas: r8a779g0: Add PCIe Application/Local register reset
             [6/6] arm64: dts: renesas: r8a779h0: Add PCIe Application/Local register reset

Patch: soc: renesas: Kconfig: Enable ICU support for RZ/G3E and RZ/V2N
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/series/1174130/
  Lore link: https://lore.kernel.org/r/20260925224927.14951-1-prabhakar.mahadev-lad.rj@bp.renesas.com


Total patches: 14

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


