Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEAA23D5645
	for <linux-renesas-soc@vger.kernel.org>; Mon, 18 May 2026 09:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779097258; cv=none; b=fGkYOXM6GuGbSEg4pXhZSARPHcZswxSUs8UycCT81eHEWt9R2EKlaLThIoT0aPpg+dNsy2eE/0L3TcN2MRSOIRLCbi9+mGINNTlgWel75Qtfhl9zrttErEkVlpX9P1MD48X1mPuaCLO6ILFFMcEY4uYAzvVnX9vPESC3MNtovKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779097258; c=relaxed/simple;
	bh=wr6juJa8a55svbyqJW4IRtzyK16QMDTbkuHMYD/CI/4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=adGhxZx2LvwxgeWBNzscZgavydChddGZquyfR3RLFW1rfX1NpYc77JChmN2xG9NAnA50porCcD5d+Y2j93oxtpdfJHC7M3cMBeTkcKYxPx1uI73mMBnV3QBhe61I5UnuAxkDF8fIECDf86ppD9Wi71sn0DBQrz1pXXYsANhgizQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AGbniK64; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AGbniK64"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F00DC2BCB7
	for <linux-renesas-soc@vger.kernel.org>; Mon, 18 May 2026 09:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779097258;
	bh=wr6juJa8a55svbyqJW4IRtzyK16QMDTbkuHMYD/CI/4=;
	h=Subject:From:Date:To:From;
	b=AGbniK640sbuhw7pUWNEQyVUGLxXpVdj3H/XOvxxFokMtorQCD27db+5xSafXhhxA
	 TYUdoa/OJJ8SwYvQOsJw6OqPYp9qW4VU+K2toG0TYtJ/qyQwMyRcRVFGxtkSrj/jIk
	 eUhLdQt2dVY8Gd4B79C7NV+8mNGdE4P9i7JxeJE6tZwVZkjSHQFdb9SpFV34pCmcQD
	 vwu7105pnX2gXYlLkFWgbBEJ2bEidVTGdl3aywslnoAjiJ+u+y6L1KkYVVgizj1wUO
	 Meg0R3/8DGuP1TL57rIQ4kGbo+jexF4JNZXUbiHUAT4KFUVils3BTpBVoBHdTRiw6b
	 wpcXk5u2B6qDA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 1C3853930BB1
	for <linux-renesas-soc@vger.kernel.org>; Mon, 18 May 2026 09:41:11 +0000 (UTC)
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
 <177909726980.1305655.8310252288519869815.git-patchwork-summary@kernel.org>
Date: Mon, 18 May 2026 09:41:09 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: [next-next,v2] net: ethernet: ravb: Do not check URAM suspension when WoL is active
  Submitter: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Committer: Jakub Kicinski <kuba@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1092248
  Lore link: https://lore.kernel.org/r/20260510103017.613773-1-niklas.soderlund+renesas@ragnatech.se


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


