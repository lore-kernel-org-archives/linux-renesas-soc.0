Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67214318BB5
	for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Aug 2026 08:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787216147; cv=pass; b=PFfgL65jc3q/jAIx3UD6fSTixENKbPHmDnhS1wJX2XQlZclRE14aojQL8UCN1IBSd0/NgQt7pWgYULEqW91+GY92klj7UYn+S8NMm+Em6388k1RUgSLsUFIaMR37q7DhQU/PACk7uhMj4vqw0gzQLQPThiqJvYu4ltVfOtZ9Y0g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787216147; c=relaxed/simple;
	bh=yq6qBaYEd8EWyUc0cX7E33WMuFA5Gh/NyidWLLeEDsI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XHUNoRj70y10GJHTGxb1GS0WqzGbvRqnXWwci3S4V2xMHHsVstAgd40WyuVYlrMlDfF18s1d3z7Kuf5T0wrcwNnIA4D+ZDu0fnFYNP4xaUH7trMgdA4wkS66ZMmyQRGecrKrItTYf9dEQDU/Dm/nyWB7nUKnRje8eeYuSBolYps=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O9DbdMSx; arc=pass smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O9DbdMSx"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47362928f65so1890203f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Aug 2026 01:55:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787216143; cv=none;
        d=google.com; s=arc-20260327;
        b=M+43I0kVeggJCLPAuLh2IwSbPXu0YsCGlmo9rfh6qUPs4dWOHAenzsogFYCRHJM/oP
         ed33N0TQSSddkvHgFE0YlCgx48alvj9UYCIgX2lUim6R2yjBRWS8J8kzdLiktdoc+Fz/
         qs89d93bwyNiVmntxUD27iI8E4aa1pvOSLuJaq11Hvp8cCK77K4XK+MNfucEmkYXojr8
         yK9pH0SoVgoBvjIs/0PJz1WI+IZHobjWaPV92d9WmB63Bh0JGlSA7b+9MzqcpgK0mup7
         QnLHPmZnAlfX1gq2I2B0BCAFXhgbqAwgbieIFKrULh8gRd5t4MRELura52LJZTkqowcZ
         6Zeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q4u+NdUMNPAkV97SlmJLYtbUzZRlFDkakz/9HAp+z3M=;
        fh=n+zw/AWzDQOoAz/bLnhHWCZuLKCKUJs52DNC/1Ds4HY=;
        b=XSa1++Gu+a6aSPTVakTNjX3hza0SgTNA0nJSkbAizsd9sTNjIUINYzdY787pWyoXYf
         32O6dxMozTnN28tv7+O7xBZpikHHukfz58R36SzKoIiunfk7bXowu81sAIQ+5vjNHv7W
         Jr3O6XKK7lOuYQtI9g6IwsE7Heav3sIl1p0bXTDJsM3lJzIPAxxqk0VXE5u2Lp/OfPQs
         LmC3YEbWAiKvyCdywlHvtXuF4tA4IznpRj+rRl0eTXov9miz2POY+a1FF3A3Sv5Yz0mX
         Yx6PQCuQCD8pR5C32msOK+D7SGNJzpPq36Mo3Z0mSBd08wLz7x+fE4E9bw4ezViFYlNW
         oTiA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787216143; x=1787820943; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q4u+NdUMNPAkV97SlmJLYtbUzZRlFDkakz/9HAp+z3M=;
        b=O9DbdMSxWwIsyL9H4+pXHVuf3+8Ue9IhODOEOq34AxJfMlCQunXb2QmbOR956XXEmy
         XFDOfHi019fDzX/zE1EINaUXw3nsD9zGNXQqxWevFdbTR5dFBx2u1hPishriMk7YK2jb
         fLRy7zsPjq34kP/ibu+X6Sn31+MoJEtoLjxBP90MNEs4IzEE6PPoerQQZUTRgI3IPT7H
         Bgg6bJEiZfUHJA9PaxJedpqJX8RihtqCas09tWarmGWmv7XYxQ1t0u4Itb2zi20aMngw
         Z/zekTnoeHA+Da3/gFPQZZTGzBCwIXTPP6JrJgq/ILS/xuJ6OXTgY3qwR1baxdM9EjS3
         Qf4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787216143; x=1787820943;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q4u+NdUMNPAkV97SlmJLYtbUzZRlFDkakz/9HAp+z3M=;
        b=h1rbd41YjuzSUOz6A2n0nMyQ5swnW62RN6n95w0sTieey+/Cu8RxvCqeHUOQVwduWt
         zwEWTXG7q894Cp88xiJtjvizAOKYL8pLiCpq2uvUSFIfWZvk9hAfhQDDQQ045eYdiigW
         Zy40gMisFrJgl/hZDSeBk1mDr/wezVQuTGeRwF3VrrAAuuSwSMKLudldkx555r+qOPtl
         iyi067AlM0uB+LiLXNB79GXihOjjrSaxxMb4enovx7KZb2DhRRKbV/WNw0s0WSVaSxOw
         tEOV/yVLNAk7ElPC5BlNUjjiLbm0GHeyvsSmhJHtkeGJo02yOrzjMLhvPfwy8B10Y8l5
         U2ZA==
X-Forwarded-Encrypted: i=1; AHgh+RrdRhesaot5ulW8cP0iPA+2YK1zumUj3OdLbGHmKpIKBPuYsL/taV5C11/8vc4idg4V699mruqrsz/o1k2ZmBNnCQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kow4ZMJ2RkU8YHUp/q3haevEsRL6RmZscdyWns+FsZ68OE5uFM
	aRA4Rl6mr/Z7pMQm/QrNtAHb8jGzbxY9eteOkWqQRRbIbiMCuOcDJyR3lKJ7mK0676s8uTQmWN8
	YGrvbRkIviItO5/WQYo5B9Jn2W2X6yMQ=
X-Gm-Gg: AR+sD11O/TTf13sZZ9IyNDsK618X+Mu1K8SEGJ56AkEng4bbKKZ7cYAQQv07Qvhg6gE
	dCnutzZZG4R462eikJy8x7F2qQxNaPN678dyuGQOZt6KgOH2qIGOypQlnxNSf8VCSJk7if0hjjA
	a9bQNClKMSQ44xJRlYM2CHZ9I32xgRkj1uZUi7m6F5ct9Pnb+vaUZ8lt4iXtRnc2OkOntN8ktNk
	Jo3QNtBK8tAQNRG/oSW3dsRdXbHYzk8lL2FJ1ZexBSD2ntkebHRXIHPav7g14BO2bA37eS/G0/p
	w7FRISsre+QcYCJYJTs2W5MhNu4B0U7x33zIIBk+TeBKX7hr2NRUglVtDz7CtkawiqB1lyOUuuR
	d+YSINu+t4VtBOhh90rRKApyeb3qC4vc=
X-Received: by 2002:a05:6000:2383:b0:47d:ee9d:90c8 with SMTP id
 ffacd0b85a97d-482b1e872e3mr17978958f8f.3.1787216143464; Thu, 20 Aug 2026
 01:55:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260819102812.2592880-1-tommaso.merciai.xr@bp.renesas.com>
 <20260819102812.2592880-6-tommaso.merciai.xr@bp.renesas.com> <aoW8O_p_DyG0P5p3@zed>
In-Reply-To: <aoW8O_p_DyG0P5p3@zed>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 20 Aug 2026 09:55:00 +0100
X-Gm-Features: AcwNN1U3WRaznNUlioKHrhx5tA4kU23Omg_nTO7h7nNJohBAgFWIGrpJrMB2n4Y
Message-ID: <CA+V-a8t-cVQdB5WEkvAmGpEriyttaprfjzd+BRaN+QX9Rt-YJQ@mail.gmail.com>
Subject: Re: [PATCH v6 5/5] media: rzg2l-cru: Replace has_stride with
 stride_align field
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, tomm.merciai@gmail.com, 
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, =?UTF-8?Q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Nas Chung <nas.chung@chipsnmedia.com>, 
	Isaac Scott <isaac.scott@ideasonboard.com>, Paul Cercueil <paul@crapouillou.net>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 19, 2026 at 3:24=E2=80=AFPM Jacopo Mondi
<jacopo.mondi@ideasonboard.com> wrote:
>
> Hi Tommaso,
>    thanks for the update
>
> On Wed, Aug 19, 2026 at 12:28:09PM +0200, Tommaso Merciai wrote:
> > RZG2L_CRU_STRIDE_ALIGN hardcodes an alignment only RZ/G3E and RZ/V2H
> > need, as only they have an AMnIS register.
> >
> > Store the alignment into rzg2l_cru_info instead: 128 on RZ/G3E, 1 on
> > RZ/G2L, and update the code accordingly.
> >
> > No functional change intended.
> >
> > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > ---
> > v5->v6:
> >  - New patch.
> >
> >  drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c  | 3 ++-
> >  drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h   | 2 +-
> >  drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 7 +++----
> >  3 files changed, 6 insertions(+), 6 deletions(-)
> >

Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

> > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/dr=
ivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> > index 3c5fbd857371..a2b833e2bf9a 100644
> > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> > @@ -361,7 +361,7 @@ static const struct rzg2l_cru_info rzg3e_cru_info =
=3D {
> >       .max_width =3D 4095,
> >       .max_height =3D 4095,
> >       .image_conv =3D ICnIPMC_C0,
> > -     .has_stride =3D true,
> > +     .stride_align =3D 128,
>
> We could use a #define here
>
I think to be consistent with most of the members of rzg3e_cru_info
raw value should be OK?

Cheers,
Prabhakar

> Apart from that, the patch looks good, thank you!
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>
> >       .regs =3D rzg3e_cru_regs,
> >       .irq_handler =3D rzg3e_cru_irq,
> >       .enable_interrupts =3D rzg3e_cru_enable_interrupts,
> > @@ -406,6 +406,7 @@ static const struct rzg2l_cru_info rzg2l_cru_info =
=3D {
> >       .max_width =3D 2800,
> >       .max_height =3D 4095,
> >       .image_conv =3D ICnMC,
> > +     .stride_align =3D 1,
> >       .regs =3D rzg2l_cru_regs,
> >       .irq_handler =3D rzg2l_cru_irq,
> >       .enable_interrupts =3D rzg2l_cru_enable_interrupts,
> > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/dri=
vers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> > index b426bc7898bf..2c192d370dcb 100644
> > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> > @@ -75,7 +75,7 @@ struct rzg2l_cru_info {
> >       unsigned int max_height;
> >       u16 image_conv;
> >       const u16 *regs;
> > -     bool has_stride;
> > +     u8 stride_align;
> >       irqreturn_t (*irq_handler)(int irq, void *data);
> >       void (*enable_interrupts)(struct rzg2l_cru_dev *cru);
> >       void (*disable_interrupts)(struct rzg2l_cru_dev *cru);
> > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/d=
rivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > index 27a35ef2a6df..a7b6dce66570 100644
> > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > @@ -32,7 +32,6 @@
> >  #define RZG2L_CRU_DEFAULT_COLORSPACE V4L2_COLORSPACE_SRGB
> >
> >  #define RZG2L_CRU_STRIDE_MAX         32640
> > -#define RZG2L_CRU_STRIDE_ALIGN               128
> >
> >  struct rzg2l_cru_buffer {
> >       struct vb2_v4l2_buffer vb;
> > @@ -277,11 +276,11 @@ static void rzg2l_cru_initialize_axi(struct rzg2l=
_cru_dev *cru)
> >               rzg2l_cru_fill_hw_slot(cru, cru->num_buf - 1);
> >       }
> >
> > -     if (info->has_stride) {
> > +     if (info->stride_align > 1) {
> >               u32 stride =3D cru->format.bytesperline;
> >               u32 amnis;
> >
> > -             stride /=3D RZG2L_CRU_STRIDE_ALIGN;
> > +             stride /=3D info->stride_align;
> >               amnis =3D rzg2l_cru_read(cru, AMnIS) & ~AMnIS_IS_MASK;
> >               rzg2l_cru_write(cru, AMnIS, amnis | AMnIS_IS(stride));
> >       }
> > @@ -850,7 +849,7 @@ static void rzg2l_cru_format_align(struct rzg2l_cru=
_dev *cru,
> >                             &pix->height, 240, info->max_height, 2, 0);
> >
> >       v4l2_fill_pixfmt_aligned(pix, pix->pixelformat, pix->width, pix->=
height,
> > -                              info->has_stride ? RZG2L_CRU_STRIDE_ALIG=
N : 1);
> > +                              info->stride_align);
> >
> >       dev_dbg(cru->dev, "Format %ux%u bpl: %u size: %u\n",
> >               pix->width, pix->height, pix->bytesperline, pix->sizeimag=
e);
> > --
> > 2.54.0
> >
>
