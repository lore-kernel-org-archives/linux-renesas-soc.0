Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AAA548A2C2
	for <linux-renesas-soc@vger.kernel.org>; Wed,  2 Sep 2026 12:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788353479; cv=none; b=CkclmdXeKa6MgThmsVb7xuC2Znmv0rB3xzkRQCevoYrEki9sczXqMaWMm2tmGaHtQBOWzYahx2WrLKXrzlCjvkaT4HvSmcHLND6R3NYIasS2Ud92v7zawlmX6A6WBCy6qZudL8UX4hXwPHFOQTftA5NVVVHDd98RqZCtNsCiWTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788353479; c=relaxed/simple;
	bh=ISyGVtZ14Pts2tswTlsCTErXYsU/ClKecAAibk7Ou9w=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=I+lFn17vbLwBKPe8dYZ5dNcGsXFgkv8eXWNS1dp1srgrwVp0j+mp1ZOvwylkPaRt1Vhlkbb/9zoLuOzVb7rpiCd4WcRFGsGzQYOINLSFmrIzxsjyHXxruug/wnbYY3IuamINY+IfgZnAvuAo3HyUqKLgwVO74DRYn629+DnDDis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hpGUZ5Uu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hpGUZ5Uu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34BD81F000E9
	for <linux-renesas-soc@vger.kernel.org>; Wed,  2 Sep 2026 12:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788353477;
	bh=CK88pYq8AX75gixXSHe4K6JZGzTLCadT8Hx/z2Wiy7k=;
	h=Subject:From:Date:To;
	b=hpGUZ5Uu0R7Ekwa9z/kOdQdJ2/Y57D+BLWgzYk41WdV8poOrZX6+610xTGtPyOgJM
	 KGNueyCdofT5/vgbPwctMOPSMbPGJizfuEOOOQxQiKYreSVCnYECFHjSFgvmz6ZeAw
	 uZGM6o+o2cH128yxbU7OWb0RK0RfQyFaF19EuA2e9xrwCII+ViZbQeFWbEPwPHwZPg
	 WoHkiw5+iRAEDC3MBaR2a176MZmuzL95HJ23WJ6RZtwxaBZ8X/V7cONgbZqtQNuK29
	 U1+w/05IdJrMcKxXsADIH6Nh0adjVZ1Ex+mI49x5Y8bpi9JKeGs5i6POy5Fug0dsQ+
	 C061a9+Q8CyvQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 5924D39263B8
	for <linux-renesas-soc@vger.kernel.org>; Wed,  2 Sep 2026 12:50:20 +0000 (UTC)
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
 <178835341903.2712775.6937449454999701261.git-patchwork-summary@kernel.org>
Date: Wed, 02 Sep 2026 12:50:19 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: [v3] ARM: dts: renesas: r9a06g032-rzn1d400-eb: enable GPIOs on CN12
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1147128
  Lore link: https://lore.kernel.org/r/20260817103255.49565-2-wsa+renesas@sang-engineering.com

Patch: [v5] arm64: dts: renesas: r8a779g0: Add GICv3 ITS and update PCIe nodes
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1142986
  Lore link: https://lore.kernel.org/r/20260809200429.843212-1-marek.vasut+renesas@mailbox.org

Series: Add RZ/G3L PWRRDY power sequencing support
  Submitter: Biju <biju.das.au@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1152057
  Lore link: https://lore.kernel.org/r/20260826122742.153643-1-biju.das.jz@bp.renesas.com
    Patches: [v5,1/4] soc: renesas: rz-sysc: Register auxiliary device for PWRRDY power sequencer
             [v5,4/4] soc: renesas: Kconfig: Select POWER_SEQUENCING_RENESAS_PWRRDY for R9A08G046


Total patches: 4

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


