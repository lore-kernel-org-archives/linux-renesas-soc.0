Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794919822;
	b=WHPX2s2lLQ09bGzw+VCU2uxFbVEwxETutwO0UxSGMpAcTgQ+6luObJJ+Qf17qLNvveCp
	 VMDCCL3Tb5hm9AaQn+RZrXF1Pp6YPaxGsXaV2UdtmFUK+scWRoIY9ch38zZzH3TE6/nXh
	 T81i1+qvJUl031Sc8+fYVXx0AUDNTvpHlg1yAUkJtwP/lM9GGpEDY7YfBEJmTUTWZoM73
	 cPGeY1K8CNcMRIDr/Mg1YvR+btiIXodFRZBb5kue5d2RZTCGpS4L7LyJbkEaoizuz2tp5
	 qwG51FQnj/2ssmheGWp3YrNcXZZt7YRyy+Ip0A1fAds0utD8ELPSVoG4qPNleLIqy3Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919822;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=alp2wdj0ciuINrldi+v2R8ftFh9goTMatxYZrDAB0WY=;
	b=qNeJ0zYyag9wKI+xVn8KFG3aDgDjQOgZkArQEPjzQzRkJi/+KAlyFGdxS7x5bG7zDTta
	 8fcnoMlgTOkfnJDLdQTHWHW2y0uLAkGuv07+ZH/1suv8j3MIDUtGse4pdaDMSfU+1Tq8e
	 lmB+GhkrWPqXEm/5fUGlN6Z7wdKWdWsq0AtmTj3hI9yGVkWBrAf1/ILRS/vovX1xmx0iP
	 CVP8hAmHeoDU7agpWjLvsJkydjpkLDTicTkB0T4h0+ZAvJFWPlxf8WR9Q9gRL6ArGd15Q
	 46ooJd4leRmfaAIfnOYk6sJOV8CCg3MKukjIDsUq921xvfCAx7ADtUnPI0Z+vo2S9gA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SHzuP6NU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.179
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1FF0606A880
	for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Nov 2026 12:50:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1FF0606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SHzuP6NU
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-949589c1495so381844285a.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Nov 2026 04:50:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794919821; cv=none;
        d=google.com; s=arc-20260327;
        b=qfnCsXC/sKgx1i0rdDpgUQmCCmef/s3P1gphh0hRl9NFZArGQDMq2JhnIB4bPGN1A9
         SZ6LVlX+YZUoshFQWECEejf9OQHLdsFOcjA2ggDInKR3YUBLbSPUcwKKSN9Ny/Y3Bcf6
         qr/9dSjyroFAf1zc8H8EfhOnza233XrabFkT1p+gKABrLGuMj4hP8yTWwIK6lBPRqANc
         0/A4U61SDXun/Dj5ezeLH3bo74KWPrhTYrsjBfoXLNSMH1FmGJcCndWhJNCUsSDYdYnw
         E2B5L2vlA75gTs/pfh5tKbjlb174Su4UZWPTzl2WOj/ZiJSiwo3rrinaw0w+bVPwsC8K
         HuzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=alp2wdj0ciuINrldi+v2R8ftFh9goTMatxYZrDAB0WY=;
        fh=f4zl1X9t+9BYd9CrqA8P6deAVrpPecQEIYNxF8mdV7s=;
        b=RZaSCGWQSU87zQ48gssX6zIQD9cjAylhZ1uH7jKWqXP4NknKaLtI5srsiJXq4ch2Ud
         tYILiEsZIsdYBMV+69C6Letrho0lBk+COsf7UijI2tpNEtU7mO8NvEd2ka8MONQlpAKF
         57pBuuPDcOUEEkZp6tlyrT4CbPvfEqZ8bQut9pWl8+P9xBeLwJsq+ASumFy0yYa4432y
         FuXqRmqZZLDvQGsDySE1pzwgEmq0NlsiyHlh9ddPUMGPBD8of6/TTk2TIP84YjRUsCuX
         5c3zS5mIv33EJmpPn2azpl8OS/YgcsCvHWv39Z2Zbf5ac5pbnsVdgZgojdRzuTnaL1Nf
         tr0g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794919821; x=1795524621; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=alp2wdj0ciuINrldi+v2R8ftFh9goTMatxYZrDAB0WY=;
        b=SHzuP6NUJr2wgsIO/xPddg5deOwy8E1pxOQNA2w5keWeie33/B5VSVHjAGTUj2wp0l
         kuQlEJTrdkueD6of8Sz99+zW0rc+zGkFeR90UooN4l0rIl6fc0/DXdYoJnKbqbuFYiZW
         fJSRWtog23+z/Chav9Fs9rlV4CGl6HDj82TAIgcGTrSWEKwa/c2bpFBZzISq4v9204WO
         mBLvH5I/pJzXi5aIXJ3duh6T6zsMa6SHOC0vraG9ZiHo0lzHDC6l0kD4w9CMVBq+BC7S
         cSB5iq39G/RSrugxsCPn5kscSCVXu9w/Siy87pPXUn9Zh2kxr9bwMDD/PHIoCi9/hv8b
         VavQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919821; x=1795524621;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=alp2wdj0ciuINrldi+v2R8ftFh9goTMatxYZrDAB0WY=;
        b=gszeCf7bBsHQt+gFvju/tXm+hD1LRUN1tsWGB/UR7T/30/zVTwdND0vgcY7bieNM5U
         5j6bVkDikYRmSOMRQPDysWUdc/AeUVjVrPRrpqyK9nYxWDG8wwoynCIUtSus5eyhJdAd
         39t6Y1r2zD/tKT8tzLDqa7w86yx2m7ZWtJwvX7T/5ydgKNYS/toHh2WzE2uVc6YFfvKy
         Xzbjc7T9/zzx8M1vIjXRzlrqzYgDH+R91nj4D4cMtlfvrVvJY/P8fhm/b19zWhldTUv1
         5zfSWWdJDbGsNBuR2tL/maB8C9CrI+MxzxUtTMF9cgMQ8dW3dVciDAWrPpxreJCCt+fP
         3PDw==
X-Forwarded-Encrypted: i=1; AL+hErHLccBIkX1BlAYaSDDar3MpcPMPnPzB8ErI7EmE1dQj1wZhORmLfHf5lcMWKWp9LxvDOH50hCgL/YSL9METqR6x8g==@vger.kernel.org
X-Gm-Message-State: APuU4Z9t8+ahjHYFvKPfBJH1BEzIPNX7U4Kb/4VMgxnk99VN+wmYMpFB
	lUNAYrQJ/1qZTdsSx4BhwwBp+Ono97thKH8Ge0I3eetZHxCG4Rg78KATVaqomFifUqYbPKxwCSE
	8kk2gX/99Ea6gsMwZoE8n04IbfojM/dy2Rg==
X-Gm-Gg: AYBFou0+C/uBXT2UUUHInwiV8CNbmx4eZyMT/CA6dm3JSKfRVVzqAtHXz5RBZ7wFSNb
	EAgQNm0MiVwbgVYnbaSqHQ9wZ9kpt8rvuhsFUxlUEcYCDobYHgxabkyiky/yPCTFrTe3xthGdZt
	aY9MUIQ2VygJVejqJ/zChtZEYeapo8g5bh++apKjASa9lwYajklXnVwStWgvgixiol5usO43OdM
	ptE24rtEADXltHft4IUumcPRiJ/FOidPgmhJiMTmhYTAW5j7QocAChEqG9zE+M9W7h17CPs8kEY
	/U1B/09dNb8ZsJ2rzAgTlZgQzKMryjmCxfgWRiLoHt5GBzieTGUpRT8hHdJylmk2+Z21tfEcH+6
	lxBLV5PrOZXGqhxNcf06U/+cLqBhPUuq7fonCD4HjzKIu6B+CdryU9KSDX+7qVHhuxZJ/xg==
X-Received: by 2002:a05:620a:2b46:b0:949:6898:2e4b with SMTP id
 af79cd13be357-94968982e92mr1377520185a.66.1794919820609; Tue, 17 Nov 2026
 04:50:20 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116-sdhi_hs400-v2-0-de41f7a7f330@bp.renesas.com>
 <20261116-sdhi_hs400-v2-3-de41f7a7f330@bp.renesas.com> <sashiko-outbox-217555@kernel.org>
In-Reply-To: <sashiko-outbox-217555@kernel.org>
From: Biju Das <biju.das.au@gmail.com>
Date: Tue, 17 Nov 2026 12:50:08 +0000
X-Gm-Features: AclHuK-JNOMvr1H6WVjiviK4fa2hA1fYql31E_0MLnDzOYs0jMAbidAzy2CCdtY
Message-ID: <CADT+UeBDnDrgz=AqH08JqbgdGQ+ogzZPhozghSotao_d_Sqmqg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] mmc: renesas_sdhi: Add RZ/G3L HS400 support
To: sashiko-reviews@lists.linux.dev, linux-renesas-soc@vger.kernel.org
Cc: wsa+renesas@sang-engineering.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 7:22=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 3 potential
> issues to consider:
> - [Medium] mmc: renesas_sdhi: hs400 state not cleared in
>   renesas_sdhi_reset()
> - [Medium] mmc: renesas_sdhi: transient SCLKEN enable in
>   renesas_sdhi_set_clock()
> - [Medium] mmc: renesas_sdhi: ios.timing check in
>   renesas_sdhi_set_clock() halves clock
> --
>
> commit f53353ca4ff89c05b540eaa85ee6f33b90c060d3
> Author: Biju Das <biju.das.jz@bp.renesas.com>
>
> mmc: renesas_sdhi: Add RZ/G3L HS400 support
>
> This commit adds HS400 mode support for RZ/G3L by introducing the
> TMIO_MMC_HS400MODE2 flag, programming the SDm_SCC_HS400MODE2 register, an=
d
> handling the RZ/G3L HS400 internal divider bypass and divider 0
> restriction.
>
> > diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/re=
nesas_sdhi_core.c
> > index 7dfcf7f970aae..66da2d1e93708 100644
> > --- a/drivers/mmc/host/renesas_sdhi_core.c
> > +++ b/drivers/mmc/host/renesas_sdhi_core.c
> [ ... ]
> > @@ -226,12 +227,33 @@ static void renesas_sdhi_sclken(struct tmio_mmc_h=
ost *host, bool enable)
> >       }
> >  }
> >
> > +static void renesas_sdhi_reset_hs400_mode(struct tmio_mmc_host *host,
> > +                                       struct renesas_sdhi *priv);
> > +
> >  static void renesas_sdhi_set_clock(struct tmio_mmc_host *host,
> >                                  unsigned int new_clock)
> >  {
> > +     struct renesas_sdhi *priv =3D host_to_priv(host);
> >       unsigned int clk_margin;
> >       u64 clk =3D 0, clock;
> >
> > +     if (host->pdata->flags & TMIO_MMC_HS400MODE2) {
> > +             /*
> > +              * While HS400 is enabled in hardware only divider 0 is a=
llowed.
> > +              * Leaving HS400 (e.g. mmc_hs400_to_hs200()) lowers the c=
lock
> > +              * before the core calls prepare_hs400_tuning(), so disab=
le
> > +              * HS400 here once a non-HS400 clock is requested.
> > +              */
> > +             if (priv->hs400_active && new_clock &&
> > +                 new_clock <=3D MMC_HIGH_52_MAX_DTR)
> > +                     renesas_sdhi_reset_hs400_mode(host, priv);
> > +
> > +             if (new_clock)
> > +                     priv->hs400_clk =3D priv->hs400_active ||
> > +                             (host->mmc->ios.timing =3D=3D MMC_TIMING_=
MMC_HS400 &&
> > +                              new_clock > MMC_HIGH_52_MAX_DTR);
> > +     }
> > +
> >       renesas_sdhi_sclken(host, false);
>
> [Severity: Medium]
> Does calling renesas_sdhi_reset_hs400_mode() here transiently re-enable
> CLK_CTL_SCLKEN before the new clock rate and divider are programmed?
>
> renesas_sdhi_reset_hs400_mode() clears the HS400 mode bits (re-engaging t=
he
> internal /2 divider while priv->clk is still 400 MHz and CTL_SD_CARD_CLK_=
CTL
> still holds divider 0) and ends with renesas_sdhi_sclken(host, true), rig=
ht
> before renesas_sdhi_set_clock() calls renesas_sdhi_sclken(host, false) to
> stop the clock again.
>
> > @@ -259,6 +281,13 @@ static void renesas_sdhi_set_clock(struct tmio_mmc=
_host *host,
> >                       clk &=3D ~SDHI_SD_CLK_CTL_DIV1;
> >       }
> >
> > +     /*
> > +      * RZ/G3L SoC HS400 mode has only 1 divider value.
> > +      * Other divider values are prohibited
> > +      */
> > +     if ((host->pdata->flags & TMIO_MMC_HS400MODE2) && priv->hs400_clk=
)
> > +             clk =3D 0;
>
> [Severity: Medium]
> When host->mmc->ios.timing is MMC_TIMING_MMC_HS400 and new_clock <=3D 52 =
MHz
> (such as in mmc_select_hs400() before mmc_set_bus_speed() or in
> mmc_hs400_to_hs200()), does the SDHI_SD_CLK_CTL_DIV1 check just above
> halve the bus clock to 25 MHz?
>
> drivers/mmc/host/renesas_sdhi_core.c:renesas_sdhi_set_clock() {
>     ...
>         /* 1/1 clock is option */
>         if ((host->pdata->flags & TMIO_MMC_CLK_ACTUAL) && ((clk >> 22) & =
0x1)) {
>                 if (!(host->mmc->ios.timing =3D=3D MMC_TIMING_MMC_HS400))
>                         clk |=3D SDHI_SD_CLK_CTL_DIV1;
>                 else
>                         clk &=3D ~SDHI_SD_CLK_CTL_DIV1;
>         }
>     ...
> }
>
> At 52 MHz, priv->hs400_clk is false, so renesas_sdhi_clk_get_rate()
> already divides the 100 MHz core clock by 2 to 50 MHz for the internal
> divider, and the divider loop selects the 1/1 divider (clk =3D BIT(22)).
> Because the check above still tests ios.timing =3D=3D MMC_TIMING_MMC_HS40=
0, it
> clears SDHI_SD_CLK_CTL_DIV1 and programs divider 0 (1/2), dividing the
> 50 MHz clock a second time to 25 MHz.
>
> [ ... ]
>
> > @@ -623,6 +674,12 @@ static void renesas_sdhi_reset_hs400_mode(struct t=
mio_mmc_host *host,
> >                        host->pdata->osel_tmpout) &
> >                       sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_TMPP=
ORT2));
> >
> > +     if (host->pdata->flags & TMIO_MMC_HS400MODE2)
> > +             sd_scc_write32(host, priv, RZG3L_SDHI_SCC_HS400MODE2, 0x0=
);
> > +
> > +     priv->hs400_active =3D false;
> > +     priv->hs400_clk =3D false;
> > +
> >       if (sdhi_has_quirk(priv, hs400_calib_table) || sdhi_has_quirk(pri=
v, hs400_bad_taps))
> >               renesas_sdhi_adjust_hs400_mode_disable(host);
> >
>
> [Severity: Medium]
> Should renesas_sdhi_reset() also clear priv->hs400_active and
> priv->hs400_clk when resetting via priv->rstc?
>
> drivers/mmc/host/renesas_sdhi_core.c:renesas_sdhi_reset() {
>     ...
>         if (!preserve) {
>                 if (priv->rstc) {
>                         ...
>                         reset_control_reset(priv->rstc);
>                         ...
>                         priv->needs_adjust_hs400 =3D false;
>                         renesas_sdhi_set_clock(host, host->clk_cache);
>     ...
>                 } else if (priv->scc_ctl) {
>                         renesas_sdhi_scc_reset(host, priv);
>                 }
>         }
> }
>
> On RZ/G3L, priv->rstc is populated, so renesas_sdhi_reset(host, false)
> resets the hardware out of HS400 mode without calling
> renesas_sdhi_scc_reset() -> renesas_sdhi_reset_hs400_mode().  When called
> during runtime resume or MMC_POWER_OFF (while host->clk_cache is still
> 200 MHz), priv->hs400_active remains true, causing renesas_sdhi_set_clock=
()
> to omit the internal /2 divider in renesas_sdhi_clk_get_rate() and progra=
m
> the HS400 divider while HS400 is disabled in hardware.

Ok will fix these issues in next version

Cheers,
Biju
