Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B06B3A7849;
	Tue, 20 Jan 2026 20:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768940184; cv=none; b=qRxj28yeygDUzWLSByjfUCoQXdQyvaQcsffDRuC4ZqzAPr57l2d2A5FPdMc1Lsq2sLHBABPYhTcpzTi8hUL0NcI2yBYt7wibdFO619WsHkVPgRaY4VtzqGhI0M+jpQi/5XRaAZtsPnHTCbdhw0dKHGMOynoA4DQkqMvkD7kGDnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768940184; c=relaxed/simple;
	bh=6dUKCugFRJzcq+YlARuQEeJm+3OTI5/f+LQQi+mQLis=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=oOpkhAgP4umhU04pFSKgcKhwcM8+fyXMeekSM8WQsOwRYPU0n+ngs6gkzjXvjeqRkv1EbklderodR9ZFOnlIRlJ4wWk2G76xM+lhIvfann8mh8oG20aG55zPzpSeqMAf6MVLN1No+BSsrusliRRO0UN1POFJ/Slr7kqbxYxaa0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e5iVNQHB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e5iVNQHB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E60B1C16AAE;
	Tue, 20 Jan 2026 20:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768940182;
	bh=6dUKCugFRJzcq+YlARuQEeJm+3OTI5/f+LQQi+mQLis=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=e5iVNQHBLnH2xoEyyh0mtmQm4Futeijiu0kHaXRulmtAjB8irbs3wkMH1Z9u0xwGg
	 lKb+H+tZuHSNopAFCtYBwhOmu8X+byXZKQrst7FrwHDCKSE3rUhKqMhSQtkJIL8fE9
	 Jj2edDE1UwsM08OAJm+l0nSbnPtGo7xRLeTLAVUZU6XHoDg94I8wu0oLp6zBHK+jDp
	 QJ8dXitKsJGxeW6KsMSjPtBpjeyydG6h7nBrLOvsyeorrEiqP9KgHRWW4n2n805S8m
	 YjrojJvgQvFfsazZUG7jvXpSnNehWFUZXl2PtwJ/V51ov3w8prBxk7D4ck+I84tdKP
	 h8r42UktcrTRQ==
From: Mark Brown <broonie@kernel.org>
To: biju.das.jz@bp.renesas.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 Claudiu <claudiu.beznea@tuxon.dev>
Cc: linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20260119195252.3362486-1-claudiu.beznea.uj@bp.renesas.com>
References: <20260119195252.3362486-1-claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH 0/4] ASoC: renesas: rz-ssi: Cleanups
Message-Id: <176894018067.787825.6650327370864720398.b4-ty@kernel.org>
Date: Tue, 20 Jan 2026 20:16:20 +0000
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Mon, 19 Jan 2026 21:52:48 +0200, Claudiu wrote:
> This series adds cleanups for the Renesas RZ SSI driver.
> 
> Thank you,
> Claudiu
> 
> Claudiu Beznea (4):
>   ASoC: renesas: rz-ssi: Simplify the logic in rz_ssi_stream_is_play()
>   ASoC: renesas: rz-ssi: Drop unnecessary if condition
>   ASoC: renesas: rz-ssi: Drop the & operator in front of function name
>   ASoC: renesas: rz-ssi: Drop goto label
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: renesas: rz-ssi: Simplify the logic in rz_ssi_stream_is_play()
      commit: 53dfb2ad6fcff111f58aa506afbbf6fd82f32cb1
[2/4] ASoC: renesas: rz-ssi: Drop unnecessary if condition
      commit: 9e0e337cc6c7f30a5986dd44dac5c0a0e30d971f
[3/4] ASoC: renesas: rz-ssi: Drop the & operator in front of function name
      commit: c7a4c368e7135046c358ff15c4f7897e2522dedc
[4/4] ASoC: renesas: rz-ssi: Drop goto label
      commit: cafadbf430f4b2f3ca4158de48ef6ba4d97fbf17

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

