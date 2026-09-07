Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BBD53BADAA
	for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Sep 2026 21:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788816231; cv=pass; b=eGuREo3btWMu0vWTQ+QH3FELXIhzMMfpz0zmCwFIJhzIhkZH3sCmT6ym5D0pUMg32mROAr2wT3d1cAmBO4icm5rMSWd3hqIjs8NzYJfG6GfKg5gUcE/UIZ8Kr0S/JikkseFVz0mNf4WzgdV5a3Gnb6MkO+T/4XW6i6Gm+ucW+0w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788816231; c=relaxed/simple;
	bh=19/8aQ8d3WRQPVmOABUgfgBS9WSqvPRbfyGSQyZrvXY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pLqzedagQ8/GlU9sbQUlWYfSdRF15EOGyR/mvlZCULS+c8N7tvCYMexzmX4O1zyx6Rl44++AYK8rE77reBi3o+55Tl5FsJ5C0vJ5ZYPbIC8GIHlRBSJvxgLOxk+rnV45qXc1c3c+ZnG32BATV4mB29QTtxUO1Rhzg3i4HqQaTeE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X+MX10c6; arc=pass smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X+MX10c6"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49d05d51553so18701735e9.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 07 Sep 2026 14:23:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788816228; cv=none;
        d=google.com; s=arc-20260327;
        b=h9IerLM9BG9dixbwwq+7IhVpOb5JJNse/tkJiG2VyEOX/yUTNNEqcRUoMkvCF5FMSX
         gaf5LHX+7YTxkFZLDkxx6qcj1KuxsQxKteSUs9vKkZyuH5h7PYZ5JarWh+R4g1rKqEtz
         ZLPyqF8/+3zx7Wbt8lFcVZAFQ2y4ljO3rlGewu8ppIFll2HN6aDxh5/7EeDfiFCdBwnH
         JDkxkgsSrKN+2YarR0sk97ev2XzjOnZ1ZSjDebdYrdqOdTDje23UCHGDZT8887DRVur6
         99o33YiAH1WsdPN3p3759ZGnyWW6PBb0zHyQYuuJtgQIrshaf45769JKxg/ygbd5WXfQ
         TPJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wuA9AOewcEEJ8XMU+DUU/y8C9hklGB9rqR+cr/+jZjY=;
        fh=pj9n8Ar9nVnRB4TTp34/pM2H13m/DHn9YdlINrmxNZ0=;
        b=D5FtwXV3vETF79UDznU8OSiexVvPZRoxAaDSc9Vjii6JiSwxwT1iZEvmZ56gzMtMYZ
         2MS9a4MU9jFcWxNIsHp+WhkI45fli3P8Lvj3u8Jjv2p/Y2ZECLUZKWw4Z536olPyh3Af
         0m8PnyDf5Ha1Y6aiounF1td4VFliZri2el0LDOhiKWmeJ2ymbxJXpD7jFpUFJBkSihdM
         pBf7gz6Nl2V3wK+gyKWaDFGp/DySnCMpO8onhHFGu2+w7v4Zwi7ytjyiH02OfkvQw9k/
         LZrpAwAUsGCvbbej/XDBHtJAN2kIYxpYucftqqbrE1WmDF0f0waYhki9/0HdN9n2ghsi
         Xe9g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788816228; x=1789421028; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wuA9AOewcEEJ8XMU+DUU/y8C9hklGB9rqR+cr/+jZjY=;
        b=X+MX10c6MQhhUHNv/JZ8+iqWZZ8PJVfINv8g286mpS1G48IrG5p7zJqc4RE9w5c4T3
         AvxZwPlPauidlIkE4iwka6Duc0MBMMrHjl5xX8xJE+QFTRUps0m4WuplFB5HAzSEU6r1
         iT3fEgDB2uW7ORy2N+dzEJ6dpFL8pjhFgkM4ZOKoqUJzCEWw4z0Elok02idwv84ajWBi
         mJ8IJqCGeYGQM/rZj2EKG4x/eoaXPPaECCggNWmrL4LbuPRXPeY1wuh/BrZW7Y5pZmpA
         jY4LZV9zCFJ9VM80l7fHUvTHTMRJBJ2xCywPZHz3rdWcYhqiYW9kvlT2ohOs2bX31Aon
         X7Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788816228; x=1789421028;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wuA9AOewcEEJ8XMU+DUU/y8C9hklGB9rqR+cr/+jZjY=;
        b=pqUxsZh6fW0pp63+ymqpqDq96aEL6vwvi0rx/4Qi6jeir+mTZcClHnfdXIvDBpJ73K
         FnD7pGQSip4sSnKrGmpq2Z9sOWlpl53V65gdoWO9lbIxT2eZEyRsvWek9g7hJ3wFjxp8
         PCv+Ixx2b0Q5MFIR03eqNa2F6kaK87G4a9W++cQ+SHIId5JPhOuWWMOHsm8BI0MkFpPX
         k8FOx1xEkKzNb6s23trZpBW9/aSR3tPi+T90+uHfvDHrSIpPxUTYAwEdUBxhF47688Sx
         1J5OZRlc2omT1cJ8rfh3HGv40fejBs3zdUfjJotevWnXrRkUPwzfEjO2heP7PWmR92vR
         Y3GQ==
X-Forwarded-Encrypted: i=1; AKwUvByu0+zI2kQGKWKV8le/0uQ51Hm2JE31mWZKU/0Ccc5VnBdUtxkzlQRt9Csa1wkj9XhQEbq8SrzaOMcv9YNCHQx3fw==@vger.kernel.org
X-Gm-Message-State: AFuF++lRcWPSyV3jyaaKf5JC5kMTflbxUQ92n3HChmPqTsTLZDfCqC1I
	9o32Fsm60LI+4A07fviDm9FQt0FODhyTdFCDeRKE7R5MZ3PnP0j7D40IIDaP0U6O5+XnvXb1r/k
	q0CMlYhKsUJMsGMiZKeJBy5KwpRK44bY=
X-Gm-Gg: AYBFou1eL52IixVtMkqQXNoA6vdkT6vuoEjD4xmqM/tXlc52OGEZY1GGIDH/z6zv1u9
	gfWg0tAPSiZujYkwV6bgS2ZK1I2mVWL1n1RgW6gaMaakfF8RjYW+I3FW/nm4wL0e2+r9olc4peG
	VhEaVy3mMmg5XLU1xMyjxDsI8BxbF+rbncuWchPGrI9zFtnx/zZny2SwGgnRsCm7vmwnYRmVY8l
	YFsV9/1sG/d6QUhGTNhutHWPWAUH3pLsNuPX6ljvUTKMyn+/OD/AUwg+HzuxGEa4mS3Z++ozj/q
	1GuAglFnHoECGeEq2oIXNUU5fr/I6+9m9JoAApECOQKmBApiiroGfWQk/aF4bU3CsPKAVGxvP3C
	ypSJ8KyqHSmsoZ176Jci2x8HnPw+B83DF
X-Received: by 2002:a05:600c:8706:b0:49d:191b:88be with SMTP id
 5b1f17b1804b1-49d191b88e2mr11604605e9.0.1788816228283; Mon, 07 Sep 2026
 14:23:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902-rzn1-miic-fix-array-v3-0-3f7dccffaf5a@reliablecontrols.com>
 <20260902-rzn1-miic-fix-array-v3-2-3f7dccffaf5a@reliablecontrols.com>
 <CA+V-a8tOLKxFEKF+yZ0Asf_KYb=_hrFuJagkdzHPxZ_zf3MNRw@mail.gmail.com> <81f2b455-7df7-4aae-8b67-d7cc9a7039d4@lunn.ch>
In-Reply-To: <81f2b455-7df7-4aae-8b67-d7cc9a7039d4@lunn.ch>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 7 Sep 2026 22:23:22 +0100
X-Gm-Features: AcwNN1Wo_8wwvrgt5LhiUMun9fC2pDJoIDFWLjv37XoCXAfNGC83f6MaStO_uN4
Message-ID: <CA+V-a8t9C5D+YeV4Qqiw5zKjipE8zLmDAQ_rSqDmw6VWPOBfUQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] net: pcs: rzn1-miic: Verify port number from dtb
To: Andrew Lunn <andrew@lunn.ch>
Cc: khendry@reliablecontrols.com, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Mon, Sep 7, 2026 at 9:49=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Mon, Sep 07, 2026 at 08:39:27PM +0100, Lad, Prabhakar wrote:
> > Hi Kyle,
> >
> > Thank you for the patch.
> >
> > On Wed, Sep 2, 2026 at 7:55=E2=80=AFPM Kyle Hendry via B4 Relay
> > <devnull+khendry.reliablecontrols.com@kernel.org> wrote:
> > >
> > > From: Kyle Hendry <khendry@reliablecontrols.com>
> > >
> > > Add check to make sure port number is in range before writing
> > > to dt_val array
> > >
> > > Signed-off-by: Kyle Hendry <khendry@reliablecontrols.com>
> > > ---
> > >  drivers/net/pcs/pcs-rzn1-miic.c | 6 ++++++
> > >  1 file changed, 6 insertions(+)
> > >
> > > diff --git a/drivers/net/pcs/pcs-rzn1-miic.c b/drivers/net/pcs/pcs-rz=
n1-miic.c
> > > index c50b65d064fa..3ee40eb9d545 100644
> > > --- a/drivers/net/pcs/pcs-rzn1-miic.c
> > > +++ b/drivers/net/pcs/pcs-rzn1-miic.c
> > > @@ -692,6 +692,12 @@ static int miic_parse_dt(struct miic *miic, u32 =
*mode_cfg)
> > >                 if (of_property_read_u32(conv, "reg", &port))
> > >                         continue;
> > >
> > > +               if (port < miic->of_data->miic_port_start || port > m=
iic->of_data->miic_port_max) {
> > > +                       dev_err(miic->dev, "Port number out of range:=
 %d\n", port);
> > > +                       kfree(dt_val);
> > > +                       return -EINVAL;
> > > +               }
> > > +
> > Query to maintainers, what policy should be followed? Since the
> > dtbinding check complains if the port is out of range should the code
> > also check it?
>
> Yes, the kernel should check it. Running the checker is
> optional. Crashing the kernel because of an invalid DT blob is not
> something you want to allow.
>
Ack, I'll make a note of it.

Cheers,
Prabhakar
