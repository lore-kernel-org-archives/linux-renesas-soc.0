Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794743829;
	b=FMA6HNOgLD9GZf46til5IXRadVm62tA1l0NQVr7wkiqRsw7nYSGU+zPnlBKIwQnZrnBw
	 MzV2hLX4RnldGb/t803Ppkwf9eDaz3pAJyoF1L1xIu46uRlncm+8VJe8xptaQ9YlScGX0
	 57l+No7+ARc4DQI3w1dYHle+3SpqAU3v7wGXcC41p9Yvtb/BK0KDn8V8UuTDd/UXeVcb0
	 pbelApzUgBfykPJ/w5QucrdreyrUhO/f5OMgPUrqv8Wu8PLvdNcDus5t60IS8g43TyDZq
	 5OZWVedtBZnWQoFGLbIQ8LftPVDLBZFg8CMyMH7HCQV3HMPHoCdc4Ng6tSDwoVv+0+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794743829;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=zhhDm2qyru0LaqxksPFvsWC42WCRzYXUzwovCybxf/w=;
	b=N0skTdIKUSFkrMWA0x43mDCmToSVQPXM/aYsCOg8Iik9bHK+KHGBGgdLGEFo9AIj7DIP
	 04MTlIfFWNTk9GBOrPudDw0rQwiFjkat5HOn5QEpL2hVj8A850c0YYdO3LbNrWV2isQ9J
	 8otSFiGtfiuQSOAhkOaQWapuEWwKH0rb0E38761GoTGiocQE9AdE+CdpgYo0Tdk26bZUZ
	 NWkn7Yu7aS/dlqdYCQ+jpmsS+mgtb7lb5yCordY4zzchy36wMQVYPk9654Kso0p36D5bn
	 fXcYoUAmLAf+ZdgRQ5diJS5A+J2VnOaXNV9ZFriOMnmQqaw1VzoAf+PB6toVJ7GXbLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=ijmaewX4;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5393606A31A
	for <linux-renesas-soc@vger.kernel.org>; Sun, 15 Nov 2026 11:57:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5393606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=ijmaewX4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=zhhD
	m2qyru0LaqxksPFvsWC42WCRzYXUzwovCybxf/w=; b=ijmaewX4miP4ddwVG2zc
	FelrOxzBahZlunioU4qSakWVzoN8fPAagUD6YVAJ0ZOjcjb7/yv/V26nBnSPy/f5
	aYgQ9ONhYbdH9dKEWGVUN98pvjTap8Au+ouO1fOtBzgwrSHIxhWTWSaNXS89mdiE
	dxYYYJbHzWSkvfkdJRhHCxZRw62t5bI1k+1FtFb2PulTwIKeIm4jKvjOche8IkOs
	Q/hxqRt8wzUEEJjBR1XDrm74hJm9zznBOQBZN1TANbnnI8/KDlbMZ1ExM1ot4ARV
	l24JpZjPcT/mBTM0D/GEFmoUZCtwLC/jJiCpj4kDknMk4FuL+HKzwiqsi22ad4Fp
	vw==
Received: (qmail 906437 invoked from network); 15 Nov 2026 12:56:58 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Nov 2026 12:56:58 +0100
X-UD-Smtp-Session: l3s3148p1@cPS5W09g7qgujnuZ
Date: Sun, 15 Nov 2026 12:56:56 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Diogo Ivo <diogo.ivo.sx@renesas.com>
Cc: Frank Li <Frank.li@oss.nxp.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: i3c: renesas,i3c: Document analog noise
 filter control
Message-ID: <avmeCELZRvJVNtyl@shikoro>
References: <20261020-divo-ssgrlpcsrc-2966-i3c-anf-v1-0-b7ad60cde650@renesas.com>
 <20261020-divo-ssgrlpcsrc-2966-i3c-anf-v1-1-b7ad60cde650@renesas.com>
 <ate-aNmqsyXCAIX8@lizhi-Precision-Tower-5810>
 <64f604a7-7e70-4a0d-8164-28c5d7b1e509@renesas.com>
 <at-5E3b_wKcnuJ9Z@lizhi-Precision-Tower-5810>
 <f4b8a714-dab8-45d4-b98f-717d010806de@renesas.com>
 <auC06gqa5lGtKPjj@SMW015318>
 <7dea4022-20d8-493b-b560-ee635deb7cbc@renesas.com>
 <auIK38HPyv7PmDJF@SMW015318>
 <db1ad309-c02e-4616-8486-ffa967207d44@renesas.com>
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <db1ad309-c02e-4616-8486-ffa967207d44@renesas.com>


> In the end we got confirmation from the HW team that the SYS_I3C_CFG
> register does not actually "exist" and was unintentionally left in the HW
> manual, meaning that we cannot control if the filter is ON/OFF so this whole
> discussion and patch series becomes moot.

Interesting outcome! But easier for us :)

