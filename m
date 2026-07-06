Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC9C3BA222;
	Mon,  6 Jul 2026 12:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783339842; cv=none; b=scez6P/wbmMsnAZ9aUhddjgTRLrWyyd+ETSqIEgJHt7gGW0q4hodWB5ZPxvVY4N38MFeQwBeS8+CosxFjiHfHLB7SgkJngrpqm6pyFugv/c6yxmDGvpFqpNBnXnC1mfnKZP7IKK3ZD5p6My0fBNF+9MkiC2RF/vtbqEAAg1bmcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783339842; c=relaxed/simple;
	bh=mmPuvfIzQLdOHWO0qAEpjYE2zKqAdbjlRcxutccTKs4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=cPLBv4NwZ8qYRO62UduhGtDJd6YELgrOfMT3/QWaW39akcna54pA18aKgYSzo/f1uG9DzVv0+CGB8Hs33ktqXF8wQT4VBdRmguUoyl4RppikbqIYipU5RZRhJHBAjbQYLBw+jFyXZYTzTSieoAHWUd7pAGXEbu7nVfX9CeGZ9n8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aRGGmb89; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aRGGmb89"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76F2A1F000E9;
	Mon,  6 Jul 2026 12:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783339841;
	bh=cnEtq8u2iDv0a6zIMjQEaPJ5vMYQaREOepRI4xYGwG8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=aRGGmb89d5a/+9GGyAM9SXd4hNACKGJ8ZWC/7ndtBWLQ9qPewR5x81XOrANFY1HDq
	 NYWy/6xKdBaEZIGDYVKE609E+H50iqhDiau64AKJNMbqC5kHaCNzKV+Unpajlh9P3O
	 lfTRTv+yaePWdXN8ujHv3tJ6AQJVyTsB6jGzsd769U0IiFAOzXhieh03K9pSWQTabk
	 cNz1ky2rBxNG78/5tUQXfkEaOXxLzFtkl8GxQcmsAzfdR0y09fOZ82PnJ6q7tJb8l3
	 Y0fzRf0dmQdlth1K9echvx3MUZKarX/yPjR6ClryUY96qxsMJPj4QVhsM+a6uJRq+y
	 ijsK69+Mjuh2w==
From: Mark Brown <broonie@kernel.org>
To: kuninori.morimoto.gx@renesas.com, lgirdwood@gmail.com, perex@perex.cz, 
 tiwai@suse.com, geert+renesas@glider.be, magnus.damm@gmail.com, 
 John Madieu <john.madieu.xa@bp.renesas.com>
Cc: linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, john.madieu@gmail.com, 
 biju.das.jz@bp.renesas.com
In-Reply-To: <20260610164704.2211321-1-john.madieu.xa@bp.renesas.com>
References: <20260610164704.2211321-1-john.madieu.xa@bp.renesas.com>
Subject: Re: [PATCH] ASoC: rsnd: adg: make rsnd_adg_clk_control()
 idempotent
Message-Id: <178333982561.57168.14431449839923969165.b4-ty@b4>
Date: Mon, 06 Jul 2026 13:10:25 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1127; i=broonie@kernel.org;
 h=from:subject:message-id; bh=mmPuvfIzQLdOHWO0qAEpjYE2zKqAdbjlRcxutccTKs4=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhizv2Xb9trW72lXU7v2dlbAizlPJQ+HDceXY5UvCi8U/q
 2+w2/60k9GYhYGRi0FWTJFl7bOMVenhElvnP5r/CmYQKxPIFAYuTgGYyHJu9v/FHLmL8sx27/MI
 t109Y3Wqd5X6PrP6hWYCuvypq+WWtfXbHT3gtSP46xHX9fnW0iJn9Z+6CR+pmLLNoiSPT3jpXru
 0+JTv4lnhPbUhFov/nW3ckrm+Oln+4XrJTFfhD+0an2dufFBcOWPhjHU1+z20NXM/7E45r8ueMJ
 +hahPr2jNH9TyMzfX3J3QW5ihvSxS+bPvnkpXJlfby2+rdBg1adszaBgbX7tjI992VnPapYW784
 vuS2TWNsikW4dN+13zRrM39a7TC7E3WuXo3w6Bn75g4y/PEnTX6fGfZC1pkLpbYlLH4WreC3eRz
 2v0BcpH/383xV1F5Y/Ji21+dd7vmLHTwjXrtPZHrwzY+AA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 10 Jun 2026 16:47:04 +0000, John Madieu wrote:
> ASoC: rsnd: adg: make rsnd_adg_clk_control() idempotent

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: rsnd: adg: make rsnd_adg_clk_control() idempotent
      https://git.kernel.org/broonie/sound/c/ed0abc8be27e

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

