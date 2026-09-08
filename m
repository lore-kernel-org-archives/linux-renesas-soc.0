Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF738556B85
	for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Sep 2026 13:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788872687; cv=none; b=b+24/dhT7tbLUi8uV9azFeOpkpsZAeDm9O1peyH7FNyGwuURzW2bYNMCSSYdElxq+xkeTdHxhh52y5CaYP8XeqhZM+zAZ4SUUikOdzy2lQ8y843HkHk0d7tvejZWm9IZsNIlw7o+/uj+iBEKnvMJY9kVF/37DYMtsrbaPsdnZPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788872687; c=relaxed/simple;
	bh=QielMTt5kZGRA9qslagGlyuEZEWfmqWZ+CWbXIZJoTA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OvsumuXC2PG1lsz80ip23yFrwL/1g1zhF5ZuvEPEji8qDQaNYev9WqDQRksQIETOV0w6wfDLLL4hT71vnWSx5h6hwx7NCKBPlvCaCWRwAIZBjn+6Anuy5TnhBVkLUszf3VJcQWVl3E9ibxnf9aNiiAfWp59toHF6kdCZ27UOoB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-97ca72f2cd9so2417962241.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 08 Sep 2026 06:04:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788872684; x=1789477484;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=r5dLsgIsqu5pg0i7fE8t17PFsu5iOt2muwNdqto+9Q0=;
        b=bLSKzXDf0US6Huwew3onLHcds7Rl+BHaBu2nFlyLgoOUMh+NXyjROomqcI7P2/FHYa
         J9LtqHKrP+AVrLoafWjx0A4NNOqtoyzzol/u1ZsYy9hlT+NMGgnKXePA1FkzEuncR9hV
         kJq/oCwbOq5aEpTL+6W6kft64XoDmiWPYbH5CruRR/8Z7xlXuOpGJUDOeKo6QRH9gQuv
         YrwZoRsi46OSLDn45iJFNU2HhN2cOMXPE3vQKnQAxWVET+cjxJOs6n2Qrl3Y9dS1fPfn
         4y8hM9Vf73iOC2ZUsF4QUh36EwwvijHn7gFzt2vgezhFI8RVdB3keLTZh9caGDL2DzQT
         T28Q==
X-Forwarded-Encrypted: i=1; AKwUvBz/qNqoZiHBX9smi1NUdjmCSHKpZYxJ+Qs1AtwAaG8bD2yxbAuFiP0Gc6TnYf6/JGelPGJlyFnRZznN3TZ2cPryNg==@vger.kernel.org
X-Gm-Message-State: AFuF++np/fllTWpLVD5fez+elVO4hOcNy7FrAzlEMxy0498edMi3BMfI
	5lmlXH1nSGyg6aCb29PT0N0hSc1NxOymJhkhFSYeBJHf7TsePEm+j5DAY6Y6a6Cp
X-Gm-Gg: AYBFou0vZLHEQaaDs+scVHMhy79MvIO0MXbVMazEFrQCbM7h46fVKjynvPdNZCMaOBE
	qFl3An58yuF3gjPnL25yKd3X1tQp3i/uqT+RVhtDXUXWEWzqzW3fAuTlzWlu0Q/XxxN14yC5Me3
	1F+sezfHF3BsTz9IIfO0pUJBE+qk6EwmQj4RagG8HqvYC4nM9NY/fvfSlWM9kNsfpBnc0asFGr5
	Uh9bLPBj8JXP4Pkkr1cm1D3bdp2BnpfI1mxlqMaiKQORMm6vt+SR70LZHo27ZdpGHgX9Te61GEz
	nq8aKxwlrYls+YwJrSGNSQ/KWvzzhYvESYM9wisN4YIs9Li6cIjiFDjcwG5e1VRKCAPx0wXuRyA
	w/zVmTSV6T4MKJEEy7mZ4Uuwp2zJIAcB5u/C1n2GTV+5+RxWEvGRCebZhsheEKEdIAcCuSVMzyQ
	/ZqdyAqYy4d3aZyzFLlWCJXze+RP825O7qQZF+HWak+I83NtuC6xh1YyVfyRoY09Jpbw9KOLGNH
	GPz47aI8V55LkGbmPKroIG/nuso/A==
X-Received: by 2002:a05:6102:5803:b0:785:a48a:e3b9 with SMTP id ada2fe7eead31-78a4a6a93d8mr12032755137.4.1788872684337;
        Tue, 08 Sep 2026 06:04:44 -0700 (PDT)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a47b3468csm8966535137.11.2026.09.08.06.04.42
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 06:04:43 -0700 (PDT)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5c5f23666d0so4156456e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 08 Sep 2026 06:04:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz3F00lg+ii1BGPmen5/AZpi8TkTE79i2TsWtwvOfZr6UFAnU7ogL3tvgQTN0mSgxxuBDtooTeyp56967tOOigZaw==@vger.kernel.org
X-Received: by 2002:a05:6122:792:b0:5c6:6189:c756 with SMTP id
 71dfb90a1353d-5c7ed4a07b0mr13843335e0c.2.1788872682402; Tue, 08 Sep 2026
 06:04:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826174854.199139-1-biju.das.jz@bp.renesas.com>
 <20260826174854.199139-9-biju.das.jz@bp.renesas.com> <apAS50JiLKRBgKs1@tom-desktop>
In-Reply-To: <apAS50JiLKRBgKs1@tom-desktop>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Sep 2026 15:04:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWucyUMVMWKrQVM=0vq7wYpajbKhQxoOR7B37cakOwx0g@mail.gmail.com>
X-Gm-Features: AcwNN1U_zOQWTR9B9fm6IwJ4cRT-Y5AkSHwVnBmCWdF0OYXdSbkMzmBVZOWCSQE
Message-ID: <CAMuHMdWucyUMVMWKrQVM=0vq7wYpajbKhQxoOR7B37cakOwx0g@mail.gmail.com>
Subject: Re: [PATCH v3 08/13] arm64: dts: renesas: r9a08g046: Add fcpvd node
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 27 Aug 2026 at 12:35, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> On Wed, Aug 26, 2026 at 06:48:42PM +0100, Biju wrote:
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Add fcpvd node to RZ/G3L SoC DTSI.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> > v2->v3:
> >  * No change.
> > v1->v2:
> >  * No change.
> > ---
> >  arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> > index 9f5ea62efc2c..ad38aee2efb3 100644
> > --- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> > @@ -696,6 +696,17 @@ ssi3: ssi@100e4c00 {
> >                       status = "disabled";
> >               };
> >
> > +             fcpvd: fcp@10880000 {
> > +                     compatible = "renesas,r9a08g046-fcpvd", "renesas,fcpv";
> > +                     reg = <0 0x10880000 0 0x10000>;
> > +                     clocks = <&cpg CPG_MOD R9A08G046_LCDC_CLK_A>,
> > +                              <&cpg CPG_MOD R9A08G046_LCDC_CLK_P>,
> > +                              <&cpg CPG_MOD R9A08G046_LCDC_CLK_D>;
> > +                     clock-names = "aclk", "pclk", "vclk";
> > +                     resets = <&cpg R9A08G046_LCDC_RESET_N>;
> > +                     power-domains = <&cpg>;
>
> Maybe for consistency with:
>
>         - arch/arm64/boot/dts/renesas/r9a07g043u.dtsi
>         - arch/arm64/boot/dts/renesas/r9a07g044.dtsi
>         - arch/arm64/boot/dts/renesas/r9a07g054.dtsi
>
> You can move reset entry to the latest position.
> Apart from that LGTM.
>
> Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4 with reset moved.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
