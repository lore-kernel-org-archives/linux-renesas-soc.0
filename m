Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50F335DA6A
	for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Jul 2026 08:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784019041; cv=none; b=UUtVn0LBnNjDZD7Nuzu5/WaBidd2SQ+vjO+ZREyx7AC5B4KYvTM7U+YpZhWYUWW3xEfU4Q2AoJKufl3IJlk5ovWpAZ3EGg7M+vA3IxCaiagU7czL1BGaKcx+aFViNNit9Cjj/zMcYgFMGOr9UVo407ujTcBw2iXuJNZi4rH19WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784019041; c=relaxed/simple;
	bh=8ud//6Dr0+sr0D1Fatv6D5mpuUc5KpLZy1Yg/is1xro=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=mcytAUqrBTjJhBhO8VJ6+m+26c0sKIAo/fhwkRGSoxrqpb3wdEYo4WB34rx6NuCYnp4hNxBVHaEc+T5UI3qoNh9DGMrFUeMaNKvXw/mA/ydr/Lq0TiJFgwY5vS1mf7wELEZ/ivC32rkhqk416gzNTAMA5f12HnNrqSEoqN8jh2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QKSvgo4e; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QKSvgo4e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61E1F1F000E9
	for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Jul 2026 08:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784019039;
	bh=9wqhMzkJdH71yivlMT7QowX7hF4yd3dHYKtn7TaesBU=;
	h=Subject:From:Date:To;
	b=QKSvgo4er+wOYCBFXkX3EqmVO7f5CHexAUj/N0n/1/2TnR1FNF2NjyK/aVWVzo69r
	 UxEsgxk0De+YPZ6rDoDRmkALNlMluiagJhKViVVMRw6nC6cQ65msRCE8CPC6lhDs6g
	 N0R0yYoGuO6M3lfZqDGuFFWMq/mUSZwQjTAZ9CvQ+PgPju5UTaJixImdSup8iLmAbw
	 n3LXTk9j/VtK5hcdFaNuVk/7Sr26uFxenS9Ji7M7lrBcP5tV70rCBDYqSoIwBUTBp9
	 GHQea3G8Dij8xm+sOl8qb99/1OX4UoPd2eB4IkvNBOmkiZfeh1oFSekEaUugojWUwT
	 aatCBsqsX25bg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 596E939250C9
	for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Jul 2026 08:50:15 +0000 (UTC)
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
 <178401901404.3044085.4263811668285294401.git-patchwork-summary@kernel.org>
Date: Tue, 14 Jul 2026 08:50:14 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: [v2] arm64: dts: renesas: ironhide: Describe inline ECC carveouts
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1125486
  Lore link: https://lore.kernel.org/r/20260710160450.64967-1-marek.vasut+renesas@mailbox.org


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


