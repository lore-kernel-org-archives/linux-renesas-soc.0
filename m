Received: from mail-ej2-f9.google.com (mail-ej2-f9.google.com [74.125.228.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F447446060
	for <linux-renesas-soc@vger.kernel.org>; Thu,  3 Sep 2026 08:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.137
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788424703; cv=pass; b=sw3K84RwEIEIBn/t3VXK0W6dmW3RakwxbyT72QDscMcxs+/fzElNtqshLaR+mOeYEib4X9aOMgIPFLyfTLKMLYqSqs3iv/8uQEM9eOFFQ8GrnoJb51UcODUYJ0owc6cLB4X571QZRImIXhV1JTdDutZQZHf6j6WGzVPfapGcoto=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788424703; c=relaxed/simple;
	bh=TN4nRbj2sDa3jvcFws0KzC/xkvTzZd0I7H3ICwDkr5M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IF2F2LqEDCOUNop5aJT++fn5Za3RBp0CP8VIsd+Srvb2wZIJ5793XuCZaXB1/Zvb9EZwFL7ljoZ9zHPFW31wUhdIVAzXZRFadC4NaA+Ylgm2Q/UGLad6M+5Om9ap3mDAOWgCAMMdneqHnp3pFl/2a3UfgfUSy3Bgq9eRtO7Rcxo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q1KThPar; arc=pass smtp.client-ip=74.125.228.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q1KThPar"
Received: by mail-ej2-f9.google.com with SMTP id a640c23a62f3a-c252e3644eeso101729366b.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 03 Sep 2026 01:38:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788424700; cv=none;
        d=google.com; s=arc-20260327;
        b=AeFCaK3l9X4SLqRbLblTULAl5ciT4/kgl5gqGHPsuuz1AeNOBRtb9IsXdf73FZcftL
         8pY87WAzzWKZo90Ht3E1tzoyZw2HeqMhP6pgZa71GmeJe11pDXSEtA3TODVb8JeE7UPv
         yanrweB0uFfxiSWkrWr0ISF/hZ1RbYdzMegvnB6hrHfJtmMsX/wR9i1OipwvoZkni+ez
         d7NXAWrihjBRtE9SLqlMLW1/H1ErU1YrulfsxM7L86SBvaPdztjGlPn6ItwcE7if7Kty
         2DUg6uHGUwS5k0/DxugVjI4vm1GSblRDnRJ0n0rLvKhIIvbUMMFh5JRZfsoDImoGwuhP
         +9dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zLI/RWFajbdI/yeWFj7by+G0c5qK0/HsoOvw38Apr+w=;
        fh=aO0Veqfa63QddUmnXugvkEpCe29Ks3AImtxrsC/ya5c=;
        b=tAJgcCWEKhi3hbCxvKuA+X0ChB/BpuWfhsMeDdLrdLuta452vUckzQxuxFwuf1hC0s
         pq1QuaIXbrrLcG3cDaJSYd6NKtZrse0HDasc6VN5qra5+helHrTnw7lbCyXHonsnTfAD
         msEEpUqKUWZ3aNiGa9BRl4iZA/J1WcbLE3xBHyiKcbVnP0KkWMiSZvYPfSSpLAnOgeJ/
         /KVI5CeZ+bceva+b1nWSI/yOckfmeL+E/nfyH1CQEgT/mejw/hHj07kjdF1jfRMVlQ2+
         J8mCKP0MvquiMrEv2OZlU4kgxGF0u80o50U1wEPIVRcIJQ+mUAtv+i/3z+mx5Ww00UCX
         NeqQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788424700; x=1789029500; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zLI/RWFajbdI/yeWFj7by+G0c5qK0/HsoOvw38Apr+w=;
        b=Q1KThParMiBk4Ixunwx8k+m3hjhnkHFvvKa/rhPe7EdaK2d4h5ll32Q+RN67QTkOZc
         8jxQmYzl5TS07VD3JFNPsXT0GdrjJbvxGaOo+zQQeT9sDrsvPILQYn2pnpfVjLgYZO8Z
         FInD1IuGQjhejxZi/krDFs67sVD8bAV2k34bqwLj5fC9IEb8t5D4hZEbTdLazUtIwa7T
         sMzHihOT3uUvq0dWakEIb4jCpxHfKwelmP2DqJzndGfgj+zxWsUfPHSJ0RMA39h+rw1Y
         MxI1fZDXHuYjMUvVP0OKFEmzMZdKZxtpmYZ0QCiluqDwE5V9j0pR0CVmiaqcaIUFdiP1
         9bqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788424700; x=1789029500;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zLI/RWFajbdI/yeWFj7by+G0c5qK0/HsoOvw38Apr+w=;
        b=I5Sxf/fICX1DaD0s0IJMGmNOUHOwHlWCUenW6I6V2S+hMeao0MvuHpdAfjBMJ+oV4q
         MUg/b4KC4P/YNK5ADOYM+9qv1k+6Eqw37330OaytvM7W4uTTQACROipfufKyPrEJY3yW
         7kd88hyS0OmZ+vDYVO4Ia64BzmlMThdRbk+vX6IckCGgZgxO4DoWnNG9nwd5V1vW6Wh8
         CiLSTLgK5tDuQp4rVRDaDyoA/fwV84x12tJtnflmQyuXj3rsOz2XJS5YqiYsf/Wngo2u
         pxgWgAEnm6h9zJ9ICIVmPDZ5kVhCsRNS8jFQHuD8Ws75XsM2zfl4SBGOaU6Wn/MWlj33
         hzTQ==
X-Forwarded-Encrypted: i=1; AKwUvBzz2QG7H8rpczG1fp7HrWTloFskHyGVtTr7+mG2oYW394/plofVwoG6I4LdZneXQPzEAz5vH+8tQheoiWrnrexfxw==@vger.kernel.org
X-Gm-Message-State: AFuF++k3zqSK2veTWZSVwTIy64ofIN8RU8cRatWPanRcTeZJupTUktwI
	pKIpqURXflbSyXCAn165wcycbK34jJKL87cc8dt6OFv94F9AQgHLixj9uiJiNIqygllur5WfLwa
	du9mZiNMkK1XexcVp74HNOVadtXguKIo=
X-Gm-Gg: AYBFou1iwCKeDbjwzNokr+XqoY1qAgI3KPRKJuP/4RPE7sPckOYm3qoVIOZloKik3ze
	QGKyt/62QK5AiAbYCdhNuBVmvH/Uu+vE0uRFCWpkoSRWU7WNHd/b0o6Jz/pA6zrsPLGjp6VBJr3
	Kpq4YE1IKxYcDdYWRpgssrAeWKbFidYQn2pqNEF85wODu6QTqcJAWRBHIZD629YiBGVE9Fh6dTb
	s4loUX5l8PBH+MCf1k0cDOJ9jRkKylxYTQfB8IIKuCQsFixbF5c1F8rXDP6luH272nwXVnX5NSv
	sma9uLIHlAptpjjktnW5LMiXCQfahNqL6k7jdJTgUUSKyNabwizzC3obLvxUwtk=
X-Received: by 2002:a17:907:c71b:b0:c20:af9d:4533 with SMTP id
 a640c23a62f3a-c25d560c603mr627292366b.19.1788424699559; Thu, 03 Sep 2026
 01:38:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901150111.141037-1-coiaprant@gmail.com> <20260901150111.141037-9-coiaprant@gmail.com>
 <f07c64b4-3018-4e9d-8aea-12454f132419@bootlin.com>
In-Reply-To: <f07c64b4-3018-4e9d-8aea-12454f132419@bootlin.com>
From: Coia Prant <coiaprant@gmail.com>
Date: Thu, 3 Sep 2026 16:38:08 +0800
X-Gm-Features: AcwNN1VhuHjbmY1CA9bSBTxLCt2mOIIUXarfDkLXAsSy1buatA_CYmYfdE_lEPs
Message-ID: <CALj3r0hxSOrtRwOmAQ4Vw=nEkTfA+x93KzpAdG9m=xWFYbOuTw@mail.gmail.com>
Subject: Re: [PATCH net-next v3 08/10] net: stmmac: dwmac-rk: add SGMII
 support for RK3568
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Romain Gantois <romain.gantois@bootlin.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Russell King <linux@armlinux.org.uk>, 
	Shawn Lin <shawn.lin@rock-chips.com>, David Heidelberg <david@ixit.cz>, netdev@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Maxime Chevallier <maxime.chevallier@bootlin.com> =E4=BA=8E2026=E5=B9=B49=
=E6=9C=883=E6=97=A5=E5=91=A8=E5=9B=9B 16:34=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi
>
> On 9/1/26 17:01, Coia Prant wrote:
> > The RK3568 SoC integrates a Synopsys DesignWare XPCS that can be
> > connected to GMAC0 or GMAC1 in SGMII mode.  Add the necessary glue
> > logic to support this configuration.
> >
> > The current dwmac-rk driver does not support SGMII mode.  SGMII
> > requires a PCS to handle auto-negotiation and link state reporting,
> > but the existing driver only supports RGMII and RMII.
> >
> > Add a set_to_sgmii() callback to configure the GMAC GRF register for
> > SGMII mode (bit 7 set, interface selection bits 4:6 cleared).  Also
> > add a supports_sgmii flag to indicate SGMII capability.
> >
> > Provide pcs_init/pcs_exit callbacks to create/destroy the XPCS via
> > xpcs_rk_create() from the Rockchip XPCS platform driver, and a
> > select_pcs callback to return the XPCS to phylink.
> >
> > While at it, fix the clock enable ordering in rk_gmac_powerup():
> > gmac_clk_enable() is now called before any register access, including
> > the SGMII mode setup path.  Previously SGMII mode would bypass the
> > clock enable via a goto, which could cause synchronous external abort
> > when accessing MAC registers with the clock domain disabled.
> >
> > Also clean up the error handling in rk_gmac_powerup() by using a
> > unified clk_disable label, and add error handling for the default
> > (unhandled interface) case.
> >
> > SGMII In-band vs Out-of-band
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> > On RK3568, the MAC clock is fixed at 125 MHz and cannot be dynamically
> > changed by the stmmac core's set_clk_tx_rate callback.  In-band mode
> > works because the PCS handles rate adaptation internally.  Out-of-band
> > mode does not work because the MAC would need to change the clock rate
> > to 125/12.5/1.25 MHz for 1000/100/10 Mbps respectively, and the clock
> > is fixed.
> >
> > Enable default_an_inband for SGMII and disable the generic stmmac
> > set_clk_tx_rate callback.  This forces phylink to use in-band mode,
> > where the PCS is responsible for speed/duplex negotiation.  Without
> > this, the stmmac core would attempt to change the clock rate on speed
> > changes, causing TX to work but RX to fail.
> >
> > Link: https://dl.radxa.com/rock3/docs/hw/datasheet/Rockchip%20RK3568%20=
TRM%20Part1%20V1.1-20210301.pdf (Page 386)
> > Signed-off-by: Coia Prant <coiaprant@gmail.com>
>
> [...]
>
> > +static int rk_pcs_init(struct stmmac_priv *priv)
> > +{
> > +     struct device_node *np =3D priv->device->of_node;
> > +     struct device_node *pcs_node;
> > +     struct dw_xpcs *xpcs;
> > +
> > +     pcs_node =3D of_parse_phandle(np, "pcs-handle", 0);
> > +     if (!pcs_node)
> > +             return -ENODEV;
>
> Here aswell you make it mandatory to have a PCS, as the generic pcs logic
> introduced in patch 1 doesn't handle -ENODEV, it treats it as any other
> error.
>
> So, either you return 0 when there's no PCS (so that we don't break platf=
orms
> that don't have one), or you handle -ENODEV gracefully in patch 1.
>
> Maxime
>

Hi,

Currently, `rk_pcs_init` is called only for SGMII, which requires a PCS.

As it stands, only the RK3568 supports SGMII, so we won't break anything he=
re.

Best,
Coia
