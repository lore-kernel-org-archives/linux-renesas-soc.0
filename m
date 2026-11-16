Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794822606;
	b=powYpa4QKBaHLGqhyBHMh2qvmFouAmZrns9ht1mib0W0UqS5zVE5ZgltnfveyoUse8ls
	 vTIVrBi4gAAz8dlakhESvprZBwkAKo14Ptu6kIuulPoNtZ4hPiyJ0vQFvGs/Seu2jRjem
	 dtdGd/PCtZrv9c5ix15MTBiuWG9EKT0RXGb8IXygLsKefLBQtYvtSloUZ90znSbzE+iV9
	 30zioLFM82uSflJv2b1t+/mzfEjciCBSRgg+sXXFqRFZQvmQvggVfGKucXFLvAzsOhj4A
	 MDm2O3LgytyyB6hp9+K2INfRyjEP3icX2mrSz6efQFf+l4VhVO0Lts7kqOfr6hzjVKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794822606;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:To;
	bh=KOh/g8adhYNMFibib8PscvhPyIKdZjsKVIj1T6dWwII=;
	b=UQBEZsJ2vjQp6c4hZQUa3H8FjtznyCNaqFoprFl9E6dDp6y+z8dE7LwVFt46fsZlaFdD
	 zEs1ZmN0PEXLY760q6fM+JpFauvT/gwmqLmDz/54CkrFxVyrNKwg9SXZUr1Zo2iZxlsvv
	 XTLbPVNH33T6G94duVz2S7y7X8kQZe1OaxeEVOM9T1S+kHfRrJFzRhXR/uyW4q8Yfh9QF
	 kHmhIWNifIf3zPqx+PWGpTLNsNKnBylaxbj5KUmuT/vYgS8FHx+AfMtNsxwjE+PbcG/a8
	 d59QDrFzGgaSFJEeMTWshj3eA2QrBsEQKODher6sN5pgl+ZCP9Z96v0PcMA7WWss1Kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e+zgfgOs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 883C1606A31C
	for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Nov 2026 09:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e+zgfgOs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6539E1F000C8
	for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Nov 2026 09:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794822606;
	bh=KOh/g8adhYNMFibib8PscvhPyIKdZjsKVIj1T6dWwII=;
	h=Subject:From:Date:To;
	b=e+zgfgOsIJNdj+nVws0Uu0vkbXvIDpv0RPLUEuDbxLHbkwp4mv46gYuSjsHQGFJn0
	 ad88n73W0XpXhiS/dLqgCkwKUDkn7L7G4rvh4+bax44ZjQTtkC8D48BppUAvE7VhD9
	 qGrSRCiyaJ+W5udCrpgCMogt8DcF2NSrZQ7F2VIFPjr6X+q66TczTNVm7S9ZzBDrzc
	 UGFajtRjJRYFc665idztAYACPK/J/QShVP38CcqeIFYo0J+r63PUNxaP8wzkqEXYgN
	 /UzwEN2D70MOXHEIKoAwHLelwkNxcaa6131yk0n0JLx+/+vE+k2ynfvp8UCUvKF7yV
	 jLjPyrDm4JrCA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3C93438007CA
	for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Nov 2026 09:50:06 +0000 (UTC)
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
 <179482260478.3495177.16794792858917155703.git-patchwork-summary@kernel.org>
Date: Mon, 16 Nov 2026 09:50:04 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: [v2] arm64: dts: renesas: spider: Add overlay for PCIe ch0 endpoint mode
  Submitter: Koichiro Den <den@valinux.co.jp>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/series/1193407/
  Lore link: https://lore.kernel.org/r/20261026063942.3173469-1-den@valinux.co.jp

Patch: arm64: defconfig: Enable the RZN1 RTC driver
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/series/1206001/
  Lore link: https://lore.kernel.org/r/20261109114123.797741-1-prabhakar.mahadev-lad.rj@bp.renesas.com


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


