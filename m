Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013BA3A7F7C
	for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Sep 2026 09:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789462871; cv=none; b=fHRmsq3FjIpobwZW5+1PbBiYDpJWAcg/6TdZXDQTsGivoszk1cv//TeBvo+Pf4SUZYuA6A5ldubqkpj9g5RAuPkojo8KiENZjWxg97+n1Y526xzAw3SczQ2JzJXwOs9hzbt7DiMo2Eh4y+PO/LSUpmIDZYYRi84HcLPwd0/MT80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789462871; c=relaxed/simple;
	bh=3GJn2QtLhXzVJNg2ajNoWdpNIIdwTAZBJFH7GZ1QRQs=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=TSgB0UUUXMmlULLpd/Pe3oZZ59sknE/G+hWcha50mOOmCPi8mt7La7xJyz5Ih1UoLYY/XZ3tqUCh3VraaOLj76pKuPxas1rqN5Y2rHHPizmWq4OHTDXQWu5o2MIdggO681k1FN8GR77cFlRMwfqDYCG1GAElIpdw4/Q/iodlRt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bF3CYE23; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bF3CYE23"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A1AD1F000FF
	for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Sep 2026 09:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789462869;
	bh=9LLGK6Ko0nHUbJy3spA4qhTuJRtVCN9MQDQjBeV4ods=;
	h=Subject:From:Date:To;
	b=bF3CYE23Sp4znkOEoVV4dVW+4svHRxF9u1hAgkwvhj3AQlnQxuQPjq7ApWvDZP2dN
	 hYebumavJiYxZxcvsRAXNQyMGCOnPFvDil9mRPvbVCmWDYF9Br2IitXlm0DpcI+Gu8
	 gCo8+M9XmgL7Kz3/2q1fT6+te9pHBG0gJUojiqCcw/EbB2+kUsDJIK+VlGJlpTrG8S
	 oZZa67kPQ+NyCb1s0BiU/OhulvjFr49xngdtfzK8IUk2ZNnQNtLC+aHT4E6PaRKo9I
	 l55JCjJRFCV/pYLgmVVsrJhywIvVHkWEVk/3Qx/mGFE3SmPa0lF5prxvYtiN+oU7UT
	 VWND/wrZcS6DA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93A3E3926244
	for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Sep 2026 09:00:05 +0000 (UTC)
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
 <178946280423.1461254.13404871276574498556.git-patchwork-summary@kernel.org>
Date: Tue, 15 Sep 2026 09:00:04 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: [RFC] arm64: dts: renesas: r8a779f0: Add GICv3 ITS and update PCIe nodes
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/series/1161526/
  Lore link: https://lore.kernel.org/r/20260909175922.161658-1-marek.vasut+renesas@mailbox.org


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


