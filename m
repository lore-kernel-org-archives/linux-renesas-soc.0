Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9A7401A2A
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Apr 2026 07:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777360849; cv=none; b=KEvSuU/sl8jigG4SimKpiVQkl9l7n2N9o9T4yzYTyy2gneiBTzLao5lftVrCVe26JLGkDBROc640C5U0HaQtnyAXQXqtRqqeoS30hfff31J4+VBnO33mFvcfEg0Fh8Tz2PI7o7Od55CChzT3HLly2CpqxvidvE/DQu6QWdSSqzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777360849; c=relaxed/simple;
	bh=ll9+QhSKCVAyVn23QJYiuhJ7Bzl+VFz4FS2ZyAm1+uw=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=Mp7wPEMco/VyJKqaHjMi0CXxgBGnEs8G4yRv2TtBn7hJQrw4RSMLUHtpa8OJHAJxqYQ/vPm92VYeagYllUvMzpDYx4OyZja2yTuFrnPVNCwtj5hwqN4T1Ssu0ipqj5i2G04YJFME+iL06bXxB+trt2Tez5+7ZItLamrDrd958ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PnOFI3Xn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PnOFI3Xn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FEE6C2BCB6
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Apr 2026 07:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777360848;
	bh=ll9+QhSKCVAyVn23QJYiuhJ7Bzl+VFz4FS2ZyAm1+uw=;
	h=Subject:From:Date:To:From;
	b=PnOFI3XnXuSpmBCIuLBaZYJy7ELYJtsXPiImILJLQr7659ffmVsmxVLyne4RtycNu
	 3XQWO1BFl5KAylZh8qGGP194v0It9skM9M23OsYP9oMpbSoFXE5OA8J5vW7hFODQWq
	 bGvOH6Rj23yU52ZQrKIisGNmaOUTZ8V4lUd39n2I6sc71/EJ4AEo11+FzJRa4wUWlN
	 HyAINyde+jI6B5scqPBxDiuBVsMj6/+lHiCbJecZAEa2RKjoPbN44uqmd6adRk1996
	 Y8pu31/ryyqg95EU8rDrJ+6zvQrbmTy15N2xLpdr9LLwjGM+5aNwh5Q2kE/uAAPk9f
	 zASZN06PpkexA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 426073930001
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Apr 2026 07:20:06 +0000 (UTC)
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
 <177736080477.298314.7030869990014823326.git-patchwork-summary@kernel.org>
Date: Tue, 28 Apr 2026 07:20:04 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: Add Renesas RZ/G3L PINCONTROL support
  Submitter: Biju <biju.das.au@gmail.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1067896
  Lore link: https://lore.kernel.org/r/20260317101627.174491-1-biju.das.jz@bp.renesas.com
    Patches: [v3,1/8] dt-bindings: pinctrl: renesas: Document reset-names
             [v3,3/8] arm64: dts: renesas: Add reset-names for RZ/G2L and RZ/V2H family SoCs


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


