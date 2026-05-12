Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B2A384CEA
	for <linux-renesas-soc@vger.kernel.org>; Tue, 12 May 2026 10:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778580676; cv=none; b=WU1PlYqEQ4k2udhsxeBUyTqVUHLmoujKA2tvXDBGpeDIyXn1Ock2iEpJKaPYoNFXQuXavESy7UriLCCURs4N0rJtBeuM7u/AyAajNO/JIBaviau/eOJItheChck85UgkDL7KfFNwQl5pGWSVsZKUz6Xm24oF3hdY6PgeKOfT2gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778580676; c=relaxed/simple;
	bh=uDCRwG/jleEHyertUvyxsbu7QZDz1y6TWX5+QJAsoUE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=FhekGJrh8DLEk9xrsE2vZHPEyDOAQNOXip0GEfanFD8mY/piIgS+hf/Tl7D6An7bLfRnILRN9/IVXDNVLojCGH61gcXUilG3aKYacxtOvyVOowrT3nCWm1KWqV5tEtzu7aD1btAUNolMTkEFBBbYO3ZZ3SFKJ030lJJyy07pyu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r6K64xrn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r6K64xrn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69A24C2BCB0
	for <linux-renesas-soc@vger.kernel.org>; Tue, 12 May 2026 10:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778580675;
	bh=uDCRwG/jleEHyertUvyxsbu7QZDz1y6TWX5+QJAsoUE=;
	h=Subject:From:Date:To:From;
	b=r6K64xrnezCkRouDFaOwm0mcSLoHAGG3zQC8qZZWoIVYpQqNLga1rsukb98rOYM39
	 Ivg8DxVC/eDui6Is+ViTk86x6ckoXJOKK/lF1ctagZxfoDytkRf0X/RwZlgc2UM4PW
	 ktd367DGs6MGe2BL4jN7OMo4IVEIcTuI/ov0JfuzFazZb/yCRRplFM1Gb0+XvLfoF7
	 CFbOxcsfRTJdQ5VebtMyHlj+1lffFkotCYepp3cUlWjeVFdyELg+4cS/X+/AaMvc2I
	 2pXFyxYu1mBixUx7kzOAdAigJ3Z1dhspos4tTyxXRN9N6XRgkZ0+vnBd2lPklY5x9h
	 rgYVOtgY10koA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BC890393108E
	for <linux-renesas-soc@vger.kernel.org>; Tue, 12 May 2026 10:10:22 +0000 (UTC)
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
 <177858062130.2782186.16414917349414046.git-patchwork-summary@kernel.org>
Date: Tue, 12 May 2026 10:10:21 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: [1/5] arm64: dts: renesas: r8a77960-ulcb: Enable GPU support
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1016460
  Lore link: https://lore.kernel.org/r/20251027211249.95826-1-marek.vasut+renesas@mailbox.org
    Patches: [1/5] arm64: dts: renesas: r8a77960-ulcb: Enable GPU support
             [2/5] arm64: dts: renesas: r8a77960-salvator-x: Enable GPU support
             [3/5] arm64: dts: renesas: r8a77960-salvator-xs: Enable GPU support
             [4/5] arm64: dts: renesas: r8a77961-ulcb: Enable GPU support
             [5/5] arm64: dts: renesas: r8a77961-salvator-xs: Enable GPU support


Total patches: 5

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


