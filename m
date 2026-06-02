Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C494131F98D;
	Tue,  2 Jun 2026 12:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780404258; cv=none; b=RHHFln6bwcIZUE50ei14LFcFIfbUOzG8apQFGRIO1Cf+GxHv1CFda8bKKVVQK7mHoKCeTwEEi9arrEzkZ2wyAvtudUVYQcxF/RJxzkPhCjBazBXa23VCD9WLkkGpKxNteTYELAh0z93/aInoaC8kB/7hLoX0TRN4udOLLle4QUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780404258; c=relaxed/simple;
	bh=PsmwG6ZhRtKSko1LER9ksVd4m+49ryYomLkrL8qW77w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=qDAGogiqFJ5WHlg1iwj03Oz9FBjcy4taDYvu8wec+cTxLdY/5VSCwMA+S/NOZgQK0n+PTceL1M1zSWz9sVTmn8ls8PrE0DunOwMKX2D6WUk09lZUW1cS0U95nmO4kqSnAkjls2Y4GfpE1tOagj7ewB0Cjf3YfN5iWFDNWuJq9mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qe/FI0H3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qe/FI0H3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E5051F00893;
	Tue,  2 Jun 2026 12:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780404257;
	bh=XmSDqS5doeHURK/Q5K7xJlW3vJVpvtlzzxQyo8gvrZ0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Qe/FI0H37dmdEvh0APEdjUcJU44wvQ8X/ejU3va5a1eFxuYP5ZKAW3yi49msgZPV3
	 /kf3axtTnX161vu5VL34N7HymBGChX7t0h9QijHc9+l/PEF0icMXMVwhQxPKTyT0VB
	 8mN9az0zDIKOkfMMhvRh5Fvb8vnuJDaKOV1KDJG4Ct9WJ4/h150z6xuD+jRuww6yMi
	 cm73Gy63mCgDyoFTgDAuc0hyUg4hC0JQ/a5DpBRFq8WLe9Y6yr6DKEqMO0xRF1ed53
	 QNzcLrWkW/Zbcx+ZtH0iENpp2i9b//SkTto2kuDvcppI2xrx+75PjzNelqFZtCzv9C
	 kR5WeLyb6Xs/A==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 John Madieu <john.madieu.xa@bp.renesas.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Magnus Damm <magnus.damm@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Biju Das <biju.das.jz@bp.renesas.com>, john.madieu@gmail.com, 
 linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260525110230.4014435-1-john.madieu.xa@bp.renesas.com>
References: <20260525110230.4014435-1-john.madieu.xa@bp.renesas.com>
Subject: Re: [PATCH v7 00/18] ASoC: rsnd: Add RZ/G3E audio driver support
Message-Id: <178040423936.61081.3832922625019742059.b4-ty@b4>
Date: Tue, 02 Jun 2026 13:43:59 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4028; i=broonie@kernel.org;
 h=from:subject:message-id; bh=PsmwG6ZhRtKSko1LER9ksVd4m+49ryYomLkrL8qW77w=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqHtAdezEQIVl/DPbvK36GazMkNvIb797f/j+g5
 hhTJYKz5WKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCah7QHQAKCRAk1otyXVSH
 0KJuB/9TcCGrkPo86Tp6nxva0GnswAgqsqrlUNa6Oauk/HDFwgGX5Ua8oQbl5oQvyU3LHAqD8K0
 O6uc2hz9NzPenW3yCIYL/To2vIDIKpj1Ss0relChTyLmrJ5nRL+VtW2WMaGSlXTxcgonPC1DzK+
 xHahvBDNNN2MSgM62tWtGshIADfncoiDxU4J4q0fiH5s0bU7I7cp6C6S5/IeZ+lVnd8rcFjsVzQ
 /0TJKvtNztGaP85GbzWzBBDdudPumCE+9tjkM9a2tTA2TXDt3C49/N0AScjtGvXysOz3xrACwv5
 2/yn2FKtBCzWkJfiCBMhApsBL8KV8kNyjTbcXrJSqjCJ+LHF
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 25 May 2026 11:02:12 +0000, John Madieu wrote:
> ASoC: rsnd: Add RZ/G3E audio driver support
> 
> Add audio support for the Renesas RZ/G3E SoC to the R-Car Sound
> driver. The RZ/G3E audio subsystem is based on R-Car Sound IP but
> has several differences requiring dedicated handling:
> 
>   - SSI operates exclusively in BUSIF mode (no PIO)
>   - 2-4 BUSIF channels per SSI (layout differs from R-Car)
>   - Separate register regions for SCU, ADG, SSIU, SSI accessed by name
>   - Per-SSI ADG and SSIF supply clocks
>   - Dedicated audmapp clock/reset for Audio DMAC peri-peri
>   - Per-SSI and per-module reset controllers via CPG
>   - Unprefixed DT sub-node names (ssi, ssiu, src, ...) instead of
>     rcar_sound,xxx
>   - Hyphenated indexed clock/reset names (ssi-0, src-0, adg-ssi-0,
>     audio-clka, ...) instead of the legacy dotted form
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[01/18] ASoC: dt-bindings: sound: Add DT binding for RZ/G3E sound
        https://git.kernel.org/broonie/sound/c/a86fd3c20218
[02/18] ASoC: rsnd: Fix RSND_SOC_MASK width to single nibble
        https://git.kernel.org/broonie/sound/c/c0758279367e
[03/18] ASoC: rsnd: Add reset controller support to rsnd_mod
        https://git.kernel.org/broonie/sound/c/83c9631e974f
[04/18] ASoC: rsnd: Support hyphen or dot in indexed clock and reset names
        https://git.kernel.org/broonie/sound/c/22622faf8120
[05/18] ASoC: rsnd: Add RZ/G3E SoC probing and register map
        https://git.kernel.org/broonie/sound/c/948b075ebc95
[06/18] ASoC: rsnd: Add audmapp clock and reset support for RZ/G3E
        https://git.kernel.org/broonie/sound/c/fb859f6fc43b
[07/18] ASoC: rsnd: Refactor DMA address tables with named structs
        https://git.kernel.org/broonie/sound/c/e870c10f8bb6
[08/18] ASoC: rsnd: Add RZ/G3E DMA address calculation support
        https://git.kernel.org/broonie/sound/c/1cd10dab6702
[09/18] ASoC: rsnd: ssiu: Add shared SSI reset controller support
        https://git.kernel.org/broonie/sound/c/b4ef837a28a1
[10/18] ASoC: rsnd: ssiu: Add RZ/G3E BUSIF support
        https://git.kernel.org/broonie/sound/c/80f43c521771
[11/18] ASoC: rsnd: Add SSI reset support for RZ/G3E platform
        https://git.kernel.org/broonie/sound/c/692f03422f0e
[12/18] ASoC: rsnd: Add ADG reset support for RZ/G3E
        https://git.kernel.org/broonie/sound/c/9267b89985de
[13/18] ASoC: rsnd: adg: Add per-SSI ADG and SSIF supply clock management
        https://git.kernel.org/broonie/sound/c/47899d53f86f
[14/18] ASoC: rsnd: adg: Look up RZ/G3E clkin under audio-clk{a,b,c,i}
        https://git.kernel.org/broonie/sound/c/16593532c47a
[15/18] ASoC: rsnd: src: Acquire shared SCU clocks for RZ/G3E
        https://git.kernel.org/broonie/sound/c/799836bc37ac
[16/18] ASoC: rsnd: src: Add SRC reset support for RZ/G3E
        https://git.kernel.org/broonie/sound/c/33a3500a34b8
[17/18] ASoC: rsnd: Support unprefixed DT node names for RZ/G3E
        https://git.kernel.org/broonie/sound/c/ec1b5ebf6d8b
[18/18] ASoC: rsnd: Add system suspend/resume support
        https://git.kernel.org/broonie/sound/c/ef19ecf042b4

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

