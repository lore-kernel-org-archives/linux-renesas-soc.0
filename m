Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE35A470EB1
	for <linux-renesas-soc@vger.kernel.org>; Fri, 11 Sep 2026 08:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789116318; cv=none; b=pOgnhdumLETzL1FhoNbhnzobwgFqDLy97I+6urG86wEsNxLmPuOCM5vGrEyn/yzkRrnJNXPX9II2fQCD5g1onhTz5EroWR0vNC0PsmveJrRZSAbYHJW8oU1OUXaLyn+XYpL6R7mlBZ2HVH5ZfAA1TyZAjaB6AI7iIY7+t1unDXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789116318; c=relaxed/simple;
	bh=h5QtskLdwN0aOposRJmsMlXcFaOCxlrGFlXawJuLUoE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ksbpmOhKbxlUD4MFRIqioeOiOLsP65KYDWgz9Mv1wedTI5ugNJjN6J0Df4MnWfO/RsMmpvjH3+oEpCIKi0EQYlfvw87CFLgbxgQxwzMOP4mtE/5kI9g4NbqQF32fwDSfbc5AwG1mUq+FaQd9Y2NRG1xMkwgsbFi0GD9cHnUudlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f12.google.com with SMTP id ada2fe7eead31-791a9878aa9so201905137.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 11 Sep 2026 01:45:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789116309; x=1789721109;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dFqCzfESKQLEVO0Bv6rt70nL97v3lPj6zjiKBmAFaxk=;
        b=cD46+8AVDU6IVjgRJFf97YwX6YKsVgy+0Gdfn1KA745VQDe/u3cU+680FBL5KTIK77
         HORG/mcWKVA/U+ahtrRFLZ+v5awUdLC7MTxsVTaUxUJ5dtOQNVjLpBTcGrOeN1PAxR2J
         5YW5NR5SLpAvs5q4bmDRMXrqMyXp1YHORPnNy906asLl1SxDDZ7+L5PU6bZdfu/YxKSW
         oN4Xn5Uh6Bg6te+3rihVMiuRM4dSoAPh8iQgs3pM/VELy+NxMPnTfOc1Do3lq7H0TPLS
         Q4JH0IXm1y8zuT0QH1UthALpTpw2Hl2SoALgnW5sImWw9aVGL/J2lzATUKd9N3xuwg8a
         WyNg==
X-Forwarded-Encrypted: i=1; AKwUvByW/FV69AGC2OGewMq7DBTqKOSu+uIR9eZ9xCOw52XGk3yeW9kZaFcfVmLsUNPCRo66I/nQcOTTUnABpqrBE5tvxA==@vger.kernel.org
X-Gm-Message-State: AFuF++kcsvN4qfQ7j1NUkBKIr9PArc1Oi4QCB2IClom+aPUCe1gxZUy6
	gMxHQBCsm7OHTr36rV/O3OmT3ArY59jcdXjbqoy4ILTOc3g38zwGjXW2HFoEpClz
X-Gm-Gg: AYBFou1/9DRJKk9bk8Z4H1TOcVGin6uns4GPS58FZCaUu0xQNWw6SHdcFBh5oq6XuTr
	zirocKchmtivDPfG8v8u0BkEyYm/6lpRuPmZe8T8klW2+yDdi7LG5cauj8a+Y7pb+hyPwzGKKOz
	A30sP4+PYjlOM+uOtwgPxIUreOGZCavzPdyeDDH4iDLWy6r1t8vCIdEBq+cCt2MqD9Gc5nBSkxK
	VVSukUO+nRbO9K44skH0u5B3VYA8bc65Ew2SWx3nEtDvW0AlyhFsuDJ+hWPal+JBnHWatow4/1y
	dN4gM9B86alxlHbG8s1Y9wvlkFcTOCzNDhV8xpI1Oe00PQvoEYS3Ux8LwoRVNrloedznmMCMHb2
	9fXRgujUFS//vzQbKvpHAUmLHufnaEKf/TMI9va9224+nWXiG/1Lfp+5+8FutB5CowYQXQtFrlY
	viMYq6DWUkBBigjWBXLWX6r+H4tWhSjkJ1h7dM2aKXgBQ5xpIwwJgEv2UvdkUNM3XajhFA+1aBP
	30Pk2NFZamIyckfNmHjniops3VtCrNClNFfuQ==
X-Received: by 2002:a05:6102:54a1:b0:785:bfc7:26f5 with SMTP id ada2fe7eead31-792ade8b568mr1200951137.12.1789116308746;
        Fri, 11 Sep 2026 01:45:08 -0700 (PDT)
Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com. [74.125.226.204])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-982b9a297edsm2101534241.0.2026.09.11.01.45.08
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 01:45:08 -0700 (PDT)
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-980b6159d30so148486241.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 11 Sep 2026 01:45:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxOd2ktJbxQSq09XgEP6j2WEEDTNObtoyq5ON4Cltcv32+zshgtqshdJlWzmRptvycNAQ1Ow4yH69HpV3FtsCK/hg==@vger.kernel.org
X-Received: by 2002:a05:6102:2907:b0:789:3f43:645b with SMTP id
 ada2fe7eead31-792a83eee14mr1339655137.2.1789116307687; Fri, 11 Sep 2026
 01:45:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911073058.253000-1-den@valinux.co.jp>
In-Reply-To: <20260911073058.253000-1-den@valinux.co.jp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 11 Sep 2026 10:44:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVAFq4izexG=Sf2i9dZdMMNLnb85AVgBazAFMtTA2jwxg@mail.gmail.com>
X-Gm-Features: AcwNN1U9x2Dw0_q7aq6BSLyw8iIHJUaRM391u6KpE8PvZrGWtybbNLMNuLVxPdU
Message-ID: <CAMuHMdVAFq4izexG=Sf2i9dZdMMNLnb85AVgBazAFMtTA2jwxg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a779f0: Set UFS lane count
To: Koichiro Den <den@valinux.co.jp>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marek Vasut <marek.vasut@mailbox.org>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Palash Kambar <palash.kambar@oss.qualcomm.com>, Bart Van Assche <bvanassche@acm.org>, 
	Shawn Lin <shawn.lin@rock-chips.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <mkp@kernel.org>, scsi <linux-scsi@vger.kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Den-san,

CC ufs

Thanks for your patch!

On Fri, 11 Sept 2026 at 09:31, Koichiro Den <den@valinux.co.jp> wrote:
> Since commit e72323f3b09f ("scsi: ufs: core: Configure only active lanes
> during link"), the following error is observed on R-Car S4:
>
> ufshcd-renesas e6860000.ufs: Tx lane mismatch [config,reported] [2,1]
> ufshcd-renesas e6860000.ufs: link startup failed -67
> ufshcd-renesas e6860000.ufs: error -ENOLINK: Initialization failed with error -67
> ufshcd-renesas e6860000.ufs: probe with driver ufshcd-renesas failed with error -67

This is very unfortunate...

> R-Car S4 has one UFS lane per direction, as described in section 152.1
> of its hardware manual. Without lanes-per-direction, the UFS platform
> driver defaults to two lanes.
>
> Previously, the core used PA_CONNECTEDRXDATALANES and
> PA_CONNECTEDTXDATALANES to configure the link without checking them
> against lanes-per-direction, so the missing property did not prevent
> initialization.
>
> Explicitly set lanes-per-direction to 1, now that the validation is in
> place.

Given this breaks backwards compatibility with existing DTBs, I think
this new check should be relaxed iff the DT property "lanes-per-direction" is
not present. Are any other platforms affected?
Possible solutions I see are:
  1. Skip the check completely, like commit 06a34d9c1f47b923 ("scsi:
     ufs: core: Skip link param validation when lanes_per_direction is
     unset") does for ufshcd-pci?
  2. Correct hba->lanes_per_direction based on the actual values of
     PA_CONNECTED[RT]XDATALANES?

Alternatively, ufshcd_init_lanes_per_dir() could override
hba->lanes_per_direction to one if "lanes-per-direction" is missing
and the device is compatible with renesas,r8a779f0-ufs.  Or perhaps
hba->lanes_per_direction could be preset in ufs-renesas.c, and not
overwritten by UFSHCD_DEFAULT_LANES_PER_DIRECTION when non-zero?

> Fixes: 5235d551779d ("arm64: dts: renesas: r8a779f0: Add UFS node")
> Cc: stable@vger.kernel.org # 7.2+
> Signed-off-by: Koichiro Den <den@valinux.co.jp>

> --- a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
> @@ -901,6 +901,7 @@ ufs: ufs@e6860000 {
>                         clocks = <&cpg CPG_MOD 1514>, <&ufs30_clk>;
>                         clock-names = "fck", "ref_clk";
>                         freq-table-hz = <200000000 200000000>, <38400000 38400000>;
> +                       lanes-per-direction = <1>;
>                         power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
>                         resets = <&cpg 1514>;
>                         status = "disabled";
>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Works fine on S4SK, so
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
Will queue in renesas-fixes for v7.3.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
