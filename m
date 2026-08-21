Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18CA6376BE2
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Aug 2026 20:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787344694; cv=pass; b=noNJbt7UJFCZf3kYnJM2+UZCw4/pUOeH5Sc9N6K40GoDV+JGHZ17GEShb1HImRyPSBF8DC4hT0kaVT6AmN23o3SjDPIZTvg3qQ/40aPr1depCa3FfVS+y//fL+cS9QfjPM0Aw882DAv8H4UZkdRV9FvpR5bhJ1WiPc6WKglq3/Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787344694; c=relaxed/simple;
	bh=q13Ycl/3I6Y3/7hapb9RKt5soriwKmS57N1y723YsvI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nL9339iG9529vfhkPpiZnZBPTxY2VdY9iC+A5ZjSGP2otnMBn74XZf81MwNVbZPOqt/9ivR+MsVT/Emcl+OEtImcyLbxudYuoB2drsowAIWHMxO4mAb7ObZw+a4W9/N2jkIp3F4D0NOuMa8hP5C9b406SuScc0GvfoxPyW0Jmgw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KQ9A5zcB; arc=pass smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KQ9A5zcB"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47f7872abb6so837488f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Aug 2026 13:38:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787344691; cv=none;
        d=google.com; s=arc-20260327;
        b=U6zSVQhqByaRcM/HaZKQEw32ejcJknoci3B+FxG679Hk0ZSr47BjcIbzryiShg2Yx2
         eXR5gkKYaSF2mE8GDY+kw3LNaWPUHo7XHVcCnA2jkrPNJwZO6AK+WZyJ9AkvAuybac94
         qzGq3Chl3lJxw62ePSWvLHzUSfTlMdP4PBoDNCPnh9aErgwukeajyGULhPsWcDUIlbLz
         SzmqNN9RmGBRakmdU7gJpH6N/LyjlxgmERyHcv9NRlCejVWS/p5iyBbb0yvNRZDsQDTJ
         VX66XWNbIMUXXgpk6cvn4K3+pwilDw8Rgh7F/M9OL9o329Y9jwvd6hvB3lq15YeG5tgT
         32cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WdiOzXvDUkVsjFuM6APRwKIWsDPLxu7zb+fOUcgUmVg=;
        fh=SZ8BrMSrN+oC/Ts5eEgvOx4Il5TNenAjaNgh0baOmr8=;
        b=pJgDSsvdNxXXh5sifVvGwFBBVUZ+Wj0KhulOfZKgjyvdWji5ETo8PzpMC8WxRMtIeI
         ctjt054YP/z0ZjnDcE8wCfh/ZpVmvOz+aD90qBoeqM9RNXO8jL2880FiM4REL2NwBvsV
         cEtTvNFBrKZ008VPFUBKegMD06aqdPT7Svvr1gySXl0JaX/VbUnu8eNu5eKe6JJ5dgPn
         DA5YcUcH6/j0iw9hrE1rheddqFLY4jbBNq8FDrf4ykalTqpD1YjASuaDNUKYJrwILSDY
         n8mqksulL4xDoXHbVGH/SG0vyr5ac9zacRuGmVZaugrDHU1WFGzzG0XVhdFMhUOjq/r+
         r0Kw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787344691; x=1787949491; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WdiOzXvDUkVsjFuM6APRwKIWsDPLxu7zb+fOUcgUmVg=;
        b=KQ9A5zcBl3DkMppGuWyduTfxngmqFkUa0HBrwBJbMIpcZ2W6DeDtMgp65E97pLIrCM
         /tvEBMv4M4j8453YUHmAloMGtHAonGcl8RDdN5ePn/Nv4CTGgNOGZCwAi/WF7ujJkY2l
         3OchERuv85mq/y3goLPUFrgRfXEM1Y67v8CxeiPZvgRpSNAqkYVQVlaLU6de2ljYvVus
         PGgiwl7MmsgE14UbtAOGY9ZQmJXrbECocSyDGxLPKdglbP1+pT0UzI1IwIWfb162sIAd
         ChdsLqmP5hg6ORsgZ9vhGJk/EG3IGdWRIDquLr9ZNh4aVGXKvc090ta1Fz3eV6eq0xqv
         ID8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787344691; x=1787949491;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WdiOzXvDUkVsjFuM6APRwKIWsDPLxu7zb+fOUcgUmVg=;
        b=hl0AK+TGG+eleYNPUDQAJUyHOPk3SmD8dtwOwjGsZl0XUsIZgcm7RB83HBjrCI324y
         gor5V2P1QSszYesiI6JCy0rIwZubjRBH4q54ooU53/JgjYQfSlnhZJ4uUsAffQ9w93Pn
         MDcCoIIDkikJxqfsvz4eqdzIXOJ84AHmvY84G4IsAp2B0kP+C/EJEpYM1jmA/rQbYjTS
         db9dazY4GzMDfz5FVRW49FfOL32Es3LPvC8m42Mmb14Cqb+CMg7TdygI18dDyrge0qaL
         wd5uKf5aYPds9zLBXuxergYfU92nJPqsbAT90q/6GEKRjCFJW+ZpCi61sUq//5HSQh8F
         ZVew==
X-Forwarded-Encrypted: i=1; AHgh+Rp+gkIo16SR9AZjUa4EpvkszXYJO8DqVcjflFylgd7bLaC83z061LpBh7rP1btbnqVeKBfvZX5+LrH1yNNnw6/Pfw==@vger.kernel.org
X-Gm-Message-State: AFuF++mCm+jVNhZp+s3y6ViMiPAWD7+OaiWaffMepokDnqJEBVNDw13r
	XblhJ/77IAjBIH+tMHvQHnynCUfJ8U9nRewN5R5tb5rH8bK4VjkfdfoLuJ+fwou+21ylsN51O13
	dSWrMKnWpHODJZkmzwNtLfQm7mzCXpjg=
X-Gm-Gg: AR+sD116O9Hnw5a1jG9EUg2iMJLZxDN9H8eSLaNXmH8YUr0vDiINRKUf0WhhCcGnDek
	ZT1xN/jfpALsnyxWNFeJuP3KO3gSvy0McES3Yc50cz8qS/cMKs7WBRDabZ4Ed/okWLl4Jc7eydN
	yllqhu4kcbipiZ6n1UIZJmeRH+mLM2EodQJe3EsakD+aBKGVX5BBWpbraURnk+fGMBHLJIksXRW
	o20uw9g9Hjj2sxCb9J+tnjObPx7X01L0Uv/ASS9ZyudJwcIxata0lGm258Lmm77TNtIM9rcM/gB
	EiIk09QRi5pAZHJTwNoMN04+mTDboSALb6QwhSK6LGBF+3SFK9eNVFT6OpVnspYXPjNo6FjVTRC
	DpfpMLIeuWamH+j6kjdOOPVIUOV7FVRs=
X-Received: by 2002:a05:6000:1884:b0:47f:9557:8d77 with SMTP id
 ffacd0b85a97d-482c0b97893mr12816144f8f.10.1787344691056; Fri, 21 Aug 2026
 13:38:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821135608.275233-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260821135608.275233-16-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260821164050abd3ceed@mail.local>
In-Reply-To: <20260821164050abd3ceed@mail.local>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 21 Aug 2026 21:37:43 +0100
X-Gm-Features: AcwNN1VVl2XSQKPQVSNLcdE-KwXFGBkc_Ti4Au0DGXEzggezb14PYhbpLUOzD68
Message-ID: <CA+V-a8tp8EEJw9NLRfpiM5pve8GBc41iL_s=5=MqZaSHssOzbg@mail.gmail.com>
Subject: Re: [PATCH v5 15/17] rtc: rzn1: Add OF match data to gate SUBU
 register access
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-rtc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alexandre,

On Fri, Aug 21, 2026 at 5:40=E2=80=AFPM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> Hello,
>
> On 21/08/2026 14:56:06+0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > The RZ/N1 RTC driver selects SCMP mode only when an optional xtal clock
> > is provided at a valid rate other than 32768 Hz. Without an xtal clock,
> > or when it runs at 32768 Hz, the driver uses SUBU mode.
> >
> > However, the RTCA0SUBU register used by SUBU mode is not present on all
> > SoCs that integrate a similar variant of the RTC block. Allowing SUBU
> > mode on those variants would expose RTC offset operations that access a
> > non-existent register.
> >
> > Add OF match data to describe whether the RTC supports the SUBU registe=
r.
> > Reject probe with -EOPNOTSUPP when SUBU mode would be selected on a
> > variant without SUBU support.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Suggested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > ---
> > v4->v5:
> > - Renamed rzn1_data to rzn1_rtc_rzn1_data
> > - Added a print message to indicate that SUBU mode is not supported
> >   on the variant.
> > - Added a comment to indicate that the xtal clock is NULL when SUBU
> >   mode is not supported.
> > - Added Suggested-by tag from Wolfram.
> >
> > v3->v4:
> > - New patch
> > ---
> >  drivers/rtc/rtc-rzn1.c | 22 ++++++++++++++++++++--
> >  1 file changed, 20 insertions(+), 2 deletions(-)
> >
>
> This doesn't apply cleanly, can you rebase on rtc-next? If you do so
> today, I'll include the series this merge window.
>
Oouch, I'll do that right away. Hopefully Im not late.

Cheers,
Prabhakar
