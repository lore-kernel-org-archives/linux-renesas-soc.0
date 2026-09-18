Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE9951FCB9
	for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Sep 2026 18:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789756260; cv=pass; b=mrsjPbdgxpNWYUTujNoCk5vKhz+ABooQ+39/6jF9zW+u9yF2Hi5MXEbmO4043f2D3mFAO3bQeKVarhF++EuD5o0CIHQzhw71RepZCcufcOnLRbYBp8+5u4a6f12Zq12jb02En+cC3Nt6xEMWtPHWxMlh/wgEkrh8VqhA/wrkyg4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789756260; c=relaxed/simple;
	bh=Z3GCDadB22nJ3H8dlp8oFEKsrJ7JLQwFPKhgk/HwR1E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hjZtUbtuqN9FeXB6p/apPC20g3wUSyzdQg/iJlLURtncWfBMphQjwCEh60U54vxqrwMQc91pqWSk6C2zNsoe2ZiroZhcRRDNFnOzQSp6g2E3QlJNE73t+5wvo1Juf4d6P8Yy7fzo67ux09RlxVuSe4Zgd2/RbTTUq1naTIK75QM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C7pXUP8g; arc=pass smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C7pXUP8g"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-398a1676000so986303a91.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Sep 2026 11:30:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789756253; cv=none;
        d=google.com; s=arc-20260327;
        b=lnQQmbu/GjYxM3ZLb80fhxQQnoPtHniUQr0rCfZNtEJOcnv0YF+l4K7mN+tJhxPt2O
         lb+XLIugRBHStyDj+ISiB3i9uruVgfl+uoILPmxYPn8cLo2uGL4ip3fd5Cxf3BP459jV
         11McAAkyyRGiKmZs+NUaC7kHHD9k2G4geHAf6pH9e/D9RnIggMGRwV6abCGc5WmZHeJh
         j1/hmlb6b0RehTnHUbaR4CXppuHB1/6i407LXjgXMEaGuiLeuY0nVfWXF825XgTC4H6l
         iUIwL3ZZWfnPkKVlFoTgh2dBg94+8gwldL8HcopGufAoi8/qQEbfgF3VF+6ULjg/K/YL
         daRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UthLOTqsgx1H7Ky6X1sMBpSJ/ushOzRSeE2EVOIQouM=;
        fh=E9LUvmTWVmQK63eXVkLmNAlBbjc6ccHrsNZCNFys9gE=;
        b=ZOw2h5DkFHRnGX3Y2XEgvCG4jrjD5ROFEjTiroPGczf3TpQjy9mXcBYtdwLLDPCk6P
         C3EykPSCPLqMBomxrMJ2yZAbbTqr6eDHPl/L7liq1iSoxxIUorfO4gXBt5p+LF+T//2I
         Mxw9fImSb093F8BuTEsiv+Bn3WfH0or+8ahNzwsd2lc7uLl8e4EJydT7B5CSfLx1rTMs
         TH5/JchTwpJuEfCEY1iVvB2q67KXcoCd9A7EuOQgnlgTNdfNPSRZ/PM/ZwPYTJ4oOMzI
         hpIngt7gZOEZkgZWRDfGaHFdhwjZ5jNk8JrAE0kbwcvlbRBhML8CkEat/3Cr0lvsypNm
         mVkA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789756253; x=1790361053; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UthLOTqsgx1H7Ky6X1sMBpSJ/ushOzRSeE2EVOIQouM=;
        b=C7pXUP8gPhskr6JrmaOqzZbQFyo1KCY0eWKQkzc1OTFuEgVNYdOOrYRvHXw4nvnV9X
         mBJPmUNTK38gMHYRi6phSIKGl4On4aHQGIrh/tv15tmpYc/TdZdWJidlJ3FLVoSdZv3A
         FMoXWk0qCpi8QwmMIh9pp8LuAIMuI+NYcr6bn5YVg8vUm4kSXDfisDdtDWvcU+0buAPa
         GATSG9GzrWjt6/EwRXvdqd5nItW2XnjP5ciEFJ4zvwfY4YLLtuNpZ/+47iKZdFBt2F+a
         GbejvzsiPaxFvUyr4smI7t8qM4KBpFVHBG175O6AcfOs0HAmLG3eoKCS1AFnL6nqubHI
         npyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789756253; x=1790361053;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UthLOTqsgx1H7Ky6X1sMBpSJ/ushOzRSeE2EVOIQouM=;
        b=MA5+57qbMXitnFDFc7ysP4x4MD/bxPYPneVFF9eFcSs/D2TnGQ8Kjay+oGBCGxYigB
         y69y5+ajOFPD/RSNTHFLijxtSeYkBjVQ63jcTB7oAC0rex/mXJLvW/DZICdSyPfm1J/6
         FdZEVjiI5vFKcaT0Wu2xYa7uUTFd2I+J3lyZeSq0kmsdzp3hluOnH5jV+OmMSVYgw7Yn
         hh8zJmenUPJyfVhngm60C0ijrwymJmrRfWFoG2JZzEmIBuNUKi/yo7FeUq8ac7W/CwWY
         Um2slEX67Y+qm9+3zMykm6sFsiXLawFU4Xb/CUBO6Kcl56uTm38A9yY0kWlRJzCdijsg
         VAug==
X-Forwarded-Encrypted: i=1; AKwUvBy8kY2wpEaNXfqbkLimhSsD+/3w1bfsKE0O4ibqjbLCEYKPBCSpkDIhiUkL1jqFr0Sxotry0KdBNpJYa8pkSIs9eg==@vger.kernel.org
X-Gm-Message-State: AFuF++kC/VQ1VD0HwRr4VI/JUrTctHi37ZufVhXA8r8faAZt/oSzhcfu
	PRo3yPjrr0EWZbU7Q7YaeBcVljNsyqijuPpLvaCvyLR52Bz1dr4EsZTCq/NS7SMbj8F60xpgF+z
	uFIR4us8/g6qPCuK5O067R4ZBnTwucc4=
X-Gm-Gg: AYBFou3myU4JN7hKqusg6jNeASOFYYWCudv2OIPQFv8cWtXJ2SgYUvQxLL/8DBV5sEF
	LgeVDCXW+I4hcOT4SsUQ5LgWcOYbgLB16m2VMYV/aOcqQvZYDCHtnW/7Mr7cUDDzRd5xVQeXuFW
	2IEgwDlFiGHvnpRVlvdVfNrMKCdSwzaLKZRh8D+3HXfEO22a7yEggtOGiYYT7C1l1758H5FAide
	RTnaY0dRO3FxFZX0YqwczrkKJDkBzcJ4iqeWcQJiAGJKYWodxXB7x2KRR1XeYHDg0fCAczRPIFl
	Gx4ZXZWzROlg+ImRByr/gxlK/cIbV8qpN9ugEWBjeCctYmOCMiKBMns7QJYnVYAZ+e3w2p9SMVB
	E9Pn83u/GiFRf
X-Received: by 2002:a17:90b:2681:b0:39e:6c69:f482 with SMTP id
 98e67ed59e1d1-39e6c69f55fmr655165a91.65.1789756253090; Fri, 18 Sep 2026
 11:30:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918-kbingham-orientation-v6-0-5e8b1f01be29@ideasonboard.com> <20260918-kbingham-orientation-v6-5-5e8b1f01be29@ideasonboard.com>
In-Reply-To: <20260918-kbingham-orientation-v6-5-5e8b1f01be29@ideasonboard.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 18 Sep 2026 21:30:41 +0300
X-Gm-Features: AcwNN1UUuDTcQsQdT6LSC3YiQR-XJenFcyp7p3MxtUdbO4cYi1dTxigUEDSEcPc
Message-ID: <CAPVz0n2pZukL2tnaJef-N=kRiudVLN7RsTjKJJkTqp9-_k7HwA@mail.gmail.com>
Subject: Re: [PATCH v6 5/6] ARM: tegra: Convert to new media orientation definitions
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jacopo Mondi <jacopo@jmondi.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Jimmy Su <jimmy.su@intel.com>, Matthias Fend <matthias.fend@emfend.at>, 
	Mikhail Rudenko <mike.rudenko@gmail.com>, Daniel Scally <dan.scally@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Michael Riesch <michael.riesch@collabora.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Paul Elder <paul.elder@ideasonboard.com>, Martin Kepplinger <martin.kepplinger@puri.sm>, 
	Quentin Schulz <quentin.schulz@theobroma-systems.com>, 
	Tommaso Merciai <tomm.merciai@gmail.com>, Richard Acayan <mailingradian@gmail.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux@ew.tq-group.com, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-tegra@vger.kernel.org, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 18 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 13:44 Kier=
an Bingham
<kieran.bingham@ideasonboard.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>
> The orientation property for video interface devices now has definitions
> to prevent hardcoded integer values for the enum options.
>
> Update the users throughout the nvidia device trees to use the new
> definitions.
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> ---
> v2:
>  - Fix MEDIA_ORIENTATION_REAR to MEDIA_ORIENTATION_BACK
> ---
>  arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-common.dtsi | 3 ++-
>  arch/arm/boot/dts/nvidia/tegra30-asus-transformer-common.dtsi    | 3 ++-
>  arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts                     | 4 +++=
-
>  arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi                      | 3 ++-
>  4 files changed, 9 insertions(+), 4 deletions(-)
>

Reviewed-by: Svyatoslav Ryhel <clamor95@gmail.com>
