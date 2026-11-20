Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795164592;
	b=tw2SbY+DzpC/sNaIBg1s9bBSQN80At/RmSyKxVh/oDvVds21fdivFhXtisUsv7c0Nj8c
	 IhUnu7n7/K/2bgqz5AyOJ+eSrkr8BhoZ+zOVZNPmGFC1OVHQHqgLr/4zXH6iNn4eyOpaU
	 yyduXd1U+90bWXfLSBPf1bZVL6GP63UscPI6nnQ8vmNWGm68jDHPPudZUoankmOPC1SPh
	 KvyYs5UbFZpFSn0sArQ6RvTjk9Fr5Zb8xbQWzaN0QClSE5rc1rxGNXPPkmeT+vDSPY93m
	 a7BL8PBbzbzgKzUGzyGcZmD0GZVWwrjjxqJsvX+0iV0Wph2rYKFYwI4p9oIGvJKDpaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795164592;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=slnLzkdmpwFbnxdOJOf8j6Mw1PiHOu2DMR+OPWGMV3g=;
	b=UeKR91YM6y93BXhqZ61AXTMcstuMNNm4HSs/REN5ciXiSWWIvlDxMEqpvfqRdJtB+5zl
	 H8Rt9KddIYCoG4fqlo49gE4TNXwiDUKTTgejt1l+rbEs/E1rPG/nZ1eL1YlEL2q92i5In
	 /BMCFGhr7cK/KirFAB/NKX58LIa5TJ3anr+613kYMS8mBBpcZygwq5ZluZ9Dn0NBEG2y3
	 wICOLyCPx89+7XGOsIkBLUG7CyxDpQwqNuK1j1Z6wAMa7xAAX0hjVt9JoQb8nIb2k1qgw
	 GfFFbx3zLONuhfrAHMwc/KIOmt+ZG1t87AimLSlkCkC8xVL/nPUrGB2FVVlsy2PuYKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.170
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924C6606A326
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Nov 2026 08:49:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 924C6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5eaaa9b1591so492560e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Nov 2026 00:49:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795164591; x=1795769391;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=slnLzkdmpwFbnxdOJOf8j6Mw1PiHOu2DMR+OPWGMV3g=;
        b=KRYbEYWe5kQLkIOi4FaG3sCc1o4g/nCivjxQqCwHaNsea0N/gYaEjIofVgux0l5Ohv
         5cz/byT0RvzC/7s+ymyjnvoeNqhJb2JCqyjfHqUw+f0LNbF1qE8smkiHlqLtyKMdt/51
         TqJ0qWf/xtr+e0Vx8nVf7V6xd5gYLhdcEkfeLtp5nVXEyR2jFQDCSfZLswNya27bUBdI
         QgpcgmCj49FxMwY5/uEzF+Dr+43+kSmoBBfegtXFlLFqY1RqzLKUgyHyK7l0kcOCCAgk
         SPyuqxTg40DduqNPCR4yzC6zaXPQRmHnbIGTmNqTNajeV13Vwfl3QkBOWsSLii7qWirJ
         +RHQ==
X-Forwarded-Encrypted: i=1; AL+hErFTKUEPS4BP6z3t7kwltiTglLmICGZe/8rL+NLVjB/tPqxMsLvmncIGjPx4a2dxcS3TcbBoY/UBP6MQZs0UniXGmQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8CJyAlJVYK+1kcAUeqQsYE6xtUnSZuQQfxQlAdYPSdYt8+KwFM
	T++2756YjhvFlyye65JbrD2qwAPqkxvrwBvwJHl+t89UYnr35ZinaRc2YEboy2HV
X-Gm-Gg: AZFdTZdiEQE9zyUNnxZRxNEszzylPe70nrlot7trRfALguqWhYTCBUsVpMMmLkBZaoO
	3HPPmSaVjMXgnbFTOHruHU8y3qyP+gvbLBCSx7N0fYBeo7+YkNPhgsFL5qcqyBKt6Wei8lfveOI
	khoMvw0k8IWHNl+mo2KrpYjfqqoIP5OSBlrfIir9lya62MRd9TQtxJ3Pj2pQysjMulgCoOU96Zs
	48XOU7oFIZ76ltZLl7L3ORxPH6NuXP6i5F/WFe61iQSQbJ4/5rS4GM/0ogEIeMrhjyIhvxZxwr0
	VQOUkjbdn0tZF6LEq9NE352HcJi+mEV0GvSbVEdIKl1r32bTWuOvga/TCdgUMZoGmBWzqoefSI+
	4LNFwMfxW/jrX2Ykobp845XjXebNDVOW9Pq952MbCbxsx1lnkeJv7f3IMtZ7KeGNlw8/4FD4W3F
	YDmMxmretkbuhuB9Owh/lCjJ5KhKrOi9B8bJoKD9tC/OOEzd/7IavyVPkjnjtB+GOPOo6ryLGLz
	c0L1MLV+KK8IG2/6m5Op7DZ7thQyo6nDBeT1cEGbq1qi8BTITVW0X8LnNNlWMdRE/4JEiAovNPc
	NlKWGDwXrJmT6xqIUL8TLC0lsJLSfqrqWVgOInj7JONfwaMkhM9sp0+0yACSGAj/5I+P/jPuEi7
	NGbB9qtAJd/Ts
X-Received: by 2002:a05:6122:1c88:b0:5ea:f399:781d with SMTP id 71dfb90a1353d-5ee8afd7156mr1241852e0c.23.1795164591425;
        Fri, 20 Nov 2026 00:49:51 -0800 (PST)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee8b5a91bdsm1964906e0c.9.2026.11.20.00.49.51
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 00:49:51 -0800 (PST)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-7d65662077cso345378137.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Nov 2026 00:49:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErF4TzlUiYk2cOPIbZikj6edSkxwP4OvbVk/2CfF2we210obreWN6HNuyfjjN/V0R+vMukICLeu1P20dUYqRu2DZ/w==@vger.kernel.org
X-Received: by 2002:a05:6102:a49:b0:7c3:7286:c291 with SMTP id
 ada2fe7eead31-7d739587805mr971622137.19.1795164590827; Fri, 20 Nov 2026
 00:49:50 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1795094688.git.geert+renesas@glider.be> <683b5b189409e5ee04100044fb615b01cb877f3d.1795094688.git.geert+renesas@glider.be>
 <20261119225017.15a7b5cc@kemnade.info> <CAMuHMdVbgGV_6yjOip4xT3YhBgaOveHzSRbw9e_cHen9NRZqmw@mail.gmail.com>
 <20261120094320.442d064b@kemnade.info>
In-Reply-To: <20261120094320.442d064b@kemnade.info>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 Nov 2026 09:49:39 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWiCODz6RC9Q9-xMM5_k3grHztiLuR+-ikOZYoBawVvZg@mail.gmail.com>
X-Gm-Features: Aa3M54pnWIgbseGoLAFGMXWb1P8DBLFzk6LU-uNSdaE_BgKhwLT8uPsc_3uFT5k
Message-ID: <CAMuHMdWiCODz6RC9Q9-xMM5_k3grHztiLuR+-ikOZYoBawVvZg@mail.gmail.com>
Subject: Re: [PATCH 5/6] [RFT] ARM: OMAP2+: Convert to dev_clk_get_from_provider()
To: Andreas Kemnade <andreas@kemnade.info>
Cc: ettore.chimenti@linaro.org, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>, Paul Walmsley <paul@pwsan.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Sandy Huang <hjc@rock-chips.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Andy Yan <andyshrk@163.com>, 
	Ulf Hansson <ulfh@kernel.org>, linux-clk@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Andreas,

On Fri, 20 Nov 2026 at 09:44, Andreas Kemnade <andreas@kemnade.info> wrote:
> On Fri, 20 Nov 2026 08:49:05 +0100
> Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Thu, 19 Nov 2026 at 22:50, Andreas Kemnade <andreas@kemnade.info> wrote:
> > > On Thu, 19 Nov 2026 14:40:38 +0100
> > > Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> > >
> > > > OMAP2+ clock handling uses of_clk_get_from_provider() to obtain clocks
> > > > used for power management, so the latter show up as "deviceless" in the
> > > > consumer column of the clk_summary file in debugfs.
> > > >
> > > > Fix this by using dev_clk_get_from_provider() instead, letting us pass
> > > > the consumer device, too.
> > > >
> > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > ---
> > > > Compile-tested only.
> > > >
> > > > The first change is probably OK.  The second change may fail if anything
> > > > in the oh->od->pdev->dev chain is not available yet at this point.
> > >
> > > Test on OMAP3:
> >
> > Thanks for testing!
> >
> > > --- clk-old     2026-11-19 22:44:59.810807920 +0100
> > > +++ clk-new     2026-11-19 22:26:52.862531880 +0100
> > > @@ -1,17 +1,17 @@
> > >                                   enable  prepare  protect                                duty  hardware                            connection
> > >     clock                          count    count    count        rate   accuracy phase  cycle    enable   consumer                         id
> > >  ---------------------------------------------------------------------------------------------------------------------------------------------
> > > - oscillator                          0       0        0        26000000    0          0     50000      Y   deviceless                      of_clk_get_from_provider
> > > + oscillator                          0       0        0        26000000    0          0     50000      Y   deviceless                      dev_clk_get_from_provider
> > >                                                                                                             deviceless                      no_connection_id

                                deviceless
mcbsp_clks
> >
> > Hmm, so the passed device is always NULL, and thus there is no point
> > in making the change.
> > Do you know if these come from the first or second change in my patch
> > (I guess the second)?
> >
> From the first change, The second piece is nowadys only used by the dm81*
> devices.

Interesting.  So that means all/some of the existing use of
&od->pdev->dev in _add_clkdev() is futile, as it may be NULL?

> I would prefer to have this tested on dm81* too.

Agreed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
