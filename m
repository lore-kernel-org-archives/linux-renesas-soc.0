Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5CCF36B072
	for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Mar 2026 10:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773396610; cv=none; b=JfP9SilGhpRyeKwVW0ox45qPWK4Rukv0/ObYciT3Ab5qg4JQJ84sjn3oyVZTfX8SLCTTnYbTg6UKduS6rj2eP/JCxbvKb0U803ByQLZI/sdNnUYxLmLQEg6AN3PXaO8NtjGVOKMqBOs/RTuNeJXB+kbIQhT/3ZC0oAoc/yDXzrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773396610; c=relaxed/simple;
	bh=xbpKpzq4tONEyzU6MUuBtSoN12LFjSP8WPc1Z8ehykU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=KutFYG/Pk8gKAJmaKwdQiGPRM2iFhNwiicbPdaj85g/nXu3msQ0mHntaV//T9a9bVI1ZA7NC7zyuyhazGe75bDydkIQJEXllTYsfmwhN5SrzN4MwyNKSrMERjoWlnZcH8/5dypMv9gS6uhTD6y6DdiYdhqCQemBm+SUv3QKNQdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WYzpA39P; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WYzpA39P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 617D9C19421
	for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Mar 2026 10:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773396610;
	bh=xbpKpzq4tONEyzU6MUuBtSoN12LFjSP8WPc1Z8ehykU=;
	h=Subject:From:Date:To:From;
	b=WYzpA39PAr8MKFgCM7KEBN7hNd4ff11dj5yIio1og4M4AORrIbs5iH/7DjYrl/UtB
	 AsEnvCGC8P4/eCFxJgu0IanHZEe93s3zb9n7lY/jt0TDH5MJdBx++096qKDxueA/OX
	 QqyIxLw7yVw2LX3t2sMGwiLTimXc0l2SbU1LH3KefZ2aRQRtpBubU8uZI1HqAm98sw
	 l8d4fM+dSGHZAD0+IbAmPh4Olj7fJvgCv8BgSqTsq5DWsUYJ/BfdwsWnxfPWJVBHkC
	 mPRr1yyJeKbP4naq8rQCn29JSaoupljGGhsMfC3Rho8wlsbnZBOwz4F7TcEjqFW14x
	 Njber4QS9S9IQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7F8453808200
	for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Mar 2026 10:10:06 +0000 (UTC)
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
 <177339660504.797092.7166565610802982759.git-patchwork-summary@kernel.org>
Date: Fri, 13 Mar 2026 10:10:05 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: [v2] arm: dts: renesas: r8a7740-armadillo800eva: Enable SDHI1
  Submitter: Bui Duc Phuc (Fukuda) <phucduc.bui@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1057059
  Lore link: https://lore.kernel.org/r/20260224074532.60046-1-phucduc.bui@gmail.com

Series: Input: st1232 - add system wakeup support
  Submitter: Bui Duc Phuc (Fukuda) <phucduc.bui@gmail.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1063345
  Lore link: https://lore.kernel.org/r/20260309000319.74880-1-phucduc.bui@gmail.com
    Patches: [v4,1/2] dt-bindings: input: touchscreen: sitronix,st1232: Add wakeup-source
             [v4,2/2] arm: dts: renesas: r8a7740-armadillo800eva: Add wakeup-source to st1232


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


