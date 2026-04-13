Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A831B22156C
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Apr 2026 08:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776069387; cv=none; b=MLXs0n3Yi3FZ+EljP5zzTGD3JDzOlNzkZS6MeMNLo5QFKtjqIJVIQ4Jr1TAswjWsVrv4BKl0TJyc1aC1MNTZAnwKQJmM1UfQ4Y2bCQs9LI4koaBw2khSG4Tv+32yzacGeWsqL9YDsNJcgBlOHdaPA2MWPXUojSZ+XPyE5BMUQJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776069387; c=relaxed/simple;
	bh=Hx1ZONIbZ70mXCmhgFaFfR2FL0pD8416lILrwBk+qN4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=jbnvE5iLJM+RZEexVXJjAYgGlHZnxXqZXvVaqJoW65qPscQIgOXKcc80e2m7wLclkqZ9NeKJSwTjh6QOCeiwj/KnA0z4sFBWcjRyhSA10GDQ1x4N3z+dXonwmvsaDJF00MZ+NiOd1pHWDL9B8s/PNG19AuHuTcD19UbPw3FNFE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D/HSgMIp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D/HSgMIp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 469E9C116C6
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Apr 2026 08:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776069387;
	bh=Hx1ZONIbZ70mXCmhgFaFfR2FL0pD8416lILrwBk+qN4=;
	h=Subject:From:Date:To:From;
	b=D/HSgMIpMMfPUDa+XNhfeBtoo1yIj7d0aPN5vRqOrUh9Ooy6rjpqIR8WF2/3bLliF
	 RdUn6i4ptq6uUHLZBAwjuKWP/gP9Hk220PXFEDUiSNF0VbbCXP5fvAj14lWv5693U+
	 UxrTzpojQUCfprDhjXqOcBNAh8OKXj2ASUniBaJXumY2+hG5wUWy2HmjoMPlDw3e/g
	 ZQ0Mq7HcSVaN65hbvQcqXBMEB4/edoHtHbTO2R+jvc2ehImlImiH7c+IYJuUNZK3QU
	 khtn+1z2h/+RKXL63EL7dVWzuUa4sPvYuZgcG//q7jJ1c22GRO6MYBGAAgFdrjjN8i
	 r2sXtc8JqS9mQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 427D53809A8D
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Apr 2026 08:36:00 +0000 (UTC)
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
 <177606935903.3996493.7209020772567904169.git-patchwork-summary@kernel.org>
Date: Mon, 13 Apr 2026 08:35:59 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: soc: renesas: rz-sysc: Move common code to helpers
  Submitter: Claudiu Beznea <claudiu.beznea@tuxon.dev>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1077039
  Lore link: https://lore.kernel.org/r/20260403141341.2851926-1-claudiu.beznea.uj@bp.reneasas.com
    Patches: [1/5] soc: renesas: r9a08g045-sysc: Move common code to a helper
             [2/5] soc: renesas: r9a08g046-sysc: Move common code to a helper
             [3/5] soc: renesas: r9a09g047-sys: Move common code to a helper
             [4/5] soc: renesas: r9a09g056-sys: Move common code to a helper
             [5/5] soc: renesas: r9a09g057-sys: Move common code to a helper


Total patches: 5

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


