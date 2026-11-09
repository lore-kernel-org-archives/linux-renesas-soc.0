Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794220812;
	b=fe/fQbjcolOHB4Rauw8DlDN/y0W48EfOjeF/PwbLQDm1uu68SKsmuzlOxGoZQKc/F+Tm
	 jhIn2B8ZvHHKDs+ORB6M1NofYpstnH3dW6BEaSKh5n/UL/JVqmUYT85dFGvFvajgDLZ/R
	 aDY+JLllZA9aQVEpT7fIA8tHOAN/NeGd0O1HkNwAmWdi2qAaa24AStlI3DB1EbVtU1UUv
	 +NnQrwdf879wpLtntuJ/4bKzjcMGKMN2dqWVvE9OAUBV6K6a7szAnmGsgMrxu1alf0Xy9
	 OSaK5OSCljOI/WMejIuF7mOnEMFpdb5G5GSQUDM92h8bj7CNg1NWEGeYqPBeDlXoavQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794220812;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:To;
	bh=+d/5Cnp5tXMVTGe8Ly7xj+oWZVCUbPdju+Z2kexOiog=;
	b=GD2LB2T1oii0YVQ7mL7FPfxfnCOVsJz8qa3sEtLgRrknl44dvO+ZsJNwwSecaD4Ofbv9
	 sWeuL8nsflWeHpI5eXRYS23O2Os1XoMYlLJmF5uHOGlP4UO1jFSb14x9gckDqf/K6qCqa
	 2xDbQ6yNdwKxjxgp08r802r3EnPbNPZ5pmM03dJVUMGc87Ic+rstUSMmxWpadCNorXPOZ
	 QApo1DqkJkDcmvtu/GC3QefhBnv/ZcHCueuQ0pVa+wGAaEx+79MX4fWZwmr6/Wd30zUk+
	 T0PmEaBLQve3pI6cnloZx1pWsuWfVTcIIUWw0kyP0x8GBi0YOWMBHUvmBntiUDEG2Zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dyDQndt+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84DB6606A325
	for <linux-renesas-soc@vger.kernel.org>; Mon,  9 Nov 2026 10:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dyDQndt+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DCE51F0089F
	for <linux-renesas-soc@vger.kernel.org>; Mon,  9 Nov 2026 10:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794220812;
	bh=+d/5Cnp5tXMVTGe8Ly7xj+oWZVCUbPdju+Z2kexOiog=;
	h=Subject:From:Date:To;
	b=dyDQndt+CYZwSFaAqxRO1OlzRbotktHzF+TuS7UyvJ8QErffswG0UwTg8r3ntcFEW
	 mYTzfOQnfhyEn116Qzm2Ro2Xth9NW9AToRcw98z4sCGWjcLoqWsiWq0R0vr8jTaPkh
	 mK6IDA4kwacfUzTnaRVbi5cFpB7eiCU60n1v2OGGKLsAa8X/4yGVF2gFlEY27nqAFk
	 G1YNm1md37K4N9s1pbKfYcZHEDzdMIf+tLI7LdmLI5eDfty0YHirmhfGmeK7h8zfq9
	 2v5g2PMT6e8eQNJzqpeYBjto9Uop6DJC8Pw7DmFvgPfNB+8NGXcBcwkjq4r9x1T4zf
	 yO8uhragrKf9A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id DACC6380822B
	for <linux-renesas-soc@vger.kernel.org>; Mon,  9 Nov 2026 10:40:11 +0000 (UTC)
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
 <179422081046.2695611.17698874814720262842.git-patchwork-summary@kernel.org>
Date: Mon, 09 Nov 2026 10:40:10 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: [PATCH/LOCAL] riscv: rzfive: defconfig: Refresh for v7.4-rc1
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/series/1201815/
  Lore link: https://lore.kernel.org/r/ca5b7840d5e2ed20b06eed3364b1427ba67cbea0.1793798520.git.geert+renesas@glider.be

Patch: ARM: shmobile: defconfig: Refresh for v7.4-rc1
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/series/1201808/
  Lore link: https://lore.kernel.org/r/d3335368d073f91745c2d24ffd462b11ed18f275.1793798428.git.geert+renesas@glider.be

Patch: [PATCH/LOCAL] arm64: renesas: defconfig: Refresh for v7.4-rc1
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/series/1201809/
  Lore link: https://lore.kernel.org/r/27bb44d9dd4ca7a8ca9bd47045cdab44266b1e00.1793798477.git.geert+renesas@glider.be


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


