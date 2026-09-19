Received: from mail-ed2-f7.google.com (mail-ed2-f7.google.com [74.125.228.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D00E37A49D
	for <linux-renesas-soc@vger.kernel.org>; Sat, 19 Sep 2026 16:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789835511; cv=pass; b=rI2IAlmBbQOquZjZvJJOf4TBgudvEczAX+Jg+qOZDK9Qp3d+Qw9mPuTudeTw471daIkawiGBae6o3ozAG/UVdiFUmYi61fryXrS8vezSn3J1P/slr2MStCCGR4zlJGDfxvOhtHQtP+eCQdWn4acqhOJntq14xeqMNrv8baw0w60=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789835511; c=relaxed/simple;
	bh=FoBb+MCNrssOL4O5BLzYqYW9vzpXkaseLuESacaKWDE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cf8x0WF1hLBIbolf8lqxpVZZfA1id31mRpOEzqHFNQMy2xZMuPai4JhvClGHnYl0yYbBD0zA5Fq3xHd6gzh2/j4yZ0lhpyd2o7biqDe8VG3FRTMSnXNhR2JhHwREDRQH5CxSXeFdfhL8/x2bbfnuUbkwKDBEXAmeTdHEdjE7x0U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YU/fQkKx; arc=pass smtp.client-ip=74.125.228.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YU/fQkKx"
Received: by mail-ed2-f7.google.com with SMTP id 4fb4d7f45d1cf-6aa70a9f847so110812a12.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 19 Sep 2026 09:31:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789835507; cv=none;
        d=google.com; s=arc-20260327;
        b=klhIqYXVgstx0uPPextVpkPDoEOW5z992wCwbxRWMzLvw7zu9b7m0QuOd3JD92ng8U
         BNk/RHEu4yWulAg7vtai7eBbgywb8lYasSGwf4Ghnm4nOFfq+VbdR9RtB5sg4sidPND0
         +Oy0dFI5CCuXL/E+ActEjkXK61kpXJ9VwrmXYMCUQD1yxcBVsqK+im8Ur0nVk1f+k7qa
         1HM7kwEiT38E+waIOEDeG6bcjmq4ii3aD9kV1nAR0qvvuEw+clEBGZdoaA9rdn0WnnVu
         y02TxNGW2I1gMBIdBSquu1/82V1l+tIy51sOvjTVBL5QTG6aGqLMJQTxr+K4/hAQvoRE
         g6CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FoBb+MCNrssOL4O5BLzYqYW9vzpXkaseLuESacaKWDE=;
        fh=sUqbAjVbpFAdkjIuxFjjj5p2itR/2cNjb+XjQvY5Pjo=;
        b=oxkiwufkNPMdgv7L1pFqLcuck274uxdEkqfSKZLtZMmAObluzYt4b1PQM7Xy6SBq0N
         fCDT++6vJK6TfI7JkN4utMCVrSZtXqbEhkRzykiUxK/W2ORzI6yEOEQL4arhDgY1yYqB
         JOCg+cBykDwCfTUIQQQ8O5y0XEG77AQEqqDcaQTzovBGDQMqLh2/y+j1JD5aSKxanrXp
         kO0lse+MERr7p+37Z7fZTLQv0uf4zaok8m3HYfL1cN80zvtrt2470LOPxSXdtkTKrI4X
         Qk1jHntvd2KAUmILqhGzXBTM/JZDGDZulk1IKaDEwZ9j1zl6NZyY860NmrbTNNcjRT3w
         ZKQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789835507; x=1790440307; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FoBb+MCNrssOL4O5BLzYqYW9vzpXkaseLuESacaKWDE=;
        b=YU/fQkKxZBFfeuL0PGdGq3LjQ+oGDTtEzHOZ+0rIHnMzsi3vSc+JT71del9bTYy/rz
         LJgUNA+YIQilqfvSwJ6pMO+lgpF2PF3ATJkf94+9Tq2yPN/q+dJRpbxW/ofuRWocity3
         8bRmBK0OTDng+YWqpxdHepX/eWrG4XA9YlfRQiuxuwJiHcGujv5pwoaORG8QKcn2Xfqm
         BMMJwGKf1UO/pyNN+Y1iDoJj0bA0pXTKS2Z6bw4XmTKruwb6CXNMhdO5vSfZzU3ZDKSa
         inIvUdTWW6VjOLu2LwdFeatX90srS/r6fpmUiV0LaDtpqlIIwp4W+S2ghJih+HMd44j6
         0rCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789835507; x=1790440307;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FoBb+MCNrssOL4O5BLzYqYW9vzpXkaseLuESacaKWDE=;
        b=YkOtqS557pmjphaPJf0ZRJnX7T5knFWejj51+nLH9jIPHxLOw9LD6HJQ/rHWm9E4IU
         QlMtl/q/pTK+Lt6cmxk0Dp2GG3w/XkN6f3BoME5xjoosmGSkUCn/u3b8S6BhWc+9Z6mD
         zA0sAkDrbzViK+URZTKudt4qbGjNDUDUSkpwHbLwkydJ1++ruD2myOLN47SZS07zS3Ye
         N8V2hfVH8Y+S+94h3ozs+0+IL/LRS+t/cN0hyTnUvpoDPp1Rn6UfBYs9fyU9WLAHBeZl
         fVsxObFiczk1At60ouBYUDH2b9DQEjYTrRKGjO68jLuWEEofT3vQftDv2JmNEphGv0gG
         yMmQ==
X-Forwarded-Encrypted: i=1; AKwUvByC5dznIjaSw98ZXsZqVKNMb/g+6JYZP0F2o8d/edvaN5cTPNLoMC5GtrJGtzFXFmlBJrtwUSy4ybc++7whSK/++w==@vger.kernel.org
X-Gm-Message-State: AFuF++nagEkFkwjO0+eYvGl7E3geVekBBnyQ8RLBpI5R6yFAoQ6cmdPz
	jV7ZfzPay2AkYEA9/eue56LHAoemMYmA8JVxi2nke3eGSp+7/2r95GHRX8Vuoern7eCrdiavaJ5
	c+V7sfF+9FimDy+zRgKDG2VcYGVQjIoA=
X-Gm-Gg: AYBFou2apTGCBp3rxLnXhGbPSv8tn7+i4HNUtR+y+3cVDdXa+trZfKT3S7Sd4VBWwZy
	sfrzJAYttZJc2/LRjhusxdYT+e4soKb2suknY8nYNyqVrhdKwSZNsXEQ+6HB31Ob57goBNUxkKH
	mxrFid9vmg6SLsamPi0JCqBqTPxIe3lKUOjz+NmIqD7MaTb5kTGdD+5Hga0Md2UXSF4Dj8zmDr2
	Bk9MNXlTT/4iT5Kq/aGJxbeP9k5iYB9sSq/7Bxdl9L5oywXnN1Wa89qxWshvvJUrotraqQynOF4
	jKPbap0y3BEoabdv2kZy6z9ebYmaH+dp8KlkMuLKyr0hcLZCBNnHwq81XA==
X-Received: by 2002:a17:906:2099:b0:c29:c575:de84 with SMTP id
 a640c23a62f3a-c2a164422b2mr337838566b.8.1789835507327; Sat, 19 Sep 2026
 09:31:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260919-s32g_serdes-v3-0-9d68868c1e89@oss.nxp.com>
 <20260919-s32g_serdes-v3-4-9d68868c1e89@oss.nxp.com> <6aabb56e-406f-4d13-9fd8-54822202039f@bootlin.com>
In-Reply-To: <6aabb56e-406f-4d13-9fd8-54822202039f@bootlin.com>
From: Coia Prant <coiaprant@gmail.com>
Date: Sun, 20 Sep 2026 00:31:35 +0800
X-Gm-Features: AcwNN1VbQyHS1-cJU3SdJ4oOQkYk_cjiBlklhRFTetXHOgzYOSwzbp6stXuvGvc
Message-ID: <CALj3r0g2FtxRRUDnG80SZJGSbpyBekTkd0R1ek-z-1h-d830ig@mail.gmail.com>
Subject: Re: [PATCH RFC v3 04/12] net: pcs: add NXP SerDes XPCS shared core
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: jan.petrous@oss.nxp.com, 
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>, NXP S32 Linux Team <s32@nxp.com>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Bogdan Hamciuc <bogdan.hamciuc@nxp.com>, 
	Ionut Vicovan <ionut.vicovan@nxp.com>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Clark Wang <xiaoning.wang@nxp.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Richard Cochran <richardcochran@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	imx@lists.linux.dev, linux-pci@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	Vincent Guittot <vincent.guittot@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Maxime Chevallier <maxime.chevallier@bootlin.com> =E4=BA=8E2026=E5=B9=B49=
=E6=9C=8819=E6=97=A5=E5=91=A8=E5=85=AD 23:31=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi Jan,
>
> On 9/19/26 08:54, Jan Petrous via B4 Relay wrote:
> > From: Clark Wang <xiaoning.wang@nxp.com>
> >
> > The SerDes subsystems found on NXP S32G and i.MX SoCs integrate a
> > Synopsys DesignWare Ethernet XPCS and an Ethernet PHY (PMA) with an
> > identical register layout. Only the register transport differs: indirec=
t
> > memory mapped access on S32G, Clause 45 MDIO on i.MX.
> >
> > Add a transport agnostic phylink PCS core which operates on regmaps
> > provided by the platform glue. It implements the phylink PCS operations=
,
> > the Clause 37 SGMII / 2500BASE-X / USXGMII / 10GBASE-R configuration an=
d
> > link state handling, soft reset and polling helpers, and the common
> > feature sets. The platform specific register sequences, compatibility
> > tables and quirks are supplied through a per revision descriptor by the
> > platform drivers selecting this core.
> >
> > The register sequences and the feature lists are derived from the
> > Synopsys pcs-xpcs driver, so its copyright is retained. A separate driv=
er
> > is needed because struct dw_xpcs is built around an mdio_device and own=
s
> > the transport, the reset and the identification of a standalone PCS,
> > while here the PMA can be shared with a PCIe controller, the bring-up i=
s
> > sequenced across both XPCS instances by the SerDes PHY driver, and the
> > transport is not always MDIO.
>
> Is there a way to avoid code duplication by wrapping the accesses into
> a mii_bus ?
>
> This is what the Rockchip submission does :
>
> https://lore.kernel.org/r/20260919125119.2107089-8-coiaprant@gmail.com
>
> Maxime

Hi Maxime,

The Rockchip approach (wrapping MMIO into a virtual mii_bus and reusing
pcs-xpcs.c) is indeed relevant here. Alex Elder's pcs-xpcs-regmap does
exactly that for the TC956x: it registers the XPCS through a regmap and
creates the virtual MDIO bus internally, with both direct and indirect
(page viewport) access modes.

https://lore.kernel.org/all/20260605010022.968612-4-elder@riscstar.com/

The indirect mode is very close to what S32G needs. For i.MX the C45
MDIO transport is different, but the bus wrapper could still be shared.

That said, I think there is a broader gap in pcs-xpcs.c: it hardcodes
behaviors that vary between integrations. RK3568 cannot use out-of-band
SGMII (fixed 125 MHz MAC clock), so its in-band caps should be
LINK_INBAND_ENABLE only. Today that means editing xpcs_inband_caps() or
duplicating it. NXP is hitting the same kind of problem with soft reset,
poll and EEE quirks.

A callback in dw_xpcs would let platform glues express those differences wi=
thout
copying the register sequences. That's the same pattern stmmac uses with
plat->pcs_init/pcs_exit.

Once that callback mechanism lands, I'll send a separate patch to wire
it up in pcs-xpcs-rk.c. Since the Rockchip driver is not even merged
yet, there is nothing to change there for now.

Coia
