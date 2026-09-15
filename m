Received: from mail-ej2-f5.google.com (mail-ej2-f5.google.com [74.125.228.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6630147CC64
	for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Sep 2026 10:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.133
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789467796; cv=pass; b=Z63arcjEjuMVqWJhnUm2+1aptwm3EmY2k1dj/43krgRUZ+2jkOf/0RGzZFNcWUvjwvsIVJavufJHc01B1K0cmXhXeyo7x2G9iqpXKJEtJRmVtMQMur6BMJKb9Hp+BhLeT0mG7hi/s0fafPcgPRhaM+7iEec0jjfoNw+6Zb1VMcE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789467796; c=relaxed/simple;
	bh=c3RIJ2i8Y04OYsadwKNxN56yhveUJrAsHw56HkKOmYg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NqDs16u+r2OiD7mF0E2Bd9H3VJKbiqurni7NqkFL0rKBe7W8lRcgfvvYnp5H31Do7wnkZeXszDhrYsDCdFidtMFVjPE7P8aO8Hj2q7g/gvTYxDMfLf8i7c36VbO4KnFetqtxY2TotzQpudhmhwgzNAl4G02CVkyr7JDGIA8AC/Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BD8BCWYb; arc=pass smtp.client-ip=74.125.228.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BD8BCWYb"
Received: by mail-ej2-f5.google.com with SMTP id a640c23a62f3a-c2950c25486so236813466b.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Sep 2026 03:23:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789467791; cv=none;
        d=google.com; s=arc-20260327;
        b=J/yGwzRS4mO6GAlTaYM9c/QxBzps+Vyl/B742LXgB7gpTo521ws+l80PBoruPyW6EP
         mN2Cyb5lTiVaMbqAwdFDVEjaXCeyas0+G+vmb6QBjM6VDjBuxp1y953GzVL5p5mxCnLC
         CYajt7h93DmxE07oK/1d+PED9jL/qtCLX0bbH544uRQmoSkPNW5w8RPg6p+c2Ny36/A7
         X5A4ywWwEQKsQEUBz1HocjDczDFU+hci3dFi4C6HgH3lMBRB30Xb8v0zTUbRjJTTkgkI
         HTsKDvgduuLZ6Nx08kjt6iVOJpZQ8etat8CaQTRG4dnuit3Tcw8nDSlgyjIP0crQ6n6+
         FRDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nYoTXRWm9dXxQab97Avfkm/YI6364EPnV/puvJGLZtc=;
        fh=4ohzrJIdG85qS7BdMJvreGa0rql9+8BzswWeDnvjJ1M=;
        b=f8KFQOeltOW8vI3zPQ9BTegfsGNDTdupGSZ0bEVTMW/FM1BvCFmHXAjdvW2GH6nXTO
         Z7JfrfPjlxYX5ujE9FluitVdR2SeVnJz8l6r85qurMYUnaJgzKLj7vbzH9w5bMvqv9x3
         m2pawsy+E0JmdrutNKrmK+VmWy9jLd4d4oz9T6SK+3wHCWhoJmNj9jkM3317eQZ35OUF
         C8W1BOqB/9CzSqz76mFHfTwIUXn79aCn1omxB7YIbXWVQ/ph6LN+gWgSFvCgbvdGmDAu
         ctAvF4VPPTZcZXOTwcKzvgRFrS4vgIwKTIYBASQD00luGEYjnv3fOaVkc2BC3ukcsrSI
         Qpyg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789467791; x=1790072591; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nYoTXRWm9dXxQab97Avfkm/YI6364EPnV/puvJGLZtc=;
        b=BD8BCWYbg/2D6ELs1XNumO73g7sbmRiB4WAMxDPiToc1VZH2i+07pszYcoto91GCXY
         ArGwZHhNqEP5889Yg2n28jOKLcwthlZlYdybB6pm0/hhBTFG7QCpJrECo/Uj2O3MTCHk
         j83wwHysm6Ikl3f7jPb7EgHswjSGL0ngI9QpvCXYzrtEPq/BQsVoDyxXECmQqeKKJrMP
         B8MNqasHbfvHd5Myw2ix2+naDoTWxgYCH9xYVl6mDx/Igns3/sNkYT6vb8kH4RuyeUrA
         m9MapE6PU8l8j7LCF+FWO52q69vLRYIwv4jqcQbbanJbsGI1D/7j4HiVAmcR5S1ElAyl
         s0yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789467791; x=1790072591;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nYoTXRWm9dXxQab97Avfkm/YI6364EPnV/puvJGLZtc=;
        b=BZwUc/2dtEm1nVRtAKTD/ZFoPNa7jx3CX7H3kO0KKB7MQZOQK1bKKrOrtdSwGga8/B
         5GqFPsr9yVRT0tosduXfpyVz/dxZYv2GKl8n71i2QTp7UzfkP3SQPHgNoY5Q+zmiTLBg
         cI84ZPDRm6qAhyMySXeLEPROW/Ub+bNHm0LqhbndQpSAA3/NCqUuE0A/BLBM0COh4UQk
         Rq0oqpPn6te5uJYD59IL0l5WULAfCjAohR+3id7Eg5Dj496+idBOrZc0iDTI5kKarQdD
         jA0gRaHnn9QVVLrY1+DvgwvGcjlmD+nKQXUNKZ0xdqMC5dluZApQ6FEBlZiGZUduGobJ
         lz+A==
X-Forwarded-Encrypted: i=1; AKwUvBzPvkEAXLmtUHPzfasH1H6ll3Pb3Y/qtSPnLJoc7z24hlgriqMsPqcucVOFPUhBahCZVUG/agBYZU6iyF7PHtdxzw==@vger.kernel.org
X-Gm-Message-State: AFuF++lEyEMY1HXnHP+Uy1cj+LalPviesckMCELeYxFPyd5bQZVHKMjI
	aWsyTrPEXWHqnOXYJ6INyG/5o3D1rlBGEFQwNzJPMpB6pyt9RyUv0kG4wn/jhRRALBuh+DdlYE9
	qB0nnFVoCFdc7HOoD2Eh3qUXlSdRyEu4=
X-Gm-Gg: AYBFou39ioYB2+hraZda/X5qLLcxUS+VbqcmkGS88V7adRQVUnP9SoTYRE6b4Ta50Hg
	2cfOoDYgncJ0YGbQ3Q/y7rOEMHuL66BlVAZcnnE0LhX/DP5g8y6F+4T9rS+SvNcEnXxScXjr2he
	dNQktKT2rjQ4RCfYbv/R4BObLhWDFCITzudoM9cjboPPNsu2egbyNK9bEi5OoOyQRDr6hsh7buK
	3a+RkOaxTIA6HjQHrRXu0nNHWh8KYi9ewKhznDPVYf7cwd8H4alH4IcdtPF76ke0AFr0t4fNLLC
	8PKasDg2moLqB7aEBJBB+PDFLinVarJpiLYO/v323Qa9RKVkLft9svineQ==
X-Received: by 2002:a17:907:3d56:b0:c25:6c9a:88bc with SMTP id
 a640c23a62f3a-c29b87339e8mr775899466b.19.1789467791028; Tue, 15 Sep 2026
 03:23:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260913185849.907479-3-coiaprant@gmail.com> <178941747711.22033.8495700704733189874@kernel.org>
In-Reply-To: <178941747711.22033.8495700704733189874@kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Tue, 15 Sep 2026 18:22:59 +0800
X-Gm-Features: AcwNN1XIwap_FwM1kV5GNhNfjY4yI0txPnJoW2RyomCTNzqIwhUfgmMQ2h9aiaE
Message-ID: <CALj3r0ge_AVi=jrUZh_T8cEt954S_Ah7Hi4QxkccjEm6zug_Ag@mail.gmail.com>
Subject: Re: [PATCH net-next v5 02/11] dt-bindings: phy: rockchip:
 naneng-combphy: add rockchip,sgmii-mac-sel property
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
> - [Low] Concern (validated as NOT a defect in the series context): the
>   binding adds `rockchip,sgmii-mac-sel` while, at this commit alone, no=
=E2=80=A6
>
> --
>
> dt-bindings: phy: rockchip: naneng-combphy: add rockchip,sgmii-mac-sel pr=
operty
>
> This adds an optional rockchip,sgmii-mac-sel property to the naneng-combp=
hy
> binding so a board can select whether the RK3568 SGMII interface is route=
d
> to GMAC0 or GMAC1.  The property is restricted to the RK3568 compatible v=
ia
> the existing allOf conditional and defaults to 1 (GMAC1).
>
> [Severity: Low]
> At this commit alone, is rockchip,sgmii-mac-sel read by anything?
>
> rockchip_combphy_parse_dt() in
> drivers/phy/rockchip/phy-rockchip-naneng-combphy.c does not look it up,
> struct rockchip_combphy_grfcfg has no pipe_sgmii_mac_sel descriptor, and
> no in-tree DTS sets it, so a kernel built from exactly this commit would
> silently ignore the property.
>
> This resolves itself later in the same series: "phy: rockchip:
> naneng-combphy: add SGMII MAC selection for RK3568" adds the parsing
>
>         priv->sgmii_mac_sel =3D 1;
>         device_property_read_u32(dev, "rockchip,sgmii-mac-sel", &priv->sg=
mii_mac_sel);
>
> along with the RK3568 pipe-GRF descriptor
>
>         .pipe_sgmii_mac_sel     =3D { 0x0040, 1, 1, 0x00, 0x01 },
>
> and the write in the PHY_TYPE_SGMII path of rk3568_combphy_cfg(), and
> "arm64: dts: rockchip: rk3568-photonicat: enable SGMII LAN port" adds the
> first user:
>
>         &combphy2 {
>                 rockchip,sgmii-mac-sel =3D <0>;
>                 status =3D "okay";
>         };
>
> So this is noted only for the record, since the binding and its consumer
> being split across consecutive patches is the normal series layout.
>
> The remaining point is a design question rather than a bug: is a raw
> uint32 MAC index the interface preferred here, or would a phandle to the
> GMAC controller node be a better fit for describing the routing?

The property maps directly onto a single bit in the combo PHY's own
GRF register (PIPE_GRF_XPCS_CON0 bit 1), which selects whether the
SGMII lane is routed to GMAC0 or GMAC1. It describes a mux setting
inside the PHY, not a relationship to the GMAC node. A phandle would
introduce an extra dependency edge between the combo PHY node and the
GMAC node for no benefit, and the raw value matches how the BSP and
the surrounding GRF properties describe similar muxes.

So I'll keep the uint32 form.
