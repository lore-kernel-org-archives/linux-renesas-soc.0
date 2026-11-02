Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793618407;
	b=XeVc9lsRcXbkNeuHTGF60xo0ePC3fI/DOweA9j+xHEloXUuhBOzmG2aEdUSS4Rqde8V4
	 1n4KwkksJ8u5vTx5/oNoDpb7yiSBpLBh0DK3I8y2WieZOZPCyp28DLgveiFmTi0GMzqhu
	 NnQiYtEcYUfC2uEeuVMkAwJFHV5bDGbIrZHh3P1+Yu/Im/aY5hjqNu9FW45I5G3gqmEm5
	 YgTAcgmRwwJTjbBNAO6pKHwo3Jog66G7FzYckKCermUM7dYcUSmLxp4OE+pY+qGn+MZ5G
	 y4pikgFYBcgMxK1o3BRUVk1iKIeTGDtPEbzWTfDx/64MgRrVjMNCG2pSKgXmX45vYSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793618407;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:To;
	bh=S+kejvRUamp0N4Ny4unUmNygKoXXdGoMoRv3UA87IjE=;
	b=XGSvN8BaOtB7W4JaGJ4l6ouGp18RmMMXjpwJP/c+WW5yP6rmEAvwsdLNUCN+vKgWFugt
	 mob1vZIyt9DharTPwNRQ2gajmauS2uPYhGBRmkKkAxghqFFTwTsOYZZ+Phbi0+Ri0x0Me
	 ok+PVKsyb7LABlEbCgDkTnq7NRh+Rmw+TNeM5EfLTtceOFb6cdPWBn/ofKncjKLP4pXCU
	 sIAMl6WhI+b/VixRgMXdhtALBXX03uklInfcc2fpCWSc340mfL8Deb/dhYwtMMToz4u0o
	 rR8jGAP3FltGYgmZQbzYWe/zZnybSXWh/LbWxP1hTOJtxmfyHeh2mOrvG3VuMMLdRZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TXVzYU35;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C63FB606A338
	for <linux-renesas-soc@vger.kernel.org>; Mon,  2 Nov 2026 11:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TXVzYU35
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EF8F1F00A16
	for <linux-renesas-soc@vger.kernel.org>; Mon,  2 Nov 2026 11:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793618406;
	bh=S+kejvRUamp0N4Ny4unUmNygKoXXdGoMoRv3UA87IjE=;
	h=Subject:From:Date:To;
	b=TXVzYU35VCReT39rBnbqqI/ArFqLxB6ElAS675ZG0bmPuCnyardg2Dl63KHin5eUO
	 /RYopoCG5kvFDCMjzFCG/+/yuIyLZagCiruD6HSMDvYQW9oFVkYqNzMxDrKuIRqYDr
	 0Cypx3BH8h2U/V9GjSqJWUEsNxZrpl2HHWmY5NURS1XxrcN6q3tT+TkigyIuVIEKr0
	 spvVx8Q+5X4+YVbU6Dhq2d/4g9gmYds5NuwKR6am0S15GWRLP/WPOsKTK0mLa9eT2c
	 lO5PQ1lrDXDui22A2qOztQc1lbsmYSmPfxx6dgqt5xqark52zHO18astgUI1M8opBK
	 Op4qmr6r4+cdg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 42CA5380821F
	for <linux-renesas-soc@vger.kernel.org>; Mon,  2 Nov 2026 11:20:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From: patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: 
 <179361840472.3957042.8778310495688530392.git-patchwork-summary@kernel.org>
Date: Mon, 02 Nov 2026 11:20:04 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: perf/renesas: Remove remaining RISCV_ALTERNATIVE references
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/series/1184516/
  Lore link: https://lore.kernel.org/r/fe117dd44728fe7c96f3e4b3ec88c6ca83c5da9b.1791880574.git.geert+renesas@glider.be


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


