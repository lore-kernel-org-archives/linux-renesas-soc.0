Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792450907;
	b=px0F0h/McXLmh0YVgOT+aV3WbwdKfe4tmr8aSYGnQ3c8Z2SCtZ7sG1Ia9v7NttRUSgOX
	 VSaXBzvrEW1rsN4L89lGSqMAKKYkFUmpmyk2GpfmgTdviA7KUeo1ms2MRSraqtzs+e31Y
	 ktPTW9fhEl+8WEfrsb4ByGUiL3IwbCmGIEhhwiZ306BrtW+ERI8dhaIsQE5zg7u8BpXQY
	 hBOfPIMndKyYuwdzXoL7LcOCoeAQ1dv7ZUcYFHA9Icrt245k/ZmfaVYXd+Ceailt7eNw8
	 b0alpiqlcffHhubY9hPzT0aOQzeVvwqtboyWD7Nb8azqrMuEvGrNHD+uUKrtWwcdbaA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792450907;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=r0vEaLu+DC0I1E6m16+4V7ipgHwAyo1JO101zy/TgUk=;
	b=VSK7PFymB7GilbTQY5/Gutlpg/0lY8xK09QR15klqbvPU01s2LEo/Q/+j+JQzreYkynj
	 EHtYPB/6PbcCDIcdNHaKHwXDpRbDJgwfgW8Lbj1bMhuOdk/R49wN5CVpzVwHlgqz0dDUc
	 E0jjSZp4s1SHKzJSh/gsGi3eP2ULFoC+rPVRPdut3CSMLZRVWVY4Cp/J8l3VGozwgn3z6
	 WRkTGddFXtTCJWRBGD0Z/lL7wJxnee7z1VEff1aoFAsBDIkwI4EbUk7vmdsr997Gs6KWU
	 vuxEehRoYlHKKfXb5SSefQWkNy+01g7o36AlS+IqMo4NliYd7t8VK8WXk941WqihYuQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lSWMQ+mA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF503606A31B
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Oct 2026 23:01:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF503606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lSWMQ+mA
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c34bff61551so371652166b.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Oct 2026 16:01:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792450905; cv=none;
        d=google.com; s=arc-20260327;
        b=RRcZ3WLYqnfHbCUfYCK4fdmEHY5vNEXek/oUN8+il8FZz8yI1wCbFv+7JyKlxjKptn
         GjDuNnpAoUnFj+7nntguKs+e6cxkZhgveSEk5z5Ii085suxrbxZ1LTfe7J0eJvWCvG1H
         FneE2lgdVoNPzxleledAnqRhWOwiJGFWt5LCIOyDk/NL28rbk8DgtHGHk1Zzx5bHjbCJ
         jrWzo0UCBunnIPykt8xYlYADTV0Kzj5atd7Ex/lIB2XKldmuF3s+fgGDwbImky5b0lGj
         phapBdM53do2alk3IbxNCjyzya1YqySE4xT3TJyh0QBl5NFJ6ZGZX21L0e85UdCzBkvy
         4f6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=r0vEaLu+DC0I1E6m16+4V7ipgHwAyo1JO101zy/TgUk=;
        fh=MwKMGkGV/0EYtjVk29pZtWEcHH/R4d2eZsR+Mutqu48=;
        b=eEMUUlxqckhtPJ+uFmIIBLRVQF8xVa2OdsQ4Wz91O3jPjDSnYddO6DKqW51NWXyRa1
         tudZJj4kabRsRNyQ4sd/3DL3gz4xsgQ+TFNoV/NyU6Gfw9AB1+VWnMREK9mAYYNdVmuh
         35vfGhmACVl9qYaygbWR4wdr2TJAAU8j2JkDDWaNyC0GwNkQ9eaV6kXVZ1/LJyP6u+WL
         BkySgNT+QLJxJIyBVDrIorfrfRCTIuOzpJ9n/ySt9tDy+Z8vzTxRPboorkMTrrhwrm0Q
         BaqAb5598nQO9xvGUI+0NojQyebhUwjIAHJIeVeTAHnNMrWJRv+PNN2btQKScq+A0LIC
         P9mQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792450905; x=1793055705; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r0vEaLu+DC0I1E6m16+4V7ipgHwAyo1JO101zy/TgUk=;
        b=lSWMQ+mARUpGBrwe6Y3hefSsBmuR4/334vChRM6PJWGzi6Cnj7mG0Nqh93HjiDkK93
         V829decEkWb3A79Y6/oVT3aWoGQj14dQZIKnJsFMD7AYZM0x0ajcyoycKwDKPULrf5jL
         ztWiRFvDywJh7rhrplIiOLkJucdhPmxK45AbrB6jv04TsiMCutIWTaxyl+Srgn70Wybe
         9SpgW+KJbY32gVdBrahn9ZvRcpef18bnAxpJZgPFqf1pajoNZo35GHDQclqKeXePnMP8
         vG7UK0TZunBJnV/rrD81aK+Lk9bcs+KgG6tZ/qowAQZK8Zv/14lbOC8WNJdptiCOL1Eg
         p3Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792450905; x=1793055705;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r0vEaLu+DC0I1E6m16+4V7ipgHwAyo1JO101zy/TgUk=;
        b=iVzyd3EPM0dVUxni8CFgKCwv5iuaUOGdk/4vJh/nPafBQGcIJMik4L7xkO8k5+hTPL
         SeD8Tj12ezWKHnGhaCjcUmFrxY5qkWs5SV3R+vomVmHU+Hjy9yFvTjEr7TJX1cmXG9hV
         5KfaeJt/yfO53L3LxPI+gVjtwm2ce8zudHiVgqVzQT2+XhhFymhBnF4KSmD7umOXrZEO
         4NGdMM+79x/eYKvwNLz+HHVIgCtktwuu8iWIS9/Lj/yhdVXfdn5rWQfsj4YDdecyQfcw
         Uxmy5oOCVt1aMCs6vBBU3rG5/Qs+crrGekgzR1tCpCvQln67P0/MZtufGv0cjk/93t9k
         Lt4g==
X-Forwarded-Encrypted: i=1; AKwUvBxdE9dtG+nO7HCy++ZRb9feaSE5WzFpU7v85Ses+AHRaDBujun0YMsSDVZqeA/3KIIlZtsieI8SIijFP74Ke3V9nw==@vger.kernel.org
X-Gm-Message-State: AFq9FYIo4O1ERc4qepbobQFgKREZQBd55a3iyJuT1bQ8ICoZnz3KAHZH
	P/4WsrayIL/HsPOPqpNw06WHkY+kLvDV8aujKuFkA6+y1aabJUcHwTGIguehvylvEaw/qNM4Lm8
	O2AEQzQ5wxPv2l5zm4iM0tshQlnt1AA==
X-Gm-Gg: AYBFou0I8BUutpIzNcuxcjsmvnyo68XPQE31QU42aTewTJBYSerB1UeYIFp+x5K55wq
	OVjwjWcRT5K+SpAsiC+GW8aPZIrZ2TLa/yCLG+N0MjvTdQkW9Zeoi5ZrtXahOsZkpL9y6PO2xqC
	oqd9DdwyiAAtlS+5IrPv1NGJjLDMNyp+rUzExcYcMbU5lJ8ma/eWjlCeEvN9qqEI+AOCIH1adeg
	55xjIq/pc+9NH2rgevuq5ew4AmFpjvKcGTFa0moRt/+x/ghw3nnhNd90S6Ig4hFB09iSUK/bmOE
	MbjUvCEgIKP8SSfHzCARzxoU4mSOJZ7EoHcubIBw2vVOXM8TOC8i1uJlgLCtREnysM9tL3LWmhO
	lemhFT0EX3G45OYVdPTw8Mjpe5O4hTmmQ7kGWVxuGAOcc0S+1IF9c1+hLXf/wk2YH7VNRJA==
X-Received: by 2002:a17:907:7282:b0:c31:866c:9696 with SMTP id
 a640c23a62f3a-c419ef274e4mr640187066b.31.1792450904944; Mon, 19 Oct 2026
 16:01:44 -0700 (PDT)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261018024654.3913088-1-mhun512@gmail.com> <20261018024654.3913088-2-mhun512@gmail.com>
 <20261018065442.GC3577260@ragnatech.se>
In-Reply-To: <20261018065442.GC3577260@ragnatech.se>
From: Myeonghun Pak <mhun512@gmail.com>
Date: Mon, 19 Oct 2026 19:01:33 -0400
X-Gm-Features: AclHuK81kf5sGjsveLlYf_EvL3ALaDVS59y4IbiqZrlq6hPfPGs6TazFFH6ntZQ
Message-ID: <CAGEsz8Fa3Hhve3hmKEcWdGENtToKxztHPqaOxkoU-rai-NPV4g@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] media: rcar-isp: distinguish absent cores from
 registration failures
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-media@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ijae Kim <ae878000@gmail.com>, Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

You're right. I missed the resource-probe error handling.
Sorry for the incomplete revision.

I'll review the code and error paths carefully, then fix and
validate the series before resending.

Best regards,
Myeonghun

2026=EB=85=84 10=EC=9B=94 18=EC=9D=BC (=EC=9D=BC) =EC=98=A4=EC=A0=84 2:54, =
Niklas S=C3=B6derlund
<niklas.soderlund@ragnatech.se>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On 2026-10-17 22:46:53 -0400, Myeonghun Pak wrote:
> > risp_probe() interprets -ENODEV from risp_core_probe() as an absent
> > optional core and continues with the channel selector. Keep that result
> > for the existing resource-setup fallback, but distinguish it from a
> > failure after core resources have been initialized.
> >
> > The following patch moves the core IRQ request after RPPX1 and the
> > registration state have been initialized.
>
> No it doesn't.
>
> > If that request returns
> > -ENODEV, its error path releases RPPX1 and the VSPX device reference.
> > Passing -ENODEV back unchanged would make the parent continue probing,
> > although core->base still indicates a core whose resources have already
> > been released.
> >
> > Translate -ENODEV to -ENXIO at the registration error exit, after the
> > existing cleanup. The parent can then handle the failure using only the
> > return value, without inspecting core->base. Leave all resource-setup
> > results unchanged, including the existing fallback when VSPX informatio=
n
> > is absent.
> >
> > This prepares the error handling for the IRQ lifetime fix in the next
> > patch; it does not depend on an existing -ENODEV return from the V4L2
> > registration helpers.
> >
> > This issue was identified during our ongoing research while reviewing
> > kernel code.
> >
> > Suggested-by: Niklas S=C3=B6derlund <niklas.soderlund@ragnatech.se>
> > Assisted-by: LLM
> > Co-developed-by: Ijae Kim <ae878000@gmail.com>
> > Signed-off-by: Ijae Kim <ae878000@gmail.com>
> > Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> > ---
> > Changes in v3:
> > - Express the distinction in the return value, as suggested by Niklas,
> >   instead of checking core->base in the caller.
> > - Translate -ENODEV only after resource setup has succeeded, keeping
> >   existing resource-setup and channel-selector fallback behavior.
> > - Describe this patch as a prerequisite for the IRQ registration move.
> >
> > Changes in v2:
> > - Split the error-handling change out of the IRQ lifetime fix.
> >
> > v2: https://lore.kernel.org/r/20261015004159.2202899-1-mhun512@gmail.co=
m
> > v1: https://lore.kernel.org/r/20261011214448.2043581-1-mhun512@gmail.co=
m
> >
> > Compile-tested with Clang 22.1.2, W=3D1 (arm64). No runtime testing.
> >
> >  drivers/media/platform/renesas/rcar-isp/core.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/platform/renesas/rcar-isp/core.c b/drivers/m=
edia/platform/renesas/rcar-isp/core.c
> > index 586a5adbedfa8..373d9ca9374fe 100644
> > --- a/drivers/media/platform/renesas/rcar-isp/core.c
> > +++ b/drivers/media/platform/renesas/rcar-isp/core.c
> > @@ -894,7 +894,8 @@ int risp_core_probe(struct rcar_isp_core *core, str=
uct platform_device *pdev,
> >  err_destroy_rpp:
> >       rppx1_destroy(core->rpp);
> >       put_device(core->vspx.dev);
> > -     return ret;
> > +     /* Do not report a registration failure as an absent core. */
> > +     return ret =3D=3D -ENODEV ? -ENXIO : ret;
>
> This completely misses the error code from risp_core_probe_resources()
> which, as I understand it, is the one you initially wanted to
> differentiate on? This change still propagates the return code from it
> and just chnages -ENODEV to -ENXIO if it happens to be returned from
> v4l2_device_register() or risp_core_create_subdev().
>
> Please stop using an LLM to throw spaghetti at the wall and if you want
> to have this change read, understand and change the code by hand.
>
> Nacked-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se>
>
> >  }
> >
> >  void risp_core_remove(struct rcar_isp_core *core)
>
> --
> Kind Regards,
> Niklas S=C3=B6derlund
