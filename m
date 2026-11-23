Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795429807;
	b=fcUl7Ui1tmWLGo90u/3n5/MNvr6FdSOTO7u9NFqN3XipfIdf4pQSmpjBAqs+wQuVidEF
	 NvbraEzzDdiBv4v8IarYmmf4bq8GuGqiZPGgIUpE0pZIOnX1zcV4VKodoN5Lbkm6ysqyu
	 YeARssJw1cJtp8IHGkzFCQlsvcq8zbSyjaLwu3C2Ef0OO1Q8Q5caYTBhzqZzy6PjqTSrn
	 sQmPpz/BM0g8/XLx1ZeveCEZPd5Qp+Atf0zHt8wFdNG745RgLQnhV3Ng2vTcGqdljoNZU
	 a2i70T2R7JqxB+DjuQ/kYggvtap9Hmz/rvKgzyXdwK1ntSPOC74GEtHDXoJoHh7Q/Mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795429807;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:To;
	bh=EgV8bPLFgn5qOTH4qw7hGMQHjNvpMwEGe+Kyk5Qdl6Y=;
	b=O42fG90MbadLg1enYlkAQ+HtjKDD9WqBMIMjVD7wAgj75KqAtaHT8VV5w3DaGTJ+FwOl
	 CJ3yn0u+BKzQrBlIkWnsCxksdSCWadkIRH5ec6xujXDC9yxuwca3M+c7hB0QKQhW/Oits
	 nniBLK7xrI5ElwStXMH1vujWA2/2JeGA8BDSk2u6ij9nLSaKK9Ru9UdKE8kEWmx0pDhPz
	 hBN+I+HHVVBOvTAk8P9tpTa6+dQzUzGneLyXrE6MbB2yllGoPt1IIuwWWYp7zO8zR4xe5
	 APljHsRv0+EhFJKLRwXKlOniiGPHjksNOKNwOSCg5qBZQg7Lv039HzjoT244tEzWneA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Te1GDYZg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3759D606A330
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Nov 2026 10:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Te1GDYZg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F6FD1F000E0
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Nov 2026 10:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795429806;
	bh=EgV8bPLFgn5qOTH4qw7hGMQHjNvpMwEGe+Kyk5Qdl6Y=;
	h=Subject:From:Date:To;
	b=Te1GDYZg1CuJ3kaiE7MFREXAgIhM/5N0exwD8j3jJdyyefj6nV2NqLRuQXEE7Zu+Y
	 bfxB3v30+0nYqy+cbFF8P7R86MCZGeXaUWb0gZrxbPZzHYNhxcaRLGyE5HXMg883ey
	 48R2NN/EJ3v9EP41CZxtYKNkDa8LFOCNDBbIhrmgJw/B7grYtTVblM8AHHY6ncto8t
	 85b9F95ph3ooLP9q2HsL9ji5E3LTuV6JLDOY0kSSzaDiBmKO9vZ942kFr/KbzXiUow
	 cdS61LNj811RMPcctGyL3stdFLAV602Np5SF20YALOVz07J1HTBKISrsk0ym1CJW0u
	 RKEBY3bbnvPpQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 799FD392ED85
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Nov 2026 10:30:06 +0000 (UTC)
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
 <179542980504.2295705.13299121585947776253.git-patchwork-summary@kernel.org>
Date: Mon, 23 Nov 2026 10:30:05 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: can: rcar_canfd: Add support for Renesas RZ/G3S
  Submitter: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
  Patchwork: https://patchwork.kernel.org/series/1156231/
  Lore link: https://lore.kernel.org/r/20260902141544.565763-1-claudiu.beznea+renesas@tuxon.dev
    Patches: [v4,1/7] dt-bindings: can: renesas,rcar-canfd: Document RZ/G3S SoC
             [v4,6/7] arm64: dts: renesas: r9a08g045: Add CAN-FD node
             [v4,7/7] arm64: dts: renesas: rzg3s-smarc: Enable CAN-FD

Series: Enable Renesas RZ/G3L CANFD
  Submitter: Biju Das <biju.das.au@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/series/1212948/
  Lore link: https://lore.kernel.org/r/20261116-canfd_rzg3l-v2-0-89e06c46f40b@bp.renesas.com
    Patches: [v2,1/2] arm64: dts: renesas: r9a08g046: Add CANFD node
             [v2,2/2] arm64: dts: renesas: r9a08g046l48-smarc: Enable CANFD


Total patches: 5

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


