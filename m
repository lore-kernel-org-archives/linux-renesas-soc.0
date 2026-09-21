Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33DE444C51C
	for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Sep 2026 09:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789982475; cv=none; b=jEjA/daal5rTXnFL23fPcj7V04BjLNkLIbuZiXSBzAd2E3Ksbi12cueGG0Rhy0L7dCY6hFTtTGUQNQxJ4icsDQXheSmpBP2b1dXo/DR1g5U+lFeZIE79/RKw1JEdcjKNstpKF5zPBkg9Kn67SmMGLYR4XypG2OchNjZXz6UGwXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789982475; c=relaxed/simple;
	bh=je+9BvbsxWX7qc7MuwIz5m1hCnSbY/PwsCFt+v3Smg0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=XFTW6oXeXmNLFSbfVHdcN3arG+k76WqYLurB+RzfgQWqdFx1+LxGMoyLTBDhFihBLJMIkku/HinMo1PMZfZC04kTSrV0+9euOHatGea+6mgOa4PeZ/pWqn7cuoWJN9k1c+zncRWCRAXbbtuQYPdLPOVZQEmMIs6eznTlslBSSi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ad3xDrWw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ad3xDrWw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B80921F000FF
	for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Sep 2026 09:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789982473;
	bh=UlvXHpZfXj6BiTNObTt4og1N+rGncB1NBS97dvkiSlA=;
	h=Subject:From:Date:To;
	b=Ad3xDrWwRFQGVWAHgZcPWpXHGRLpiv9x+WReYOCCWwuFIhAM05sODBGBYe4uQ2i1K
	 F0wK8eOHDOiUM6CjzdOl5YQ22eNXAqY6uKKgIu6wYYAN702gM/8gNXHE2dr3Vj3d7z
	 oRxRuJ2VsZsUAfWfdrdC9kXWNidlXdOGHLTFq/keQGEg1mQoTBPrM/p7PwFE0ZxDOq
	 n0N0AFq55Qwq/UK8vLJlGP5oPhDvqGFo+g+8+H1ZJcFnc7/3dGVK3SUkXo2qKf9pFr
	 mDKgBE8a4u+4gK/5hgEnC4txroEXM71DzrVV/RsX7hG5WXRrXLxoREFL8TPvOTaX3I
	 M5EAlk6PcIJ2A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 961F2392627A
	for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Sep 2026 09:20:06 +0000 (UTC)
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
 <178998240512.2453417.9603647100646453924.git-patchwork-summary@kernel.org>
Date: Mon, 21 Sep 2026 09:20:05 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: Add RZ/G3L PCIe support
  Submitter: Biju <biju.das.au@gmail.com>
  Patchwork: https://patchwork.kernel.org/series/1151416/
  Lore link: https://lore.kernel.org/r/20260825095047.9971-1-biju.das.jz@bp.renesas.com
    Patches: [1/4] dt-bindings: PCI: renesas,r9a08g045s33-pcie: Document RZ/G3L SoC
             [4/4] arm64: dts: renesas: r9a08g046: Add PCIe support

Series: iio: adc: rzt2h: add DMA buffer support
  Submitter: Cosmin-Gabriel Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
  Patchwork: https://patchwork.kernel.org/series/1161885/
  Lore link: https://lore.kernel.org/r/20260910085430.3173166-1-cosmin-gabriel.tanislav.xa@renesas.com
    Patches: [v2,1/9] iio: adc: rzt2h: remove unused struct rzt2h_adc::max_channels
             [v2,8/9] arm64: dts: renesas: r9a09g077: Wire up DMA support for ADC
             [v2,9/9] arm64: dts: renesas: r9a09g087: Wire up DMA support for ADC


Total patches: 5

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


