Received: from mail-ej2-f6.google.com (mail-ej2-f6.google.com [74.125.228.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8705A367B71
	for <linux-renesas-soc@vger.kernel.org>; Sun, 13 Sep 2026 15:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789314448; cv=pass; b=ny1A6DyZ8U6nHY4SwMyMomewgDY/TB6D7YCKP8qyeWJnMOpgOEjmcKSqDOKf15hqdpXyyEmjBbWAJY6Acdz0jDhiTLRuJ8CGXZY+ytfSqdRCaoZ6cOIm9kzy8fgP6kRr+G458ke4ITCRw5naA4eOZdhN/JwhJ3Zcfyv8MJ+TyUQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789314448; c=relaxed/simple;
	bh=0J4H18xBnaTXwWA0eFc908GPhTPH1AfqEK/WH2weBo4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QkJDDv9CYwU3c8gX4tljQdqKkZUOBHsolmcCruiAATnqKk/wYlLbJhKNVDQeXqlIBxPLfYxh/7EYWWQ1upXyi5sGq/1vTOE2BRI0oTs1r5QQ7XRo1n278j7TwrMHbfc2YfQhYzuwh2NvDrbm4iAP7XiISw5gey1Ksdi/Efs3BFI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GQao12pB; arc=pass smtp.client-ip=74.125.228.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GQao12pB"
Received: by mail-ej2-f6.google.com with SMTP id a640c23a62f3a-c294716dbf3so186856266b.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 13 Sep 2026 08:47:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789314444; cv=none;
        d=google.com; s=arc-20260327;
        b=GX0YPK3MOEIf+u0cYpxCWPznLthZCnWjvCuNV9bM3QNbuMSs/C7mn7Y6lk1DPZvceS
         lRHS46/Sh78zAiQfIDrhuO9YToTe6u1JKdon5eoX4CnK/+d4SRCPUZ9A5+CDGFPE5bQ1
         7en08gtO/0APmPZL9qo+WtlKGj5ouqtIZRnwFtj+xfV7CRVk9LlSoDxuycgomfbBjHTO
         jUgrCCy8d2MDklJ6Cb/XEEdqgKDpJU29lTafWJ3GS1s5DPBAiXD1/m4McUuzQPetWOOc
         XeX12ZxXDOUXoxcAZPRzgc+u/ruszsAvLQkyQcj3xVKB6Io7A/G6byY2qQiIWHrQCx2A
         p9kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xd4RtXYSQe4fX2yQzgQaQhaAGqt8/5t2s9pKA9e2Z/M=;
        fh=UpVDfO1rDeb0quRz0uX2l601Rj5kn4Fix3tj7zN8r1E=;
        b=kF6Mefdc1DH78sOnLDmt27KODUbBvN/cW+PN0frrnRYUNEaEa/PDziKJhVvcD26BTV
         ciA/YlJvtXYm+QYR+eqmplwZPcriDZkc0bbSsoCTERCKj4ekU5wv8twiGOOHSj/2Q+R6
         ZoM1veMGyGGCQtF7fkPaunqWIFipQn2D/5AMhvidyaw8qGo1M49QbdjYBBGC0N1wtEpT
         4QCt4E3YDl4x9LdbmEFRrsavLFl57QnqkU+eZCIxmo1mp1weVd7C47CxXCz1S4mloG73
         s2KG2iuiWnv4ZmCS7dRkDoqbZ8bTE0fAZDBwt0q2CA2wj67G55dmZGYtj8sFCttrA59U
         +27w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789314444; x=1789919244; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xd4RtXYSQe4fX2yQzgQaQhaAGqt8/5t2s9pKA9e2Z/M=;
        b=GQao12pBWJj5yV02h/hWeLD1RM4nG2jHYtiTAKgXq3mc7t5SVXc8G1cNXJ9BfvNK1G
         lUH0HSbIak1kHn22z/2CBwBbQoZZExeYqs5ckO06cyLATQNssR3E08fiM6GQvtMfHm2H
         B+5sh9rueSIYKHdctZRkfyedkAiYp4PFP7v34v4Uri9+d9TS+7lExh/VT409KOUe8l9v
         yPAgr89qVQXQO+zOk3NrR+ezBcxjWQnP9KUFLi3R3DNarGQFFOwZPywJ5PWUegvU+zAr
         sPIY8Mt6J4ljACadBSYeEfLIPNX9FQGJy2KVDoauIMLdUQxBNXHO1mWR7FJgAa/p2IjK
         GvHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789314444; x=1789919244;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xd4RtXYSQe4fX2yQzgQaQhaAGqt8/5t2s9pKA9e2Z/M=;
        b=RqfKSCVY6etZvLsnsu6rEyYlAjBkSOLzi90O2LwBmONcVSlfiujGjCawelNLB/aR0Q
         Py4bXzH+n1VhM8Eoutx6m09e9n9BW+tWsaKEkkyfmuZ17f0Sa/qwtR9kVLYiIKuPQPvR
         V54uvYwrZ8dcOUS2c9hNK4sCpbnosSCNJUAaMmob39M8x5Avlg2SzPMQtm0PyJ5N1qnl
         ZTZQ3i/jyOgBT0BES7wvJV1njs96hzMTyX/uXy6Eex65jGoVYnDl5pxTAda+iWMiPSPp
         y51f8QrkWNiDOCQObJ9n5IpUVFGVe9XEee53iNFhVbhpLpBVjlF7d6BT+kbxwpAJWzPF
         9+Sw==
X-Forwarded-Encrypted: i=1; AKwUvByK8JccIkTHs8Cy3A+LhgqpZ43MxbROJyFGOoALEm83wdNoaqDYJQIbICnvhkKUNCrHGqPtDkv/OawKJ7dAzMaegg==@vger.kernel.org
X-Gm-Message-State: AFuF++nKo9H9Va4Fa3DPg2ff5Ic8vHCU1Qu1V/S2g4Ya//ZMl1MD/ilk
	mMITfNd0bBeIxsJel4W7IiQkPKaeQw+Vy3c4D5+oqiDjLkKBBf9invmAzTyo+CnfZJeyOdv6Bzu
	VAXcHdXzBxkd2xIB8ABe3lxX3vsA24ZY=
X-Gm-Gg: AYBFou1lIr6HiLlDhvPzB6wH4Y4YuJWhvWUfVjrTqGRjhRdXXkSjeUFHE7Bt8jBfjRX
	VMkratbTweixv7xrt881356kPIAO5f5psymwvfZBCGEQ/hh8qfLYBDRsvCG3BHicAEtKbo+6b/F
	LZSW6B/x53ZNNecS95fLTrW79FTXuyvaHeSrOaT3Yl2UJvpGj8zhpIsh/PtrcTSzqrYegUhbV3Z
	4K6iWDQJrHIudN10OoLe8nwGSFbukO9L7EvkPPvJcBahNsjMBmmA83jIdWhHZN7SRHYeWyfAW5F
	BvKDtrt+ne3Zfd5a2xmw8ZksUODlD0vidrTwFaI6VWzAU9qoFbipgsZUD36gO8ZP6jpI
X-Received: by 2002:a17:907:b049:20b0:c26:2f5e:29c7 with SMTP id
 a640c23a62f3a-c29856af6e3mr248244566b.7.1789314443704; Sun, 13 Sep 2026
 08:47:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907153713.2572547-7-coiaprant@gmail.com> <20260912201325.127009-1-kuba@kernel.org>
In-Reply-To: <20260912201325.127009-1-kuba@kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Sun, 13 Sep 2026 23:47:12 +0800
X-Gm-Features: AcwNN1UukBh9R-kSgJT1DSG6HaucuFjaf0b71SnVjdkjmimZTMpjLzcMh3JEWAU
Message-ID: <CALj3r0h7ZQKPvMZbjpy0Cc=u0LvS+WAXUFNcsi+gWY9OxL+jfg@mail.gmail.com>
Subject: Re: [PATCH net-next v4 05/10] arm64: dts: rockchip: rk3568: add XPCS
 and fixed-clock nodes
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
> arm64: dts: rockchip: rk3568: add XPCS and fixed-clock nodes
>
> This adds the RK3568 Synopsys DesignWare XPCS node (with four pcs-mii
> sub-nodes) plus two 125 MHz fixed-clock nodes used as GMAC reference
> clocks.  The XPCS node and its sub-nodes are disabled by default and are
> meant to be completed and enabled at the board level.
>
> A couple of questions about the new nodes below.
>
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
>
> [Severity: Medium]
> Does this node validate against the binding added earlier in the same
> series?  Documentation/devicetree/bindings/net/pcs/rockchip-dwxpcs.yaml
> lists phys and phy-names unconditionally:
>
> required:
>   - compatible
>   - reg
>   - "#address-cells"
>   - "#size-cells"
>   - clocks
>   - clock-names
>   - phys
>   - phy-names
>   - power-domains
>
> The node here supplies neither, and dt-validate does not skip nodes with
> status =3D "disabled", so dtbs_check should report "'phys' is a required
> property" and "'phy-names' is a required property" for every rk3568 dtb
> that includes this dtsi.
>
> At the tip of the series only rk3568-photonicat.dts fills them in:
>
> &xpcs {
>         status =3D "okay";
>         phys =3D <&combphy2 PHY_TYPE_SGMII>;
>         phy-names =3D "serdes";
> };
>
> so rk3568-evb, rk3568-rock-3a, rk3568-roc-pc, rk3568-radxa-cm3j,
> rk3568-wolfvision-pf5 and friends would still be missing them.
>
> If which combphy carries SGMII is genuinely a board-level choice, should
> phys/phy-names be moved out of the unconditional required: list in the
> binding instead, or should the dtsi provide a default?

As I replied in the earlier patch, dtbs_check and CHECK_DTBS only
validate required properties for enabled nodes, as confirmed by Rob
Herring. The xpcs node in rk3568.dtsi is status =3D "disabled", so
boards that include rk3568.dtsi without enabling XPCS will not trigger
any validation warnings. Only boards that enable it need to provide
phys and phy-names, and they do so at the board level.

The phys/phy-names properties cannot be moved into rk3568.dtsi anyway,
because the SerDes connection is board-specific: some boards use
combphy1 for SGMII, others use combphy2 (like Photonicat).

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
> [Severity: Low]
> These two node names take the deprecated branch of the fixed-clock
> $nodename schema.  Documentation/devicetree/bindings/clock/fixed-clock.ya=
ml
> has:
>
>   $nodename:
>     anyOf:
>       - description:
>           Preferred name is 'clock-<freq>' with <freq> being the output
>           frequency as defined in the 'clock-frequency' property.
>         pattern: "^clock-([0-9]+|[a-z0-9-]+)$"
>       - description: Any name allowed
>         deprecated: true
>
> xpcs-gmac0-clock and xpcs-gmac1-clock do not match the preferred
> pattern, so they land on the "Any name allowed" branch.  Newer Rockchip
> dtsi files use the preferred form already, for example rk3528.dtsi with
> xin24m: clock-xin24m and gmac0_clk: clock-gmac50m.
>
> Could these be named clock-xpcs-gmac0 and clock-xpcs-gmac1?  The labels
> xpcs_gmac0_clk / xpcs_gmac1_clk and all references would stay the same.

You're right, xpcs-gmac0-clock and xpcs-gmac1-clock do not match the
preferred clock-<freq> pattern in fixed-clock.yaml. I'll rename them to
clock-xpcs-gmac0 and clock-xpcs-gmac1. The labels xpcs_gmac0_clk and
xpcs_gmac1_clk will be match clock-output-names.

Best,
Coia
