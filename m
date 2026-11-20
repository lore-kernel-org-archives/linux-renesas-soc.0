Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795199317;
	b=GlD4qjcTAbosT3W4NAE5WYXbAdHWqPiwoeL2T5cxdT9g65zcNsZHBoW7C9KzblRNhV8l
	 swdJ3k9lLMjqosSCqHukGqrpxCQJkGOf36k/ufpXMsy+3GXeQxM0q+WMj2rmbVaK0rmQl
	 vILiIVuzhkx9fve2PIFGrmPgNoOD6QuqCUJqcLPM91PjWcfhyMOoAX/KtsBymELGMBCI+
	 Wy7otEJRtQFDBR6AjvYqMDMV90/8yB4r89lD20BvtfJfDtAVfN3KSoLZShcTxtXGzU5cb
	 YZyRd2UT4yp2FslAMo58mdtfGbtxKunp5GpxUE8uPzqSRjBJy6u8LW8T4BRV4r0GKQQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795199317;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=zNDQo+a14v9s0HW9OP+czAcmraAhXwLLM732JTo+ZL8=;
	b=d8PV/HrdcAUDGFHQrqjzFspiUOUwS17nEJTIr4V267nU7EiEK2fIKxOWr6xBJpGLnfP9
	 ZuvC9B+AFaLUsQzjgGaC9FniiJaQt+W3/rVICyvchoSS0h3TWXgqFoz6+0ngGanIP+Vwq
	 jlx4Z+SU+sGQbkHgzkuO/X3pFCsUU4H+zvDrswtQKvRWxNQbq0Yrmg9vFiRnU+S3X5Nfb
	 PV2c57tnQOha7nqwQrjfBCz+W3l+KDYXxpWQdLwztvtltO2NHa0gJ6YneWAReqejQ75CV
	 8LEKZVB2eJ2bAUxQ4aP8FvJlgGuBBeTWVEm53LvAZu0weotANr0lllA5HIBthRqwhFA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SKP+VL7U;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC8D606A331
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Nov 2026 18:28:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CC8D606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SKP+VL7U
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4a32576da88so724152f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Nov 2026 10:28:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795199314; cv=none;
        d=google.com; s=arc-20260327;
        b=Pro5k02oeGJkjEdZYPgCuME95M7LJRrfvyLLwTi3PxAk1Gz75xrw4SupzhfO2dWxJm
         wZpvVOgBMYi2VfMWvu4X+5Gti1L26CWYwxq8ocDzyDQnofqRIFE4dFxZrwXVztdbCU35
         3gEvPIDcCy0kKK6M9uR2nfnf+SstpIijGxgXjvBVQ1aeGFkUac6Ql48PRHwyG37rV8jZ
         3gCignLGp+dyYqA9r/ZyYw2/s3DP3h2DMEn3FtoE738ERKJecgDnaGGeNapCYSLmt62S
         81qthAQMPCsPKsmUDk4tDYngjRlKjM3RnkqxfMmNzO0CUXiG2+TAvxekro6qZSeapW8M
         seBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zNDQo+a14v9s0HW9OP+czAcmraAhXwLLM732JTo+ZL8=;
        fh=J/nKaci8eZhqp/9ETt2/x/dZT9mlW0vLsFQkpGIGgLo=;
        b=kCAkjkVNIx6dpuQViHgcYhEeM0dIy0nab6cvacUZu9a+qMj406tgGlADWBHywBDTsA
         x2kR7vd4+TS7vTJt/eOYOYYTlW6M9bEwkqawYowR5lhXEGI2d1pi8BDcj1gHNA3P0CSs
         lEFIVtmDxKXAMGU/bvGf2gDgmfi+DLIB9H3X22sJ5NOw+AWZGa39pjOuItkH3KmSif4+
         yh6buMgNH5Rtl+umvg4rfRatRdO9DRh1fOSBuT0dqTpchl7RpjmBswdMe6gDLHIBZAZK
         y2xATLgFDxc9nnIYEzier7VT64mg2MmkYyeDu7Vm1OrSUGYjOYd8vk/JoPHZ41VzAmsf
         FONA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795199314; x=1795804114; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zNDQo+a14v9s0HW9OP+czAcmraAhXwLLM732JTo+ZL8=;
        b=SKP+VL7USEbVWLzyNKe8vqlVzzCV9Yk8mcaoFQiMau8f8rXDzwpCak4Vsmv6BR/+pr
         RgylvG9oK1tyn9HVNxsfbZVUNKkIchTWZ9X8kJuoyh1kq64J4Ht2rzEa0T1VyHr22jgY
         8LCDGRU15JxcXqPu3SUUV5SgqRuHz+Z1iEokPyTEcAcId1PaGovoxia4Ty6h+zvaD7I3
         4y2tVCh/h1q718vD/ixJINcglatHqod8P/u+jn7b0Kg91rBesPqOPLmb7sdtO2eGD3hu
         BDKWUbOZHypesxxEv5PhgymmUWQHQko31GpAGU6sziXf/1R5N8yEfF6gUFxCmLJXMEQq
         BKPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795199314; x=1795804114;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zNDQo+a14v9s0HW9OP+czAcmraAhXwLLM732JTo+ZL8=;
        b=zRy4/ttHExWLBp+dk2dZt1YT0p8L/g+e7+9YNzf7IkpTPxpzYkT+TbNeC676RHA7a/
         s+bCUYRFOxHNnsHgd79gIcK3mTmRNPio/LZJSdV0ZdiWbVeaQ9YMhQB5UXKmEt8YQbxf
         /pHmv8pQ/4PzPfDtorKiVvWHvwBmQCz1WrZPpRy4qJoa96TPYLlx98kFyPudyX4jN30d
         VeBXDqGMkR3F25pAfb5yZEySM+0uF/DGRiQ8rAEv/TqKPfzopfU5GOh5+FxQQkuAbLMr
         1MvnSArYCjrGqeZ4kr15KiSjQ1P9Gixxrg1O6QIYJumuLu9BBi9uBPB6ePKSCoSjn+5E
         +FwQ==
X-Forwarded-Encrypted: i=1; AL+hErGqk6MSGIlP6N1WZynNA6Cqk4JilGeSUyGdiDaxpYb84p5PjCwLrfHqZUDmPhbhNS/fAAoQtL4h6lRzTkAprmztVQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZGdEzVduUoFS2Kt4LJfkHW248RGWEZ6kFd7z6D7nfH/UCeFjU
	bfrmwuQRA4fEE5jv3w5DkYGm4I+kRCCHsiGxrySuyU5VkE/6KXgtiTqbbtyhrh8dOqzASfF4Da7
	wvx9HLOs7INaH2XIHYcTpe48Bjg/HqxU=
X-Gm-Gg: AZFdTZfPgXQ/JqbOueCcSspdRKNpvIGUAfqORe505jyP9tD4Iqbs2xYeN7MOsT9ZyAY
	Ok0VJdMjqmLnyAoaVq83rTesv/5jvZFdfukQBtAKHrhE7yLAoNTeCtEU7UipNpfrThs3zySsVBw
	p56TL4iTHhjoWtiKD9u8VqjQTIVUQiLr48Bvk+LrD55OpTUWXF2uL/DFOu/xHpIJUZ2pQ8X9teY
	SFhfWB6SQwTrBoMEBkwNXllxZaUiyh740lm9vPtZMaIR3ADHnL9hbLW00Ry5jSeYcVcgc264nQK
	6/vv3zTk40KlSyrVJMXsRKot6kGUDQtQCtWL7BSK3Sjr2gHfik0Hh8sFVN/Iru+TmrCUROQpmva
	ZbtcYmp+aco/yM2hwufgdZFj37xms6NRJzuZl3NFQEy4IA2znLFe2g+EWf7gkp52Uwkgd+rEcy6
	GwNk3kvrsmk9jZ4JC64Wr5wJ+8VhDL8jPxX7ttBUfhdUUbvOPFm7Wyr7f+3Q==
X-Received: by 2002:a05:6000:2f81:b0:4aa:ba0f:c1a with SMTP id
 ffacd0b85a97d-4abb683bca6mr8274343f8f.40.1795199314113; Fri, 20 Nov 2026
 10:28:34 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120002549.1908299-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20261120002549.1908299-10-prabhakar.mahadev-lad.rj@bp.renesas.com> <d4405a68-5df9-4e76-84ff-fa034f162429@lunn.ch>
In-Reply-To: <d4405a68-5df9-4e76-84ff-fa034f162429@lunn.ch>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 20 Nov 2026 18:28:07 +0000
X-Gm-Features: Aa3M54otSF2In6FsOUyV1sYkafqWIOL4jrRT5kqPhS7eswmhjTdncZ_k_zb5leE
Message-ID: <CA+V-a8vj4nCZ+u_HnzNxKXu8xuOR115gHDF7YACFfiDpskQsjQ@mail.gmail.com>
Subject: Re: [PATCH net-next v5 09/24] net: dsa: rzn1-a5psw: Fix
 VLANTransmitted counter offset
To: Andrew Lunn <andrew@lunn.ch>
Cc: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@linux.dev>, 
	Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Simon Horman <horms@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Florian Fainelli <f.fainelli@gmail.com>, Ralph Siemsen <ralph.siemsen@linaro.org>, 
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

Thank you for the review.

On Fri, Nov 20, 2026 at 3:29=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Fri, Nov 20, 2026 at 12:25:19AM +0000, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > The RZ/N1 hardware manual places the VLANTransmittedOK counter at
> > offset 0x8f4, not 0x8ec. Correct the register offset so the driver
> > reads the counter from the right location.
> >
> > Fixes: c7243fd4a62f ("net: dsa: rzn1-a5psw: add statistics support")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> This again seems like a real fix, so should be for net.
>
Ok, I will re-submit it for net (and for all other fixes patches in the ser=
ies).

Cheers,
Prabhakar

> Submitting these to net will also help with your patch count.
>
>            Andrew
