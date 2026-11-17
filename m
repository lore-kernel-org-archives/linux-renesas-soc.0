Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794928379;
	b=D/2dV8p9L6yfDQiE1s/cTCVC2LTYKmu1TC1nK5wJ0Yvi4NtCKAdiQFr8z6agXBmztl66
	 +18akKbxBzPzxlUYG9qAasLIIWtKGLiRkOiYFgEz4G01uW6qyp6J0kqm1Bvc2aCa0L5i0
	 tIuCT3lhJmg1Hzuul/QT92j7bVbAo9GIr4FsRGtItsOgCycXbu6MJpY2ak7+uBX4Zg64h
	 N1Ku/S2SgOtQwvi5EoC/ugHGQmcuZix97eOZBTkEtmvOYQZ7wWYn2BbJt5PHnKfLC15g8
	 lfyK+UHYECC+0y3XpvROXaoaWbcu3RIyQwcXPcPaWN3/mR9daVMzpE5q4brQxLJYJ4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794928379;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=lXzAHAHuyb7ljn+BW0UDmcAkjyTtMTKu31hzJUVD5x8=;
	b=ImLkmQgVAjNnF4E8Vc8HaR5GcWo+BZ0rJBXKc0DgKonXZTNkxlqCO/kwQlAnNSoKxBON
	 LFNPAsWfmFVW/a5Ob28BGTJiR0szm73OXTcc0okUI5qk1T1TpPYAcwhIBZ3l9nHut9oVf
	 IzxUNxw77005HOKfOpdlkiWR4ShQuXK4DW+W124qXghUEbTkJyN96W3dJQ7mvN9L8Z3oV
	 GSodv/uzY1GrNPuRGcApPJyuZsKo+mbHquE0BZFq/Mh6AmnQUG8PcFqafYd16KeWpleWs
	 ySqpLuXdqq+f//TXpMyG05coOmXa3FOo8pRdm/yB2luHhcEPh+dzZdCrcuKr7jtOXKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.217.46
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57577606A331
	for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Nov 2026 15:12:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57577606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-7a6e560f580so4545449137.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Nov 2026 07:12:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794928378; x=1795533178;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lXzAHAHuyb7ljn+BW0UDmcAkjyTtMTKu31hzJUVD5x8=;
        b=Jiwu+t9nvJELorZXc/UXKWvBLLUDm2dJfKPPt+vsOoZgSAxmu+9DTx60bvxHXuSXxG
         u9qEReA5mfJjYfHHyUkuOKX2YXpbiFByw6GX2BW3udpeZHUNQ2wR11I/kq/0v5tNiJp5
         5niReiFlhjpFIuG/iOvMwf38NB3RXj+VU2BPO8yDwIGCo5r6Ll1zxV/cEor2C5MJyb9v
         qM9lrM7LQfih2guKZmgsjax2TsSMKuxsVt0U+et8bg9kk/2FtsmTMkQstbZdzsc/Xec/
         zL4yuItrstsduhF4MDpA5mlhMAVPXKMpdQVkdY7FKFosLk/jPo2wl2DTNw/xmzidX+wc
         HtRQ==
X-Forwarded-Encrypted: i=1; AL+hErH5CUu4IgMEyOQRz8BplWKZMADa+Br/H+REfoC0RZPMlGP1hhOBpBV1SMrKRLstDq04P0p2+K1tkwedbwj5cHXknA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/TdGeBpKGiRL1J6l85RsPh62XphHjQlklmbITD+9z8QbfgY65W
	+OsoX4YnqBFBn9so6KLiiqavI0EJ/i3KHACCj1OYsosipcY6199XuWPa7HR6ob0+
X-Gm-Gg: AYBFou2svqKuntti3fCJb9ceTR975VhHWuHeIaPr5sCR/00c8/ybsWzy1A3HxT7CMDT
	odowabtyQLYgBIFYOm271ClCs20wrb3hXzgZpMJroJMPmMMUZ8m4xOZLrzZawi/gaErnsq3cpYe
	WpqkvPDiShIivSO7yxui+DvPyfJFA0pYkD/Yc4+JLBo+pKkDMAybbAklvSNPRgrBsCVu80J7/cc
	HpQ2iSPTceC80AcRvMtw+W7YUmP0WVi81Iuml/L2ht/DsBOQmEZk/+NZpAb7bLmJoeLu12F4Tdc
	/lCE5D6zFcHYNtk4cnH4prFAYKEN94d4nXbmZkaakZnGUbUfhAR8P7zr5wiQwcA3QJi5OUPCmh9
	eaWhJvOOXNDnImhNfONPrJKaeAK0M4XvIJccIT6AafxhQiabZ142sJWkKExkxklIIHqBC11QCOX
	qzwNuC5c2ZyZW736frmtRRnp93snRD1MbYX+Qvj8vFJf4Ug8SizCVYWKC5Nr5vlZiNQx6ACyDWf
	wdh7gL2UpbgWBc8dw1JZOL2Q0NYpDd+i3SkSSN3LHhjQLO+37R6kn9RSm0bkXlaIZMBJPZBEOFX
	Aln5fwboZ2vciUFHjl3ovJdRv7GufS+6K7vOzeFVHYFDVLs60LWqb6rG5bAKiwIeRMsN+MXaHRM
	PC+qCVdePTuUr
X-Received: by 2002:a05:6102:6d0:b0:7c3:9982:67d7 with SMTP id ada2fe7eead31-7d64d6f794cmr5235760137.16.1794928378104;
        Tue, 17 Nov 2026 07:12:58 -0800 (PST)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d69e023608sm2707656137.7.2026.11.17.07.12.56
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 07:12:56 -0800 (PST)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-990703f817fso3546748241.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Nov 2026 07:12:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFWgYpCZSt6THv4oB7Ph4GQQgDCze0ovFnit33ZqlcTXcKRIbbgdL63hQ/FLtH/0L5BkDygBlHDP3IMhPARLXqAzQ==@vger.kernel.org
X-Received: by 2002:a05:6122:4202:b0:5ec:c180:e1a1 with SMTP id
 71dfb90a1353d-5ee3468bc3dmr6118113e0c.2.1794928376130; Tue, 17 Nov 2026
 07:12:56 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-b4-tm-pm-du-v1-1-507474331137@bp.renesas.com>
In-Reply-To: <20261112-b4-tm-pm-du-v1-1-507474331137@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Nov 2026 16:12:43 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXQjm9rqmKn35G9-CqGSuMO9nirDw2GmFfF2PBfsCvH_Q@mail.gmail.com>
X-Gm-Features: Aa3M54ptylXmhL6SzM56Sx5LCXa21m2jXwzZpxrJX2kGuRvWvlxVM_ksOElm6ig
Message-ID: <CAMuHMdXQjm9rqmKn35G9-CqGSuMO9nirDw2GmFfF2PBfsCvH_Q@mail.gmail.com>
Subject: Re: [PATCH] drm: renesas: rz-du: Add suspend/resume support
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, tomm.merciai@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tommaso,

On Thu, 12 Nov 2026 at 09:31, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Add suspend/resume support to the RZ/G2L DU driver.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> @@ -140,6 +140,27 @@ static const struct drm_driver rzg2l_du_driver =3D {
>         .minor                  =3D 0,
>  };
>
> +/* ---------------------------------------------------------------------=
--------
> + * Power management
> + */
> +
> +static int rzg2l_du_pm_suspend(struct device *dev)
> +{
> +       struct rzg2l_du_device *rcdu =3D dev_get_drvdata(dev);
> +
> +       return drm_mode_config_helper_suspend(&rcdu->ddev);

error: passing argument 1 of =E2=80=98drm_mode_config_helper_suspend=E2=80=
=99 from
incompatible pointer type [-Werror=3Dincompatible-pointer-types]

The "&" should be dropped...

> +}
> +
> +static int rzg2l_du_pm_resume(struct device *dev)
> +{
> +       struct rzg2l_du_device *rcdu =3D dev_get_drvdata(dev);
> +
> +       return drm_mode_config_helper_resume(&rcdu->ddev);

... likewise.

> +}
> +
> +static DEFINE_SIMPLE_DEV_PM_OPS(rzg2l_du_pm_ops,
> +                               rzg2l_du_pm_suspend, rzg2l_du_pm_resume);
> +
>  /* ---------------------------------------------------------------------=
--------
>   * Platform driver
>   */

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
