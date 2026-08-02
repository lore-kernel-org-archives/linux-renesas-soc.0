Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594AB31E842
	for <linux-renesas-soc@vger.kernel.org>; Sun,  2 Aug 2026 18:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785695619; cv=none; b=bwK+3eIqsaoK0kRi5A5d0B/ghZ1O4Y+FsE29YwlwyqJWMA+4XPtQ0o9OjGfNSup7J2CULdQ88cXVLOrSg7VbL2G2w/kJdLHgzZI3QuoPEny3lXzA1cntq06y7unKnpBgm/JlH/EJVgrYNPz2G99Whp+ORUBMBP1CfhKPgWDXy54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785695619; c=relaxed/simple;
	bh=umEJ7RCFuYqWSju68xFX7t1iTgYwDk5WE0T4zmZHPww=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=sE9NVXvaUTo0qqO3qKzaRjzX7XwW8QohP0NWvsZJwruVx10drVZsNWFyX7zeakNaFalLD5RJg7CJdSQqObvOimN7GsIdolA7imCoKCvbSTqckrK2o9otC6cN/k5YcQ+Qb2Gf/6s72/aqqRzhGxV2oE9j52KpZJz34xy+1PhEQM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PS2ljPQs; arc=none smtp.client-ip=74.125.227.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PS2ljPQs"
Received: by mail-pj2-f11.google.com with SMTP id d9443c01a7336-2cf02ecb572so24665885ad.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 02 Aug 2026 11:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785695618; x=1786300418; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=AScFG8goSI/RgVxAO9BArK7H6La1AdrGmTueDgaxpTM=;
        b=PS2ljPQsO4is6Y1CK7txKj+QyuP8ACI3aMR5asljcURgegYVVtXlZ0qKykAUv+H1Wa
         lB/U3aDSHqLizZU7OX8GhtZScamYKdlQ5oN5nbKMGak1MhriVEapA+++9/i2jWMu//a+
         l19bjtqb3lCHHQD/J8z7R6YIYVf8nsqGy707j+3uEsFh4kVqG8s1RIhLXYZbUGEJJ1ye
         s5Ly2sPkfGlt8JUjFguy1P0PaxABNji3IcjdHZ3UdYGtzMj12bcT628SC2nGNPJ7ggHD
         7r+jWK+fFEGbTH2VIeFIwb4y0IS5yI+FclKp/AKOtZcWgKQC0YmeEQQN3en2ftgorsXG
         GeDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785695618; x=1786300418;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AScFG8goSI/RgVxAO9BArK7H6La1AdrGmTueDgaxpTM=;
        b=SUfuIigb5RgKMknsPRJbtoC9KUoKdBU3Egi2IBzh3WcFiuaIiHleVoFNzeBV+S7pIv
         Gf2+PlyOEGHo1NREs4haOggwclfoCiZU+3uhAdSGhIVRxSAR+MjcfduNoK1W5C73u3We
         g7bSb3qkBcFZO+UR2IkJx0vh3PU5udPwyXKiNZ6ThzOWc4fY5X+sQ+Xt7w/bSPwsJXFp
         UaS3gn7v5OUeZ0mMwlr5SA/jK+sSc88dna+vj9p+ISel+q2kQvCiv2ytBIj4MOM6IIJw
         E2K/nGZxNZYZ528JCLz64FDcA2XSdtPjXRvHH6+5pnFgQk4o/zC8qhRxk+xPXIp+FDji
         YVew==
X-Forwarded-Encrypted: i=1; AHgh+Rocr+eWX/nyRCsCcPRCz+/0z3jacWk4zN/L7n3gkcvBEExm9MQpXZwpEVMqi2qioYs8FTKmxCGikQ7NcZvWBdqqhw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxP3fy24qKrKDt8tfzhwHWuufiN8kjNbKd+AMGaeKI5Jor8Vock
	u58apX0CrSNQo/W2REXv1dkMVy+YazipoHtmAoJ/R5HCKGv4a0DX6/4E
X-Gm-Gg: AR+sD10sMnUahVaQWSMqeUSB0zn2jeAOd7TSBRDkQn33BhVsjCnjhdCiIiOaGc8k22/
	C8RXdWcVxgS1KxpobEfcY+OlswyFRb5R2kwkvJf49NkbrVLley3l6KS4LB2XCFxQIhUYuQGFlJp
	gIOjSUgnc4TLyAV+pWSrH+Nfd5Jg7UUsmXrFeeaLujUasD9bgB5loZHZn3gHjBBGLfLCta7swle
	XOW86b3PwD+Vw920kxngh0kwzbm0hm01xfokjDM+oUKf3VzdeAWpspLlmExCvQSFEcLNR+VkBwr
	jRY3pm7RO8MbtyGiVkj2J30PuT+M/mg4HMkThlBokXd+BwC+W0BUX0Chx4x5D90YtBonLzkV52/
	ahcmttnNXqIb2XMVCLp/ZfkNZ7hDllzmVNdh2Umnvi+pPpyt+w5DDq4MPlEgCLs68IZRYJ+VQgU
	HtqkAnZrIoYku4sZ1pZTespSGzkjw2M0N2+aImj4f3Qr5iCXJtO6MkvvGQCXHeFViP
X-Received: by 2002:a17:903:37c3:b0:2cc:d192:50b5 with SMTP id d9443c01a7336-2d05244b700mr76635895ad.34.1785695617537;
        Sun, 02 Aug 2026 11:33:37 -0700 (PDT)
Received: from ehlo.thunderbird.net ([2401:5a0:1000:10:233::14])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04ae5e347sm27973535ad.25.2026.08.02.11.33.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Aug 2026 11:33:37 -0700 (PDT)
Date: Mon, 03 Aug 2026 02:33:32 +0800
From: Coia Prant <coiaprant@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
CC: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Russell King <linux@armlinux.org.uk>, Shawn Lin <shawn.lin@rock-chips.com>,
 David Heidelberg <david@ixit.cz>, netdev@vger.kernel.org,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-renesas-soc@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_07/10=5D_net=3A_pcs=3A_xpcs=3A_a?=
 =?US-ASCII?Q?dd_Rockchip_RK3568_platform_glue_driver?=
User-Agent: K-9 Mail for Android
In-Reply-To: <302c67b0-6729-4930-a409-a2408dde33fc@lunn.ch>
References: <20260801142244.679437-2-coiaprant@gmail.com> <20260801142244.679437-9-coiaprant@gmail.com> <23d8e994-8552-466f-98e6-c47d5783525b@lunn.ch> <CALj3r0i5yVcJY8V75y0Hm5xjtZSBpH0DXSAWKsAUqguChVcxYA@mail.gmail.com> <302c67b0-6729-4930-a409-a2408dde33fc@lunn.ch>
Message-ID: <58C6FD30-02CF-4DC8-BE7F-4E2AAC5985E4@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On August 2, 2026 10:39:46 PM GMT+08:00, Andrew Lunn <andrew@lunn=2Ech> wro=
te:
>On Sun, Aug 02, 2026 at 11:20:27AM +0800, Coia Prant wrote:
>> > On Sat, Aug 01, 2026 at 10:22:31PM +0800, Coia Prant wrote:
>> > > The XPCS block contains four MII ports (0=2E=2E3), each of which ca=
n be
>> > > routed to GMAC0 or GMAC1 via the pcs-handle property in the MAC nod=
e=2E
>> > > The hardware maps these ports to different MMDs:
>> > >   - port 0: MMD 7 (ROCKCHIP_MMD_MII)
>> > >   - port 1: MMD 2 (ROCKCHIP_MMD_MII1)
>> > >   - port 2: MMD 3 (ROCKCHIP_MMD_MII2)
>> > >   - port 3: MMD 4 (ROCKCHIP_MMD_MII3)
>> >
>> > Why is port 0 called ROCKCHIP_MMD_MII not ROCKCHIP_MMD_MII0 ?
>>=20
>> Hi Andrew,
>>=20
>> The naming follows the Rockchip TRM=2E The hardware documentation refer=
s to
>> the MMD for the first port as simply "MII" without a numeric suffix, wh=
ile
>> the other ports are named "MII1", "MII2", "MII3"=2E I kept the naming
>> consistent with the TRM to make it easier to cross-reference=2E
>>=20
>> As I understand it, this is probably because the MII controls not only
>> Port 0, but
>> also the entire PCS (these registers are read-only in Ports 1-3 and ref=
lected
>> back to the MII)=2E
>>=20
>> If you prefer, I can rename it to ROCKCHIP_MMD_MII0 for consistency=2E =
Let me
>> know and I'll update it in v3=2E
>
>If the TRM gives it this name, then O=2EK=2E It just makes the code look
>odd, unbalanced=2E
>
>> > > +static int xpcs_rk_read_c22(struct mii_bus *bus, int addr, int reg=
)
>> > > +{
>> > > +     struct dw_xpcs_rk *pxpcs =3D bus->priv;
>> > > +     int dev;
>> > > +
>> > > +     if (!xpcs_rk_mdio_addr_validate(addr))
>> > > +             return -ENODEV;
>> > > +
>> > > +     dev =3D xpcs_rk_mdio_read_remapping(addr, MDIO_MMD_VEND2, reg=
);
>> >
>> > Does this mean C22 registers are mapped into the first 32 of C45
>> > MDIO_MMD_VEND2?
>>=20
>> Yes, exactly=2E The C22 register space (reg 0-31) is mapped into the fi=
rst
>> 32 registers of the VEND2 MMD (MMD 7)=2E This is how the hardware is de=
signed
>> and matches the standard C22 to C45 address mapping=2E
>
>Does the xpcs code actually perform any C22 access? A quick look
>suggests it is C45 only=2E xpcs_read() calls mdiodev_c45_read()=2E If C22
>is not needed, i would not provide these functions=2E
>
>>=20
>> >
>> > > +static int xpcs_rk_read_c45(struct mii_bus *bus, int addr, int dev=
, int reg)
>> > > +{
>> > > +     struct dw_xpcs_rk *pxpcs =3D bus->priv;
>> > > +
>> > > +     if (!xpcs_rk_mdio_addr_validate(addr))
>> > > +             return -ENODEV;
>> > > +
>> > > +     dev =3D xpcs_rk_mdio_read_remapping(addr, dev, reg);
>> >
>> > Should it be returning an error for dev =3D=3D MDIO_MMD_VEND2? Or at =
least
>> > if reg < 32?
>>=20
>> No, we cannot simply return an error here=2E
>
>Thanks for the explanation=2E
>
>       Andrew

Hi Andrew,

You're right that the xpcs core uses C45 exclusively, and modern kernels
no longer require C22 callbacks for mdiobus_register()=2E

However, I'd prefer to keep them for two reasons:
1=2E Debugging tools (mdio-tools, ethtool, etc=2E) often use C22 reads to
   inspect PHY/PCS registers=2E Having these callbacks makes debugging
   much easier without having to patch the driver=2E
2=2E It keeps the driver consistent with pcs-xpcs-plat=2Ec, which also
   provides both C22 and C45 callbacks even though the xpcs core
   only uses C45=2E

If you strongly prefer removing them to keep the code minimal, I can do
that in v3=2E But I think the debug benefit justifies keeping them=2E

Thanks,
Coia
