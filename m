Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41580264A97;
	Tue, 17 Feb 2026 19:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771356281; cv=none; b=Lm51gfSNg9uo9uG88SH2PdJ9R7dzUdozGC/m6rVmleutDFJ/e0G0ZfbBTV+5hryuPfeoeS88cJT3NlRQCX6HgTYzCSlUzwxwtz5qWvV56sZg0mM5mwMAI3eRMZWtHGMGp0L25OcifZZQREzsHg2fLHcGmKw8V5t9tIEK82HHUCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771356281; c=relaxed/simple;
	bh=8ghGAV5BxOgH283VZgsGWAPOfml4IsqZmeuT3P3pPGA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=G4/aLhgBEQkcako1gFQzLafIoo9wMqCdr3NCjHMQzdA3RqjhNwjXMBWeFWAyNJhvFCowj32xly+YUyLY1MUTyldIGwq5t/sZYVIMMwIumX8o/1rapcmet/8zMNqv0U+sWX1Sj4/UzHKTY2bDFIaAPnXOKupy1NN5BEDKsWiGjf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Es+E5cJM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Es+E5cJM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10060C19421;
	Tue, 17 Feb 2026 19:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771356280;
	bh=8ghGAV5BxOgH283VZgsGWAPOfml4IsqZmeuT3P3pPGA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Es+E5cJMKEEF4PKdnglxC2Ff4C0FRKZFDscrE0pViTuy906rPTZnA14vh2HC81t9R
	 ZupJNpBXy2z/edWWB7Ip/K+uYy0SbN0CyRSlk6RkZjdDVIKcK8lkojssz6pX2aDUqd
	 jE8n0GK0z86tGuOVDm1ng7tKk0n/9nHltF9/komb7TH94+DEpqngi4c2TXWO2KMe0b
	 3DRiSCLAGMH+bgyc95Zrf8J2/fshfMhUS19aWE3j6SznxG7U5Cflql6xIDQjRbCUJe
	 XYbjrwS2ky99Qnk70Y0Bn9Ozztf0hDqSh0JuE2z9zGwrH7ogByNvGB9ax7B2LziN1b
	 nxCOBesE7aISA==
From: Mark Brown <broonie@kernel.org>
To: biju.das.jz@bp.renesas.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 Claudiu <claudiu.beznea@tuxon.dev>
Cc: linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20260213172434.3801015-1-claudiu.beznea.uj@bp.renesas.com>
References: <20260213172434.3801015-1-claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH] ASoC: renesas: rz-ssi: Fix playback and capture
Message-Id: <177135627881.310944.2441265883960352070.b4-ty@kernel.org>
Date: Tue, 17 Feb 2026 19:24:38 +0000
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Fri, 13 Feb 2026 19:24:34 +0200, Claudiu wrote:
> In the current codebase the rz_ssi_stream_get() is called at the beginning
> of rz_ssi_dai_trigger() before rz_ssi_stream_init() is called.
> Since rz_ssi_stream_init() sets the ssi->{playback, capture}->substream,
> relying on it in rz_ssi_stream_get() is incorrect. Fix this by checking
> substream->stream instead as the original code did.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: renesas: rz-ssi: Fix playback and capture
      commit: 82e3265487c018814b789e251fb8aee8e683674c

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

