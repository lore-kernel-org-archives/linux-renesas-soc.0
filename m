Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 733CC3DDDB3
	for <linux-renesas-soc@vger.kernel.org>; Thu,  6 Aug 2026 08:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786006728; cv=none; b=q+6cseUMJsSa4p4C4dhT8IptnxTUtX2AthPp9sOoTor5mtwK/ipmd3BinrC+PIpB/sF0efahx6/f/EMaQpRIgC15H9a3aRl3nMhT7hUFfJPQN4MPFkcUjR5brorJVfHnmssJEmJXHnsgCoH1jiR/uNas+sJ/Dl3KPyAix8xmdx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786006728; c=relaxed/simple;
	bh=Wp5Awetz8x1lkJd7iV42zxvDh1yQD5wNbmheE5eZ5No=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p/aE/zK08j4LAhW998hKvE6voRMrUadUv8KXK65gXZ7GHd1a243RcBCx66UFJQHaFTJ8lZbdaNjGtARFDpOUVLVkMWrgFsiKG0s3N13OiBhtZAi7OpFoUmPET9YuCQp+OoLaRwcdhk5sSvf53wNZS4z+dZfyS3kWhQOa0cC8tso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5c38565e774so557491e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 06 Aug 2026 01:58:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786006725; x=1786611525;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Y/Tg3lEpqdaiPRfyjPgi2cmAvw9BxKYOOcBoKp4sZn8=;
        b=AevDqOQQHcLIKLlFlNeW1FQwMfRyYlB7lKMU316zpyvd5yLc4PQuv9pGBpjmytCy3Q
         7OGhUiHeUfOrlxQDxfPOrAal0HcjEWQXBie6vA4tsFOaJRe+yeAvSJxz6fGrVWPkRJLa
         M6q+3/QGm/fjgpAT0ucXfFKo9hIaSLdZJ+KdUKMZhBbw5Eijb0we417knX9dHjRqhZj3
         cJFZrc5++FfopEjo+FVo6nMjzzpc7qPU5N4SXu7O1Qo6Zwblob/w1OfcjMZBHXruwoqn
         m7+4zuaNhLlQbT/SsJSaZIp83B0Hft1tJ2hM7HQ15lvPfGN+7UjFQgXFJPKmXNKb82wi
         DV+g==
X-Forwarded-Encrypted: i=1; AHgh+Ro5r7iWgEY0o6T7bwfGFI05VPI3X9nbUAPiX2J2IGf9decYS8mMr+kyVgn5BrcnOGQte937/pjfW19dvA8Oy7eBNw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0vTfuFao6IWoMGsRpq8hI7ohERVWAtLah2bjY7YBx1GeueGls
	oL6tyZQ7Y3qvUtcZMAH1ki03EsHIKDBsm2eb5mG/l+3DdoRpu3OVFYYjc1rUBIeJ
X-Gm-Gg: AR+sD10+fWEvYL7lsmavqjRRX+OGKGMyx8vlC8ijGqyiLWrdv3jQqqhPskl/3uKNhBN
	kli7wwyjjUMheQRfWjxnT8E0Y6ysxEdYo9jWtAzjwFg/MkSaBqK2OXzSQrKNRcvj+0R5WKqQgow
	A65OgR38jcjldpQYc/15E1kwRhLHGrjrO2AG4zkZVkRWk3fI6l2EVq2HfdHv2DQKfC2uj8cgc62
	auqJE65NC2i13Bmzy8JPzKGBsdtxa9FT16MDp1QphmJXIJcae38tF/oHP7eI1OW0NJs8e6ARL/x
	XVvNeoFTYIYZhTSWbj2UjiJHulAc9uw1Zx+ZKPLRbpfDYr5f8rlU2bFmhAGtwzpP5QkdaOxenli
	gUhn2cxRc/yIWdCXue4C008azuwU9QLjBP/EdQCxUklOuhWrMoxjPDbFOumNjRtF2YEtQ1Zxefh
	dLOQpHcw3a4sBR4lcMll+HFOU0JcG0ikDwzUQO1Sw69Ohpu7XxaDJkAAKII6ebeULvkzmorSB2O
	KShFfWgwbwmK4hSWMkOLYtFKT5IeA==
X-Received: by 2002:a05:6102:4412:b0:73e:5068:824d with SMTP id ada2fe7eead31-760e9a56323mr2762889137.14.1786006725050;
        Thu, 06 Aug 2026 01:58:45 -0700 (PDT)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-76048764defsm3328582137.8.2026.08.06.01.58.44
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 01:58:44 -0700 (PDT)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5bf94664327so794514e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 06 Aug 2026 01:58:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpnXTbnXLRV1lpQQVtGZ40c+p/1mRkmVfHg+c047kvWcpSwrT6VjL/yTggguvZCpCIKGD242D/vpNZegmqXSDiwqw==@vger.kernel.org
X-Received: by 2002:a05:6102:374e:b0:739:626d:4473 with SMTP id
 ada2fe7eead31-760e3698c49mr3173857137.0.1786006724650; Thu, 06 Aug 2026
 01:58:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1785941595.git.geert+renesas@glider.be> <89e6a71b35703f10e12f520af1f389b5f40f4b35.1785941595.git.geert+renesas@glider.be>
 <7c30baacac8c75037f32c0ac3099a6107cbec38b.camel@pengutronix.de>
In-Reply-To: <7c30baacac8c75037f32c0ac3099a6107cbec38b.camel@pengutronix.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Aug 2026 10:58:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX3mUVq5HAOcoLxf8_=ALKe_j-0uSTTORA_KyiOq1Bgiw@mail.gmail.com>
X-Gm-Features: AUfX_mwUZKZac7nMaa-VOsxeMPj2DizVJUU-sXiHc_DXR1wX8yJ0IgF-oPKqM3c
Message-ID: <CAMuHMdX3mUVq5HAOcoLxf8_=ALKe_j-0uSTTORA_KyiOq1Bgiw@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] pmdomain: renesas: Add R-Car X5H MDLC driver
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Ulf Hansson <ulfh@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Philipp,

On Thu, 6 Aug 2026 at 10:13, Philipp Zabel <p.zabel@pengutronix.de> wrote:
> On Mi, 2026-08-05 at 17:20 +0200, Geert Uytterhoeven wrote:
> > Add a minimal Module Controller driver for the R-Car X5H (R8A78000) SoC.
> > For now this just supports the always-on power domains, and dummy module
> > clocks and resets for the serial console (which is enabled by the boot
> > loader).
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > v3:
> >   - Replace <linux/mod_devicetable.h> by more specific
> >     <linux/device-id/of.h> in v7.2-rc2,
> >   - Add a comment to document only always-on domains are supported,
> >   - Consistently use /* sentinel */ for zero sentinels,
> >   - Drop trailing commas from sentinels,
> >
> > v2:
> >   - Spin off from "pmdomain: renesas: Add R-Car X5H MDLC SCMI remapping
> >     driver",
> >   - Add default support not using SCMI,
> >   - Drop all SCMI remapping support,
> >   - Document use of -1 as a sentinel,
> >   - Rename struct r8a78000_mdlc_info to mdlc_info,
> >   - Print HW IDs in hexadecimal,
> >   - Reduce log level for unsupported MDLC instances from warn to dbg,
> > ---
> >  drivers/pmdomain/renesas/Kconfig         |   4 +
> >  drivers/pmdomain/renesas/Makefile        |   1 +
> >  drivers/pmdomain/renesas/r8a78000-mdlc.c | 330 +++++++++++++++++++++++
> >  drivers/soc/renesas/Kconfig              |   1 +
> >  4 files changed, 336 insertions(+)
> >  create mode 100644 drivers/pmdomain/renesas/r8a78000-mdlc.c
> >
> > diff --git a/drivers/pmdomain/renesas/r8a78000-mdlc.c b/drivers/pmdomain/renesas/r8a78000-mdlc.c
> > new file mode 100644
> > index 0000000000000000..5c8acead7cff9bdd
> > --- /dev/null
> > +++ b/drivers/pmdomain/renesas/r8a78000-mdlc.c
> > @@ -0,0 +1,330 @@
> [...]
> > +#define DEFINE_MDLC_RESET_WRAPPER(op)                                            \
> > +     static int r8a78000_mdlc_ ## op(struct reset_controller_dev *rcdev, \
> > +                                     unsigned long id)                   \
> > +     {                                                                   \
> > +             struct r8a78000_mdlc_priv *priv = rcdev_to_priv(rcdev);     \
> > +                                                                         \
> > +             dev_dbg(priv->dev, "%s: Ignoring\n", __func__);             \
> > +             return 0;                                                   \
> > +     }
> > +
> > +DEFINE_MDLC_RESET_WRAPPER(reset)
> > +DEFINE_MDLC_RESET_WRAPPER(assert)
> > +DEFINE_MDLC_RESET_WRAPPER(deassert)
> > +DEFINE_MDLC_RESET_WRAPPER(status)
> > +
> > +static const struct reset_control_ops r8a78000_mdlc_reset_ops = {
> > +     .reset = r8a78000_mdlc_reset,
> > +     .assert = r8a78000_mdlc_assert,
> > +     .deassert = r8a78000_mdlc_deassert,
> > +     .status = r8a78000_mdlc_status,
>
> Are .reset and .status needed by any consumers?
> I'd leave them -ENOTSUPP otherwise.

.reset is used by a variety of R-Car drivers.
.status is used by the R-Car I2C and PCIe drivers.

So both will be used later.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
