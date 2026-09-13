Received: from mail-ej2-f7.google.com (mail-ej2-f7.google.com [74.125.228.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131C4368D62
	for <linux-renesas-soc@vger.kernel.org>; Sun, 13 Sep 2026 15:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.135
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789315147; cv=pass; b=mtxP6+V0r1sv0s5LFl0/ZX7TzYk27N4ims+zuV1KWikbZjuWl5PoTD9wBhZn7jG44JHKkHQQjWX/EOqvISemJ6ylJpDse7lIuPV/1m29bUS/WjIEGui9ntn6qLpP+VbqvioihsXFfJrH5phiDJWILMCm3wtSDtSxgRz4n8qeWlI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789315147; c=relaxed/simple;
	bh=GwskXz/4lUAOU/7p13jVmuQ8myr6xowZ5XA7iUxaLtk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tu1B4rSKO1z+vAIuuvzdM1z6GAMGVGDNq4Vvx7w6Vo1pBJvNYfwRJKrdpTc5YJXYKmgj/1tJTKlzDtCiWtcO2lIJBeuhlAc6QV8WV4bBH0qb9kzMz47qONEqEasD59shRElybBm20xAh8Gjxqq/fT82Hiq/xSU1WD4ZBh/z25HU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WWg1nTvY; arc=pass smtp.client-ip=74.125.228.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WWg1nTvY"
Received: by mail-ej2-f7.google.com with SMTP id a640c23a62f3a-c28e3998eb7so156391166b.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 13 Sep 2026 08:59:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789315144; cv=none;
        d=google.com; s=arc-20260327;
        b=JD2hoBoP0VIlYVYHS/N3sZPYAgbaxWreW/oRhgXW8LVG3NG+YgXE+xzTFw85LkFh2D
         xIpO/vab78mZrOcX9uld1e9XOfR0l3KT95DQd3ud5mY+vhAN977OHKcozskyAxrdQl8G
         4ybWKhgI4R4B4A1Y8Avu1YVdHZSJSJNcevaFLDbBEzmfS8LlnBcc7VVb1WREYGlAFq9F
         IGJT1wBes4qPfzWyanYKor95cDoSYXZM7aEtNwDJdAtawNa5D0GaURKhjDXN7xLbMbqQ
         u7HNDIrMuHgaAPkCYp/OKz+tkUecLAPJoOdbqpVvFpU4RZen/cGPBZLCdewOcCO47/tX
         ZwLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QtQwQGv8F8oJXhyzp/mmJrRotQmL7KJWiE3zhpMTfrU=;
        fh=bzks27i0TA/qL6F9F01pQqDRzmUsCWA6RMr5W1sVabc=;
        b=hjBYa1tKUbDNVbGtZ70ZpDJdDap91FQTSGn59chlsx4NC9ttaK6VDJJZWTiIZC7nSF
         QqIxniMDFfXKZmEOsSIOlMn5YF3Hs5AbGCH7o7WgjQxkuYZAzFBShT8dZVGVOGHVpU2P
         z5Ju5+PubeUnB40hAW/L5sSuF7YPpn6rc4nV7lNq9ju0GllRhhFyGH+THMJKXnWqcuI0
         KM3c4eJUd8nnM+HktmXy53q5jA/VmCzpqnLJp9xRbiTgn7I49cQS3ZuS8DcGaOlUcZUz
         CZIigAe0C29RuCCKpwkV96Pit/lx8icQmSMk8OnrWAK1sKccpDXVVviIc2z7l15UmCbo
         CRuQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789315144; x=1789919944; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QtQwQGv8F8oJXhyzp/mmJrRotQmL7KJWiE3zhpMTfrU=;
        b=WWg1nTvYL+9Ouz7+KipH2gQpYVHVyY/n0XtPsa42WcbfDxm7cSdOQFUtSRwA5Hcyfq
         2LG//KqwbOEZongiSKa3DXoun1ndDqPtePsK2tE945hkt+jBt0Ot6dsW9CWEKmHHFs3t
         PYB4aiQZBycQJkDR6IlvPx7RhIKI9e3hgQOin/DCJV9mRZsAZBLv/Xkl48YaWmRrE0ej
         RRy9AFVTF4Trvxnh5Q8d8u9xI621lJAgGSLdUEceg3vnhLqjuf1N0kRl0QOmKY9Gp/PE
         57vw+mzR8nS3uf9DN4u1gOv07b6eYAVa1dE07EL4FVChQKez635fL+vGPRl8vdXLKIJ4
         uGDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789315144; x=1789919944;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QtQwQGv8F8oJXhyzp/mmJrRotQmL7KJWiE3zhpMTfrU=;
        b=TiIy23SYqvcF1Xd8MNkmgj30xx1JRv26yUqSOxjb3rHqbzTkh1l1tnBdeKodcBThqi
         hBeveEBAgyuq7uW+WPV+O6uni5qeVEKF3PcStr7xD1TpNLmQcd3IyzUOUb5roksKeNd6
         aETdjRFdkxy/d0ceak4OeLktDRjYltClDm9w7ZJ8q2t1bhoMSCGF01L6LRUPw6P/VMSC
         JS5p8wy/uWuAiDVDJhQElUOi22TcDDIpIquJYncn1cZ/Xh01qgbqIDV9fBMp2fYfEbwG
         zrZ7WFN1GUJXvYYU5aVf8FvU1SNbNQJnzwoTBM+169pGLZYaftnzLUO6XxxR8KsZBdw2
         Hpzw==
X-Forwarded-Encrypted: i=1; AKwUvBz6TrKo/s9FZo+HxnPwk3EknRtyz7s5wNgRLxZlp61aeYxxUvqttGHrolPXtwEreq9GV2nUJPC/OKmQOjAw/ZHpGA==@vger.kernel.org
X-Gm-Message-State: AFuF++mX/jMnuOd6wkZXH8ib6ud2gMsBHJRvEkEweHsFYFHvU9TwtAvg
	JScKWOb20ncR3ENw/gXs68GCZEfUue257dXSwHMMin3vj2UzqsXv0m9+ye3urOfZ71WIiNpJpRQ
	MpHY1SiVZy24cX3do1jPehdUYbmmKmeU=
X-Gm-Gg: AYBFou2oEi34e2UXy2ZZeLjYRs8qJviGFKrfzX76qxvmlddsHwoIZmwQBTjuh6OEvtm
	9BooHtDkJK5yXB/9K0yombT6JpxtBDgT6dl3veMWsGSU8p7hG9fnaeV+XpiGP+P5LVEYfmRotIY
	quxijEBreqsXDRYFbxVZeXirgLR4dUdVT0519fpi5tnjD1NMhE/7BDyOx1Aumctabjhh1ZQ32Zb
	W5rCvsBtYU6/o2A1lv76qPRgY7NWNwxseimX/LjYG1cwKD4uX6iQwRDg6vfr1izCLAI3T+sx8nF
	RXAxVnvreWiia/fNSNYKtj8g3tCutR5U9/0km6IkQFaUKJugY3pRVKVRQw==
X-Received: by 2002:a17:907:1992:b0:c19:6104:e5e4 with SMTP id
 a640c23a62f3a-c2985769204mr414384566b.20.1789315143958; Sun, 13 Sep 2026
 08:59:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907153713.2572547-8-coiaprant@gmail.com> <20260912201327.127042-1-kuba@kernel.org>
In-Reply-To: <20260912201327.127042-1-kuba@kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Sun, 13 Sep 2026 23:58:51 +0800
X-Gm-Features: AcwNN1XAulIb65_nNmPJqWeqm6n78LTScmm_BZJth6ooN4ELABvEb2CnyYjxeFw
Message-ID: <CALj3r0gRtJJMzZKW1DAyYJR3WQUX+JsBNH23VULhgLvopyHADQ@mail.gmail.com>
Subject: Re: [PATCH net-next v4 06/10] net: pcs: xpcs: add ANRESTART support
 for SGMII link recovery
To: Jakub Kicinski <kuba@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	heiko@sntech.de, vkoul@kernel.org, maxime.chevallier@bootlin.com, 
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, romain.gantois@bootlin.com, 
	hkallweit1@gmail.com, neil.armstrong@linaro.org, linux@armlinux.org.uk, 
	shawn.lin@rock-chips.com, david@ixit.cz, netdev@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jakub Kicinski <kuba@kernel.org> =E4=BA=8E2026=E5=B9=B49=E6=9C=8813=E6=97=
=A5=E5=91=A8=E6=97=A5 04:13=E5=86=99=E9=81=93=EF=BC=9A
>
> This is an AI-generated review of your patch. The human sending this
> email has considered the AI review valid, or at least plausible.
> ---
> net: pcs: xpcs: add ANRESTART support for SGMII link recovery
>
> The patch sets BMCR_ANRESTART together with BMCR_ANENABLE when configurin=
g
> C37 SGMII in-band negotiation, and clears the latched CL37 AN complete
> status before doing so.  It also restarts negotiation from
> xpcs_get_state_c37_sgmii() when AN completion is latched but the link is
> reported down.
>
> >     On some hardware using the DesignWare XPCS IP (e.g., RK3568 MAC sid=
e
> >     SGMII), the PCS does not automatically restart auto-negotiation whe=
n the
> >     link goes down and comes back up. Without an explicit ANRESTART, th=
e link
> >     stays down forever.
>
> [Severity: Low]
> The changelog describes a user visible failure ("the link stays down
> forever") in long standing shared code, but there is no Fixes: tag and no
> statement about which histories are affected.
>
> The only hardware named here, RK3568 XPCS, does not exist in the baseline
> tree: searching for xpcs_rk, rk3568-xpcs or pcs-xpcs-rk under drivers/net=
 at
> 879e280b8486 returns nothing, and the glue driver arrives later in this
> series ("net: pcs: xpcs: add Rockchip RK3568 platform glue driver").
>
> Could the changelog either name the pre-existing commit being fixed, or s=
ay
> explicitly that the affected platform is introduced later in the same
> series, so that stable tooling does not have to guess?

The affected platform (RK3568 XPCS) is introduced later in the same
series. I'll make that explicit in the changelog so stable tooling does
not have to guess.

> > diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
> > index 0337e2bcc0125..50b9cdf94fdaa 100644
> > --- a/drivers/net/pcs/pcs-xpcs.c
> > +++ b/drivers/net/pcs/pcs-xpcs.c
> > @@ -816,9 +816,14 @@ static int xpcs_config_aneg_c37_sgmii(struct dw_xp=
cs *xpcs,
> >       if (ret < 0)
> >               return ret;
> >
> > +     /* Clear CL37 AN complete status */
> > +     ret =3D xpcs_write(xpcs, MDIO_MMD_VEND2, DW_VR_MII_AN_INTR_STS, 0=
);
> > +     if (ret < 0)
> > +             return ret;
> > +
> >       if (neg_mode =3D=3D PHYLINK_PCS_NEG_INBAND_ENABLED)
> >               ret =3D xpcs_write(xpcs, MDIO_MMD_VEND2, MII_BMCR,
> > -                              mdio_ctrl | BMCR_ANENABLE);
> > +                              mdio_ctrl | BMCR_ANENABLE | BMCR_ANRESTA=
RT);
>
> [Severity: Medium]
> Should the comment at the top of xpcs_config_aneg_c37_sgmii() be updated
> along with this change?  It still says the opposite of what the code now
> does:
>
> drivers/net/pcs/pcs-xpcs.c:xpcs_config_aneg_c37_sgmii() {
>         /* For AN for C37 SGMII mode, the settings are :-
>          ...
>          * 5) VR_MII_MMD_CTRL Bit(12) [AN_ENABLE] =3D 1b (Enable SGMII AN=
)
>          *
>          * Note that VR_MII_MMD_CTRL is MII_BMCR.
>          *
>          * Note: Since it is MAC side SGMII, there is no need to set
>          *       SR_MII_AN_ADV. ... There is also no need to
>          *       trigger AN restart for MAC-side SGMII.
>          */
>
> On the default path this same function selects MAC side SGMII:
>
>         } else {
>                 tx_conf =3D DW_VR_MII_TX_CONFIG_MAC_SIDE_SGMII;
>         }
>
> so the restart is now issued for exactly the case the comment says does n=
ot
> need it.  The new DW_VR_MII_AN_INTR_STS write is also a sixth step that t=
he
> enumerated sequence does not mention.
>
> If the databook statement no longer holds for these parts, could the
> comment be corrected, so that a later reader does not remove the ANRESTAR=
T
> bit as a mistake?

You're right. The comment still states that AN restart is not needed for
MAC side SGMII, which now contradicts the code. I'll update it to note
that on some hardware (e.g. RK3568) the PCS does not restart AN
automatically when the link comes back, so an explicit ANRESTART is
required.

> > @@ -1093,10 +1098,15 @@ static int xpcs_get_state_c37_sgmii(struct dw_x=
pcs *xpcs,
> >               return 0;
> >       }
> >
> > -     /* Clear AN complete status or interrupt */
> > -     if (state->an_complete)
> > +     if (state->an_complete) {
> > +             /* Clear AN complete status or interrupt */
> >               xpcs_write(xpcs, MDIO_MMD_VEND2, DW_VR_MII_AN_INTR_STS, 0=
);
> >
> > +             /* Initiate the next round of AN */
> > +             xpcs_modify(xpcs, MDIO_MMD_VEND2, MII_BMCR, BMCR_ANRESTAR=
T,
> > +                         BMCR_ANRESTART);
> > +     }
> > +
> >       return 0;
> >  }
>
> [Severity: Medium]
> Can this sequence get stuck if the xpcs_modify() fails?
>
> The latched status is cleared first, and DW_VR_MII_AN_STS_C37_ANCMPLT_INT=
R
> is the only thing that brings execution back into this branch:
>
>         state->an_complete =3D ret & DW_VR_MII_AN_STS_C37_ANCMPLT_INTR;
>
> So if the clear succeeds but the restart does not, every later poll reads
> ANCMPLT as 0, state->an_complete stays false, and the restart is never
> retried, leaving the port down with AN idle until something calls
> pcs_config again.
>
> mdiodev_c45_modify() does a read followed by a write, so there are two
> places it can return an error, for example a bus -ETIMEDOUT, or with the
> Rockchip glue added later in this series the pm_runtime_resume_and_get()
> error path in xpcs_rk_read_reg() / xpcs_rk_write_reg().
>
> Both return values are also discarded and the function still ends with
> return 0, so the diagnostic in the caller can never fire for them:
>
>         case DW_AN_C37_SGMII:
>                 ret =3D xpcs_get_state_c37_sgmii(xpcs, state);
>                 if (ret)
>                         dev_err(&xpcs->mdiodev->dev, "%s returned %pe\n",
>                                 "xpcs_get_state_c37_sgmii", ERR_PTR(ret))=
;
>
> Would it be better to assert BMCR_ANRESTART before clearing the latched
> status, and to propagate both return codes to xpcs_get_state()?

The current order (clear the latched status first, then restart AN) is
intentional. If the restart is issued first, the newly completed AN status
could be cleared by the subsequent write, losing the completion event.

I'll keep the original order and propagate the return value of
xpcs_modify() so the caller can observe errors on the restart path.

Best,
Coia
