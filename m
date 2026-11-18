Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794987978;
	b=P2wKZK8CRNXjjP0STFWdSNbZDF6ddvapghtxb1k2TyVG7wMM7obUHVGYujg3lnuLwO3L
	 ttk6OBGJxeQ2FObBG2Ru4Qk8iAG4H+25O+jzpXv8S/n4hyNNu6o3QEMOzKBdS2XnGy0us
	 JwY7KYGS8oLDzWZij+6li2HPEF2JWHg20o1QLFaGCyjbih1a8N1fe2mh4/wO32Yuyaa6j
	 GLOf/YMHKET9Ev5YTiqXPDRJ6igT12QufHMXqXOcOuibBmo5Rse10Eg9foRm/H/rNSdkz
	 imLe6P3SKv4kdSOJLKMspxv2Nr3B4v8WWJjKK2HM0jQRfKP8cuV0ZJrPvHEQUUVzMIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794987978;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=6to1e8ywxICS4xI4JtlfYu40TwDVD3t2Zo+rkXerpvs=;
	b=BdJkRDmSd78nUBEASh23CqKFqm0OQViMlg7pTSvMOvR/+JRLo1viFjaudpJoCheM9bH8
	 ZxCzQcJFph4Gpqiy7D/HEiIIWHs5qO+xzwNMj0kSYR70j3i6/WOhVI6wfF+84vKsMu6tq
	 43PaFDQDKEqgrIto0Fy1dJ/UX1F+d3rHd5eExafZp2Y98SayqWicZHj/fie7h8GS2OVvU
	 gk4pqNmX0MYsoHGf+WjIx/cSY0lD4HVHs5tRIU2996b/caEVGDZerHZ0VXvDk8GIbbu5u
	 MYlxCdXXfgshOLc6qJvWlWue9i+16+6aWVfHa4kDMrHoeHCldRNYEAfU/YVXAO0XP2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.181
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3ACD606A335
	for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Nov 2026 07:46:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3ACD606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5edf97136aaso356122e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Nov 2026 23:46:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794987977; x=1795592777;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6to1e8ywxICS4xI4JtlfYu40TwDVD3t2Zo+rkXerpvs=;
        b=I4gzBCb0Bmg8QUMDOzLT8ytlujJ+oMAXhiEvqop4C2BTUE6l5/EHjtdpA3wiW1j9ms
         XPLqP1UY+gULBOiumZrlkSuk5VtK7y4oM/XgBHYRegSZ2Pg3ah/d2rUV93J8bm7dg4SW
         ixBE5/ImMhbzQk78dESlGSQPntlk/3WFCIx0XiOeu7vo5fEpjjevtRTq4ui5v9u33sz2
         9+rPiJ+mO9oKjRLR9Gz1FeMtDdrgydW9CBRvsNZy484RtodxnvrKauK91elbiM4LhAXv
         kW0aPkqKyH9sXvzXwXj3gWtR64WcEB83c8WsqFUQgDh3I3U2WHs1PTK0OIT3AJbn/6d7
         RMlg==
X-Forwarded-Encrypted: i=1; AL+hErHV/+0YMRNYaZr+q4nCqpRFcU/uWZYRTi3nBW0QMeU6HCizysMDhsvpx+esUYfUyFfBkR2x0h09wd6t5xbvv8bzow==@vger.kernel.org
X-Gm-Message-State: APuU4Z+f7+AQ/y0WohrM2S/71QwpaMHtAAvogzTIzlIDzwRjx1/Ggsv8
	anvl7c6dk9Q5tgqr7ZR0oTFbGSlJpQNPkb8yoHxA2U15OPPDa5jcBkG0KcfzauUs
X-Gm-Gg: AYBFou21ooR8tvs8d4CAZ3yYf3ZTTWo/BtXujQmAeWu6615w+x9z+U8ULSNEBuHjvIV
	09kmExPAEGfwbs3dG63kkKt9yOvH9wzPxnSnnSXUt978uIzO1oCqh0cn8Le7fPNcxwQnL4s9x6k
	TnGYFK/jCibsYTXFWwiAE29fs0IT+tFTkRxBtBe+QR+ab/HZBUpn5dwUgf/AHQy3XK2pofqiPyX
	MD4o1h05gy4RMdZ4C73TD4gwU30loSM/ykE8cxLjobSnUziWS/PS7nqmKWwU0hKeDX8Y0Bz2rUT
	hXkTDBDZVJo7yOwHz39zL1hiIw1OUR5xSv6fsz8cy/xLQyJfe1FlHFgPSgwwMIBCEz9dGJvLRPb
	uf8mlsEXId9s9Vnj5MiKLR8TQnP+TFl95Va05l6ESwBM82DAybWgT+0apTzYQoSUe9lPMF5Ba69
	Gz0+pxCOd2DSoBI+uizOJ6+337BqVxGQhZcnPCNlBOzbJF+mwILhik960t5VqMxMkmgvjHBI2Et
	It3kz20XSJSHNRFY/1isLRKyROhvlLcskCgfMNNix1vGWcRm4TNYDwp6E1ixdFdpue19wHyF/6v
	VVHQ1z3lFZFFhtjD6buPLWdD19gm+K5xLqBzeuoFEK8hyRomv2rTgI7iCDyuU5eFJJI=
X-Received: by 2002:a05:6122:6e01:b0:5ea:cc3c:9449 with SMTP id 71dfb90a1353d-5ee64779b16mr976416e0c.19.1794987976922;
        Tue, 17 Nov 2026 23:46:16 -0800 (PST)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee64eb9653sm1055142e0c.13.2026.11.17.23.46.15
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 23:46:15 -0800 (PST)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-7d2bf046ceaso407936137.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Nov 2026 23:46:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHIv08+v+f4KGS2DZoYcoSP1Dg7pVIBL2AD+Z/MPl6SpjMDXdoxwjiUgYlmDDLuokHBUhrS6MduuxNJ/tY/CRs4EQ==@vger.kernel.org
X-Received: by 2002:a05:6102:e0a:b0:7cc:94e0:ad23 with SMTP id
 ada2fe7eead31-7d6ba4d7327mr622866137.31.1794987975215; Tue, 17 Nov 2026
 23:46:15 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019-paul-v7-3-rc1-edac-v7-0-84c76c6d7595@bootlin.com>
 <20261019-paul-v7-3-rc1-edac-v7-3-84c76c6d7595@bootlin.com>
 <avxR5VZESPLklIuG@ninjato> <DMXJ5VMIPGL9.1917ON486UJRD@bootlin.com> <avzCbuXANntvBPDz@shikoro>
In-Reply-To: <avzCbuXANntvBPDz@shikoro>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 18 Nov 2026 08:46:04 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWC30-=DPtui1EjDEOdtXBVy7WLqNU=xz5=68VoZijt2w@mail.gmail.com>
X-Gm-Features: Aa3M54q17UL4mAgBxZLvOfOFworgkEOusBybuuLEx_Lh39xXrUjItuh72fZWiHU
Message-ID: <CAMuHMdWC30-=DPtui1EjDEOdtXBVy7WLqNU=xz5=68VoZijt2w@mail.gmail.com>
Subject: Re: [PATCH v7 3/3] ARM: dts: renesas: r9a06g032: add EDAC node
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Paul Louvel <paul.louvel@bootlin.com>, Borislav Petkov <bp@alien8.de>, 
	Tony Luck <tony.luck@intel.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-edac@vger.kernel.org, devicetree@vger.kernel.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Herve Codina <herve.codina@bootlin.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 17 Nov 2026 at 22:09, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > > On second thought, any reason we don't want this enabled by default?
> >
> > Please see my answer to Geert [1].
> > After reconsideration, maybe it is advisable to enable it by default. Enabling
> > ECC is done by the bootloader, and it might be better if no further actions are
> > required to enable it kernel side.
> > If ECC is disabled, no errors will be generated, and the capabilties will just be
> > set to EDAC_CAP_NONE.
>
> I agree that enabling ECC belongs to the bootloader. With the current DT
> bindings, the Linux driver continues to work on whatever it has been set
> up before (which may be nothing), or? From that point of view, I think
> it makes sense to enable it by default. But again, my knowledge is
> limited here...

FTR, that was my thought, too.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
