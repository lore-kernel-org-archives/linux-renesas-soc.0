Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0504E468C12
	for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Oct 2026 08:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791794884; cv=none; b=WKHVsSGT7TRNihBDtGyuNK7NlTjcQS4HOpMJcuORt+lFrgJxqRBXLqU2iF0o/4vFYMQ76/W6jMrhndIEo3TWh6PpmsoyzMpjSOJsyBCb6sxfmVdoOAJ2v+8eQkP+GntKmXtNbdTJ91VLlcnoRjkkpyGOEpeB4a+Prdc8JmepwUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791794884; c=relaxed/simple;
	bh=aBKCXRC1k4NcfO23sprYjoI6K6Bpz0LlCdKLEKHyjAA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nm7SPMZ7mKQJQeFzyEdgVlEWqVp2Z2pdva7Xe2MNE/n5wqqCIcablfOEPliozFWvLVrEt27jjQDdr/HKOJj2mxMfoFnsnnIZtzBirNWFDJCGiEKegjd7fv+lyGA2KJGZycbUZdJhFvq5L4ImRPmuQ9aQRI/99GfmwIm6mrH/Zto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5e6b5794d26so1466502e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Oct 2026 01:48:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791794881; x=1792399681;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=II14nzlPS87+eKDd3Q5pRhl10wTigOj5K9H4e1LTQ1I=;
        b=f00IYVg3VTz0/HlScHEGZduhr1tjvT4pQsfLh9UnnRbSahYcWkcV0krNtCvUU9q7N+
         28/uSevvmX+e/Xyd6vP+qWbHi4J0jmbdAtqt2rp0rXa2tC3U5hwp2CUFbJRf/5pMAWc9
         yngOK4UnVFmWqmrB2YICnzSH8t15NO9VSdahoA4xOJhA2ftoPcX5/OAQ5Xotuw1Qmv28
         rRBsV3/w2PvgVkSQ7D8JqBk/O0CRItbPCn4KvV2Y/ZTYp/KzdeqdEDssBdRmNhu+l1r2
         LwbVFh0Klf2PV/SjNNy8Obi8j9rWt1JZmSTEqOXeJY190Y9pP2DKNRCkuIJqadJT4Ri3
         +HDw==
X-Forwarded-Encrypted: i=1; AKwUvByFNsUfMQrRG8gabzN29v47IEHlCets0ekCnR5BFQaNWB7DyKzSrFc0tsI4y+c2StNL0W7m/Z9cRRFdDB0RRGtD4A==@vger.kernel.org
X-Gm-Message-State: AFq9FYLnwlto5FWIpwy6BQ4Sdh6jhuh28XRlOkMQVt06EGaZPD3Ned4N
	AK9xQzQ23zOsgdYPgzV0Qw22aF2nU5dhCM82/cHKWMf6KcGHPWjKdJblrIjVOJwj
X-Gm-Gg: AYBFou2qrPQqVHU0AVyaVe2nuztq3iITvfu7g9DDVBN9P2WckijPknPXu2OWu8QAnz+
	clR9B8gp0aiBGKfoySJy0R0BuNYvxqUmJVOucqGOMw7Cs3ky2GfkCBp/ZFo4laLGw5mkLeaXhMj
	ZCve48doP2DVr+ILWSTx81+/X+vXy+kJ3MHp+8ihpupaUC88aUkTSjUqsnoG8Vkeoe7iKhNz4iS
	tP3MNM0RBjWPfwKVjyXUsngAP+kIeBHjEaoCM5eU/BSAvBc3dSGRMBRwM9nnTZbpLgkVuNSl/jH
	yogzFQKfYwyrXNuDvpWBVaubbs3gGqBZ+g0QbYP2Pegs8OCtVm9NrjaShMi30nBKr90eMDODsfo
	Kah8FtYxwemKxXalAPXo7wXmvpI9O56hLB837dcVPT243yeFK/yrRG9nzsyMisfdUGILdUnZ5Qe
	xlYaD+betBINU/xNqDAiCwIKlBMoVnMtu7BHdbrcge+/m+/EMQJRBeK/7KNu2uDetI5sUwywl6D
	+xqWNxYHsZMXCmmtBGTaulFKItb7uDn9/GLCWbuFbLeHf06eug=
X-Received: by 2002:a05:6122:4f9d:b0:5c9:a830:44cb with SMTP id 71dfb90a1353d-5e91f4bb571mr2253679e0c.8.1791794880842;
        Mon, 12 Oct 2026 01:48:00 -0700 (PDT)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5e92f300f42sm5022136e0c.0.2026.10.12.01.47.57
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 01:47:58 -0700 (PDT)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5e37ce204cfso2012663e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Oct 2026 01:47:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByj74H4YRhRft9O5FYu28ranYX7NTR0cUsrJMWfv5ugo01DOzdnNRxQZW8GCGbCzA1K+TzUHmbwHb/tr5ZHH7S0ew==@vger.kernel.org
X-Received: by 2002:a05:6122:3c4d:b0:5e6:cac7:9ff7 with SMTP id
 71dfb90a1353d-5e91e7ad625mr2370389e0c.21.1791794877726; Mon, 12 Oct 2026
 01:47:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928-mali-c55-renesas-dts-v3-0-2cf7eb746ebb@kernel.org>
 <20260928-mali-c55-renesas-dts-v3-2-2cf7eb746ebb@kernel.org>
 <5bc1553b-465b-42d1-a4b0-66a514b897d3@ideasonboard.com> <CAD++jLmBbMUjO-tbiQ=+G8tf=4RyKQ+=h2y=o2C+g+NY7HsqQQ@mail.gmail.com>
In-Reply-To: <CAD++jLmBbMUjO-tbiQ=+G8tf=4RyKQ+=h2y=o2C+g+NY7HsqQQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 12 Oct 2026 10:47:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXO+pZbrgG52zxOZ2W1aVcC9OT4v0Sd9C-HTHQXixksUQ@mail.gmail.com>
X-Gm-Features: AclHuK_P9aWhNfgjy-bm9dcFKp2tM6k860xhbXHPLm1PhxRGU9PV-PZpA0ja_mE
Message-ID: <CAMuHMdXO+pZbrgG52zxOZ2W1aVcC9OT4v0Sd9C-HTHQXixksUQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] dt-bindings: media: arm,mali-c55: Describe DMA
 line-tick interrupts
To: Linus Walleij <linusw@kernel.org>
Cc: Dan Scally <dan.scally@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Thu, 8 Oct 2026 at 15:26, Linus Walleij <linusw@kernel.org> wrote:
> On Wed, Oct 7, 2026 at 12:49=E2=80=AFPM Dan Scally <dan.scally@ideasonboa=
rd.com> wrote:
> > >     interrupts:
> > > -    maxItems: 1
> > > +    minItems: 1
> > > +    items:
> > > +      - description: Combined ISP core interrupt
> > > +      - description: Full-resolution DMA writer line-tick interrupt
> > > +      - description: Full-resolution UV DMA writer line-tick interru=
pt
> >
> > As with the IVC, perhaps an interrupt-names entry would also be useful?
>
> I think interrupt-names are only used if you have say 100
> possible interrupts and only want to specify 2. So you can
> look up the 2 you need by name.
>
> I don't see any situation where sparse interrupt supply
> would be applicable for this IP? It's just 3 of them.

How come we suddenly have three? There's still only a single
possible compatible value
Perhaps tomorrow there will be a different set of three?
So that's why you should add interrupt-names...

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
