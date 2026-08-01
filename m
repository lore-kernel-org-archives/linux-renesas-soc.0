Received: from mail-ed2-f0.google.com (mail-ed2-f0.google.com [74.125.228.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70980368D52
	for <linux-renesas-soc@vger.kernel.org>; Sat,  1 Aug 2026 19:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785611988; cv=pass; b=VajpdSynPqrODxJffiJziL/S0yctSeFDgS4qm9JyBWQ5FVxLtTw7g19JC/IsJJXpxNB6jND/DReEI8H0frRodw+CJVPohgPOwd5OAVwkqCrw6U4usRzBIs97AzdOF2D1v7JJvE6liy7KujnEX5D7MpZVrBCDpdRpwaS4cjOsPdI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785611988; c=relaxed/simple;
	bh=xMvoIasJmU6rvejNbR2b8pxLU/mmd1jsnCBevW1xB+s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IDWnRckfiyhknImCM+QeRfO4E84Fm0geE9j9Jz+ChXIBwzIJ5V6PMivYmFackLfRtifiCMilSMo6MMEI3UM3pEgva1QpfXa91oxpKgXsnqApDll2urcuwVCXGbmv6Y3tQXjRbRrWl/W7F9FN0yuSlOjy5ayTycRmkIB61vlAt+o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YDQolbSL; arc=pass smtp.client-ip=74.125.228.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YDQolbSL"
Received: by mail-ed2-f0.google.com with SMTP id 4fb4d7f45d1cf-698447ea5aeso966574a12.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 01 Aug 2026 12:19:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785611985; cv=none;
        d=google.com; s=arc-20260327;
        b=qOd4Wg0KMctgRjqVwt9hxc1TfhTFEALeOEk9uix4IBam5je6e84/cvvECFHnZrBt9W
         9Rr7ai2FgUvWzXkrhihIMs7XEPhQQ8n9ywIjtbzm47x6rFIivtkvyu56vul+oJFW9D7i
         meyANVQKg/ay0pM2RiEnm7MDDslddKc7Ur1ACQ0kPDSOZCJa33oPUrdIcUGdH6ZNu7d9
         1G/hoTfpS9APQkEE86n4ON4CVrHoLYl8hofE2i3JgL41iTkj6TdJsaawrI53dgAOZhP/
         TB44QGW4SPt/LuJmkVSvv+f+diPIBdRU3bgPPOE0FCzmF2ggT3B3FSM5L5pCmknAUT4K
         d/tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SCQm3Q/ph03r/XdeQCWy2Yw7OKUkw0PP1SQeQ3TZ+Pw=;
        fh=OSEeUZWnHqEFSmfm8hirs0FCl+nMEXYnY5XjFSpf76A=;
        b=Ig8Dg4SelNOlykuSdIfweceD9bnoITBKj5Y+2EDG2g4wTF68iSWt8nLoJYTOX6BNgq
         VzGpzyzJ38LrhMN069hiVK/YPhmr9NQbV36FAqSYx4Ec7SwcmGB6kz4cD+QFlUt5UkD7
         JvHX0GJ+OQ3T9dndspaox0p6c9PQXO+uIqafXxmgWIJbdYDGN+S3PAOWckVa5bE5yfa+
         +aDJovPHJur1VzpQHc/Op2yyOs5yERUxMASPOFbHS+ZKZcGDHyWCu5NqQBhSmnNZZzZd
         CawGxVwFTPiM2bDblRjN1tf3KLejiXOSazFjPQb+wHtoKGt94DrAyTuDjpOuF7mqLpsh
         MHJw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785611985; x=1786216785; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SCQm3Q/ph03r/XdeQCWy2Yw7OKUkw0PP1SQeQ3TZ+Pw=;
        b=YDQolbSLvcKW3PmlbCdNuRM1F3fJieiCmt9/fdP9GWFwrweEpvP0/6Lqu9rabJAPmw
         D//rGYZD3/2j0iOGQvLpgnWvF0xtqyInO/19CMs1aO3HEOLC/iIfVjDuItsvK2I4KG0n
         bEk6jpAbqvHPnwubK1Furla9u2kaosTveIjXIxVnk9iQkgFnJ6dE6znvfPqCJbjlHYuM
         F2miucV5axP1/24hc7ve1i4nmQb8Dhk5Ee/csj/0krHn8fiOdMNXBKdIeUBr+lHc+ccg
         04MzJ47NedLrKsVq9oZ8gicPRtYMg273OSXYXIqDvJXJ9u7/V9mjcVMaxDmD7K/aWD/0
         X/Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785611985; x=1786216785;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SCQm3Q/ph03r/XdeQCWy2Yw7OKUkw0PP1SQeQ3TZ+Pw=;
        b=QKbMgjq9ceaILchtLm9LNFJsIZdSv3U1emTvi0m47cwWcsFg7XsMmbsLNt6bln2RHG
         yGeG2y4SjUxYFwMENF1X0pYIxIxbGoE/B0HY25WDZi8c+957FtChIlgatQ/HgbcCNM8r
         bq+Yhx4dvUvEkRj3kYajaI6kzSG6P/rjcwcxfTDkWBQ8gRElegzaf+Ite2dDW+I7xIEZ
         P458Ra0ugw0FpYaIzGVQQMQ2VMyrrwSt7NLA6gLsAOOdtbouCbi9CcPPLB1W8yWixpT9
         GcNa79SQoaI9DvNViut07bK7tyvQrj4sgLSwfTrdgr7qtUAtX/m9tLMk19yyIpJGqv56
         n/7w==
X-Forwarded-Encrypted: i=1; AHgh+Rq8/j62ev3nuCiRZK6Z9xbv6FWX5qlRchEfI9k4yQAyp38WsBYoR98xJgUXDo7D+bOe6UrcjubjVER5CJwA0msQZg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+IgO0anOf+gi+i8hsGkhvOgk15cQ3RnAmXZ2UYGJ08eECc+NJ
	eYmBoAyEikYhAMKHe/FDmfh9kNzITXeX5+xmadSfQ+AkXn/O9K15fBulTVlXeqM5T9YTqehwPa/
	PxO6XQKZzQ/RC8cmb4JEU0rcEVOwEm30=
X-Gm-Gg: AR+sD13rQayUtsdSPWDnR3eb5JXpypBISdQRIU6UbpkaRJD44mbeX6PLHb4SVGG1QRU
	qpr3L7TmPVWV+As7fBLkwx5eART5wx7zN9dLTLja85RgdvJ/71Rr5aTxjdh2yBDNKJ8ZeRf2uyo
	v988BYGL/u+IrVcRVy/Yhw5tJ5XADXRrdvebvDd5rebNxTbC+dhzxvmWRvJChm1CnKfhjBol81o
	NT4gz8TUctJbGiFb+UWdp5vXO9EE4esqvqpD4LnqtgNbs5tvEewdGayb8LUUq22dYsa6CUElx7K
	AAkaQjp8eeZBC+9ccWeVId/rVC5so+i1lHbeAtJwF/rrPjt40CUoD6ABZQRV
X-Received: by 2002:a05:6402:440e:b0:697:f70f:8238 with SMTP id
 4fb4d7f45d1cf-6a0a7c6b76amr3103144a12.4.1785611984460; Sat, 01 Aug 2026
 12:19:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260801142244.679437-2-coiaprant@gmail.com> <20260801142244.679437-7-coiaprant@gmail.com>
 <2847036.GUH7pLUipS@diego>
In-Reply-To: <2847036.GUH7pLUipS@diego>
From: Coia Prant <coiaprant@gmail.com>
Date: Sun, 2 Aug 2026 03:19:37 +0800
X-Gm-Features: AUfX_mxTVYa8KO_KHMFv70Oru7_6E2Erl1Ah7ifU-aGIuPNS6S04bHqAgUqfw5o
Message-ID: <CALj3r0gqvFZPb2SKRMPwf9chCx076rwCnXEoOMFch_V-fOKV6w@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] arm64: dts: rockchip: rk3568: add XPCS and
 fixed-clock nodes
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
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

Heiko St=C3=BCbner <heiko@sntech.de> =E4=BA=8E2026=E5=B9=B48=E6=9C=882=E6=
=97=A5=E5=91=A8=E6=97=A5 00:28=E5=86=99=E9=81=93=EF=BC=9A
>
> Am Samstag, 1. August 2026, 16:22:29 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb Coia Prant:
> > The RK3568 SoC integrates a Synopsys DesignWare XPCS that provides
> > the Physical Coding Sublayer for 1000BASE-X, SGMII, and QSGMII
> > interfaces via its four MII ports.  Add the XPCS device node and
> > its pcs-mii sub-nodes to the SoC device tree.
> >
> > The XPCS device is accessed via the APB3 bus at 0xfda00000 and
> > requires the CSR clock (PCLK_XPCS) for register access and the EEE
> > clock (CLK_XPCS_EEE) for Energy Efficient Ethernet operation.  The
> > PD_PIPE power domain must be enabled before any register access.
> >
> > Also add two fixed-clock nodes (xpcs_gmac0_clk and xpcs_gmac1_clk)
> > providing the 125 MHz reference clock for the GMACs when operating
> > with XPCS.  These clocks are used as the assigned-clock-parents
> > for the respective GMAC nodes in board-level device trees.
> >
> > The XPCS node and its pcs-mii sub-nodes are disabled by default and
> > must be enabled at the board level when 1000BASE-X/SGMII/QSGMII is
> > in use.  The fixed-clock nodes are always present and do not have a
> > status property, as they are static clock sources.
> >
> > The XPCS node also requires a reference to the appropriate Naneng
> > Combo PHY via the phys property at the board level.
> >
> > Signed-off-by: Coia Prant <coiaprant@gmail.com>
> > ---
> >  arch/arm64/boot/dts/rockchip/rk3568.dtsi | 45 ++++++++++++++++++++++++
> >  1 file changed, 45 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3568.dtsi b/arch/arm64/boot=
/dts/rockchip/rk3568.dtsi
> > index 3bc653f027f1f..989e164c0eb39 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3568.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/rk3568.dtsi
> > @@ -110,6 +110,51 @@ sata0: sata@fc000000 {
> >               status =3D "disabled";
> >       };
> >
> > +     xpcs: pcs@fda00000 {
> > +             compatible =3D "rockchip,rk3568-xpcs";
> > +             #address-cells =3D <1>;
> > +             #size-cells =3D <0>;
> > +             reg =3D <0x0 0xfda00000 0x0 0x200000>;
> > +             clocks =3D <&cru PCLK_XPCS>, <&cru CLK_XPCS_EEE>;
> > +             clock-names =3D "csr", "eee";
> > +             power-domains =3D <&power RK3568_PD_PIPE>;
> > +             status =3D "disabled";
> > +
> > +             xpcs_mii0: pcs-mii@0 {
> > +                     reg =3D <0>;
> > +                     status =3D "disabled";
> > +             };
> > +
> > +             xpcs_mii1: pcs-mii@1 {
> > +                     reg =3D <1>;
> > +                     status =3D "disabled";
> > +             };
> > +
> > +             xpcs_mii2: pcs-mii@2 {
> > +                     reg =3D <2>;
> > +                     status =3D "disabled";
> > +             };
> > +
> > +             xpcs_mii3: pcs-mii@3 {
> > +                     reg =3D <3>;
> > +                     status =3D "disabled";
> > +             };
> > +     };
> > +
> > +     xpcs_gmac0_clk: xpcs-gmac0-clock {
> > +             compatible =3D "fixed-clock";
> > +             clock-frequency =3D <125000000>;
> > +             clock-output-names =3D "clk_gmac0_xpcs_mii";
> > +             #clock-cells =3D <0>;
> > +     };
> > +
> > +     xpcs_gmac1_clk: xpcs-gmac1-clock {
> > +             compatible =3D "fixed-clock";
> > +             clock-frequency =3D <125000000>;
> > +             clock-output-names =3D "clk_gmac1_xpcs_mii";
> > +             #clock-cells =3D <0>;
> > +     };
>
> I don't fully believe those clocks are "just there" inside the SoC.
> Instead I _assume_ they are generated by some oscillator on the
> individual boards?
>
> Because as described there, they would be just magically be there.
>
> So please aim for a real clock description (likely on a board-level)
>
>
> Heiko

Hi Heiko,

Thanks for the review.

During my tests, I found that the 125 MHz clocks (`xpcs_gmac0_clk` /
`xpcs_gmac1_clk`) are actually outputs of the Naneng Combo PHY
(SerDes) when it's initialized for SGMII/QSGMII mode, rather than
independent board-level oscillators.

Since these clocks are part of the SoC's internal design and
consistent across all RK3568 boards, I think keeping them in the SoC
dtsi makes sense to avoid unnecessary duplication. However, I also
understand your concern that they might appear to be "magically there"
without any explicit dependency.

To address this, I'm considering adding `status =3D "disabled"` to both
clock nodes in the dtsi, so boards that actually use SGMII/QSGMII can
explicitly enable them together with the XPCS node and the
corresponding Combo PHY reference. This would make the dependency and
activation requirements clearer.

What's your thought on this? Would you prefer adding `status =3D
"disabled"` to clarify the dependency, or do you think the nodes
should be moved to board-level dts entirely? I'm open to either
direction.

Thanks,
Coia
