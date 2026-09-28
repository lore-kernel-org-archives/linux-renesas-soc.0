Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C2B4E06ED
	for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Sep 2026 14:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790606490; cv=none; b=aK6Kjazst2cr6WV6kGaQuJ6IH4Rimv+poyK4DqjNICtCV6dZO5YRQyZMptLORb3mf4tC0k6vqGXeP5CwjuonRX4i7mGHn4CY1kSzKbyjeAHuYsI1x4HKMQBEZ5gQcdJxuurKCj5IdwNd+JwORCpBk02ivKSTJXOcGk5n2byCAxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790606490; c=relaxed/simple;
	bh=QC+TrTaxIb8UPxrqogN9vlSRF8uhUaV4JbMJENM3BcQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=PL3Fmsz2I5FrH+Afp4mmXIKCBbmxTwkXnr+UzWK8cSHbVP8rs6hMbaESENPMn5oiyRG1oaHrZTbk61XfQQUzeCwsIZ0Q2dkJ6h3eM2VymtTVOp3oLzUdE58zlfF9xPs2h9mNMlSz62RIY5dxFmRhN0amJSY+ByNZ+qGSrITa4AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BQAPIGLf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BQAPIGLf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 397D01F000FF
	for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Sep 2026 14:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790606480;
	bh=VDZjOLsMpRPFCg7F2mi15R9D5Jj4h5aXiXhS7vRP3+Q=;
	h=Subject:From:Date:To;
	b=BQAPIGLfg10plo04b9/bQsmqx+SUbbK4xvVZW+FcpjlU26MXAqpAbA8HIIi4qQb1g
	 gNHhGEKmtjr366mMJ9tfgM2duVIy9t5kIE8oBt3qPyCK9XLb8L9ooKkk3t0JsV8aom
	 KKzdUUFRC4Yz6ZgaNZu+/9wsBe36juC/TyW6dSPanjwbbxriKWe1pmdgSGngPGnVm5
	 bjjkKjAB3YczXuwtKslYWvWWyBp8f2PcST9+EGvsKshXLXuKogkifLWj2p9W8mO5xj
	 zKzY/aKPsm+kmMu+D1LMVnjgGPZnCdJ58kQR1pm70r8HinBN2k3MTtSsxtME2sSMIH
	 95trVtKvBIy6Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 1C2603924440
	for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Sep 2026 14:40:06 +0000 (UTC)
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
 <179060640455.4142588.15950547629073889608.git-patchwork-summary@kernel.org>
Date: Mon, 28 Sep 2026 14:40:04 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: arm64: dts: renesas: r8a78000: Add I2C nodes
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/series/1174254/
  Lore link: https://lore.kernel.org/r/20260927151133.45845-3-wsa+renesas@sang-engineering.com

Series: arm64: dts: renesas: r8a78000: Add MSIOF support
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/series/1173651/
  Lore link: https://lore.kernel.org/r/cover.1790325809.git.geert+renesas@glider.be
    Patches: [1/2] dt-bindings: clock: renesas,r8a78000-cpg: Add MSIOF clocks
             [2/2] arm64: dts: renesas: r8a78000: Add MSIOF nodes


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


