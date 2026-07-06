Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4DF542465D;
	Mon,  6 Jul 2026 12:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783339861; cv=none; b=aCTIM4xiLoeQjA5qx9eKQMnJFnnXLedgHAjJqRETmmCnzDHJV2BjtibQZHYqhZvv88ao1cpSumKvp91x0bowihjWuTxgmrdlj2RopMb5CtcIEHyc9qL0u9hh1X4TDP3CbWDHINnB2RXrLKcOCC8DVdjR8yLZ/sYuue+nZJ9r/zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783339861; c=relaxed/simple;
	bh=ESR20JOHsAVXwXKARQftYyDOraQUgdbUSMDegW7HOGY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=KEYej4CDD5gMbDbC3c4ys1qD0TmpaOuDS5YcnLvPNXIpJ6e3CLNJzsfhrK8pIOnJLcWtvzjpp+M5mkLzxI01pJMxLnF+7GHKYVnIHySLIFAXadxTJDJUubITRqu/h9gWk36utxaJdWYB81AjZjd12BXW17DsUXbP96AieJM3Aow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JC+p5Pt1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JC+p5Pt1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E1DA1F000E9;
	Mon,  6 Jul 2026 12:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783339860;
	bh=W/38Ku0KJt/WCf+BKYgLBeePBkhLQ/hObM8U2vK80jM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=JC+p5Pt1mYZ+9lF2NJaHQC0DL/kDM6vOVg6bGJOi+C5r0cWuZB4biiyuPH7vci+iC
	 cOUPTXBW/Ezn7IWBjLbD2FbV2OvEq9jYfrlPrC+EF2h6RNCpkBohYIeNGbznHcJich
	 N7UaSKVf+g+kXdqv7d6XiHOWIk2vcjH1SeKA5dHTkzotV1KrelrztceF15w55DjoMy
	 7Lz1hBHJzYoere/huF/TJUeY1N+Y5u0lXXeQtsP+AVdd3q/VNhf10Bs7805J8FV0iq
	 LWmuBxE2aqqEskCxvQDQyi5v4vYRF2uAl0Z5TOFwrQsjlBP8Cg3Ac/DAJwZP7LZJ2a
	 MZ+NF2xpuLJ1g==
From: Mark Brown <broonie@kernel.org>
To: kuninori.morimoto.gx@renesas.com, lgirdwood@gmail.com, perex@perex.cz, 
 tiwai@suse.com, geert+renesas@glider.be, magnus.damm@gmail.com, 
 John Madieu <john.madieu.xa@bp.renesas.com>
Cc: linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, john.madieu@gmail.com, 
 biju.das.jz@bp.renesas.com
In-Reply-To: <20260630175329.4145703-1-john.madieu.xa@bp.renesas.com>
References: <20260630175329.4145703-1-john.madieu.xa@bp.renesas.com>
Subject: Re: [PATCH] ASoC: rsnd: src: Add missing scu_supply clock to
 suspend/resume
Message-Id: <178333981248.57168.12375754705139131663.b4-ty@b4>
Date: Mon, 06 Jul 2026 13:10:12 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1143; i=broonie@kernel.org;
 h=from:subject:message-id; bh=ESR20JOHsAVXwXKARQftYyDOraQUgdbUSMDegW7HOGY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqS5tRqOaXbHwPRn/V/oyLiSHac97hiM6E/MhPh
 6AC8CZQ26qJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCakubUQAKCRAk1otyXVSH
 0EnQB/9cgXjNZ/vGDaYyoqcoU479SxcluEn7aufmqPEdrRz+6PeqbuI8kk0CJk1E0WG1PwXnhNf
 zMiD1WdNjyJPJY5hl/otBREnpUomTOhiO2UUZDpObqM978vJ20xwlMBD6H0jsnx6dGdIgaEgkU/
 cCQq+NHwNs67v8m06yI0B6ZO6iAdE5utBniahM37wgiLY1QoyC+E3O9uR2wmzQlE1jeh9LaZXsc
 CmJE7XGYVTMG3JIRzWReWI3YNPPbIyg9nCw1/2q+T8TbbLPLuG9KmtAOQ68oec67uHrpCQ+oeo0
 S85ik/CvVcmoE9yR6mP/D7NN8oU/MnrJ90+mRehn/eE5lKlH
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 30 Jun 2026 17:53:29 +0000, John Madieu wrote:
> ASoC: rsnd: src: Add missing scu_supply clock to suspend/resume

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: rsnd: src: Add missing scu_supply clock to suspend/resume
      https://git.kernel.org/broonie/sound/c/83245e7a436c

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

