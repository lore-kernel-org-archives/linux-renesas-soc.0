Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1FA340DA6
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 12:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783945232; cv=none; b=gNy6k8FJZTSHAxbjpc2MlyWylf3/9vF8LzTs1z+uhHxiYW6QzV/fZ1mvyz6Jn/rFQIJcavpKeJSZhEPGRyLKYPBlRSdKgdeDjccp/bJVPw0X4gF9TdskeQzHi91eo+Iiwcjq5s+4r5nXZPMPeas1LN2t59jNJfcwWiWPzLcsJAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783945232; c=relaxed/simple;
	bh=0HpVpMd9wCvc0D7LT3a/hVtnil26wvcHAP7Y2egl5uU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=dCkxhzOxcYNwgSNIOQhKtnGlF9GXVRoyaG2FRrGSB8RiIRltOByK7oW4co+NswWHYmgc8CQkD5vcfM4LWJZ7ksCdQQUih9q9kkWOZKfJADcJX3s3Ojaq8iRdxaoIgQKGdIEeer8bG9I6bvmB4e0xY1PkwG3E660gSU5Q5ge3Gns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ekVYS6ZK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ekVYS6ZK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F9FE1F000E9
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 12:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783945231;
	bh=I/bdy9T0dbrFBZ9G4MaCBn3cgW8wf9QVWtU8CxRlef0=;
	h=Subject:From:Date:To;
	b=ekVYS6ZKcPWN6w9wXcUSSKxVydqJmLDBGQmxCmILgvg0vBIwcpARkcVY4INO9L6ay
	 XBHOmkSv1+PuyHdYjHF9IR34bv2DSWDAzymVUB7dPoMhVyarde6wqRRCav783bYxH/
	 NsnIQEHuvQrBxFYZ8dxJijsNEkXPmCBjrvmYjbxd4u0sjVTA4aIhULsHqClQ6C4tZa
	 hyTND4ZDjJ+a7IvP1unwlA9Q/PNyV5Zp9dZAGmMJSPcuoydLlPxlsQXXCB8ypGwP1T
	 8xQ4MclDPtoPpHAhJmpEDrEhrXatlPOhed8To51oa5YHOj2C99+JSuGdd0w76yJ388
	 elgQq/SZsMpjA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 1C1CD3924A38
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 12:20:08 +0000 (UTC)
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
 <178394520666.2201343.17165908144058981871.git-patchwork-summary@kernel.org>
Date: Mon, 13 Jul 2026 12:20:06 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: Fix PCIe dma-ranges for RZ/V2N and RZ/G3E SoCs
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1124043
  Lore link: https://lore.kernel.org/r/20260708172849.227915-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [1/2] arm64: dts: renesas: r9a09g056: Fix PCIe dma-ranges memory space code
             [2/2] arm64: dts: renesas: r9a09g047: Fix PCIe dma-ranges memory space code

Series: Add PCIe support to RZ/V2H SoC and EVK
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1124022
  Lore link: https://lore.kernel.org/r/20260708163311.222176-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [v2,1/2] arm64: dts: renesas: r9a09g057: Add PCIe nodes
             [v2,2/2] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable PCIe

Patch: soc: renesas: r8a78000: Drop duplicate "default ARCH_RENESAS"
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1124590
  Lore link: https://lore.kernel.org/r/64de6e95719a6dec7412cf7e917a42749e738b99.1783593775.git.geert+renesas@glider.be


Total patches: 5

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


