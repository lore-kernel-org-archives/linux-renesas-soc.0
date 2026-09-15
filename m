Received: from mail-ed2-f10.google.com (mail-ed2-f10.google.com [74.125.228.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D69147ECC1
	for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Sep 2026 10:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789467981; cv=pass; b=jvj0c2kae/YXPjUD9/yHJkorCIePyELfJ6tVNlpdsknLXo0QYzYrPbpmz64oFHap+wWqntkHqjosXsTGWN8bXs8jDNIYnPYNK8SZMuvlo/921sa1kKUObPhF8G5fMoI1Cg5puccIabGj3ix+LghiKXDN0Jkz0B3qnJ8wL+0QOUw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789467981; c=relaxed/simple;
	bh=vZzYcJ1wT8Rd7uAkDW6XfZWMX25LGItG9EqsF3/2Qs0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EYZsI393ah60+xekIhfu94MzTfK0Bgyb9Ub/zDVcX0nQnGs6UIPku40xo56/05ctU97NiEhAHvGfdrl3oYL5tgNF6QWtq8PigCuv85tx/0RP8soZmOwhNUFBb3fOKttYcEcCC27ue+gr4IQxU17sTZUCeFNuWnzZeveo2nDHmEw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lY7XcFp0; arc=pass smtp.client-ip=74.125.228.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lY7XcFp0"
Received: by mail-ed2-f10.google.com with SMTP id 4fb4d7f45d1cf-6a14f2e937cso2496292a12.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Sep 2026 03:26:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789467977; cv=none;
        d=google.com; s=arc-20260327;
        b=FAkYuNS+pUtYqyc0eTy5uQh8q3ToT1R758tfB3DBzV0C0hkxGhaFp9KX84CIPNlL7x
         W441R6r7I/eLMQfYKIPC/gq3TpBejTM9pt91KgQXe31g4G93GmhCNdG53eZDsgdF1YvX
         VXwA88v4IOFKyOb332Bi8gYxn2DqjVC5nWIRtspGvLXZWnS8JhHRoJfKUO0s3BfLU7g/
         ltggjLpAar5ESVICFCT+cMsDcTVS7/7yH26mBMBs0dG5/1C1NHMRkVVisW/brQYksISt
         VUJIvVD3HqHrX6gQU07fwEkCh33ba5CJXHotXoL2Xv28L0mbEZqeDhLAGTsgybmirQDT
         i16Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PDmTn3anCnjZEAou9hrMuvIHzai6E6SOKUBtirHS8WY=;
        fh=/gFA6uqLPmQS18thU7vtSeQys28UsPJVagyJLV621yA=;
        b=iJQsasqw6R7oV2gj7ZJEnMFKgBMSJYQ1BM4IE0Rsm29VJsbrnV2Gf/5cuwy6C3X9sU
         VIQDDaCIT/b1OoUMTAbaihwGetw1VQThXaV+wTpS0G2+h2uyx7VyoTMOkyvJ2fS5lcTy
         b/mNu8CvYmSRZEsdq9RhgYZm7exjA6cS4dgVeWGF5pc0zENFUNoMM8S/lUDZ2ORpfklA
         AeCRKq5y2NxdUL/VaCDg6RrzQoC63ClavoSZIGzS7rvx+eSxfcc4X4kVyOU+RPTyO6M3
         91P5NaQlcMUVn8KUJlYQjSJbND4ZJWRO1lIKC71lOqRPV7EhzF8JZ59ZpfmvFn8ju07h
         XHiw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789467977; x=1790072777; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PDmTn3anCnjZEAou9hrMuvIHzai6E6SOKUBtirHS8WY=;
        b=lY7XcFp0DaklzYdRxlf81uipUv5eTR6q1EHJ6VSQFTIv/YFwkJo5spbxNLcEEOrAOn
         Jdq7jZj3j3YXu3SqT2BwylXzHoPkV0nSXCMEGcTBNbvbNtKP/gcP4ydsZH5eziyrUHD2
         9/ZSPcN9sLvbcJ0Y5gYIXFtyLcI9yETUOFYlFj5N5PTScDIb9vZE34ICPeTBg1nI1dAU
         yEAMMDQifn4uZD1uCdmMP52SDOzuEFyMIfNz/ylvr8rz75e551mGXKDS/seNsuZXqSqg
         R0yQonNdjUlqjYymQ6VNVlButSe9toe0uVOMTNz1zLsCsEvobzN4BlgFJRji5REYOvmJ
         NDkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789467977; x=1790072777;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PDmTn3anCnjZEAou9hrMuvIHzai6E6SOKUBtirHS8WY=;
        b=QmiRIKvKQTP+OzzWIJt5ghEh0mBUzrC44wiKEfQD4YvYW+GDC0TzLsZrS1Y4Tdp5AW
         HBMNTSLa9rIh7sVb23tLnrFTSj2CDA913fwXi2M+rjlp/YI14Yhu6+cagwAqvInjhyNR
         wL0VaL0iXvYk1dBxSSO9b0EAOlN/idsry6Vw9VspRwoXNlbwpsaCW1WlaqJooNQ3O/7B
         JH9Xey25g5O84EjpFPsXoL83TRywRxzxEYaCdYGLFA4mpkS9ikGx1Rq7O1klDTZopr1N
         cpf1DlZmkUf1rduVjdERX9g5UT3kwHVpx/8b1uUIoNRQE5CbmdI6ZiZaK6PavoYZJo1q
         Rskg==
X-Forwarded-Encrypted: i=1; AKwUvBy1s6Rhy1kdakZ/xVsC8vNrDd6rbLBe0HRd8X1LpgAsoymWgzOiS3BgggXeVZCObfEF7TOggvqqIHyo8sA963wPfA==@vger.kernel.org
X-Gm-Message-State: AFuF++nBSdc7YD01qeCV6Xj8dVU9J/QpDs6y0OBpOdvSozS3g1RbbsWc
	bc1iu507GjMLg39GXWf+57fu0JvpJEY18AOKvRDBAh073JiVJgT33ZFYBFwCngRmQwnz3Gvk5U7
	uHAzOedJL6lcfagiDx7uCaYUFdZ0VM2w=
X-Gm-Gg: AYBFou3cFlXuD+pmNXw5EoqqlGvAfzwtMWu52E7s74cNISNXjDsQ8fSyrmHkMw1eb7f
	orRV4ff/hRgyoNJvntmPWTf3q80fHOYCG1y4nDoFeujtZroqaMkHcLkCvMvdiQWBw7Flx+je5O2
	Fd08SsnlKtjE+usw+PDGVaw+YpFEhwR1isDKksIjPIRPhp9MUGbGZigOPmB0J+/wthdz3PMS6l+
	BaTeSO4WCT8TUjT1yNsYR8HQeshrIRxCwM0uAEL4N7mICDYZ5GcTLYdyEVelaX70+rMkV8kohvE
	+uRJpIy6B4OWijQw2WXs+h+A1KO7F0pqCUCvGBs4BDc29Wsrwvzf6WCKYQ==
X-Received: by 2002:a17:906:6a01:b0:c26:2205:3df8 with SMTP id
 a640c23a62f3a-c29d7717424mr36060866b.9.1789467977119; Tue, 15 Sep 2026
 03:26:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260913185849.907479-4-coiaprant@gmail.com> <178941747926.22033.15174869537556409251@kernel.org>
In-Reply-To: <178941747926.22033.15174869537556409251@kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Tue, 15 Sep 2026 18:26:04 +0800
X-Gm-Features: AcwNN1ULwDCN22NcSTGJGIqUo7wEAVDbHGW4RjkupXf6vRbCRoH1F1Vq6Gp7hg4
Message-ID: <CALj3r0hg6kchV72wSv0ybPVqG93D4_QnB-diFmW45jLZwoP_cA@mail.gmail.com>
Subject: Re: [PATCH net-next v5 03/11] phy: rockchip: naneng-combphy: add
 SGMII MAC selection for RK3568
To: netdev-bot+sashiko@kernel.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, heiko@sntech.de, vkoul@kernel.org, 
	maxime.chevallier@bootlin.com, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	romain.gantois@bootlin.com, hkallweit1@gmail.com, neil.armstrong@linaro.org, 
	linux@armlinux.org.uk, shawn.lin@rock-chips.com, david@ixit.cz, 
	netdev@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<netdev-bot+sashiko@kernel.org> =E4=BA=8E2026=E5=B9=B49=E6=9C=8815=E6=97=A5=
=E5=91=A8=E4=BA=8C 04:24=E5=86=99=E9=81=93=EF=BC=9A
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider:
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 0 =C2=B7 Low: 1
>
> - [Low] In rk3568_combphy_cfg() (drivers/phy/rockchip/phy-rockchip-
>   naneng-combphy.c:881-882) the newly added write of pipe_sgmii_mac_sel=
=E2=80=A6
>
> --
>
> phy: rockchip: naneng-combphy: add SGMII MAC selection for RK3568
>
> This adds a "rockchip,sgmii-mac-sel" DT property to pick whether the RK35=
68
> SGMII interface is routed to GMAC0 or GMAC1 via PIPE_GRF_XPCS_CON0 bit 1.
> The value is read in rockchip_combphy_parse_dt() and programmed from the
> PHY_TYPE_SGMII branch of rk3568_combphy_cfg().
>
> Link: https://dl.radxa.com/rock3/docs/hw/datasheet/Rockchip%20RK3568%20TR=
M%20Part1%20V1.1-20210301.pdf (Page 229)
>
> One question about the commit message wording:
>
>     The hardware reset value is 1 (GMAC1). If the property is set to 0,
>     the driver routes SGMII to GMAC0; if set to 1 (or omitted), it
>     remains at GMAC1.
>
> Does "or omitted ... it remains at GMAC1" match the code?  The write in
> rk3568_combphy_cfg() is unconditional, so in the omitted case the driver
> does not leave the bit alone, it actively programs it to 1.  See the
> inline comment below.
>
> > diff --git a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c b/drive=
rs/phy/rockchip/phy-rockchip-naneng-combphy.c
> > index 7843356a4dd47..7b867e7520064 100644
> > --- a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
> > +++ b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
>
> [ ... ]
>
> > @@ -375,6 +377,9 @@ static int rockchip_combphy_parse_dt(struct device =
*dev, struct rockchip_combphy
> >
> >       priv->ext_refclk =3D device_property_present(dev, "rockchip,ext-r=
efclk");
> >
> > +     priv->sgmii_mac_sel =3D 1;
> > +     device_property_read_u32(dev, "rockchip,sgmii-mac-sel", &priv->sg=
mii_mac_sel);
> > +
>
> [Severity: Low]
> Since device_property_read_u32() leaves the output untouched on failure,
> rockchip_combphy_parse_dt() ends up with priv->sgmii_mac_sel =3D=3D 1 bot=
h when
> the property says 1 and when the property is absent.  Is there a way for =
the
> driver to express "leave the bit as firmware left it"?
>
> Before this patch the kernel never touched PIPE_GRF_XPCS_CON0 bit 1, so a
> board whose bootloader routed SGMII to GMAC0 kept that routing.  With thi=
s
> change, a DT that instantiates the combphy as PHY_TYPE_SGMII but does not
> carry the new property has the bit re-programmed to GMAC1 on every
> phy_init().  Can that break such a board's SGMII link?
>
> >       priv->phy_rst =3D devm_reset_control_get_exclusive(dev, "phy");
> >       /* fallback to old behaviour */
> >       if (PTR_ERR(priv->phy_rst) =3D=3D -ENOENT)
> > @@ -873,6 +878,8 @@ static int rk3568_combphy_cfg(struct rockchip_combp=
hy_priv *priv)
> >               break;
> >
> >       case PHY_TYPE_SGMII:
> > +             rockchip_combphy_param_write(priv->pipe_grf, &cfg->pipe_s=
gmii_mac_sel,
> > +                                          priv->sgmii_mac_sel > 0);

The hardware reset value of PIPE_GRF_XPCS_CON0 bit 1 is 1 (GMAC1),
so programming it to 1 when the property is absent produces the same
result as leaving it alone =E2=80=94 the bit is already 1 after reset. The
"remains at GMAC1" wording in the commit message reflects that.

SGMII has never been functional on RK3568 in mainline before this
series, so there is no existing in-tree or out-of-tree board whose
SGMII link could be broken by this. A board whose firmware happened to
route the bit to GMAC0 still cannot use SGMII with a mainline kernel
before this series, and will need the new property to describe that
routing once it can.

> [Severity: Low]
> This write always happens, including in the "property omitted" case, and
> rockchip_combphy_param_write() sets the write-enable mask along with the
> value:
>
>         tmp =3D en ? reg->enable : reg->disable;
>         mask =3D GENMASK(reg->bitend, reg->bitstart);
>         val =3D (tmp << reg->bitstart) | (mask << BIT_WRITEABLE_SHIFT);
>
>         return regmap_write(base, reg->offset, val);
>
> so with priv->sgmii_mac_sel defaulting to 1 the register gets
> (0x1 << 1) | (GENMASK(1, 1) << 16), i.e. GMAC1 is forced.  Would it be
> better to only issue this write when the property is actually present?
>
> A second question: bit 1 of PIPE_GRF_XPCS_CON0 is a single SoC-wide mux,
> while the property sits on a per-PHY node.  If two combphy instances that
> share the same rockchip,pipe-grf syscon are both brought up as
> PHY_TYPE_SGMII with different property values, the last phy_init() wins a=
nd
> nothing is reported.  Should conflicting values be rejected or at least
> warned about?
>
> >               rockchip_combphy_param_write(priv->pipe_grf, &cfg->pipe_x=
pcs_phy_ready, true);
> >               rockchip_combphy_param_write(priv->phy_grf, &cfg->pipe_ph=
ymode_sel, true);
> >               rockchip_combphy_param_write(priv->phy_grf, &cfg->pipe_se=
l_qsgmii, true);
> > @@ -984,6 +991,7 @@ static const struct rockchip_combphy_grfcfg rk3568_=
combphy_grfcfgs =3D {
> >       .con3_for_sata          =3D { 0x000c, 15, 0, 0x00, 0x4407 },
> >       /* pipe-grf */
> >       .pipe_con0_for_sata     =3D { 0x0000, 15, 0, 0x00, 0x2220 },
> > +     .pipe_sgmii_mac_sel     =3D { 0x0040, 1, 1, 0x00, 0x01 },
> >       .pipe_xpcs_phy_ready    =3D { 0x0040, 2, 2, 0x00, 0x01 },
>
> For what it is worth, the only in-tree SGMII consumer at the end of this
> series, rk3568-photonicat.dts, sets rockchip,sgmii-mac-sel =3D <0>
> explicitly, so no upstream DT changes behaviour today; the concern is abo=
ut
> out-of-tree or ported device trees and about the commit message wording.

There is no in-tree case where two combphy instances are both brought
up as PHY_TYPE_SGMII with different values. This is a single SoC-wide
mux and only one SGMII link exists on RK3568, so the situation cannot
arise on real hardware. I'll leave it as is.
