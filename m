Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B172D1C5F11
	for <linux-renesas-soc@vger.kernel.org>; Sun, 31 May 2026 09:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780218020; cv=none; b=kT4y5zZObHqBW0vEj5QHjnGWy9fvYy5+sj7BZI3eF929gJh1TSfCTeDpRFR72ez3Gfoz8JvnQgDmDLOMrfwpVh9nzL8/WRovbEmrXRUupBSZO9Ho8L3ziMe0hKj4TRWZlBTVHfZnGkMsHMFsvQ6sCaPrXcnL6JctbYv0CLl6JJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780218020; c=relaxed/simple;
	bh=loaXIfpf76Pd9DO7MUhdUNbeErRL2RiBRgJ/A3p16Lc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=XwOJzjce5a1BRutowoT8X3nw4KsOtfJA5PDdsAYNjcNwK2d/xYRQqMx9lh4jSVAlNjQrD8ombv7Wj+Z0na3qXR0VPc6YB18u271Mbf6YBo7BXo2d7IfZP2RdniimO5nQ79ocghe8VARhC06snSn3r5XMQKVLxn68/Awucr2s/bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CIC155q7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CIC155q7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9626D1F00893
	for <linux-renesas-soc@vger.kernel.org>; Sun, 31 May 2026 09:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780218019;
	bh=u2m16UX4Mrvn9+mOz9zy1dISqLNRVOn6/8KEnPEA7yA=;
	h=Subject:From:Date:To;
	b=CIC155q7q489M8/e8UaoPqPzVkKB5etSsEHpkBygUqs2Qr4iJEaKiVD5DQ8uoCYLB
	 XYOU5GezHXdMquPO9zPTOA9txBzX2So2sz4EzdwZ/mYztAbG2rhnu3gZNWgzsi+VOE
	 y1ss3IICFwgoyK+ofT22lMkrvP2GLNC65R0JIyNY0cFeF58R0gxLhmVMcPw0jsfYFY
	 x65GWVf/eOpUsWnnt8aJ328f57PpKonUwoRdlVllFOUwi6mcz1jEgPfu5TuGA/H1df
	 em545xF+7jI3jHgelk0GYgBs+P5yHU7B7yJrPVYPN0WihVHcn42n7fOBK+3FnYoFeT
	 162TSZAyhnxyQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0CCA39302D2
	for <linux-renesas-soc@vger.kernel.org>; Sun, 31 May 2026 09:00:23 +0000 (UTC)
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
 <178021802251.2832042.434445016040821306.git-patchwork-summary@kernel.org>
Date: Sun, 31 May 2026 09:00:22 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: [v2] arm64: dts: renesas: r8a78000: Describe all reserved memory
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1096175
  Lore link: https://lore.kernel.org/r/20260517200814.21624-1-marek.vasut+renesas@mailbox.org

Series: arm64: dts: renesas: r8a779md: Add support for R-Car M3Le R8A779MD SoC and Geist board
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1089328
  Lore link: https://lore.kernel.org/r/20260504144534.43745-1-marek.vasut+renesas@mailbox.org
    Patches: [v2,1/7] dt-bindings: mmc: renesas,sdhi: Document R-Car M3Le support
             [v2,3/7] dt-bindings: clock: cs2000-cp: document CS2500


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


