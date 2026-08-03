Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1089F390CB5;
	Mon,  3 Aug 2026 16:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785776337; cv=none; b=bvIeBuGvD7WVldddepJ0pcpM1IGycaSU621oBNTQjpJ0jNTaBAWgsGCEVaaEktzKHgiiHinZsdXlMG5G+w4axm1FfJao5/dWV9c4CdrH6Pcuwlqe8n5AFVYAVMOemvkSzHz1T8M5s5aGZHUWkRwkmtV5IaNND2Nmsh8AJ5pQjf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785776337; c=relaxed/simple;
	bh=MCpMJYs95hX7XnYN3C1mpMTfVimOIxZoL75dV/frPTs=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=XLBn6ykmJfwFy/kymUxOVeZXPerYbFfwVj4If2JAmOylCw1GJcdAEJktW4b/dIPOciUzwJuShmeiCekj0k8dGYc8QyKvuNyng4tJUG4rvRP9AjSdyu2wJFsBF7qcA4EwXjFavVJ14tu1ho1yUunJmL2tX5gH6guoW8RzsD8TNXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UAlwpDeF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UAlwpDeF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 499251F000E9;
	Mon,  3 Aug 2026 16:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785776335;
	bh=/+DalorzNNAXGuMO9CXpxRAiHqIyaZJ8YhD6g/XBZ2A=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=UAlwpDeFnDjgljcdNpRssOd5bTF60/M8BCPFvNJbyx6irv18Y1ECquyToMwsHK57p
	 tn1hV4j4yxMnQgBLTRgylo4b/AgZo6UIdvQgjfiuGOglT615COpJS6dGAsGi8Oa2F6
	 jlLhL0DvypOCI0CjMFpAkzuu35BP7sKhFXVQEYTtzMEz1NrkwhPhmUQ9XJq59TYTVX
	 Go4woXkhLcP9AHMzBkDbU+wQv7DgNVujnqLDaxeuqCFtNPIV+ytrClVu8fyPn6bnw2
	 h/ykgrBHuiyl2aGIA562gRje2TH9eJpvNvEvxxK1vmlr/ZTIU555w/gpb5oOAXysVY
	 6k3lQ5JpTCj6w==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Igor Prusov <ivprusov@salutedevices.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 John Madieu <john.madieu.xa@bp.renesas.com>, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260801195425.234120-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260801195425.234120-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] ASoC: dt-bindings: Correct white-space style
Message-Id: <178576320596.255647.13467259013744121256.b4-ty@b4>
Date: Mon, 03 Aug 2026 14:20:05 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1113; i=broonie@kernel.org;
 h=from:subject:message-id; bh=MCpMJYs95hX7XnYN3C1mpMTfVimOIxZoL75dV/frPTs=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqcMjMJzIY1WiYJU0QvrYfyU6yJkqSWnS9iLTXh
 mK42kb9UI2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCanDIzAAKCRAk1otyXVSH
 0Ph2CACCMsyKb76l27CvI0GWZsqf/rLB+vgphmZXiGNL40RO6L5RMLEiqfl1g27+NCT/EfuWJsj
 mxTHSJrYQxnCVVzDDpNO+V63jSBr3VRUeuKSn+KdQ7vNSpA0oNuX2m+WzksFyEGUWdLX0juL2al
 inGRbxkj0pcRmTEk6sSKHNjLP35UruAxD674XbADdhNt/K+SO0lsbA6Vym7IUUKYaI9tfrL7ONv
 jzb+v04rwvXwcvLFFN4rp23Elcmuh0y8+o7V4n5WmYsaE6rwaUHja/Lp5jz8M+b4vALq7t5Vcjk
 c9IqLFsWQTiofP637BMgtrva+DvIiOg1P2QyJ2lIoK3AgBco
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sat, 01 Aug 2026 21:54:26 +0200, Krzysztof Kozlowski wrote:
> ASoC: dt-bindings: Correct white-space style

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: dt-bindings: Correct white-space style
      https://git.kernel.org/broonie/sound/c/abea6e6abdbe

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

