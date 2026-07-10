Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA52428461;
	Fri, 10 Jul 2026 22:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783722077; cv=none; b=TNsDymVcZO3cWUtiYIN1w6+kmVAfd86lbAgu1ENiydaIM8XlDkWCDeZisMGCKMW7WHYQGv/7wbd7C8Mui1zh6QFhrWFj94tuHHJpnY7bn65XagQsnDdBDD0OTw9IyxDVkEuZEzyDlJaKAHbA2ovx8ocZM3bcqyZZabMpYuw2E+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783722077; c=relaxed/simple;
	bh=bJl5fQPl/8SCiPA7HP6kJnaSwYgVGISoszxcNL4MMmc=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=irE98ehtBjhqu/JAMsmvYSu1f+37zPojeG4EWIgd4Z0bviVWKdF78v0RJA+/HMoW03lWcGdLhayr0b04O0FuoyFxVIRIel5Yv5e69uHafP8QsKR3YzGhZ8OcSGdJJmtN3UjXLQAAnQr6Izkxfm5PwghB5DMzi7uBRCDYKxwv0EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oeLBvzjk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oeLBvzjk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4A2E1F000E9;
	Fri, 10 Jul 2026 22:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783722076;
	bh=e5VaWoT+JyBfzZCc0Ceb0NCpR1zGV0RFto2LvwVs61I=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=oeLBvzjkEq9TS4WuRj31zDBgX/HfWKxSEpQHWmuTdgaSxHM5NbiOHqITFT+L7RmpA
	 ThVJHHRXLI/Xw26Mrk5PgtbEmNJ+eFT7W+ppnEqsFSo6sqArjkoYVAM7DZWJ0+1/4g
	 siANgGFUYh38EQyHU9dnzjk/NCt9ZiciUaQAiuVmXB/pRibhwdnuCX6lDCodPA7bUv
	 pAyy57PeyMV/OUbR6ofnZa1zntYRj/I+txpZ2hfK06TsrY6iPGnOXF5DQeGOnJmgjG
	 16VPSdYJohdl/xM3pO0jRkkf1QVRMAFc2s73jlT+WQi1p05UH+4gYOPtgPo2O0clUU
	 8YPHw29nHBXnQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260705172325.118926-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260705172325.118926-3-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] ASoC: renesas: adg: Drop redundant NULL check on
 clk_get and clk_register_fixed_rate
Message-Id: <178369992206.82617.16738196828533126762.b4-ty@b4>
Date: Fri, 10 Jul 2026 17:12:02 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1309; i=broonie@kernel.org;
 h=from:subject:message-id; bh=bJl5fQPl/8SCiPA7HP6kJnaSwYgVGISoszxcNL4MMmc=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqUXBZ+rZGW2WKc9HLptVS1mb7yESq5dqGgoQvR
 sBlAoMRvLGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCalFwWQAKCRAk1otyXVSH
 0PB7B/45UpBS6WA7tvCTfKnhJgxO+JY52/cun8iMdLzjHUSETkn1u+0tCsMdzTaYEjdSPCo7Twp
 ngHnUD7kt+IXhfkqclWk7MVHUMMWePDiGIUu3xziyRw0MpLnzJlNQ5xxHzUeA41sgaqPzUA41Ub
 wv8J8hkAs6Cfluc6yQfVtGjzgnQZpSjSDGrEmTB28sWmuC/BASDgLpson7bns8XWMTgdwVl8Dy9
 bXNWPPCdwIPjMnFv5JFOQibAgfNNCmT5TNHs2jsHNLfBK8+xMaVXbnFACTbvH55bjlhPZTXXG6X
 wiJWOvYqS9+ZqSEaTFNHwJL2uyMzNZfkICSp0beA8vvqAqL0
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sun, 05 Jul 2026 19:23:26 +0200, Krzysztof Kozlowski wrote:
> ASoC: renesas: adg: Drop redundant NULL check on clk_get and clk_register_fixed_rate

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/2] ASoC: renesas: adg: Drop redundant NULL check on clk_get and clk_register_fixed_rate
      https://git.kernel.org/broonie/sound/c/af58a647f9c9
[2/2] ASoC: codecs: es9356: Constify regmap_sdw_mbq_cfg
      https://git.kernel.org/broonie/sound/c/6ef98181eac3

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

