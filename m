Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794838166;
	b=rop/cOC6d61k4syVetuz0vjw43F+XcBqIx/qDTr5364ZKpP3dv1EAiYGe3uNmsQr36sN
	 9+IxTx1BWTWdNCmwX0mkY6lcQuvrAyzSFsrXeJZZ9ufpwmByTBjLMTau22QfAcPrvKSD6
	 7tFVCj/+ox7A2WLGB6Q5dX1YkVS0vUNvTrsr/SJqWPUrplxlAw2hjffytCADtOdJx8Zio
	 h25niKa1tBSeXDCHZnuTuUgLw0Lt/og7cKHiha9zGlUsaZ1WnamIYm6A/YvzjClRjId3x
	 6dF18CI8PugkP/RHLqRR6SqPJnvva/nyUDz+vW6YuwBiCL+9LlfyRv2sJimdD6WTu3A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794838166;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=oAJHKsJwQHmkCNrAnto0w4Yt2QcPc3iiUtlr1glYIIM=;
	b=V18H3C5xsc7pknBk5cjItrABoXiQsnR0cdfQDXbFRMO2rxE34+xSFW7piykhROYb7JJ5
	 LzITjJ++MrTuQ0gdY0Ouj0yQ7CG64UBO5Ec6Y4k4QuI1WODkCYxr/7sv4iHCX7RwPCT2U
	 +izbN9Rd2ClovkY+HayDF50bYlUHRKKTSJuxyETREBaVCkF9AtpHrpQOdCtaGY1SiZPOi
	 21PM58KycERqZ4POusZ23OVmZu5DWr/JzoKp7GdsyPxb5z9cX8zLzT3g17YAIcdnXNjMT
	 gyEDPxdIKKcAwCEFQ52VJt/3AcLb8wUENIHQ3Sa2qTi3KzqKg2KpI+jhQLpRMIJ7ZMg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="W89p/PRS";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.177
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7004606A336
	for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Nov 2026 14:09:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7004606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W89p/PRS
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-55ade1de0b4so47411261cf.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Nov 2026 06:09:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794838165; cv=none;
        d=google.com; s=arc-20260327;
        b=EqFCB+ASN2abMq/02lcPldsCk5fC3e+WYGc4rXIYuASivAypDGsfQS2YAVCH1A0ADo
         pNLkVpa4I0y55IJtOLvklKyDvhV3teDg1pjQ53ShZwhi5Vq21hvDZpFcb+gqkvTQrOJL
         MzXlW9VZhC2DTLwngYvdCxt8OyuW7zGKUgOAmfNoXNzlyxfZEANmMYRFnIh/4eKTbAW+
         EZue2NAfa7eCvRENaYqQJXJuJQEC/3pyqz2aZzToMVsVcVQRht3CGBacJIzmbcL+vyrS
         hf2GgGsfz8uV11HsgukK7dhTC7nY1J/TYMB47pWOfQPxvtziS4TIda4tT0KbFcBtRsK0
         8loA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oAJHKsJwQHmkCNrAnto0w4Yt2QcPc3iiUtlr1glYIIM=;
        fh=vFx8vOcZKpY+jTg0U9mpKNWxtxJOB2CK7suxY3sai4k=;
        b=sUz61kjXzoOCjnxrcy5ypb3/UYByvj9+GGbIjm+FMSEQrQUelqZDlbn6Ug5Y31WwYA
         3hSNrZhYrRTTgxVYAipfzYrbiew9doWKexvtal7NqCC9S7mAhpmFEe15KWLLjFy0ICu2
         1nfH9GpXMEXnW1pDiBiZY2PPwcWv4GwOHh8FJNx0Y+GlbAaKLhXukgLlQgmheWrhm7fs
         M5BH4cz5n5AC8F0Uux+juvCd3B8Nvl2K4TC6o4LPITihXzjt5X7p+Nn81dSyOwKLgAg1
         QZEIes23YgsTIpzTtmApKO0Zvl95JfuvhD2hq+H/mwkELjox+O1yaU5+rg7m8OIdpp0+
         1rAg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794838165; x=1795442965; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oAJHKsJwQHmkCNrAnto0w4Yt2QcPc3iiUtlr1glYIIM=;
        b=W89p/PRSR0qg82Fxw3PBVoasH+tDDGQrrevzp556puHQYlBQCFrlfvsji+Wni7nPiZ
         zoaL3MKZKzelq9e5JmbQtc70npRJ043+luhv79e8QlEbPxQNniRzsoUBjclAcq/I6qFm
         jtYvpO1yc+MYmoQQ+QToiicdcRNd8+X8EV/LtelvWh1da0gTyYe4tt8WIEalSdHd8usz
         pSvVKvvmFLmGqu6hp4ubppR0sxVQPBo/x4elUBuH4Z3QDMY14yHeUN9X9ShqhnOTu9D0
         PQtT5pDM7DsX2vQ+0VXaR1lnrwBjmcEpOgq1EmEEkK1QTO+AZiq03B3ExYGMeRQkIcwj
         I85A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794838165; x=1795442965;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oAJHKsJwQHmkCNrAnto0w4Yt2QcPc3iiUtlr1glYIIM=;
        b=H2LtkeFdAsf7B4nDqivstMpFEHH3MqQKciDy+6bZXGC4ep0xIQlXo4Z52RC4v9C1U1
         Od3rm1rd1krhQb4jZY3B3jxYXaVQ3M7TKGeMBcMdZmn/4sFjWm6u0nw4okpaXA23EI2z
         7FqO8iBM7+ecZgSuBKpqhPHgQH88A7Lbfd1OVrle7xQ8zQ8mNHG2qrQEPe4AUsacsQFY
         S0U/pqbUQI2QwLublZmQgZnHYbogW1aTLFW/FnSYvUG0Eqw861hqrTh73hHJOWXorCau
         /7rLWfYMBN3N23Q0faKIK5qo2P+HX39hkbHl2XWY9Q3zTNICwUEsAKUqpbPGeABFvhpV
         WO4w==
X-Forwarded-Encrypted: i=1; AL+hErFmQfWvdDdIp3AnRqZgPK6nsOGBl8TS+q7jspLU41Euk0gCSwoDYefT2FMju29NJNNYIboAXA+HXZAnD3I+L5VSgg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/HpQtAr4FxNwqxMsLzXnjXC9Zxz5OKzW4tmdsC2S8Pj8/z4QCI
	HOER4rBYXqOhsL+GuZ0yZJDlNveMfmAnymX8dGp8L/2AIGPeewhZeQCpI2s4YLMSJwREh/oBsrG
	+rrkGvDQx3Q2DEIxqhoY/5UaA54lJnFY=
X-Gm-Gg: AYBFou0TGqCV8E+PS39erAE8PhP8T/ZwvZ+U23uOSuo9+tP4opqt6dlENlcdFQeR0Xx
	Jnvb8LWUhs/J5WDVcUJeZyFxnyrmSvn9KRRv4aDmrRgzh7oMUku4dxMBixSsDgA2aWMedx7g9B1
	8kMM6R69aOVzwvS8EUwjcTVTs0/XhVLd0pcJcgZrCjuTLm8pUVUvzf2ujsIkBP4SHF5KIQpjrGC
	UgV1dJsOKq/1mWf0WhsRLFtGNpL61WFwUOpKZ7hawYnKCibCzvtq06n4xUw/IM4QridsN6JO9e0
	xHd5vnLwHwQB1EjF95PZ/nsDYQ8wDajCM02/ndOs4FGNTQ9fTEaAqdG1xTGBUEJgP+ABrXFyts3
	N4gfjFV42XxqCjV7wCFwc20Krh8ahyOtBqa3kcwAAtHIwVjh4s1VgRQG8D6PFmTvc5SjHrzc=
X-Received: by 2002:a05:622a:514d:b0:55d:3350:d262 with SMTP id
 d75a77b69052e-55d3350d4eemr64503751cf.52.1794838164440; Mon, 16 Nov 2026
 06:09:24 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116-sdhi_hs400-v1-0-c5bedd312408@bp.renesas.com>
 <20261116-sdhi_hs400-v1-3-c5bedd312408@bp.renesas.com> <sashiko-outbox-217008@kernel.org>
In-Reply-To: <sashiko-outbox-217008@kernel.org>
From: Biju Das <biju.das.au@gmail.com>
Date: Mon, 16 Nov 2026 14:08:59 +0000
X-Gm-Features: AclHuK9ZvygS4VW44O8Tz7cTK4R7bVPaN0SY-46xoL5MqjI10i2BuLdn1oOZx-M
Message-ID: <CADT+UeBPa=C77QY55gHZ8jkMn174=hWH-Eip4ZCQB-MTWuJf3w@mail.gmail.com>
Subject: Re: [PATCH 3/3] mmc: renesas_sdhi: Add RZ/G3L HS400 support
To: sashiko-reviews@lists.linux.dev
Cc: wsa+renesas@sang-engineering.com, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 12:24=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [High] mmc: renesas_sdhi: broken clock and divider state in
>   mmc_hs400_to_hs200()
> --
>
> commit e37da0a9061ca81415249820ba8b669566811e04
> Author: Biju Das <biju.das.jz@bp.renesas.com>
>
> mmc: renesas_sdhi: Add RZ/G3L HS400 support
>
> This commit adds HS400 support for RZ/G3L by introducing the
> TMIO_MMC_HS400MODE2 flag, programming the RZG3L_SDHI_SCC_HS400MODE2
> register, and skipping the internal /2 divider and non-zero clock divider=
s
> when in HS400 timing.
>
> > diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/re=
nesas_sdhi_core.c
> > index 7dfcf7f970aae..f15f766b7666d 100644
> > --- a/drivers/mmc/host/renesas_sdhi_core.c
> > +++ b/drivers/mmc/host/renesas_sdhi_core.c
> > @@ -135,7 +135,8 @@ static unsigned int renesas_sdhi_clk_get_rate(struc=
t tmio_mmc_host *host,
> >  {
> >       unsigned int freq =3D clk_get_rate(clk);
> >
> > -     if (host->pdata->flags & TMIO_MMC_INTERNAL_DIVIDER)
> > +     if ((host->pdata->flags & TMIO_MMC_INTERNAL_DIVIDER) &&
> > +         host->mmc->ios.timing !=3D MMC_TIMING_MMC_HS400)
> >               freq /=3D 2;
> >
> >       return freq;
> > @@ -259,6 +260,14 @@ static void renesas_sdhi_set_clock(struct tmio_mmc=
_host *host,
> >                       clk &=3D ~SDHI_SD_CLK_CTL_DIV1;
> >       }
> >
> > +     /*
> > +      * RZ/G3L SoC HS400 mode has only 1 divider value.
> > +      * Other divider values are prohibited
> > +      */
> > +     if ((host->pdata->flags & TMIO_MMC_HS400MODE2) &&
> > +         host->mmc->ios.timing =3D=3D MMC_TIMING_MMC_HS400)
> > +             clk =3D 0;
> > +
> >       clock =3D clk & host->pdata->clk_div_mask;
> >       if (clock !=3D SDHI_SD_CLK_CTL_DIV1)
> >               host->mmc->actual_clock /=3D (1 << (ffs(clock) + 1));
>
> [Severity: High]
> Does checking host->mmc->ios.timing =3D=3D MMC_TIMING_MMC_HS400 here and =
in
> renesas_sdhi_clk_get_rate() break clock and divider programming during
> mmc_hs400_to_hs200()?
>
> When mmc_retune() calls mmc_hs400_to_hs200(), it first lowers the clock t=
o
> <=3D 52 MHz while ios.timing is still MMC_TIMING_MMC_HS400.  Because
> mmc_doing_tune() is true, renesas_sdhi_clk_update() does not lower the CP=
G
> clock, and forcing clk =3D 0 keeps CTL_SD_CARD_CLK_CTL at 0, so the bus
> clock stays at 200 MHz when CMD6 switches the card to High Speed timing.
>
> Conversely, mmc_hs400_to_hs200() then changes ios.timing through DDR52, H=
S
> and HS200 before calling prepare_hs400_tuning()
> (renesas_sdhi_reset_hs400_mode()).  During those intermediate steps, HS40=
0
> mode is still enabled in CTL_SDIF_MODE, SH_MOBILE_SDHI_SCC_TMPPORT2 and
> RZG3L_SDHI_SCC_HS400MODE2, but ios.timing is no longer
> MMC_TIMING_MMC_HS400, so renesas_sdhi_clk_get_rate() assumes the internal
> /2 divider is active and renesas_sdhi_set_clock() writes prohibited
> non-zero dividers to CTL_SD_CARD_CLK_CTL while hardware HS400 mode is
> still active.
>


Will integrate the below diff to fix the above issue.


 drivers/mmc/host/renesas_sdhi.h      |  2 ++
 drivers/mmc/host/renesas_sdhi_core.c | 33 ++++++++++++++++++++++++----
 2 files changed, 31 insertions(+), 4 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdh=
i.h
index 8ae2ec04bd1f..d14cfd873bb9 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -94,6 +94,8 @@ struct renesas_sdhi {
  const u8 *adjust_hs400_calib_table;
  bool needs_adjust_hs400;
  bool card_is_sdio;
+ bool hs400_active; /* HS400 enabled in hardware */
+ bool hs400_clk; /* divider bypassed for HS400 clock */

  /* Tuning values: 1 for success, 0 for failure */
  DECLARE_BITMAP(taps, BITS_PER_LONG);
diff --git a/drivers/mmc/host/renesas_sdhi_core.c
b/drivers/mmc/host/renesas_sdhi_core.c
index f15f766b7666..66da2d1e9370 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -133,10 +133,10 @@ static int renesas_sdhi_clk_enable(struct
tmio_mmc_host *host)
 static unsigned int renesas_sdhi_clk_get_rate(struct tmio_mmc_host *host,
       struct clk *clk)
 {
+ struct renesas_sdhi *priv =3D host_to_priv(host);
  unsigned int freq =3D clk_get_rate(clk);

- if ((host->pdata->flags & TMIO_MMC_INTERNAL_DIVIDER) &&
-    host->mmc->ios.timing !=3D MMC_TIMING_MMC_HS400)
+ if ((host->pdata->flags & TMIO_MMC_INTERNAL_DIVIDER) && !priv->hs400_clk)
  freq /=3D 2;

  return freq;
@@ -227,12 +227,33 @@ static void renesas_sdhi_sclken(struct
tmio_mmc_host *host, bool enable)
  }
 }

+static void renesas_sdhi_reset_hs400_mode(struct tmio_mmc_host *host,
+  struct renesas_sdhi *priv);
+
 static void renesas_sdhi_set_clock(struct tmio_mmc_host *host,
    unsigned int new_clock)
 {
+ struct renesas_sdhi *priv =3D host_to_priv(host);
  unsigned int clk_margin;
  u64 clk =3D 0, clock;

+ if (host->pdata->flags & TMIO_MMC_HS400MODE2) {
+ /*
+ * While HS400 is enabled in hardware only divider 0 is allowed.
+ * Leaving HS400 (e.g. mmc_hs400_to_hs200()) lowers the clock
+ * before the core calls prepare_hs400_tuning(), so disable
+ * HS400 here once a non-HS400 clock is requested.
+ */
+ if (priv->hs400_active && new_clock &&
+    new_clock <=3D MMC_HIGH_52_MAX_DTR)
+ renesas_sdhi_reset_hs400_mode(host, priv);
+
+ if (new_clock)
+ priv->hs400_clk =3D priv->hs400_active ||
+ (host->mmc->ios.timing =3D=3D MMC_TIMING_MMC_HS400 &&
+ new_clock > MMC_HIGH_52_MAX_DTR);
+ }
+
  renesas_sdhi_sclken(host, false);

  if (new_clock =3D=3D 0) {
@@ -264,8 +285,7 @@ static void renesas_sdhi_set_clock(struct
tmio_mmc_host *host,
  * RZ/G3L SoC HS400 mode has only 1 divider value.
  * Other divider values are prohibited
  */
- if ((host->pdata->flags & TMIO_MMC_HS400MODE2) &&
-    host->mmc->ios.timing =3D=3D MMC_TIMING_MMC_HS400)
+ if ((host->pdata->flags & TMIO_MMC_HS400MODE2) && priv->hs400_clk)
  clk =3D 0;

  clock =3D clk & host->pdata->clk_div_mask;
@@ -515,6 +535,8 @@ static void renesas_sdhi_hs400_complete(struct
mmc_host *mmc)
  sd_scc_write32(host, priv, RZG3L_SDHI_SCC_HS400MODE2,
        RZG3L_SDHI_SCC_HS400MODE2_HS400EN2);

+ priv->hs400_active =3D true;
+
  sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_DTCNTL,
        SH_MOBILE_SDHI_SCC_DTCNTL_TAPEN |
        sd_scc_read32(host, priv,
@@ -655,6 +677,9 @@ static void renesas_sdhi_reset_hs400_mode(struct
tmio_mmc_host *host,
  if (host->pdata->flags & TMIO_MMC_HS400MODE2)
  sd_scc_write32(host, priv, RZG3L_SDHI_SCC_HS400MODE2, 0x0);

+ priv->hs400_active =3D false;
+ priv->hs400_clk =3D false;
+
  if (sdhi_has_quirk(priv, hs400_calib_table) || sdhi_has_quirk(priv,
hs400_bad_taps))
  renesas_sdhi_adjust_hs400_mode_disable(host);

--=20
2.43.0

Cheers,
Biju
