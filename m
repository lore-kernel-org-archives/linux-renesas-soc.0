Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9697425228C
	for <linux-renesas-soc@vger.kernel.org>; Tue,  1 Sep 2026 07:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788247864; cv=none; b=gNZMjRAiSiom4pFkRH2yath8Tj6gQkB27Dn0DFU4Ghrfk3wNB++VO2/qMqRpF/4zB++04Mv3svT6rLZJ1wSBfb+WUk9U1Ol1r1nv8w5nBGvS8aN7ZbhW786+35k6bBrcm8kM3XwvMMEIsZC6FDLHTR7Vo2dbZHYCdIHaD2dsmB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788247864; c=relaxed/simple;
	bh=nE6Ucig/u4c0YTMxpBx66+AeeKiLtRJAmGZNBgsJKnQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=sCkty1UquGqIGPg/OjbJ88HjBaVXQXDhTVXgVWswcp5f/yoPCaFMLtG4CQtJCsK2rJj+Yrg5f40dWinBKtvKEQUQjedDg6kV/eTwlqz+YQYs3EGwo2GVqBr/cytIcCKQzEP43jWhJ2cEVDbzgJRoL4jlu8koZA/3CyEJmV8sxvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PRHUPLLY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PRHUPLLY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33D7A1F000E9
	for <linux-renesas-soc@vger.kernel.org>; Tue,  1 Sep 2026 07:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788247863;
	bh=Wa9YxiCaZw1s7I6D+PHjIqFBmYtlWTbJZgTMT7iPHrE=;
	h=Subject:From:Date:To;
	b=PRHUPLLYq6MI//K6J9lTHadxquFSJy00Zfh9S10ow+1pqgEBU75GFj79ZhdOWB9ZH
	 7rZOvB1I3K3ThILZMtsv096Q9W1hrnr5V9tWcjlemfP/+KS0XXlsPow9XlnDRe2KYm
	 9BF+SGaNsD4h22nJETxMaNXEmOJeMxSb/ngV2rY566HotUVcpTFRf65imlbiOnQ8X7
	 v8zUjueHc7D1nmaxraqo6qKzqDiYebrES3DZCCIXfYtFgwkNTa0YsYczl+07ZME6Lc
	 NeC8xEkIPH+Ovy9tp009BO4vidsqnO7eFbF3oc+MVdMkcUTTV1sdcIN6xAwDZIJDeC
	 cgutG1W3gIjPQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 1BE243924A6A
	for <linux-renesas-soc@vger.kernel.org>; Tue,  1 Sep 2026 07:30:07 +0000 (UTC)
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
 <178824780569.997120.17881853082771570688.git-patchwork-summary@kernel.org>
Date: Tue, 01 Sep 2026 07:30:05 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: R-Car X5H CPG/MDLC support
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1140884
  Lore link: https://lore.kernel.org/r/cover.1785941595.git.geert+renesas@glider.be
    Patches: [v3,1/6] dt-bindings: clock: Document Renesas R-Car X5H Clock Pulse Generator
             [v3,5/6] arm64: dts: renesas: r8a78000: Add CPG node
             [v3,6/6] arm64: dts: renesas: r8a78000: Add MDLC nodes


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


