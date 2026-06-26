Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40E33F7A9C
	for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Jun 2026 13:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782481229; cv=none; b=hSjzxincn6cxJvu4ylCexiqOKrdN67asg5kHFIDo8xgX7DmD6Nk7YfjzAYY6GWIEx5OhLx9M0dTAe8ZTvd/aU/NXoVZUfA5d9XwPVEnU8PBPbSrjKtsmc16F7nAboxzimrzb0njM4hPT6SLf/WiZA15z/m1Ukb6eF66w4mRXyvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782481229; c=relaxed/simple;
	bh=exJjnemMvESUzcX1wh6yLD5wYcGKsmJCswgmyd7tsdc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=a0Bike6CJKt6OHjPrIF97pJg29O5szyG+PPKRyGDCcBGY3AoM7oL4ab+5dLVTKK/GHjHkftZSn6doyIabOBSQdAlqj3e2t5r0Nbrm8TBEYuvFKtMGBWWAhiKcHcY2db99jpAY0hASxfoPa33Fq+C3TU1jrjElbnTAWp1oPGSpEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IAFhFR9I; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IAFhFR9I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BADB1F00A3A
	for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Jun 2026 13:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782481228;
	bh=pbHhpzZ7zLcw6vjfnDAUt4mO+S/wGaCFZ3wg8kRvvq4=;
	h=Subject:From:Date:To;
	b=IAFhFR9Iv+DK17q6InjRlFxMqVOf35ItfTkBqvSeKSvw5F7J2QwtBWo40gD4Sm8Qd
	 5fddRE8BuRO6o4m3MJOu9cQ3zbA+mr11BdkKdbPkCf1hcqYOWqFiNp99R+xtRqj0nc
	 Kx6800uYRs4jHbrnirCuIPOylC3Q1TwzkXEqgm7oBNcRAcnNY6tXpVS6HKS9Fr9crb
	 AaDhakwEajkkkj9kjdGduNlq/Glnx+5xQd8a3OsNdB+e8UKdWfKetwzZcRZt3r/oJw
	 vSSd69tnFbrm9jBXa0JMVwUR1BfzUGJZs9+MILSk88NnIRJZR3Kf3VAhkIl6L8I9Kq
	 LGlXxUW2+tfTw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 9652439389FC
	for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Jun 2026 13:40:16 +0000 (UTC)
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
 <178248121524.525657.533391943407865960.git-patchwork-summary@kernel.org>
Date: Fri, 26 Jun 2026 13:40:15 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: [1/9] arm64: dts: renesas: r8a774a1: Add soc: label to soc node
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1114273
  Lore link: https://lore.kernel.org/r/20260621025052.406507-1-marek.vasut+renesas@mailbox.org
    Patches: [1/9] arm64: dts: renesas: r8a774a1: Add soc: label to soc node

Series: arm64: dts: renesas: Add RZ/G3E audio enablement
  Submitter: John Madieu <john.madieu.xa@bp.renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1113827
  Lore link: https://lore.kernel.org/r/20260619083951.3777556-1-john.madieu.xa@bp.renesas.com
    Patches: [v6,1/4] arm64: dts: renesas: r9a09g047: Add RZ/G3E Sound support
             [v6,2/4] arm64: dts: renesas: rzg3e-smarc-som: Add Versa3 clock generator
             [v6,3/4] arm64: dts: renesas: rzg3e-smarc-som: add audio pinmux definitions
             [v6,4/4] arm64: dts: renesas: r9a09g047e57-smarc: add DA7212 audio codec support


Total patches: 5

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


