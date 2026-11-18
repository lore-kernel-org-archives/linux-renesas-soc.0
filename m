Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794994786;
	b=AG1r1pmg7Lu8uyMJBt+dnBhmemO8V2qmsH//6L2kQgolVkIOVpn7Lv3MyC3MtQ/Gaibn
	 dtaU1Hwx3OOR/JA4jY2okxSVHV0V2nAmUnAm9pnizCZ65SNLSN3J7oNLrBL6dO4Jpgluu
	 l5sMV/ITpf46BO7qnnKEoNuK0WRwfYp7nvv6iCMis9Sz8V2SrjpVqVXda8C1KKgwjanFm
	 eahNNSWlZeHbv1jrxVGoQkznRm1VVA8iBigAyGt7n/KaukEYy9sCMfhcwOmjFpLhJ2KM0
	 NMcq2fv9OKtiz1/MlgcO4DTUIiaYGL9efp5LzZSTvTiPCijLmjHHSCNxLx+CmrerX6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794994786;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:X-Mailer:References:In-Reply-To:X-Last-TLS-Session-Version;
	bh=+KrsHl34xJ4ftFSv/7lL7KykdHlw2pIpbgJEgLLYEHc=;
	b=sN0XM9E8OsTnCQyRHlZXXp8sCpPOFI9OYWecaSMTKr9y8MadQkzcbCR4NnZd+uw4i5j9
	 qP15k0HDJ/i5Le+O400RgUomddvCOs6skyda1VXueLUOve1t1k7EpMtppr0qCuS+5jB4c
	 TLaJJO5cqzjzgAXsvUw20fd34Uhwvg7z8zb8sNvAwxPO9faksoRWraDuviXKPAJHwkB07
	 f67JIhAQWKUVisMdJNxJx4IRpJrWABA8qC2w+3x70L0raO+6m+44pPKMQhVgsepZyvPK1
	 MbdtD6720aAMiCo5QsFnOVJKfuYjz0QnSpbdTXVMxhNRd1pu4bwnDSwfezEcdRGeIng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=gNF7OGQa;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2FD1606A31C
	for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Nov 2026 09:39:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2FD1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=gNF7OGQa
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D30E0C4CBDB;
	Wed, 18 Nov 2026 09:39:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1049B5FE9B;
	Wed, 18 Nov 2026 09:39:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4396A11BC0C99;
	Wed, 18 Nov 2026 10:39:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794994783; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+KrsHl34xJ4ftFSv/7lL7KykdHlw2pIpbgJEgLLYEHc=;
	b=gNF7OGQar5n85yZ9W8CgOBOMsPJ/OfYjOFUvxa7twze7oRzfdbx4piGWEJfsVqO2MqWeny
	SEU0q4b9XThs0O06K2A8P0zQHuMBf8GeWgRAo+i3D3yXzX5D330ycMEdWboEqh6z06AZEj
	r+6QxCOXrN21G09/vBO6lm6p48TC2m9f5W4hpyYFqY2zx8kSuQcVBUr8FLODOJmYkbFJAN
	8Yvo/n9yNbYt5nJHAS994Y4J5K2glUkxqdEj+7gWorXJyBQ7AldY/oORykZoMeEux1afvq
	x1xCtujGLMPJtwpy/quJrZ+pu2YV4Pqw/m+YWDLmNptosVgk0dAgR2eUfsvpnA==
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Nov 2026 10:39:37 +0100
Message-Id: <DMY8JKQSCVRK.2ZLAAS9PECBV0@bootlin.com>
Cc: "Borislav Petkov" <bp@alien8.de>, "Tony Luck" <tony.luck@intel.com>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Geert
 Uytterhoeven" <geert+renesas@glider.be>, "Magnus Damm"
 <magnus.damm@gmail.com>, <linux-kernel@vger.kernel.org>,
 <linux-renesas-soc@vger.kernel.org>, <linux-edac@vger.kernel.org>,
 <devicetree@vger.kernel.org>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Miquel Raynal"
 <miquel.raynal@bootlin.com>, "Herve Codina" <herve.codina@bootlin.com>
Subject: Re: [PATCH v7 3/3] ARM: dts: renesas: r9a06g032: add EDAC node
From: "Paul Louvel" <paul.louvel@bootlin.com>
To: "Wolfram Sang" <wsa+renesas@sang-engineering.com>, "Paul Louvel"
 <paul.louvel@bootlin.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261019-paul-v7-3-rc1-edac-v7-0-84c76c6d7595@bootlin.com>
 <20261019-paul-v7-3-rc1-edac-v7-3-84c76c6d7595@bootlin.com>
 <avxR5VZESPLklIuG@ninjato> <DMXJ5VMIPGL9.1917ON486UJRD@bootlin.com>
 <avzCbuXANntvBPDz@shikoro>
In-Reply-To: <avzCbuXANntvBPDz@shikoro>
X-Last-TLS-Session-Version: TLSv1.3

Hello,

On Tue Nov 17, 2026 at 10:09 PM CET, Wolfram Sang wrote:
> Hi Paul,
>
>> > On second thought, any reason we don't want this enabled by default?
>>=20
>> Please see my answer to Geert [1].
>> After reconsideration, maybe it is advisable to enable it by default. En=
abling
>> ECC is done by the bootloader, and it might be better if no further acti=
ons are
>> required to enable it kernel side.
>> If ECC is disabled, no errors will be generated, and the capabilties wil=
l just be
>> set to EDAC_CAP_NONE.
>
> I agree that enabling ECC belongs to the bootloader. With the current DT
> bindings, the Linux driver continues to work on whatever it has been set
> up before (which may be nothing), or? From that point of view, I think
> it makes sense to enable it by default. But again, my knowledge is
> limited here...

The EDAC_CAP_NONE reported in the struct mem_ctl_info structure if ECC is
disabled is just used once in the EDAC subsystem [1] and is purely
informational. If ECC is disabled, no interrupts will be generated in case =
of an
error and cdns_mc_err_handler().

So there is no risk of any side effects if the driver is enabled and ECC is
disabled by the bootloader.

I will set it to enabled by default on the next iteration.

[1]: https://elixir.bootlin.com/linux/v7.3.1/source/drivers/edac/edac_mc.c#=
L125

>
> Thanks and happy hacking,
>
>    Wolfram

Thanks.
Best regards,
--=20
Paul Louvel, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

