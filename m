Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1A631E842
	for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Aug 2026 11:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786449127; cv=none; b=iJpdrY1dZvngdFmkHLKXqS9a+CUOaySwanl7VpyXyW6zDHsObbrUqVbREIxFTj9iPANxTWpF4qCeke0Dxlh2OYmqLtxk9SJfQ0WoUEbdxxcapAJWXxnpiS+y7jQAxVmLJ/w29XvkFBYz2X2UymfY5RAF2FeKgJSC8/3bynB6CXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786449127; c=relaxed/simple;
	bh=W8lxYDaSFvG2LENuVgumDI2Us0ijdNp1IfWuToF3Sc8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pm8+/fc/lBlLkIjzA1FJgznfBSVAMj5g3qyQG+MQyTSlWlDTWZVgJV0F2fPdaCVy9hVe3jRUyl1li2kEwgxtiT0N0kNfLbXAzsAXpokfn/AfeFdJASrVV5Nx3PfchWIDMhKzFPY5hh938+mg+cZKEIFgThXA0uzxgj0wp7xVY2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-969524c1a63so1904266241.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Aug 2026 04:52:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786449124; x=1787053924;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gw6+OutRgMyTdQq2RnO8+b25hOPJIM1JAzCBiUaxv5A=;
        b=kvq8iSHEGLPDPndxhkRFr6RILhsntMdN2TvCsxC9nJN5xG+nf7BCqAtqxTflpF6sjC
         p0ZCm3S1ve5xsmtALWsypV4mlMvZeJxDVcNn+WSBWrtRLyeAg3GdcQe+uw2oVduNst1M
         gVISIMK0GRH4Rhf4PZ1RoF9HNqqSDPvrzoOO6/nLXoLYbUAMuIVhLMF+59M4skzwfqJj
         d5BB8rOpDM68xPbLMvLWDEs5XLgq8ftJ4DfZiY+tLpW8bh2Rqt/Xn1Zbrm2nToJX/xvH
         CvDpDAPGRo+5Z80KdpgkbdMG5oBwFgZY6cHZ/AG8XtHAX2QgVw5etW2baROifPRqTDGy
         5h8w==
X-Forwarded-Encrypted: i=1; AHgh+RpSWmJXlIA7mn6XXEJvIK75DITtsEG3JoUhLzM0nMDNrMyr9HbhFX4KQHBeYbzwO6uE/VsmtHLWbA9x+XZ3+OMfVw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyskd5FQE2GkUtLhn+HGz2PN8mcgGJfk0kF36NmApALd7zY6Lea
	JivbFdDNsuP07EkFGhqMNaRRsdkUIBd+k+RnR1l7JCaXfbvQalsewDFM4PmLRLhy
X-Gm-Gg: AR+sD12gbiazu7jruyvMU1fILwCz78/yFdSwxaiqqwPyWXVcSF9AoIqzVMphB5utH9e
	wrkwBjp49CTaat1JdUB1AlIZFSgv+aGVBjHaGL9J8GR/51byCPvmm2g/YF53MrxPJt/RC+pbqbI
	54fSWSU7ijBwVz12AezFqHKI/mi+Z5tibmyQeLZdnBdrf2rGgu0kMOe1m6rs7ylnGy+CwN2/4iW
	bgvsd7gCisoo2xcPlHPBlbN1W4uw3P1xsw9sB7xgMy5A76t8W6q72KA1+i6d/SCIT4Daht0n67Z
	GbHqoPo7aPS5xrVoa1hqLc2wd6ys6Kx3HP3J3khrw9x3j6C511zstcFN/To07yPzPCxdMfuNXQH
	cu7ll7p6jR5KLNQn0avMFrCwoUzAXOngIXLpIJpu+R002bBIOg4d38z6BaILKAASCT/eCARQvo7
	7E2ZFcbGUJDVFTzmhuE6anPFGyefYlfaaANu5rq7yqixsHaD9dGu5Er9mD30SRfXvIFQHRzjdYx
	hrZmCXCDu4KQru8jbs/WXW9Pg==
X-Received: by 2002:a05:6102:5128:b0:744:d1a6:b11d with SMTP id ada2fe7eead31-76b54f7c0ecmr827111137.3.1786449124471;
        Tue, 11 Aug 2026 04:52:04 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97a36631fbasm347703241.6.2026.08.11.04.52.01
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 04:52:01 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-966e7380109so2015453241.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Aug 2026 04:52:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rp6mZ4U/vY/xM59D5FsOTEhkYFez9C1khX/T/qZBtCqD4WPbt3znn1BD1DXM8IvOWI630YxDDe1VjX4+/qQMb1iPw==@vger.kernel.org
X-Received: by 2002:a05:6102:5128:b0:744:d1a6:b11d with SMTP id
 ada2fe7eead31-76b54f7c0ecmr827022137.3.1786449121269; Tue, 11 Aug 2026
 04:52:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <d4bd0cc7f26c1bcdc260edb994b4971cb5dd3a10.1786438424.git.geert+renesas@glider.be>
 <CAPx+jO-uXbNpFPzbAbDkBQh2-xf4r1NXk2PdQvOh9ZOfEQ71gQ@mail.gmail.com>
In-Reply-To: <CAPx+jO-uXbNpFPzbAbDkBQh2-xf4r1NXk2PdQvOh9ZOfEQ71gQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Aug 2026 13:51:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXLsMfGEz5s9s3voZGbQL90hRYCxsfC==xsGs315XOHWA@mail.gmail.com>
X-Gm-Features: AUfX_mxYFb3a8-KjLfsf-hDUGSX7q2XivFMj5SQAYvLQGp9PIzS7OsTLrsDrS6c
Message-ID: <CAMuHMdXLsMfGEz5s9s3voZGbQL90hRYCxsfC==xsGs315XOHWA@mail.gmail.com>
Subject: Re: [PATCH v4] pmdomain: renesas: Add R-Car X5H MDLC driver
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-renesas-soc@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ulf,

On Tue, 11 Aug 2026 at 12:16, Ulf Hansson <ulf.hansson@oss.qualcomm.com> wr=
ote:
> On Tue, Aug 11, 2026 at 10:58=E2=80=AFAM Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
> > Add a minimal Module Controller driver for the R-Car X5H (R8A78000) SoC=
.
> > For now this just supports the always-on power domains, and dummy modul=
e
> > clocks and resets for the serial console (which is enabled by the boot
> > loader).
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> I had a closer look at the attach part and there is few questions,
> please see below.

Thanks for your comments!

> > --- /dev/null
> > +++ b/drivers/pmdomain/renesas/r8a78000-mdlc.c

> > +static int r8a78000_mdlc_attach_dev(struct generic_pm_domain *domain,
> > +                                   struct device *dev)
> > +{
> > +       struct device_node *np =3D dev->of_node;
> > +       struct r8a78000_mdlc_priv *priv;
> > +       struct of_phandle_args pd_spec;
> > +       const struct mod_map *map;
> > +       unsigned int id;
> > +       int ret;
> > +
> > +       ret =3D of_parse_phandle_with_args(np, "power-domains",
> > +                                        "#power-domain-cells", 0, &pd_=
spec);
> > +       if (ret < 0)
> > +               return ret;
> > +
> > +       if (pd_spec.args_count !=3D 2) {
> > +               of_node_put(pd_spec.np);
> > +               return -EINVAL;
> > +       }
>
> Is the above check really needed?
>
> Assuming r8a78000_genpd_xlate() is used for attaching, then the
> args_count must always be 2, otherwise we return an error code when
> trying to attach the device to its genpd, right?

That is indeed true if power-domains contains a single entry pointing
to an MDLC domain.
This check also protects against the (currently unlikely) case where
there are multiple entries. But for that to work well, it should indeed
validate pd_spec.np, too.

Is this good enough for now, or do you want me to drop the check?

> > +
> > +       scoped_guard(mutex, &r8a78000_mdlc_lock) {
> > +               hlist_for_each_entry(priv, &r8a78000_mdlc_list, link) {
> > +                       if (priv->np =3D=3D pd_spec.np)
> > +                               break;
> > +               }
> > +       }
> > +
> > +       if (!priv) {
> > +               dev_err(dev, "%s: MDLC %pOF not found\n", __func__, pd_=
spec.np);
> > +               of_node_put(pd_spec.np);
> > +               return -ENODEV;
> > +       }
> > +
> > +       id =3D pd_spec.args[1];
> > +       of_node_put(pd_spec.np);
> > +
> > +       map =3D mod_map_find(priv->mod_map, id);
> > +       if (!map) {
> > +               dev_err(dev, "Unknown module 0x%x\n", id);
> > +               return -ENOENT;
> > +       }
>
> Would it not be better (if possible) to do the above verification as a
> part of the r8a78000_genpd_xlate() instead?

In the current minimal driver, the verification could indeed be done
in the .xlate() callback.
However, subsequent patches will add actual data to the retrieved map
entry.  As the .xlate() callback cannot pass data for later use by the
.attach_dev() callback, the latter has to call mod_map_find() anyway.

> > +
> > +       dev_dbg(dev, "Ignoring HW module 0x%x\n", id);
> > +       return 0;
> > +}

Thanks!

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
