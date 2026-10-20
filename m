Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792482007;
	b=ixUdtbvk+c3GjLo5bCQTMbnJt4QvshQcv4lLmbt9d5eZpjigfolo4qzA5/aqJht4ugn8
	 p361yYsZDi3jiXsnCHfLB5rt11QvOF4KkA4UHQZMEHsEAuLSiRHo+y4yuEl3EMBw2CnE7
	 tUN5igyD4abmp6LiJG87Km9U2xcco6jwjJoz5ZY7Wp4XPzMa34sa8dpghoUSTDlFbquzs
	 4ua6+iyx8qlRbUjHFxHS6OK4xBu7M+fXiz3Psi7fz8SD61fnN7MOlYzL8DPDRNk8G660O
	 sSm8WXvTbBUm2kytOfbthmfexb7lbg44ms4uVDeXblNHN5PxWekoN8p2RTmZN3KX6uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792482007;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:To;
	bh=Cd9UIdzArb814eOWVnEvJVyGjBYfI8NLkgZCWlmp3ps=;
	b=gd3WBAqKAG37/88AAEnBVi97XXxV6fzdwfriT27EoizZJ89Mh5buDy65aeTu3GhzNfCS
	 +Gf7LKAr0q183CIjrKfGMrfxZAMyoV21gba5WvjWKbt9AjrtSytBHGoIznPW4YA5lXnXy
	 5vup5udFwKmArDfj4tjGjEKwtcILZ6P1PDwzJkPZSqS1rKbqRPOwhEAuw+CePtfiSUYtG
	 JsdS5eaVdhnyXrAshHibQ2ryOqz0jJgmMwRnwgoylgdzviRjYGocMCs1xP1WMJPBQt3S0
	 kOO93nidSO3Twk1BNo6jKhth/bzhlIJnhfmQHFicLfUkNGEbk7os3H9dWBCzuLFRRlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZFE3XQf1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7EB606A31E
	for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Oct 2026 07:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZFE3XQf1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4B031F000C5
	for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Oct 2026 07:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792482006;
	bh=Cd9UIdzArb814eOWVnEvJVyGjBYfI8NLkgZCWlmp3ps=;
	h=Subject:From:Date:To;
	b=ZFE3XQf1C4dYjrFm8xeBObB12LuIEv1vNo99ICuROyDj846U6hL0jVlMYucW0oIR4
	 6babAYJWnGVmGtU5Yp7GO2yEmimBRWg9SYpPbAx/bGrydVB3iJvlt57VkNsatUlR1K
	 J9Uj0+v0/1nZxY/FeIAufhilb/Cv2KBfU1nwQukMHSwsKlk7jKBUspUfsLql461mNG
	 5CdBikDPKJFlPRb1QTJYSFvWB5WevHMi9Mvv9SxnAOR04ssAS1OR4L4C+fUSToX304
	 /EerEsUT56Rn8LCRNYlgwoYMIj1NTkatqXqapMZdysnixR88Eh/12mE24zSM6Mc0qv
	 2Oi/IKxCYlb9w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 79E1B3924FDA
	for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Oct 2026 07:40:06 +0000 (UTC)
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
 <179248200493.3551319.8005183353199275222.git-patchwork-summary@kernel.org>
Date: Tue, 20 Oct 2026 07:40:04 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: timers: Add support for RZ/N1 SoCs timers
  Submitter: Herve Codina <herve.codina@bootlin.com>
  Patchwork: https://patchwork.kernel.org/series/1177485/
  Lore link: https://lore.kernel.org/r/20261001082225.125956-1-herve.codina@bootlin.com
    Patches: [v7,1/4] dt-bindings: timer: Add the Renesas RZ/N1 timer
             [v7,3/4] ARM: dts: r9a06g032: Add support for timers


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


