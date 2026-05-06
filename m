Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0950234B1A6
	for <linux-renesas-soc@vger.kernel.org>; Wed,  6 May 2026 19:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778097538; cv=pass; b=gPMUlPx++TDEMJMBIrBRlaSmI0i0/Z6ee34ClapzjMtqOyRyZPvTZH6jZIk5JTFgbx5hjscSuDx0ZcWRI0Qth8QaYbHg1v43hp371VPbhwrleOehFjOk10oBqvck6Sr3ws/4XlOWUi5SotVj7EE9hPPf9brGrriBk0G55e7M2eY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778097538; c=relaxed/simple;
	bh=cKQwfi3VdbXqK1EPlrp+rIWkQqAXhahRUcj4Mc9yLZo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cwzBaom7XAsWjpTYlfxdloZtcg/s+kAl2PbV/AslosykgDJBEl9xUFXciLjBUW9TsnOcBGYn7V7G2Y2sRDIp8lNSVTnqOKDwHFyB0S2IA//ohGHkBMjfA+yzjHsR5e285TJXxu/zHmEFin8VMBYLLNYwzEZyiLoB6TIvoQ3mJyk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IfyueNpm; arc=pass smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IfyueNpm"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-44a786a9a35so57511f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 06 May 2026 12:58:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778097535; cv=none;
        d=google.com; s=arc-20240605;
        b=SBnUp1QjySBB9pnqlegiif5x+Rce7pjLy1e0+1798L2rvl+3/mgGGwe5l1//grSUAU
         2EyGU8ND9H7fmHdp75YHKc6QMdCYpIisjCzw8QQg9bQpKZA++2AytrLMm79pjI8XB3HE
         sorqlcVlhGSr3iJKJShYmYTskABkD9/TKqE2uSnUXLixB7ek5PoXRRFhXk7aKzZviqWX
         fBz8oq/O4/WatrbOxfEt/KczubiDb3SBCBFeZmjxSdjqARe6ZA+/reGmrNIWuQtNYMTa
         oFUiJsV9prvZYiCJNZwx3pSTWT8xEpysZxp2SNUsySgeaPc/qDMd+elZGBJczWFb9qLK
         lRcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cKQwfi3VdbXqK1EPlrp+rIWkQqAXhahRUcj4Mc9yLZo=;
        fh=ssF1fVeqhRVVugQEuBOZYrYVXPqXeHh6oghcbpbdRdE=;
        b=aJcoPdKLRHHT34nl8+u8c9e/TjBzj2x8YrhBrBwxIksM0weX6niFTpwyJ8CCBqK6iL
         lux5wktdZbPKd6UEZQrA4nPgiAx7zGG6Q+GMLQ1oiNeL/4v27D3Ns6HCZ8qL9rgOSIcx
         4flPyETMHjglY7ZmLW8kGcxKT/F8XDZMMduZGPtRwnuod+dERP5KIb+M+/e5GKFbBb4M
         0nSOGxEGHusvj9gGrlXAVHmWC3CHQFN5vQvuSCJbtKVYtuDOE0p0VLzNXC5sfg+vbjWx
         rZ62WeiZSpT7WUlU2b7CNWObh8KAPEnr2L3XDBa0W+s/VjsDNUJtvBpiCR2Em1aFd4ir
         1R2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778097535; x=1778702335; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cKQwfi3VdbXqK1EPlrp+rIWkQqAXhahRUcj4Mc9yLZo=;
        b=IfyueNpmrnIHDE+grq7rAmz0gffddBpuukW5tvnTPN5/FIR6GwOQxlk+Qt6eVOgLdQ
         v9CZuQPV70ZKPGykxqnHyPRkXxoF2x3Wco7gTtmHwCqKQmNHziQt2n0JvXtVHMWKyALo
         lSLxE1Jgjw+Ib32mfp5RK72QGO+iEH8DpNZd9rjxITyIaIqEOjASrpDFsePDVP2F6iwF
         zUqm4gPU4d1tDmHVxEOch/8DSr2ti8cMN2RkGZNzTzgdwOBugeAllHLsapLjL25nC9iL
         hAAf1Df5HFqgkift0LV9Dru/UQrXVGFOvZzjE3q6e/9TVOjXpBwRkdOpAGbigDcKqKdX
         RKog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778097535; x=1778702335;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cKQwfi3VdbXqK1EPlrp+rIWkQqAXhahRUcj4Mc9yLZo=;
        b=WCXev7xUk246eID3hx5yirW4G0UoGpzl/GgYBeMfAD0HeSUUExQ6MXuuzJXqRCW4J1
         FskWYsB0jsX+aM6xHXprRGhHpvAP6SrHbQIsaDjhPkI4m3SknVSst2f0qMT5IjUCri5w
         bjsrs7a58XlM8Ceb2snA4r2Lv/o1G1mHk8Rn5XjSXNVLgB1DiTklYDbA7CLQv5e9MAlN
         7xoT6xLPcbgINEG1TDbGHkXyprdhV5MJvE0OnXMYFG3DH8kkBnT1wdxFBomtdfLLJ1l2
         8zJyudIcWyQBrFG5TZguvrxauV6f+XKCiJX2qfYCz2CdnTI//5Hre4pnDYT/LTQ6Ep33
         /mDg==
X-Forwarded-Encrypted: i=1; AFNElJ/WKeg18u0O2YPf+0fl4m+BpuH3iaba1/DRzQR20qQFoG5gjYS3uTgVDsOIV1GPNsmLKOrVeJrQYRl2X/RhdLaJDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOQsu4dNGGBRhAirkj51WK6KlGk5ITvWE22dtKNrOipOueVAC0
	Lq805QF8zndycOozua5ZolRTF48bLhjvrXKTR+DW11y03BNTuy4g69wUg1677tibrzfZGwCGEGt
	JqWhDKW01j6q6d5UBVkibXNR9yr+HiRs=
X-Gm-Gg: AeBDies3ViK9CSVMSSyAwiDj1wxir4YTqYC9otdtzmwnZuPwf77r3snPNqf8Jel6/mo
	RuBX0TE6HQqwVJU6pT6atQ3glrkkl/tmIvtEe4QD0vr4+pJ4ORg9EdPwM2+4hN20leyuboH681a
	FOkn88aY0CiIiJfS67b6O7ZOOVlxzXUUGaZ20rNZXsC+8bFJg978XF/a1JtsgzYCqMZmpNaX+uQ
	OT7e3z1M8V0TLsa5hlHcdzZxii4b0XvlVjD3YsPlh0irsMkJuaiXbP/y8bb/hRq6WuDFBJ4heLj
	Y7TV8BMBSWhZeuC1/W+nGk9U06s/s94TJuYlcdAGRRWlsrL2L8bGSOU/XGeV1A3G420HFF+ZXyA
	2AmvDMWfWwh45gzZZglhW5ybe/xkdl6sjDCym
X-Received: by 2002:a05:6000:2309:b0:43d:773d:78ff with SMTP id
 ffacd0b85a97d-4515ce1c7a9mr8612810f8f.27.1778097535163; Wed, 06 May 2026
 12:58:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260429170012.366537-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260429170012.366537-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260506195002.GA1778786@killaraus.ideasonboard.com>
In-Reply-To: <20260506195002.GA1778786@killaraus.ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 6 May 2026 20:58:29 +0100
X-Gm-Features: AVHnY4JcTk1czQ8A4YapAWR6cDFrvvjoC98jxL7sK27uKvjqiU99iFcUrsGiPk0
Message-ID: <CA+V-a8u8=mfR0zDJRNMEjnjrzFVAkOrqtro05Zgd1JFqGRByKw@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: display: renesas,rzg2l-du: Add RZ/T2H
 and RZ/N2H support
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

Thank you for the review.

On Wed, May 6, 2026 at 8:50=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Prabhakar,
>
> Thank you for the patch.
>
> On Wed, Apr 29, 2026 at 06:00:09PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Document the Display Unit (DU) support for the RZ/T2H and RZ/N2H SoCs.
> >
> > The DU block on RZ/T2H is functionally equivalent to the RZ/G2UL DU and
> > supports the DPI interface, but includes SoC-specific register differen=
ces.
> > Add a dedicated compatible string to represent this variant.
> >
> > As the DU implementation on RZ/N2H matches RZ/T2H, describe it using an
> > RZ/N2H specific compatible string with the RZ/T2H compatible as fallbac=
k.
> >
> > Unlike other DU variants which use a multi-port model, the RZ/T2H and
> > RZ/N2H DU has a single output and is modelled using a single port node
> > with one endpoint. Add a port property to support this and update the
> > allOf constraints accordingly.
>
> Wouldn't it be simpler to always have a "ports" node, even for variants
> with a single port ?
>
I agree that, from a binding perspective, always having a "ports" node
keeps things simpler and consistent. Biju suggested this change based
on earlier feedback for the RZ/G3E series.

Cheers,
Prabhakar
