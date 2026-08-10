Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE345374E5A
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Aug 2026 06:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786343522; cv=pass; b=hQ83EmMdHnkGafqgDbtsUNvLH1qZntcoHMWzRwBcHp/JVsR4S5bUtC//Ml0shlwY0VQYk+L3LxL5Yjom4ezGbXGNDcd+hIBtD41By5zg0I4fzYUDocARpYRaG70OFKB3woX1LwDW72UiRc5gzERCUY6KDJ822rshqLB4pcYMlRI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786343522; c=relaxed/simple;
	bh=Glv+D9dOgkTlvAE3SHxcWgORV7c52cnKk4e/SQGvejo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hKgru36RvhkuLTckBboIaM/PWWcDk3SPxXrCEhSURBxU14jIyKd/B4Bqjg1opER/pe/eBW1J30jxyXww9rjwL+o30MAFgKS+GLgkaOa1PchyqpdrlhIWxELq1pGGWs4IptzulneMFDl230+pmbGnLYvSoFkQy9XUMjcowpP4i7g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ChJ0lHdV; arc=pass smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ChJ0lHdV"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-493b966dd74so9125885e9.3
        for <linux-renesas-soc@vger.kernel.org>; Sun, 09 Aug 2026 23:32:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786343519; cv=none;
        d=google.com; s=arc-20260327;
        b=OyupDwxQJeaIR1cS/6WMl2LizeZi+pMLrsWYpQ20uTM2B5v1epYqPlyBMQEVNGMOj1
         3WjIRoK2Fi3aE934jDPTcUHZEWJdVNPay8/pBIoKl58dIQw4dU20Qnh/IAdZqb1hDkt7
         remk58GYU1Zn0NoQ5RqJqj/xcH1tZ9/JLrrIXcnmu8o86NUZ5TxU1I2I/f2F/KlYjbO/
         YqD+yXtipDHobcH1laN2QfgL37VVzV0RC+kZwnWscy7lfLRcoC+zExfBFZOPqmfZeQf/
         dihQMJO5xQ3HIhEZ0TyUAtuX7h8kz1TqAZSUxBzOS3vSbD8bJCWt0pG5NhmKaRtnl4wL
         tVgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3SjLv82lPKci1T9o7jRU252gydE3KzV/t6uQyPNLwxs=;
        fh=sdapCqId8MwKQ8sWjri/Euz5CJB9VuNo/OYx7swb3tE=;
        b=THsq1EHwy1AeCzj+ucUwiNsiez9GIpPVg/MJnv4i4s4bkraxb2wOBmdIh0fLe/xzV8
         y0Dd0dcuhWkUENlDTRozVLGuUTy3WOIYDBh7wye7UMsOSvUBPq7kAr0dPAIs7NS08lYT
         FfpIaAZLM4KpxrMY2jr7WkiMCA8tzRrZ9/dS1/A/UfU7JR28+RKFbrL01eia1n/p0q0E
         /3RyP0qobeC7kVFXcPYGAAOq4l7ygFuxqzIwCqd+efd2VE1ijY/E/cFsWPJjetIKm0IG
         uyOoyIddDCL5YikGn7L55AcAZ9fnpiMPg2fWTHVQrhtbX1o5YTHrfGcQfuxYUs3iosuf
         EY9w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786343519; x=1786948319; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3SjLv82lPKci1T9o7jRU252gydE3KzV/t6uQyPNLwxs=;
        b=ChJ0lHdVZCMAgx+GeMzYotT+NmeFPeY4xMkfbo7YfSYtOGRfYr8Tr9NJD9SzPvdRXm
         tMUBV066w6UUxCp+CHSP/FpaqkGNdB3NBbo3H7rNoAvGw3x05CSymEAs9PEVUtZxtE+R
         1aNWHHg6Z7Fl2vIprhVjpN+7CzIjC+BgNhNZg8UP+xKxSg8DOmcxowzLXH9QWeX1j3mk
         f6xhQdkHrq18yTSnxyAE5jWlfMgiC49r9WLdAORAvKYm73heG/X8KbAVhc3x7OE0pVq4
         OH7EPdtrY/vb1nI3yFtM1e3hlidqyuNth1C9+2X+EtVo5uPcR8ZnX/eJbqKL7rvFOpHF
         NJDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786343519; x=1786948319;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3SjLv82lPKci1T9o7jRU252gydE3KzV/t6uQyPNLwxs=;
        b=suhoLccU0ygG4xxzCs6d89C3YpgrMa6YHwixOMWaEvM7ZG1Q0iIsHsRHI9eo3zaUzl
         +oA989idcqzHKZhgJgyGm4ww7YTBMoFW5Yb563rz1YI9Uy5j2N533QusxfRg8m9zlWNV
         zICqyDznYJkyrs2HNWEr6Lq27ZKfa9TZWd7VKNS9wyqLFiURhydMUXnjAuLJNwSodnbE
         NBBiiSl/7jrxt8m05VHDZuCWMBB1RvcbZTUgy0WEOvh1kXjr3F6Cq6499Zzgntb7JIEW
         uH64QtouJvpuuM2KoDgPavtU40TqzfRFccoPhDpjyH8V1XFie2UQcmXhW36ENzhCv4b9
         asdQ==
X-Forwarded-Encrypted: i=1; AHgh+RrM4m5naqoZcfp6/17/ypQadDV7Gle4+EXAY+7A8OW8GkGAnPCbSmUuzY8w5xW7M6GFGHDA5qaL/9Y4ICpiEKyHOw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzK59HbW3qv1zJXQEczQu1G4dgX6pI9xKJdjm3hLZRnbOlFJp0M
	vVHmA9LvjNlEctrrDrNKJwOm9BNMJxQFAb54XM6tnr3dh6O8NCPqFM76rr4AhvZt36b7a0R84yu
	c05mkpRCys0PCWbnsfg9ZjhKcvqAeXSc=
X-Gm-Gg: AR+sD12w9wEjueT4Nve7mkmr7aQCkZngorQpJ6YXG8knWeqFLnjMOflbCSS21DtjsNd
	bjFqNMHnTp87GYiHvVktHa+Y7jf/XYpPKiQzlonM3/D4vc8jBmTNivgNDQN0cEeS+YACudGJMuG
	hctsY8U8FIsbH18D1cAE2YN4BviuRyYBFTrY5jDcServZivVU0svf88FfBFAljIYtIN9axW3HMc
	04y/6P4608af481PSFiRAojeXG7CkJibvaTMULepZViiNTkc2BTJqG6iY7MJ4O2kNZlCth1qAtU
	VC+WjpPLZxaprCmKq7Ag6Q0ZURzRYeO0SJ7/HsvAVMXy0Z1RPorJr02H2A2shz3kAMv8x/KX+4n
	9NigUP7iTI7Bdxiu/LAIzix4IOzYwuDOUCCOwmJws4ahMwT4DqNoNskvBnFpUDLaTTNTx1PHIw9
	4=
X-Received: by 2002:a05:600c:a20b:b0:495:737a:7afe with SMTP id
 5b1f17b1804b1-4994e7d5b82mr387146075e9.15.1786343518782; Sun, 09 Aug 2026
 23:31:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727095843.116950-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260727095843.116950-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <d1a5c1c4-4a9f-4dc7-b709-4f89a25ad4c9@tuxon.dev>
In-Reply-To: <d1a5c1c4-4a9f-4dc7-b709-4f89a25ad4c9@tuxon.dev>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 10 Aug 2026 07:31:32 +0100
X-Gm-Features: AUfX_mynmOOcMxUkeHfpvOzO_beN0LAWdFmV1ZYmmpijFA_DJ37tQAh5BAIv5NA
Message-ID: <CA+V-a8ujEokYydnADu3uxLxb0StKpB3sjsKPZqv=m4YF6Za6pA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] PCI: rzg3s: Fix IRQ domain initialization error handling
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Claudiu,

Thank you for the review.

On Fri, Jul 31, 2026 at 5:02=E2=80=AFPM Claudiu Beznea <claudiu.beznea@tuxo=
n.dev> wrote:
>
> Hi, Prabhakar,
>
> On 7/27/26 12:58, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > rzg3s_pcie_init_irqdomain() installs chained handlers for the INTx
> > parent interrupts before creating the INTx irqdomain and initializing
> > MSI support.
> >
> > If any subsequent step fails, such as obtaining an INTx IRQ,
> > creating the irqdomain, or initializing MSI, the error path returns
> > without removing any chained handlers that were already installed.
> > This leaves stale handler and data pointers attached to the parent
> > interrupts.
> >
> > Fix the error path by unwinding the chained handler registration before
> > returning. Also clear the chained handlers during
> > rzg3s_pcie_teardown_irqdomain() so that teardown fully mirrors the
> > initialization sequence.
> >
> > Fixes: 7ef502fb35b28 ("PCI: Add Renesas RZ/G3S host controller driver")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v1->v2:
> > - Restricted the code to max 80 columns.
> > - Moved calling irq_domain_remove() under err_cleanup_intx label.
> > ---
> >   drivers/pci/controller/pcie-rzg3s-host.c | 49 +++++++++++++++++------=
-
> >   1 file changed, 36 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/con=
troller/pcie-rzg3s-host.c
> > index f51b5d7c1998..70f1faf7e422 100644
> > --- a/drivers/pci/controller/pcie-rzg3s-host.c
> > +++ b/drivers/pci/controller/pcie-rzg3s-host.c
> > @@ -1006,22 +1006,35 @@ static const struct irq_domain_ops rzg3s_pcie_i=
ntx_domain_ops =3D {
> >       .xlate =3D irq_domain_xlate_onetwocell,
> >   };
> >
> > +static void rzg3s_pcie_clear_intx_handlers(struct rzg3s_pcie_host *hos=
t,
> > +                                        int count)
> > +{
> > +     while (--count >=3D 0) {
> > +             irq_set_chained_handler_and_data(host->intx_irqs[count], =
NULL,
> > +                                              NULL);
> > +     }
> > +}
> > +
> >   static int rzg3s_pcie_init_irqdomain(struct rzg3s_pcie_host *host)
> >   {
> >       struct device *dev =3D host->dev;
> >       struct platform_device *pdev =3D to_platform_device(dev);
> > +     int i, ret;
> >
> > -     for (int i =3D 0; i < PCI_NUM_INTX; i++) {
> > +     for (i =3D 0; i < PCI_NUM_INTX; i++) {
> >               char irq_name[5] =3D {0};
> >               int irq;
> >
> >               scnprintf(irq_name, ARRAY_SIZE(irq_name), "int%c", 'a' + =
i);
> >
> >               irq =3D platform_get_irq_byname(pdev, irq_name);
> > -             if (irq < 0)
> > -                     return dev_err_probe(dev, irq,
> > -                                          "Failed to parse and map INT=
%c IRQ\n",
> > -                                          'A' + i);
> > +             if (irq < 0) {
> > +                     ret =3D irq;
> > +                     dev_err_probe(dev, ret,
> > +                                   "Failed to parse and map INT%c IRQ\=
n",
> > +                                   'A' + i);
> > +                     goto err_cleanup_intx;
> > +             }
> >
> >               host->intx_irqs[i] =3D irq;
> >               irq_set_chained_handler_and_data(irq,
> > @@ -1033,21 +1046,29 @@ static int rzg3s_pcie_init_irqdomain(struct rzg=
3s_pcie_host *host)
> >                                                    PCI_NUM_INTX,
> >                                                    &rzg3s_pcie_intx_dom=
ain_ops,
> >                                                    host);
> > -     if (!host->intx_domain)
> > -             return dev_err_probe(dev, -EINVAL,
> > -                                  "Failed to add irq domain for INTx I=
RQs\n");
> > +     if (!host->intx_domain) {
> > +             ret =3D -EINVAL;
> > +             dev_err_probe(dev, ret,
> > +                           "Failed to add irq domain for INTx IRQs\n")=
;
> > +             goto err_cleanup_intx;
> > +     }
> >       irq_domain_update_bus_token(host->intx_domain, DOMAIN_BUS_WIRED);
> >
> >       if (IS_ENABLED(CONFIG_PCI_MSI)) {
> > -             int ret =3D rzg3s_pcie_init_msi(host);
> > +             ret =3D rzg3s_pcie_init_msi(host);
> >
> > -             if (ret) {
> > -                     irq_domain_remove(host->intx_domain);
> > -                     return ret;
> > -             }
> > +             if (ret)
> > +                     goto err_cleanup_intx;
> >       }
> >
> >       return 0;
> > +
> > +err_cleanup_intx:
> > +     if (host->intx_domain)
> > +             irq_domain_remove(host->intx_domain);
> > +     rzg3s_pcie_clear_intx_handlers(host, i);
>
> If you have it like this it worth squashing these lines in the same funct=
ion, e.g.:
>
>         rzg3s_pcie_teardown_intx(host, i);
>
> defined something like:
Ok.

>
> void rzg3s_pcie_teardown_intx(struct rzg3s_pcie_host *host, int count)
> {
>         if (host->intx_domain)
>                 irq_domain_remove(host->intx_domain);
>
This needs to be done after the handler has been set to NULL as the
handler does use intx_domain (pointed by Sashiko).

>
>         while (--count >=3D 0) {
>                 irq_set_chained_handler_and_data(host->intx_irqs[count], =
NULL,
>                                                  NULL);
>         }
> }
>
> > +
> > +     return ret;
> >   }
> >
> >   static void rzg3s_pcie_teardown_irqdomain(struct rzg3s_pcie_host *hos=
t)
> > @@ -1055,6 +1076,8 @@ static void rzg3s_pcie_teardown_irqdomain(struct =
rzg3s_pcie_host *host)
> >       if (IS_ENABLED(CONFIG_PCI_MSI))
> >               rzg3s_pcie_teardown_msi(host);
> >
> > +     rzg3s_pcie_clear_intx_handlers(host, PCI_NUM_INTX);
> > +
> >       irq_domain_remove(host->intx_domain);
>
> And use the same function here, replacing:
>
> -       rzg3s_pcie_clear_intx_handlers(host, PCI_NUM_INTX);
> -
> -       irq_domain_remove(host->intx_domain);
> +       rzg3s_pcie_teardown_intx(host, PCI_NUM_INTX);
>
> Btw, the order b/w rzg3s_pcie_clear_intx_heandlers() and irq_domain_remov=
e() was
> revered here compared with the order from rzg3s_pcie_init_irqdomain().
I will do the below:

static void rzg3s_pcie_teardown_intx(struct rzg3s_pcie_host *host,
                     int count)
{
    while (--count >=3D 0) {
        irq_set_chained_handler_and_data(host->intx_irqs[count], NULL,
                         NULL);
    }

    if (host->intx_domain)
        irq_domain_remove(host->intx_domain);
}

Cheers,
Prabhakar
