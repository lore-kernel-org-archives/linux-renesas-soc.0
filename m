Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0789389E07
	for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Mar 2026 09:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774864300; cv=none; b=H5XWDwncQCYIq0fXWaXYL5yCCj0tV9q8rXYgyVsMGq9aaGBU2UAt4HqAQoOTxqwINs/AgVi4N8Fs3OdNeBnMwr5MZebR2/HlI0arxit/8bBTSMsssHM2PvJgR3kqBBxDswEmDUyP44h4Gh0ian8Rhn4JHNYYl1Tr0K2GoE5ZDE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774864300; c=relaxed/simple;
	bh=OXNX/Ug2x6/gTt6PsDQ14KtrtSsY4bi054mDLVzJZXo=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=H/rw+/Awn3jUMUXmCfBnmsNPvPJZYCJfzYLfXlDgm22MYoVbkVnVPrAc5fBhMCg3PGibso1QYXSXnDyKoTLdPh+p+6UNEi8dT6o2uz1KyiuIeMATFULA+Z9VSQyTwGDIyPizHESoeryoTPyRJCMByybd7jLMdPT8tPsUh1E7dy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PRgV8pj/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PRgV8pj/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48784C2BCB1
	for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Mar 2026 09:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774864300;
	bh=OXNX/Ug2x6/gTt6PsDQ14KtrtSsY4bi054mDLVzJZXo=;
	h=Subject:From:Date:To:From;
	b=PRgV8pj/iupl+WYm/ikdqHQDnsZsRPAps3s11SW/N7ROYiKle8A1oWb1f2Xa8tYID
	 bCUuWz4AVkBCyOlqIY6eySq82xUS2eunUX7VyTnJ3hLMqviLRpFsIjeiNrEk0RSa95
	 Ce2VRvPN0ahHi2URWF7/CqgT1L3aVX2r/giIyrZLYv2uUZOTJlUKaHSAvQO7IQmoWJ
	 Capz3bKpAR4bAzMwsIFGAPT14HZmMbyZXDF0K/XLUdHlptAIYSvIIq8EdnIqYHoGPj
	 yWn3ag2JoDBkRAhiflLb6+G8nemQRg2zFz60wOoG94WYNjMj/VHePgFz8iAcgkAdhD
	 3ouJZRKijr1wA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BCD5C392FFC4
	for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Mar 2026 09:51:25 +0000 (UTC)
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
 <177486428423.1080314.14947368629452795068.git-patchwork-summary@kernel.org>
Date: Mon, 30 Mar 2026 09:51:24 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: configs: cleanup obsolete or incorrect assignments
  Submitter: Vincent Mailhol (Arm) <mailhol@kernel.org>
  Committer: Nathan Chancellor <nathan@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1067836
  Lore link: https://lore.kernel.org/r/20260317-arm_defconf_cleanup-v1-0-8eecb7fdd24d@kernel.org
    Patches: [1/9] scripts: kconfig: merge_config.sh: use POSIX '=' in test


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


