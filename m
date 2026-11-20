Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795199380;
	b=5MeQmhtZyRKsDZ9jrGhg2wM6vrEP+0hDdJnVJhp9Z2zN0OgTnLA0sXroOBzrDqlbKRAN
	 dtk5NFN9RKPPAkpG5hhvRRHwZ+ZmPQkI3fR8sMeA3keeKYs6RJGL0+WYX6Svo+Spw8dat
	 B3gPZl08Xf/jMfIqE635+14jTMCTMaa9gpYC8AeXF52mobCgetazOSBm0XSNFMtPFxWuY
	 bEOBcpUie5259Q7ssCmnlRy24fLfkbYGyHsz65lXOKYGpc/bmoNAKHy+o+QwUFNpdY49a
	 h063iixJRH53WFRiMRTKKRtpvDOt5FHPf16LfyEMj19BY1sewdd1n6vYp3f/QKXJtRQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795199380;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=WpZL2JSgED1dxCTCDeitpd9jOOz/PRQfRKQZbZU7GDc=;
	b=hZNP90DqgO6AtwWLwuKiN0oITxntmrw7/eZj1QdogGPDVJ0LiGFYOtcDw/A9vgwQgtWl
	 OQDiKApkWq5eRRejPkkCUc1QQ7MfKW3Yhlgx7/wOEDJF56MGMQGcZJ5dALZzh+53BxIhD
	 ta+ANznl9/LiBHWwN8aSMOGXXv+HDFeszgCTo7aUw8RYkxvjdaCmmslDaUjT0ECKevMaU
	 k9zvl03tKRehIKA3WblRsp0JJswU59gOC5uwGjaAP9IsMgKuO5kwx5GwnL4A3PowxIueo
	 HHKhrglFp3bV/ntoghpgzmBKM5imPT3EF5QBdOyhUm+kYkMuGDKWAgWVkqtAziZ6mZw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uwABIWmP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6038606A336
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Nov 2026 18:29:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6038606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uwABIWmP
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4a2f4ca0dcfso691761f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Nov 2026 10:29:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795199377; cv=none;
        d=google.com; s=arc-20260327;
        b=K9DLhtnmSfrLKQu4MI6+VfySexPj9MFnZR9w0yxhw590jXPdVWgUNXpx6uaHdhb9hd
         tAZdog/2MBF/Z9eacUrZWZuRZRpUYnCLORxajEzy7rBT4mp/gIJc90CU15JIsPiReQwZ
         PqsVKCrMFvaPudAAzUt17NTeBQRWv69FdfB+PCDHd3KkVZWVNF8YdlsT/L2p6IvtEjcS
         AS5kOHEdNJaWlCe+zquD2JvkKSIjHWUva51xuojp7DbXYTzsAVOJEx3p7Y2lCqK+MCX9
         sADC/ucf0YnXeGKi7SlNdJq2qxOsoJzu7DeRPFmLsl6c84D1xOv4r6GTSvC1jlB6vydD
         s1aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WpZL2JSgED1dxCTCDeitpd9jOOz/PRQfRKQZbZU7GDc=;
        fh=NnXMbV5P/6OKcqOhZT1WbMZNUkvp+xbU7vPNN8sXEBk=;
        b=lRz7w3aNS0/TFGSut9u5rI0qs2r2TCFra4TDn/ANnGoqzAXReG3GReaLz88yh3YqyK
         RBTi7sQZ+TNGKhy8dhouCYMQjfERSlOt+wO7e+5czOPlPni80YrHhLSOFuc8tkn1WwAf
         /Yid8E6Ednajinp4oMbDU+9XfIpQXOGyfzMLQ3u7+/KYbRZ07GeAA4nlfZG1KTNEF9II
         A/y1k/N6hkhz8NIyNWgfLBVDsNtgpuB/ZY1XNsH3radf9ReCPOjAb5G4adMaDCJwGh/R
         v2IF1CE0mKX/23l6Ft6NIrC0PsQdYBVuwaUK68wr4mJKXY/yOkmp4uf0ICKS1tFa75c7
         S5eA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795199377; x=1795804177; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WpZL2JSgED1dxCTCDeitpd9jOOz/PRQfRKQZbZU7GDc=;
        b=uwABIWmPL8ufMw3MxhB2hOwlsEmPeYT8AMWdeblvvNQ1+v8MV4AO60p9JPABKcnamE
         9JU6LGYN7Rjwug1zxzVeJfqBL5YXMOmJO0GTOzazp/XoyyrswxdfWvwZfhhafqQqFPPt
         puNGPl19MUAnpekoVGvKRt7Mr5vTe4SQFBbC7jnM/ITYttyruWuBOwQSJ9X52/Wj4iEH
         bosO+SyqUgtYWJAjPH7yYL8doFP9iZQqB2OGnY5zNkhvPXMUmBIgSn+t6PsMJQXz2KOH
         dDNGaZsmXmcj3qC835umHkJbCrs9Bn3d2RCkV/6r68WrFW+s0asEfLgHUq+ZdBKyOpQ4
         CFUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795199377; x=1795804177;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WpZL2JSgED1dxCTCDeitpd9jOOz/PRQfRKQZbZU7GDc=;
        b=qqX6L5sZsu562vtvTHoA4NC3mNxQZxg2YVwmkB2eYLSAlhHI1O7N+tTt7UXqUFd9/n
         isKjztP8/B3pUn7tgYHzkSe74LkMQSmgnYA/q6ERdyu0Jb9tOPG0wWuonbEemaida1em
         iQAaYjKnwnduSs4orLOXU2elGJoWwC3BgvkO37ZhKSq6//bDZuk9TbrmoOcwtUPNrSeN
         Wx9QgKvnq4bPuh/4jXanqzBtA3aeHs6e66inT6ijgIrBp+z4JOLffL5kJJNjPyLnBLxO
         eVcIV4PXDYtTcdr4XzgJuD9PdVUFezoQeqoAXjafY2+YXo7p7sjAaEW5CzW9zakmpvr7
         eP/w==
X-Forwarded-Encrypted: i=1; AL+hErGYBfD+rv/ntuGrHwNlZShNpkKk+Q5xxQdjG+nkmO/Qpf1u7uEDNVhSh/wWeEG4ifUcqKdO/2j0n1Zzoa8RyhChsg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+M0FrFfstWul4Ltc8Qm1NasIf9+tnuv7g8TuiUawIMABgu6xRt
	Te0uy7jcgDiqZ70OdNpLgH8d9HCnWk4YEWMhj+UduvVGQHC1Q4EOUjsqkxPrnFvNSZihXPq5jFf
	dxqjMEFDx6lhKASmM4KjrS+i17CpKPA4=
X-Gm-Gg: AZFdTZfD+nc0Givv8H0KBRM/nDOfTLTwO1e+jNZwyjJgVhEWOoBo3ol2olR0lKRsA1C
	F714FfclBq8SRn17YhD2iYTVWaDqib4VwP1k47meeLtn4OZT0DE8VmJWTPuN2WP5QE4PQR8NNop
	oNyRuUGWoGDWlKTvBxaDDOuAOrfut8OrNvvXZEFNHtDV1D3YKvtd9DmasujCiS7jCbSXDeWb2d5
	1yjibye59COOEtTp0rLnHKUUFAWDE1Glsw8WxEfnoZlPdBiDgZj9cZFPLt2o8GhfplC8Bd3EBul
	FPWzQDA4T8euekk1Tjos0SgkYkj/nz0pMRI3074xD5/bsToJMYjIeCzO634tfjR5/9kDuiaIVHv
	KyGePCR0SuxKuGa3TPqYfgIormVrBkV3akWsUJtYl3GHwxDgWoh9nLxB1TbCKfIUMMQhr6YeKor
	eiNx6Z9hGZIhdYRgktnCN7nzj8nCa/WqgYhwM00r2yoW+zP/R+ExMv6Z+P3A==
X-Received: by 2002:a05:6000:481c:b0:4a5:ebcc:2260 with SMTP id
 ffacd0b85a97d-4abb2dda518mr7812309f8f.29.1795199376768; Fri, 20 Nov 2026
 10:29:36 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120002549.1908299-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20261120002549.1908299-9-prabhakar.mahadev-lad.rj@bp.renesas.com> <d0f5f347-a5f6-4e84-b773-f29ffcdab156@linux.dev>
In-Reply-To: <d0f5f347-a5f6-4e84-b773-f29ffcdab156@linux.dev>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 20 Nov 2026 18:29:10 +0000
X-Gm-Features: Aa3M54pnhmFSvmvZzRx-r4wW9mEW3Np4iPEWnckhFv_SM03jf-al_Jy7M9nYdCI
Message-ID: <CA+V-a8tQH_aFb871XXJ6QkNUhyXwZo_0RD4j83GbgDpfa=9x0A@mail.gmail.com>
Subject: Re: [PATCH net-next v5 08/24] net: dsa: rzn1-a5psw: Fix LK_LEARNCOUNT
 write mode encoding
To: Clement Leger <clement.leger@linux.dev>
Cc: Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Simon Horman <horms@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Florian Fainelli <f.fainelli@gmail.com>, Ralph Siemsen <ralph.siemsen@linaro.org>, 
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Clement,

Thank you for the review.

On Fri, Nov 20, 2026 at 6:01=E2=80=AFAM Clement Leger <clement.leger@linux.=
dev> wrote:
>
>
>
> On 11/20/26 01:25, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > The LK_LEARNCOUNT write mode lives in bits [31:30] of the register, but
> > the driver writes the raw A5PSW_LK_LEARNCOUNT_MODE_* values (0, 1, 2)
> > directly. As a result, adding an FDB entry writes "set LEARNCOUNT to 1"
> > and deleting one writes "set LEARNCOUNT to 2", instead of atomically
> > incrementing/decrementing the counter.
> >
> > Use FIELD_PREP() with A5PSW_LK_LEARNCOUNT_MODE so the mode lands in the
> > correct bit field.
> >
> > Fixes: 5edf246c6869 ("net: dsa: rzn1-a5psw: add FDB support")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v4->v5:
> > - New patch
> > ---
> >   drivers/net/dsa/rzn1_a5psw.c | 10 +++++++---
> >   1 file changed, 7 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.=
c
> > index 13c46cf2c420..7fd2652813ac 100644
> > --- a/drivers/net/dsa/rzn1_a5psw.c
> > +++ b/drivers/net/dsa/rzn1_a5psw.c
> > @@ -5,6 +5,7 @@
> >    * Cl=C3=A9ment L=C3=A9ger <clement.leger@bootlin.com>
> >    */
> >
> > +#include <linux/bitfield.h>
> >   #include <linux/clk.h>
> >   #include <linux/etherdevice.h>
> >   #include <linux/if_bridge.h>
> > @@ -545,7 +546,8 @@ static int a5psw_port_fdb_add(struct dsa_switch *ds=
, int port,
> >               goto lk_unlock;
> >
> >       if (inc_learncount) {
> > -             reg =3D A5PSW_LK_LEARNCOUNT_MODE_INC;
> > +             reg =3D FIELD_PREP(A5PSW_LK_LEARNCOUNT_MODE,
> > +                              A5PSW_LK_LEARNCOUNT_MODE_INC);
> >               a5psw_reg_writel(a5psw, A5PSW_LK_LEARNCOUNT, reg);
> >       }
> >
> > @@ -604,7 +606,8 @@ static int a5psw_port_fdb_del(struct dsa_switch *ds=
, int port,
> >
> >       /* Decrement LEARNCOUNT */
> >       if (clear) {
> > -             reg =3D A5PSW_LK_LEARNCOUNT_MODE_DEC;
> > +             reg =3D FIELD_PREP(A5PSW_LK_LEARNCOUNT_MODE,
> > +                              A5PSW_LK_LEARNCOUNT_MODE_DEC);
> >               a5psw_reg_writel(a5psw, A5PSW_LK_LEARNCOUNT, reg);
> >       }
> >
> > @@ -963,7 +966,8 @@ static int a5psw_setup(struct dsa_switch *ds)
> >       }
> >
> >       /* Reset learn count to 0 */
> > -     reg =3D A5PSW_LK_LEARNCOUNT_MODE_SET;
> > +     reg =3D FIELD_PREP(A5PSW_LK_LEARNCOUNT_MODE,
> > +                      A5PSW_LK_LEARNCOUNT_MODE_SET);
> >       a5psw_reg_writel(a5psw, A5PSW_LK_LEARNCOUNT, reg);
> >
> >       /* Clear VLAN resource table */
>
> Hi Prabhakar,
>
> It could probably be worth it to add a small a5psw_set_learncount()
> helper that contains these the FIELD_PREP + writel.
>
Sure I will do that in the next version.

Cheers,
Prabhakar

> Otherwise, LGTM:
>
> Reviewed-by: Cl=C3=A9ment L=C3=A9ger <clement.leger@linux.dev>
>
> Thanks,
>
> Cl=C3=A9ment
>
