Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19A5378D71;
	Mon, 22 Jun 2026 11:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782127732; cv=none; b=kHxzYWkSAJZrEN+Y0Sp5QnSRWPDg0d3hEYtvE48H49uOhuFyPMF1OhMPcX6Z/ZnoHLfxct5J7AEMx7SSTm+qo0fTpYVxofzLXL/oKpPnw0gbc1SUPqPv15RHLNUMJ4DX6PEnSTpmd/P5Gt+YXMfbAOL061H7OuMR+1Jbl+U6rLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782127732; c=relaxed/simple;
	bh=EBh7bwyim66ARNUOxeZ/fLln601VKjx46wurIjTp5Gs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s7s6Yvx2dxLYBtrId4FPLPcmKxf3aiUOzzG3Sbvr1udfFg42YgS40FUIE6jWgLjt5LWmYltKWeOlANRaqcUp4ZEW6P353X7BUzgyGYPKoAj4ujqzqNitA9j4VcCxrhMKTYukRn36xDlVGByyzkTY9iKRiRH3CA8/vEx/Me58fAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=yggJZnTi; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="yggJZnTi"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 485034E405F3;
	Mon, 22 Jun 2026 11:28:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1BEF1601BB;
	Mon, 22 Jun 2026 11:28:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7CB8E106C8962;
	Mon, 22 Jun 2026 13:28:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782127726; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3ceLgsjECHaqRclrgpilz1IwveLzJRp6r0PWZEkPwj0=;
	b=yggJZnTibE0Ondxf/kuPwl8hrx3OFPOavEJUuTw2etj7kHfFUgWRie+WCLTAt1lb+oZ7Pu
	xWqZ5oF0ne5FBOwdEQ0IwLb4D2APVdfWSk5nkYrg/jbOg5dV/Pnv8naFpDGGZv6tFhbm93
	imvNYGRciHw28mNad2u1lRo4F5sXeYXoL1blKl/jNjqLZatpuGmrAyvpBkllKBFbKuXmk2
	K2cxBCmSF2MDIpFjiUsvYfBInGW6A8FE33JoTSWZzB1U4+gF4FRhOaRiL4JnF9yBiEMI7E
	qYAS3PubdDiZJR3sYp9slRO3UPZ0bjsfbRHU4u0iZkku++pCRbuG1bewEkQZog==
Date: Mon, 22 Jun 2026 13:28:42 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm
 <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 0/2] ARM: dts: renesas: r9a06g032-rzn1d400-eb: Enable
 SPI and FRAM
Message-ID: <20260622132842.7e0d772c@bootlin.com>
In-Reply-To: <20260615125355.116027-1-wsa+renesas@sang-engineering.com>
References: <20260615125355.116027-1-wsa+renesas@sang-engineering.com>
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

On Mon, 15 Jun 2026 14:53:52 +0200
Wolfram Sang <wsa+renesas@sang-engineering.com> wrote:

> Here are the patches to enable the SPI-FRAM with FIFO (no DMA yet, needs
> more work) on the RZ/N1D Extension board.
> 
> Changes since v1 in the individual patches.
> 
> Wolfram Sang (2):
>   ARM: dts: renesas: r9a06g032: Describe SPI controllers
>   ARM: dts: renesas: r9a06g032-rzn1d400-eb: Enable SPI-FRAM
> 
>  .../dts/renesas/r9a06g032-rzn1d400-eb.dts     | 25 ++++++
>  arch/arm/boot/dts/renesas/r9a06g032.dtsi      | 84 +++++++++++++++++++
>  2 files changed, 109 insertions(+)
> 

The 'make CHECK_DTBS=1 renesas/r9a06g032-rzn1d400-eb.dtb' command reports
the following:
   spi@50005000 (renesas,r9a06g032-spi): Unevaluated properties are not allowed ('power-domains' was unexpected)
      from schema $id: http://devicetree.org/schemas/spi/snps,dw-apb-ssi.yaml

IMHO, 'power-domains' property has to be added in the snps,dw-apb-ssi.yaml binding.

Other than that, your modification works on my custom RZN1 board.

Best regards,
Hervé
