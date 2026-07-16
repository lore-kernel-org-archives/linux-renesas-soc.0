Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4049341B8E2;
	Thu, 16 Jul 2026 11:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784202027; cv=none; b=bgJQOudWVLDo2G1t291O5wEBF6qDKubMBIjnbAwEUzQSzrNRL3O8xhLJckAs+gJyGf4CDJo10Xhms509CKTYUOH/f6Puxd5bc+nPiy84dW2hGNexi29xLsXLbwRHqew9JhDrxtKnf5xjlC1HQ/6fkVfukp37PX6XfDxZqEKPMSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784202027; c=relaxed/simple;
	bh=a7QgDXljRWhB3dXTPbDZL98g5ovWE5Y5K1HR7j88a3s=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MiTLQmxWuWRMWOy9g0JRWSvzG6oykMndDIIKmn/Tm327m3T9nK+xdIg1QqzkavugYta7yUWmR+jf7gNEzUw4lBaI6Kws9Pk7BagtPkrw6g+zvo/IoazKPxMHJXfGn3NMsacqomc9I3ApYZheaEVwmxNM5z5qh6P4i3EjSriU6co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=WUU3SjT1; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="WUU3SjT1"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5864A1A1019;
	Thu, 16 Jul 2026 11:40:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1E189602B8;
	Thu, 16 Jul 2026 11:40:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BD80511BD1507;
	Thu, 16 Jul 2026 13:40:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784202019; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ku5d5bR4xsbeSA0kG1hkBgZaUGyesjqT5kzf3Zv9nzs=;
	b=WUU3SjT1oI2jPjo6nLC1k45i39nEVCWefBokLzvtCb82vFDmrFacHwfIndvE30Ze0qydAh
	EVtxaK0DNK0MyjQ6teH3ZmhDbbj9/n6h3df5o6yG8DOeN0KTs6ZrGzb3OLh99eUlZzDwUa
	CZcV717uVdM3wCkuVqdFlSgDVNR+b49FrvV2qnk3BS6zmLWZPKV6nxujLzrh8R0mv7NAms
	Dx9Bp6R5bDWsSLd2jpBoyeF963KtNNZXsxTJZS50g78cIe4plVqwedbW7JhKFAgEhNTEQO
	ckksjQq3vHj5tgzPpAFLjeV1FsI/FXC4rSdKssVr0lHHlL+EWTE2Szkqlb1xJQ==
Date: Thu, 16 Jul 2026 13:40:15 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Miquel Raynal
 <miquel.raynal@bootlin.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: renesas: r9a06g032: don't set status to the
 default value
Message-ID: <20260716134015.6ae3ee71@bootlin.com>
In-Reply-To: <20260716101030.15252-2-wsa+renesas@sang-engineering.com>
References: <20260716101030.15252-2-wsa+renesas@sang-engineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Wolfram,

On Thu, 16 Jul 2026 12:10:30 +0200
Wolfram Sang <wsa+renesas@sang-engineering.com> wrote:

> "okay" is the default for 'status', so don't encode it explicitly.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  arch/arm/boot/dts/renesas/r9a06g032.dtsi | 2 --
>  1 file changed, 2 deletions(-)
> 

Reviewed-by: Herve Codina <herve.codina@bootlin.com>

Thanks,
Hervé
