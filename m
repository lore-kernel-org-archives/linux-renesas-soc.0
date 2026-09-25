Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6146336495F
	for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Sep 2026 12:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790341091; cv=none; b=LVxD0Bmw4ZzxwAbg+1ePB6swYTdEzxxawkX0rjFcYKNPTtm2x6a3alk6/paYgWpiFRrl2ER4Vs7VTPvjFe/F+DQLfvJA1IJIHmJYdUqciNmaEtmNjpdziEblX9SkxpCslmaeuMWRWVbQmTqFPOCL21Q7TNme5r814eUc5+L0eQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790341091; c=relaxed/simple;
	bh=SNXrjUHLxaO4PIWLbvPnvyB48FFWSNE4zj+UVTQoMOA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pz/6e38lDv8QQ6UE4uYvwpz4jv3XbCxXgVAWYI1SAnyR6vxY/Nk5e/YTPXv/z9zjWwGDjX62gpWXTylZG5rxkGy5MXpUjNH9q4pk6OVb9mARnQj86MWrJHzZlY42sRHj/VKme1WtoYHLmUwClGmhpqnsoEniEb1ZjJDpuGy0ANM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-78fb1fb9508so1622680137.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Sep 2026 05:58:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790341088; x=1790945888;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iikrWSUlQodloxnitQUQlaOsbbx0iKNTngyqMd+wIHM=;
        b=aqqxfMUfr0dwSD8GfllAZc/QA8CDpSzxbm+EZV8jgeim9Nj+Fy1WVv4bLjYS4gILrh
         MoVKZLlXp+tSFxbZsGSfU3kPVqARrB8dPIQf0iyQ19nJWeGRGpViv1t1hmrkKpN1bhfo
         oIuc7HVJHDdD+yg3A2hqK7xT/LKjtRSB9hSRzM1CAvDiJ0b/mIfI8aTRcgOfVolpC5Uh
         83qqt8WZ8S7pjYstUrqW9VcSlvwVJAYaNbOLlfa7DoE+D+MbZazZ/gcSIL90eZAb9smM
         Q/E/oSM/gB/gK15rtK0bn0r48VYSmX0SF3Cnzr0rSvhZVCY/QvP1Yp+3R7kavQUoXfnI
         asRQ==
X-Forwarded-Encrypted: i=1; AKwUvByPZELIRo1dkCggkPVKIhWoNQX9d5Zm/myqZ1NI80iZZNDPgTKw2wPAlsdOY4VKdo/i2YcSh/I+4mVMLorWNVnJsQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mCB2eOwHkSk+Ocsk8HcE83gYLOFLyWKJF0G3x+t/sRlX1CkU5p
	tavHavX8oQlZSVEq1QyTkp8xg/K6oeKALSqStHLx8/QjSGiKBLLr6n2vUmaBTDoe
X-Gm-Gg: AYBFou3cw/4sOT6EY+XVJEX/Xf+vSrpdMmjvT9S4cWU3+GySmFZ5TKGvOOQSODTA2Kv
	55LfsOD2CYNavYoApY9HTfdgwOIYgDYoOInVN6bbV7TQI1RwmyWQS4JK/Uu5kaSVc3EUUORqtfD
	o6AnbLZDWyfh7POI+A0nbi4vAr2uinep5geIWXjM9bAyDcDe0SSQwkhJdVwN4f/RSDiUwgbV9bY
	GzkEgaXyVzMjVYB5S6cMQe+FT7cVNfIu4WQCPL/impVVMsqeIJvqn/JxxMBrWy95nYfSye8QFxM
	+oiXR3fKYtgCgsP+1RviC8ncTosGTaqFYAvKKN/AUocUsI6wCUujDRxu+T9JCMFfwQt1Afe2URE
	1ZnnsL6MNWzOFNCpwuanv/112Sq/wJzS/3W5oLOny0t8R+6/+XUroxGSBKrzE8ZRnLMQ9E+UBMD
	B9mee4KO1vt7x6Bteslz5VAH0IlrpQFReDCWpwhi39nhSUrMiabFuv3k3cgSoc/2/xBQdXMf0/H
	lK92/1Fdlox/Jq8a/mKv2T8Zop/bART7wfW
X-Received: by 2002:a67:e001:0:20b0:7a4:3400:7e9b with SMTP id ada2fe7eead31-7af1d09eademr1776947137.13.1790341088234;
        Fri, 25 Sep 2026 05:58:08 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9861afee2d2sm2465648241.6.2026.09.25.05.58.08
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 05:58:08 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-982838c4cccso586240241.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Sep 2026 05:58:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBza8zCUS6+rlyJ4EjED/0aZItfb0jyE7fh+7SMFOWXurvGbe+oX5XnmDS/Ztjl6Yk2+TODoJknqxqGfcuxgz2h3Dg==@vger.kernel.org
X-Received: by 2002:a05:6102:a145:b0:78f:fee6:832 with SMTP id
 ada2fe7eead31-7af1cea4a54mr1503499137.12.1790341087879; Fri, 25 Sep 2026
 05:58:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924-paul-v7-3-rc1-edac-v3-0-bd8054a5b180@bootlin.com>
 <20260924-paul-v7-3-rc1-edac-v3-1-bd8054a5b180@bootlin.com>
 <arZpZolRwdU8zh6O@shikoro> <8733uxlcl1.fsf@bootlin.com>
In-Reply-To: <8733uxlcl1.fsf@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 25 Sep 2026 14:57:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUeCH9SbCr70syV0hVSqD1ccjVptMHoY-6aaEhW_ine_Q@mail.gmail.com>
X-Gm-Features: AclHuK-YV8P6qGPlYAimFvYOFx6QV9kkt9w-v-Qt2g3Qun14B0iXjB41Jl3A5uU
Message-ID: <CAMuHMdUeCH9SbCr70syV0hVSqD1ccjVptMHoY-6aaEhW_ine_Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: edac: cdns,ddr-edac: add Cadence DDR
 EDAC binding
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Paul Louvel <paul.louvel@bootlin.com>, 
	Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-edac@vger.kernel.org, devicetree@vger.kernel.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Herve Codina <herve.codina@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Miqu=C3=A8l,

On Fri, 25 Sept 2026 at 14:50, Miquel Raynal <miquel.raynal@bootlin.com> wr=
ote:
> > But one thing came to my attention just now which needs fixing:
> >
> >> +    items:
> >> +      - const: renesas,r9a06g032-ddr-edac # RZ/N1D
> >> +      - const: renesas,rzn1-ddr-edac      # RZ/N1
> >
> > We don't need a family compatible. Only N1D has a DDR controller.
>
> This is true, but from my experience with this platform, Geert used to
> request both. I'm fine exposing only one of them, but I explicitly asked
> Paul to put them both to mimic the existing bindings and keep some kind
> of uniformity. I'm fine either ways, but before we go through that
> iteration, Geert, would you mind confirming your preferences?

Well, if only RZ/N1D has the DDR controller, there is not much point in
adding a family-specific compatible value.  According to renesas.com,
RZ/N1x is obsolete, so no new family members will arrive.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
