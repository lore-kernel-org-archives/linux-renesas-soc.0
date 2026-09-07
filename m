Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E3F4562BA
	for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Sep 2026 10:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788776466; cv=none; b=AKXbpoqY2/0PFkZeL9ZOp9SzjeVZzGtxiyP3xeUolEPnsF4BYqCLPoMEVafn5UD60jYL+tO21TRfRqq/MBKuWmpr89rtTSAq3PtsDcrhXvhMTz/C7AtZBttigUyIlwHYEaJOLzmgmQ6YH3/aObBEswIrppuf7wD+zM9q5iPZuqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788776466; c=relaxed/simple;
	bh=lj6dGePPPYiQMV99OkJFTfg2iqjdhNblB13bWV8K6PA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=VojrQ7TJmYTCj429U74M5rbuFh+FLS+0nd0dgxfusw9cR1WDju9jPYzxL5fpapjSjsHWv2gOdPcSmRvaHbqA9FWMWrZ2nnPWCSmAzZA8JCtxH6nUmuxhnE9hy7gdlObDzjgRt3WyIPMzPvzb73FEnwbNjGNdauRFuQf135ZQx/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C6ls7vWi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C6ls7vWi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADBC01F00A3A
	for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Sep 2026 10:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788776464;
	bh=mSgeKNBmq7HuOk05ySkWmuZ1SI7vq9u1lteIwL91LgA=;
	h=Subject:From:Date:To;
	b=C6ls7vWiVrVnIQXs8ZOwcVc88yswWluhPEiutBOenFpYrvpOpQq4LeO0Prd8EgxV5
	 86MPEPr4GgQ9Nn/FWeAhdfpz3yMim1uY2cJmgrQKpcxoSbspU+OIFSGXHq42+wVlxf
	 WvCR9oLMcd2dWuWvV3KXxU6K6C/5A/HUFPWhg7ImNrllL7uAQBkOmJMGpTqOkVVyde
	 MtfpL4uS5QzTb2Z97xnJiOM69+hEbTp8tB+QfCeAjBriNnArd/CMmhhNwiPSFRpOsa
	 QxMKI93GRDqAYBaQw77/DyNVtM41A5REWM2AP6L7H8i/BCxrRHH6FgH2Gf3x61gqeE
	 h/O/FyqCiujOA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 1BE1B39D5FD8
	for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Sep 2026 10:20:05 +0000 (UTC)
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
 <178877640384.2436301.9165613909774196602.git-patchwork-summary@kernel.org>
Date: Mon, 07 Sep 2026 10:20:03 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: Add support for Renesas RZ/G2M v3.0 (a.k.a R8A774A3) SoC
  Submitter: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/series/1149887/
  Lore link: https://lore.kernel.org/r/20260821150408.73829-1-ayman.chaudhry.kc@renesas.com
    Patches: [01/10] soc: renesas: Identify RZ/G2M v3.0 SoC
             [05/10] soc: renesas: rcar-rst: Add support for RZ/G2M v3.0

Patch: [v3] soc: renesas: rcar-mfis: add hwspinlock support
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/series/1147100/
  Lore link: https://lore.kernel.org/r/20260817095447.34693-3-wsa+renesas@sang-engineering.com


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


