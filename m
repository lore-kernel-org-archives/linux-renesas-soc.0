Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792771828;
	b=EjI52uaJ6+X91OOt3jYbgNHN1RpiIE5yxwtxEfodUG/V1e2AkGBGV5tU3Pju3n2SdV4j
	 2APp2MciJpRXPhaM6leoskbZ/v7muVQ5j4NLT3+7gGbU68ZskV4kaKSLoZh+TQ9ZecPP2
	 BwJbpAk3WZ/0/99/VqTlyvPVlmFTlPTDFY4qrscOOfxRanXkg7wP8kxXkq5ID+SE/LAFa
	 f1Ww2JN9c6zeEBErU7qBktpXfIC4hEfMIMw40k+XQFewNZQB0UhsVIyQs2CR2a4KBpa1/
	 mgFn1Ur6S/ZPA8jIo2vo4sBZOY+Tmgy63ssuMnpmm0HcN/0e7kCe3yjevPwRnVA1bWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792771828;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=D1FYvY8xa3eBJwq7x98AcaY2jEMwwJvfUgH16tTmAHo=;
	b=AthPu80fh14Pwnvoy/qC7TZ0Sa95GTT20E8JPo3S/peRSgDpxW/SygPw82AghFIyIHXD
	 S5BJfG+dkjfmevUVfUkeqgJZ++9WgmNWARhdtgZ9IWaA4lP/4PR6SbbPOSTkgUXtBRrAS
	 aWX5KBSgwUQI/uTSsT4qcQyqTG/l0RaypwGBULJueZloiQpl2gN2CCP1718qWiJiSm/f6
	 9cBxPBQlXImzerm/72FIHe+q8MlMHyzoNFkZx+/8tQ3kJMekEfA8FSkMwEkozaSWZqtsA
	 BZOkVW3K766KVI4Oz9kQG0HBZOYGP7tLR7muMZprH2cSXq+kXuLsJAftjj7U3k4QXbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=fG5I6Lcp;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36504606A31B
	for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Oct 2026 16:10:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36504606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=fG5I6Lcp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=D1FY
	vY8xa3eBJwq7x98AcaY2jEMwwJvfUgH16tTmAHo=; b=fG5I6LcpkICQfkXa/96c
	EI/d5h7rE+jrkAiIHrUHVAuQsmTS/MjzudQDzrxUJ1XOcaq/oQrFG7pCZqTtmSlL
	2rnjfYR9TIV0LkVR8Xyeotta6MIPBNK0XOljUhvHKJPVQsDi3doJQhAaeCa+ORcq
	RKeCK6pLl/eM/lLKwsgEMGuKN+IYmSzUeXxDRFlsC8N+cK0dOr+po28HVmnBMaV5
	Qph6Tcj3L325iIDLuVIhBGhRSgZHyHQTGQONdIBsQIdtiB6CSbaQgkbIxsfhjMCt
	A5ACH5mBRcTmPFlFvlh+8sQwaSFcWi9wn2m6xwcUkzOlHjyNH1E5unm/hXpLY64O
	2A==
Received: (qmail 1618328 invoked from network); 23 Oct 2026 18:10:22 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 Oct 2026 18:10:22 +0200
X-UD-Smtp-Session: l3s3148p1@s0GZN4ReKpIujnv2
Date: Fri, 23 Oct 2026 18:10:20 +0200
From: wsa+renesas <wsa+renesas@sang-engineering.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "biju.das.au" <biju.das.au@gmail.com>, Ulf Hansson <ulfh@kernel.org>,
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v24 08/15] mmc: renesas_sdhi: Add
 TMIO_MMC_INTERNAL_DIVIDER flag
Message-ID: <atuG7A2N4GChkQU1@shikoro>
References: <20260820171657.62815-1-biju.das.jz@bp.renesas.com>
 <20260820171657.62815-9-biju.das.jz@bp.renesas.com>
 <aplBTMnnF1V71BDL@shikoro>
 <TY3PR01MB1134610EEF7D300BA8890357A86B22@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <atnXz00Hci6R-7Ux@shikoro>
 <TY3PR01MB11346D961A1F5ACA688B78E3886642@TY3PR01MB11346.jpnprd01.prod.outlook.com>
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
In-Reply-To: <TY3PR01MB11346D961A1F5ACA688B78E3886642@TY3PR01MB11346.jpnprd01.prod.outlook.com>


> See patch[1] has relevant changes.

OK, fair enough, but I don't understand the HS400 details yet. Let's
postpone further potential refactoring to the time when we talk about
HS400 support. For the time being, can we change this:

> +		if (host->pdata->flags & TMIO_MMC_INTERNAL_DIVIDER)
> +			clkh_shift = 1;

to

 +		/* internal /2 divider is always active here */
 +		if (host->pdata->flags & TMIO_MMC_INTERNAL_DIVIDER)
 +			clkh_shift--;

so I will hopefully remember these details then?

With that, I think we have all items discussed for this series, so you
should have everything you need for a v25 then?

