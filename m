Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B5441BA77
	for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Sep 2026 09:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789377075; cv=none; b=U0rb0sA/qlTtaLUdKSvg0hnKfLnyTkjYfncJJ+sLkoodj4PvWBsdZimgqPVn7bbH6bW7lojCj45fkiJ6aGqf/pDaSpmLCec36z29z8lgilcFyvw4wRL3/rUlfa7hioktn6SnueMkqv2cxNkgYayIs95nbK6yoTVJJFjjIA3iKZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789377075; c=relaxed/simple;
	bh=wT0IqygUw8IH2x3t1Sk7kc8LgUsTfrWSoydx4dr7h/g=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=qYZiDVlV1t2BlVlC1gmtvDgP6jvlOHhbqE33UhUZUJmtjU1utaRWD3JOepvH+Np7VZPdlf8pTf7B+7G7PEZ0oSxd7GYU0+6aRY9dvszJkDyX8cQAx21QFHfr2F6aRc4Vg1TY7GSjcSJIuVeY4y8sdjG6hlfMaKS0BVuWYdbN1jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TpJ6rAqd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TpJ6rAqd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4A671F00893
	for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Sep 2026 09:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789377072;
	bh=nyOkawN7Ngj9cn4KGBoW1MowZpCx6nqltg7NG/J82o8=;
	h=Subject:From:Date:To;
	b=TpJ6rAqdLW7nLMq3j/67jUtG1ecPEQ7vcWbwS9M4Y1pw7agpmwMJILhDXWnWTNR0w
	 5+LCzt4/TUYVhIjWJd9KzQWNrEql6mEIWBMpak7VeyCsFuiDaiCnLJ88wnVsKAnW0q
	 gixdZaEMvp4mlLB8Ov37R1SxglzJx+avAJ76os486cdHUasnhMebYo9oD6GJEyJisL
	 ms9XI1oo3NVE+0MIoIccaVxOqPlds49YTZXFT723P9x4FK9I1rcCbRsHRYK1x46U2N
	 y+A34ozKI11VJpHHhnkMlh7hnuSWkNDUeU7s9gt5EvAt0QS/reb3ynYPPpvjUTdmSU
	 dwQcJktxouMVQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 59565380CECD
	for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Sep 2026 09:10:09 +0000 (UTC)
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
 <178937700786.418582.4752579681164515670.git-patchwork-summary@kernel.org>
Date: Mon, 14 Sep 2026 09:10:07 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: arm64: dts: renesas: sparrow-hawk: Align MSIOF1 PFC node name with label
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/series/1161431/
  Lore link: https://lore.kernel.org/r/20260909151341.28322-1-marek.vasut+renesas@mailbox.org

Patch: [v2] arm64: dts: renesas: sparrow-hawk: Add overlay for WaveShare 2CH CANFD HAT
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/series/1161432/
  Lore link: https://lore.kernel.org/r/20260909151423.28358-1-marek.vasut+renesas@mailbox.org

Series: drm/rcar-du: Add support for DSI pipelines with DSC
  Submitter: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/series/1159583/
  Lore link: https://lore.kernel.org/r/20260907-rcar-du-dsc-v6-0-f8ef711a7494@ideasonboard.com
    Patches: [v6,1/6] dt-bindings: display: bridge: Document Renesas R-Car V4H DSC bindings
             [v6,4/6] arm64: dts: renesas: r8a779g0: Add DSC
             [v6,5/6] arm64: dts: renesas: sparrow-hawk: Enable DisplayPort by adding DSC
             [v6,6/6] arm64: dts: renesas: white-hawk: Add second mini-DP output support

Patch: arm64: dts: renesas: r8a779f0: Set UFS lane count
  Submitter: Koichiro Den <den@valinux.co.jp>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/series/1162636/
  Lore link: https://lore.kernel.org/r/20260911073058.253000-1-den@valinux.co.jp


Total patches: 7

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


