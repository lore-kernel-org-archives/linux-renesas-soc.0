Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0BC03F1047
	for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Aug 2026 10:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788172879; cv=none; b=kCZL+uRKYLlEvizhTlPEZNYNFDNmENMo9jaVVXkeVJGmz3/r1YcNEEHP67XSO3da1OKQq/v8S90+KU3zgasfLoUsDH+wRGCnbZVCYQagVABJtp1Wt0DXpvylK/UxhRo+5UgIAdm8FWJUHmGC3Fi7HePy42y2kTDoanQiqOo2AJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788172879; c=relaxed/simple;
	bh=O2TumLkmhHcj3XNR+JCPVrmZoInworDZMUiYI2OxEW4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=BdwQyT+wZ0YsHkuLguyowhvNKblSq58vHkagy7F5SEqwDt/jpla2vOGcnPDYTFfzTb94gvfWxBmDnlvE6R1JKoGKIlF1Uu33LcAF6/qqKe9xuWHCNiNny04BlaBM5XZ/bLztHY6bansjqx8HLmmE4VvLMEVFcG82uOnOktsfDXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L22cDSEd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L22cDSEd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 691E71F000E9
	for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Aug 2026 10:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788172878;
	bh=DRprrpFLXQD/o+x5TXiSvPCY5RkyK0TbUXZ+35Ghf+w=;
	h=Subject:From:Date:To;
	b=L22cDSEdZ0Bws8bTZ5EDm2TdmnDmpuGy26YN4jkRh57GPQYNFsnfl9ITZEKvCAKot
	 gy/7E/Ia3b+LA/Eth6B3td9McLjcTkiUjJsVjQgcHZSUmHG6gvO5U7xx2SkU2qViQG
	 XZYmgjInLyY5zye2wYaZyopcB/O8wMMLMLR1HqdV8DbNb4NLkikbHVJyqr2E6pI/jU
	 8pCej+TO8obxI6OmV5rB5rD9+At1EnI/oRqlCMAdNUGuTd+IF1yrfZTpPES8lq5P6D
	 Q4YA3tAaPB2vSbPh/tTyFnz4nqPuzECT6SXuNzQ+Kf3EjnE8hTwcaIinDYFa7ePO/u
	 JbnoOCNPCK+lw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D39983810902
	for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Aug 2026 10:40:22 +0000 (UTC)
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
 <178817282150.10078.7288291849577132080.git-patchwork-summary@kernel.org>
Date: Mon, 31 Aug 2026 10:40:21 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: Enable RTC support on RZ/T2H and RZ/N2H SoCs
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1150695
  Lore link: https://lore.kernel.org/r/20260824075936.2904336-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [1/3] arm64: dts: renesas: r9a09g077: Add RTC node
             [2/3] arm64: dts: renesas: r9a09g087: Add RTC node
             [3/3] arm64: dts: renesas: rzt2h-n2h-evk: Enable RTC support

Patch: arm64: dts: renesas: Use hyphens in node names
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1150124
  Lore link: https://lore.kernel.org/r/20260822075813.199336-2-krzysztof.kozlowski@oss.qualcomm.com

Series: arm64: dts: renesas: rzt2h-n2h-evk: Add LCDC overlays for RZ/T2H and RZ/N2H EVKs
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1148658
  Lore link: https://lore.kernel.org/r/20260819183829.3953529-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [v3,1/2] arm64: dts: renesas: rzt2h-n2h-evk: Use consistent switch notation
             [v3,2/2] arm64: dts: renesas: Add LCDC overlays for RZ/T2H and RZ/N2H EVKs

Patch: arm64: dts: renesas: rzt2h-n2h-evk: Mark XSPI1 boot partitions read-only
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1152030
  Lore link: https://lore.kernel.org/r/20260826112821.194877-1-prabhakar.mahadev-lad.rj@bp.renesas.com


Total patches: 7

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


