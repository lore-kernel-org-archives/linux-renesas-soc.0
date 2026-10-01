Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F031443C20
	for <linux-renesas-soc@vger.kernel.org>; Thu,  1 Oct 2026 08:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790843395; cv=pass; b=IRkxt+14/LTf3dWH5OYiA34Lu0xE7w2URsrLxXHkojKhn4aZ3D2GNDzfbIlyKrtDA4C8VQd7jMu8knQXVd++erZ1NcJciXdfCB1r4FukYLcGoi7/v/NKDQO6KrnsJkuneOZblceir9pY+gGprjpqnuEhjo9AUErZ/ydfdt9LPKo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790843395; c=relaxed/simple;
	bh=PwiJW/mknYG0ic3ENBo9sMH0ccET9ToWoZjPUMCumBU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iVb5ryx3ttFGWWsmVwdWwO1s+aZPJy1yEhKpTzmCJhq7M13Gv1Qq3ckgD3o5TQRrchiko82ya1tMIHQro/wSMN8ZieE9wktOK1/PrCcGdf9KbPoTa/5mccbOy06YLSVBXFx2McGn/UPNCjxHJg3YmDPLH/dvakAmZUVOpF3YvaI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=afZM7Q2k; arc=pass smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="afZM7Q2k"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6c0fce17so34008255e9.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 01 Oct 2026 01:29:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790843387; cv=none;
        d=google.com; s=arc-20260327;
        b=BuDsbs9pVzUP7sDLfxgNArF1ntEDMV35gV/tCrFAhubSyoMhH7FLcZ7kSV9npp+UMt
         hal52mG0HmntuWluAY1xJRgBu+QcCzvLlt5aAAUScX8xPflmBLWOp5UoMVLSUccequ/D
         nCoS8QJ7LZIpgSdr1NmM14oY9OQE+udVZOYjjcDlivdL3umGvPwWYJ0w6BHnfNv8MPfM
         bJ4w0Ftuezgus7gwctuTvGlltwJw2D5vPXM6zA/OdhgUkE4M/TJ42P6BreaBGrZWCpBC
         R/iLCRG3EKOfpLhf8TU/N8HfbV6nFd5WBpzLpqNzjaID8A1U0XjK1tqGCqzmOGysq4CX
         xiTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KdOx0gTEKpUZsHoYWW+nnd+IvZKeex/gkJLuhvb4cno=;
        fh=jdGBs+BEoDJb7shFE4+wLT/v6lVk2kGWl+ZVWn132jQ=;
        b=LHHg2WFMkkwuTkrwe/8FLvZxMhuYY6K3G7iHpmfHwmAfsZxacEda9XjwJKDmSUg9X8
         OX8/PR7H+kPzn4UcL/65rx8GJrpZc7uDz03Vgs9Hce9Y9+0x2Sf1NBIrN8ugRrcB9gWO
         /giAhiOvbarQRZfcndSe0ZgA6cJutIjJcPwuEWhwrKLhHQah5SQN9DNKnVLuqBD/7Rw4
         GAFWcOXEJi1vW7U+EhoZMM3a2z3j8qIIdlc7s/yJ022773m3kMs4aF2Brq9E+St9xbtw
         rF4YvBFU26opcTXRs7ahJzf+zjEquvJ4Q+J0eqLKr1i6y18J/9UxfSp2JuPBBEuDeauW
         k/fg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790843387; x=1791448187; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KdOx0gTEKpUZsHoYWW+nnd+IvZKeex/gkJLuhvb4cno=;
        b=afZM7Q2kQFs/le+qlP0tIYfs1NVRH/ZszIJFFdmjd3Tx1Q27Yt+tsTF/gVmyulOljD
         PPzaG3f2iqzWI9uRJEU12U6DWuVoDp5JgEjiUNrrZGyeMNys1J4UzIbVMlsKqfg24DXl
         c6RvuFy9zswUKgQtTotgXk9c9PK/2EhDXp9HOF7vzaKM9VXz71c8lhhApuYwwc5GypU+
         l/ORj+ulyjMOQ+0g/1Qua8HpHX0yO8bPnVG2OvzKStXDDP6zVyvkpskWl5cMnJbKlAqo
         0OiEdhG9eCDMWX3Qn2Xhfbca5U25TChpdLB/7C/3Epw+UdRBkRwr1Oc0DSJ8u4Ii0uml
         so0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790843387; x=1791448187;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KdOx0gTEKpUZsHoYWW+nnd+IvZKeex/gkJLuhvb4cno=;
        b=AK1Ehxp8jWjkKzdFOxj8wd3P2/oFJvrq/pmLXp4IsqLKI+46YFh9oaCipzbVc8qWpA
         DZQjPHdO6Jo71FMr7M5VrOZbff/UqIhR1tM7ocribNFS27TrH5BSj+QdyoQeGkXyaWLt
         u0gith7x0uiIXkyGSTvUO+L/3rQ/cQnFit0TBPy+VfreS5xvN5cCX2/m1VJpNCuwVC6l
         86H49SzKqK875bATF00vjV/1ii8yxoHqTTMVpo9DGTthc1dfaMufhYQ0A7yZcP+ijpg7
         fMm9VhQhjG44WmIM0x0p2B40ZFK1agJIRy2B6j+ATmjWUd3KHkz1CfJihT4IgH2VpE5b
         aUUQ==
X-Forwarded-Encrypted: i=1; AKwUvBxdPHqpNSSC2hcpepvS+4cGNSkfKb0kfoCqdo4aNTj4si3nm7QRopbGB4DT0uGODJhAxlKg+CaqJI9Cb3nDost8Yw==@vger.kernel.org
X-Gm-Message-State: AFuF++mpxGv6NaEMMnQiNSd6ft1FETbbNWkoDvN3drocwbmNSiBIgao2
	rEl2XX47lPX3AH0deEUrBPz4JWsTvaMykHwG2UyaxVBuGkszYwtY4QuhuAISv+nZTNyRi/QYbYt
	RwV8l0YpzUlqpKQh9Qwwb1HSdzc7dNX8=
X-Gm-Gg: AYBFou0h/upD0pPLl5Ihaa11i6nTbMC7WI029L8HYsGY+uVlTEr8Gr5bveUll8bvqbC
	Z2K0ETGGPOdIs08wI2aCp6XJazuQFHD1KdcRUhhi5eWsR37aw9L+m9t5QgiIUPrBg+4bwV4xTYe
	AtkHe8MCOzh8VzGEohMIJEITI+WWq7e2mD/ewMh5iXwHR5eHKcbumzsywiEQWtLdNieozn/oGmD
	uyTKCpq0axRdDu7r1BGNldp1YvaZeL90Ij/zNDH6NfNiXTuQevRDwAxUq1PrMoWzaGsdoCPIO0x
	P9FcPNwI81yx6TuNNkvUkKgRrwtAAUEkO5E0UXhCyDPw+7ojkns5ob9LsXr47yiYF6VWifXKfQi
	c2BbS6VIyaoYS7OD6cKah9wPXnwozgV+hWSKYtPYujA==
X-Received: by 2002:a05:600c:4fd5:b0:49f:fed0:fc47 with SMTP id
 5b1f17b1804b1-4a01ad90a51mr66571105e9.1.1790843386944; Thu, 01 Oct 2026
 01:29:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930133257.23210-1-biju.das.jz@bp.renesas.com>
 <20260930133257.23210-5-biju.das.jz@bp.renesas.com> <CA+V-a8tQZONUkeZYFBTvO+L+FTnrq6AE_aJQsm7MFX9CBnA-8w@mail.gmail.com>
 <TY3PR01MB1134680E91884A191791DEC4D868A2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB1134680E91884A191791DEC4D868A2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 1 Oct 2026 09:29:20 +0100
X-Gm-Features: AclHuK8vK2trvJG7pwZyhY7YNxMxLrfAscaVvEO95lXZ7MjfGAVxGE8Vb69_9TE
Message-ID: <CA+V-a8u4E8XSSXH73YEUmGJ0GCBKjmZJtBS0bHJQangU_-Wkxg@mail.gmail.com>
Subject: Re: [PATCH v4 4/9] drm: renesas: rzg2l_mipi_dsi: Add support for DSI PWRRDY
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "biju.das.au" <biju.das.au@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, "magnus.damm" <magnus.damm@gmail.com>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Thu, Oct 1, 2026 at 9:15=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.com=
> wrote:
>
> Hi Prabhakar,
>
> Thanks for the feedback.
>
> > -----Original Message-----
> > From: Lad, Prabhakar <prabhakar.csengg@gmail.com>
> > Sent: 01 October 2026 09:07
> > Subject: Re: [PATCH v4 4/9] drm: renesas: rzg2l_mipi_dsi: Add support f=
or DSI PWRRDY
> >
> > Hi Biju,
> >
> > Thank you for the patch.
> >
> > On Wed, Sep 30, 2026 at 3:47=E2=80=AFPM Biju <biju.das.au@gmail.com> wr=
ote:
> > >
> > > From: Biju Das <biju.das.jz@bp.renesas.com>
> > >
> > > The register for controlling power to the DSI region is in the SYSC
> > > (System Controller) block. Add support for controlling the DSI PWRRDY
> > > signal so the driver can efficiently manage power to the DSI region.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > ---
> > > v3->v4:
> > >  * Dropped pwrrdy variable from struct rzg2l_mipi_dsi_hw_info and ins=
tead
> > >    using feature flag RZ_MIPI_DSI_FEATURE_PWRRDY
> > >  * Dropped rzg2l_mipi_dsi_pwrrdy_off() as it is taken care by
> > >    devm_pwrseq_get().
> > > v2->v3:
> > >  * Updated powerseq API names.
> > > v1->v2:
> > >  * Switched to power sequence for handling pwrrdy signal.
> > >  * Dropped header file regmap.h and mfd/syscon.h
> > >  * Added header file pwrseq/consumer.h
> > > ---
> > >  .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 27 +++++++++++++++++=
++
> > >  1 file changed, 27 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > > b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > > index d67e1230b70c..5263b2b8f1ca 100644
> > > --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > > @@ -18,6 +18,7 @@
> > >  #include <linux/of_graph.h>
> > >  #include <linux/platform_device.h>
> > >  #include <linux/pm_runtime.h>
> > > +#include <linux/pwrseq/consumer.h>
> > >  #include <linux/reset.h>
> > >  #include <linux/slab.h>
> > >  #include <linux/units.h>
> > > @@ -38,6 +39,7 @@ MODULE_IMPORT_NS("RZV2H_CPG");
> > >  #define RZG2L_DCS_BUF_SIZE     128 /* Maximum DCS buffer size in ext=
ernal memory. */
> > >
> > >  #define RZ_MIPI_DSI_FEATURE_16BPP      BIT(0)
> > > +#define RZ_MIPI_DSI_FEATURE_PWRRDY     BIT(1)
> > >
> > >  struct rzg2l_mipi_dsi;
> > >
> > > @@ -87,6 +89,8 @@ struct rzg2l_mipi_dsi {
> > >         struct clk *vclk;
> > >         struct clk *lpclk;
> > >
> > > +       struct pwrseq_desc *pwrseq;
> > > +
> > >         enum mipi_dsi_pixel_format format;
> > >         unsigned int num_data_lanes;
> > >         unsigned int lanes;
> > > @@ -1396,6 +1400,25 @@ static const struct dev_pm_ops rzg2l_mipi_pm_o=
ps =3D {
> > >   * Probe & Remove
> > >   */
> > >
> > > +static int rzg2l_mipi_dsi_pwrrdy_init(struct rzg2l_mipi_dsi *dsi) {
> > > +       if (!(dsi->info->features & RZ_MIPI_DSI_FEATURE_PWRRDY))
> > > +               return 0;
> > > +
> > > +       dsi->pwrseq =3D devm_pwrseq_get(dsi->dev, "dsi-pwrrdy");
> > > +       if (IS_ERR(dsi->pwrseq)) {
> > > +               /*
> > > +                * This platform requires a sequencer. If we can't ge=
t it, we
> > > +                * must return the error (including -EPROBE_DEFER to =
wait for
> > > +                * the provider to appear)
> > > +                */
> > > +               return dev_err_probe(dsi->dev, PTR_ERR(dsi->pwrseq),
> > > +                                    "Failed to get required power se=
quencer\n");
> > > +       }
> > > +
> > > +       return pwrseq_enable(dsi->pwrseq);
> > Do we want to add a devm action to disable the pwrseq when the DSI driv=
er is removed?
>
> It is taken care by devm_pwrseq_put() the release handler
> that calls pwrseq_disable().
>
>         if (desc->powered_on)
>                 pwrseq_disable(desc);
>
Ahh perfect!

Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar
