Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793798080;
	b=hJfVmVKXhtOTrqCMwl20fxOM+TLL1mJCTWygQ+3REW0aQfY54gvay34/+kp/tMENOhvu
	 /9iRHfGpPRSlvdyaiBNYAHtxZs+1S1+4ZhwYEgOHh1Ath9tUkvek/gRVgBIzKQQDIxrGp
	 ncFVAAIQa823nK7adymRHRpkhoP/bvxivAoIK0UWtMB0myx0aH/ldcKBMsckjiLZkwxLW
	 37WaiMjSfIqq173bckafqmwK/O1qziUR2doxQTR+UxpT597MIYeAQLAGd0kWZwPMt/hIv
	 N5oT2nfc6wcEqaIJKAeX+3umE+gudx1H9nCKEq5nTAonjK/PiJSytk2dpyB/RN4848Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793798080;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=vajkXxV2I9Y6AOy4iqgYfUPKodpE+hYIP6A4IuPiEFI=;
	b=sy0CBixMJ/uqz86c9yQ9G0ADJMPxobqpFkfNdoy/iBOHKoyMGvYbgN34GZwAliY9wuND
	 KXisibJrATDyYWpE6NUsGLqFimwdm69+sBzK5naZyhov228Jx/5jqSslKyhwnM13uHaiz
	 hBLhz1WikDgtY29kxcWR5tb0RVE9lE3DstUcbGYt9Q6yk831TOBvljaGwoKgb/wX/wQAJ
	 RMANX1VFEKFXU37pTX8abTCrly2U+8WGdJg4CBVWaaKe2NabdBcO6/kM8fWZqvkn86LJJ
	 F+gEHepGG8hmqXaVaxF93SvG6NbV4na9TYe8dN/rvZBKGFdMtLdyf5Xi0f06xjGE+dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1174606A337
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Nov 2026 13:14:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1174606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c49c32650adso87370066b.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Nov 2026 05:14:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793798078; x=1794402878;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vajkXxV2I9Y6AOy4iqgYfUPKodpE+hYIP6A4IuPiEFI=;
        b=wU41jeDK+zLe/dtweJnPVufKebki0lip6y0EFGUG3Lt3GlFfb79ILkiJsNthyAGiQ8
         mJ7ybMvHFFxcmQXQn56EqWb9y6vhDMw7Dl82TfTbYpA0kXwxOVa4HX6jWEfFoUKHln+1
         2kUK4toSykFzlsBiwDMs6y0GpGrNd4dZ/RARovznDFaiPrUcKrFH0C8aItaYRbrolKoa
         yD9rVJLwS/ayK3p371UU0uNWL4zc2KDCp+YXlaSIXOVza+SuDRmzOCPrJGaByIApFgy7
         MbaPKT6miYJkS2zb6k1+pO2IIio+/Efg5ZyINcL05CAHPcO4z/7iphx7nqe3s6feh220
         3Adw==
X-Forwarded-Encrypted: i=1; AKwUvByzwPBVkL9Zlz9rib5MvBNfNTyMGTHWdrQgaiEwc/jXW2D9yVulg9r/PTUM3CAb7RfXqJJ68SiQoWTX5hnC04AhzQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+7jE9Q2nMSR7J3FRK2X5QaMn3IMmB/pKDk7esK3Q8rzMxZqU11
	GZkR/xgBScp3eru6VX0CPbtOJzwcSIvf+BMA46hzyr4HlDhWBxZuxwJQc8gbE98bQgY=
X-Gm-Gg: AYBFou3CxJ+igTQx2j5AQthEKiIqNUgSOhDn+qxPB7+X59mOfHBJoqZOH5tM6+mfGI6
	93Pxedq6Ww5qUJf6hUuIW1bx2o2Wp9TzM/0ovHAeh8nqR+H/aroSxLMVAYfDztXdXYZyKV1c0IK
	NBIJGXsdcnmUAxn2GJKsnBejj+gRqSm1u/0nQL8RmHM5Wr6f5AucJi0HR/Xq47XR2XLpEwEZEJb
	1HC10aQJpQZ9M3F76Z64D2wl1dNDbubwbenSb81qFV9BrKIgNQjbJQZ+qSascytHvRpyGxfbPL7
	TpM4Vg4H2CXm9ZX+m9+5LHl8niUraDOXpYbedsSmkt9QCrkV8rOjkyFG6/+L/noUujNFg7l2nmG
	tbovMwnp74cqaZHp3TCx5Y1oZl2UqMHtLmG0ynLTLU1pvwzmuKNzfbucH1eapEhx5Xml8npiEyX
	i3t9x1J+Jst74uRCe7xU79kdnPjxqkoG1fLCcfK5IM982gd9q8YD1w11NVsSe/iR5O4J3sfjTtP
	J4NdybS+JDA3qmZwJE0E2b35yT8elt3Y7YrG72mg5Grew9X2FrHy/uePbnTbhypfnYCWaiWJ4hU
	15p+OXrgXkuD6CfEJo/3BEE6AXf2/+f9wNFKp6hsu+ahI66dkWGj+xBlnVEHnv7x3iYGjoTTqtL
	zinDlIjCgbEJN
X-Received: by 2002:a17:907:cbc6:b0:c49:4450:6248 with SMTP id a640c23a62f3a-c4ca7aefa1fmr1373170466b.16.1793798077887;
        Wed, 04 Nov 2026 05:14:37 -0800 (PST)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0e4467a7sm68248966b.42.2026.11.04.05.14.33
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 05:14:36 -0800 (PST)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c411e139259so75963166b.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Nov 2026 05:14:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBy7B/4Ul53dwS6FIKwpFth0Hn7Zqbo0AnBOpklDo+uwy5zcLHM1SCd0tBg4LtezUrE8tEzsBI2NwnZKpUIqJ3lEww==@vger.kernel.org
X-Received: by 2002:a17:907:9c06:b0:c38:ee33:2931 with SMTP id
 a640c23a62f3a-c4ca7b5f423mr1315927766b.37.1793798073731; Wed, 04 Nov 2026
 05:14:33 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103084604.700540-1-lixicaicai@gmail.com> <20261104120840.GJ1959885@ragnatech.se>
In-Reply-To: <20261104120840.GJ1959885@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 4 Nov 2026 14:14:20 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV-K+S3W3R58Tjk4RZH5KNdwRKNS1qYmMyshL+VNYj_rw@mail.gmail.com>
X-Gm-Features: AclHuK9fH8jlqLC7CTY_wgXt4zpoH5cDgRjYOD9LVeoHWxOe1XqqcCj35WRDWsY
Message-ID: <CAMuHMdV-K+S3W3R58Tjk4RZH5KNdwRKNS1qYmMyshL+VNYj_rw@mail.gmail.com>
Subject: Re: [PATCH v2] thermal/drivers/rcar_thermal: fail probe when no
 sensors are probed
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Li Ximo <lixicaicai@gmail.com>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Wang Haoran <haoranwangsec@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Wed, 4 Nov 2026 at 13:08, Niklas S=C3=B6derlund
<niklas.soderlund@ragnatech.se> wrote:
> On 2026-11-03 16:46:04 +0800, Li Ximo wrote:
> > From: Wang Haoran <haoranwangsec@gmail.com>
> >
> > rcar_thermal_probe() returns success even when zero sensors were probed
> > (the per-sensor loop simply falls through with i =3D=3D 0), leaving
> > common->head empty. rcar_thermal_suspend()/rcar_thermal_resume() then
> > call list_first_entry(&common->head, ...) unconditionally, and
> > list_first_entry() on an empty list does not return NULL: it returns
> > container_of() of the list head, i.e. a wild pointer into
> > struct rcar_thermal_common, which is dereferenced at
> > priv->chip->needs_suspend_resume and in the MMIO accesses that follow.
> > A malformed DT node with no MEM resource triggers this at every
> > suspend/resume cycle.
> >
> > As suggested by Niklas S=C3=B6derlund, fix this at the root instead of
> > tolerating an empty list in the PM callbacks: fail probe with -ENODEV
> > when no sensor was probed, since a successfully bound driver with zero
> > sensors is meaningless. The error path through rcar_thermal_remove()
> > already tolerates the empty list (it iterates with
> > rcar_thermal_for_each_priv()).
> >
> > This issue was found by static analysis; we do not have R-Car hardware,
> > so this is compile-tested only.
> >
> > Reported-by: Wang Haoran <haoranwangsec@gmail.com>
> > Reported-by: Li Ximo <lixicaicai@gmail.com>
> > Signed-off-by: Wang Haoran <haoranwangsec@gmail.com>
> > ---
> > v1: https://lore.kernel.org/r/20261026115018.3227372-1-lixicaicai@gmail=
.com
> > v2: completely rework the fix per Niklas S=C3=B6derlund's review: fail =
probe
> > with -ENODEV when no sensors are probed instead of guarding
> > suspend/resume.
> >
> >  drivers/thermal/renesas/rcar_thermal.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/drivers/thermal/renesas/rcar_thermal.c b/drivers/thermal/r=
enesas/rcar_thermal.c
> > index 9a9038671..6a1e977d8 100644
> > --- a/drivers/thermal/renesas/rcar_thermal.c
> > +++ b/drivers/thermal/renesas/rcar_thermal.c
> > @@ -514,6 +514,12 @@ static int rcar_thermal_probe(struct platform_devi=
ce *pdev)
> >                       enr_bits |=3D 3 << (i * 8);
> >       }
> >
> > +     if (!i) {
>
> While this works I think it's fragile as it depends on the loop variable
> of the last loop. If the loop is changed, or a new one added, this check
> can break. Why not make it robust and check if any sensors where added
> to the list containing sensors (common->head)?

Yeah, then we could move the loop variable declarations inside the
for-statements...

> > +             dev_err(dev, "no thermal sensor probed\n");
> > +             ret =3D -ENODEV;
> > +             goto error_unregister;
> > +     }
> > +
> >       if (common->base && enr_bits)
> >               rcar_thermal_common_write(common, ENR, enr_bits);

... if not for the next line:

    dev_info(dev, "%d sensor probed\n", i);

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
