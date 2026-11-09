Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794240054;
	b=ooiZ2dWsWef6RrX5m+t9bBaLRlRI3f8UkVGvn5J6RyskV9H1eo607Yy7w9HSNnoBvlfT
	 os5qarnkhdEMW+mEMBSK31s8Ywl3uzNxdCqwdLCnCKm1zJSQ603LVtPK7CnFYX1Aej//s
	 Tg2jRHCVrWtGL39hPzQglKO6Yrb1CJ21y9UZ7W5wI1Dc96bzRcIA3sPYgzuo7hXmck6T6
	 u63Epst7faML5cVd11uKhjdJcX7LhGgToliQaAjmaDoN4aoAoov+6Mh2xqhFpXGULJ0sJ
	 X1Du6+uZt9XHkUfoVP+OKwTICZOX47jVuV950Thpdedur/tIyCffNOivQwrJyaL0k3A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794240054;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=zUAAWlNbR6q9k12Xva7G11dNMgLZ5tfgag11tYRdXFs=;
	b=Ixo27OPOfFVQmrAbC0BceHAC7qdCb1q+HSdbkXv+gj6Xligh51myK8VXCDgkXXAKITqZ
	 WrWEwe9ASEUJNNehBO6wS+L2ndqsA6oTLstqPF0I/6xHQEUqpzdlz+OwfxbrjZivW7ar5
	 Vh/Kul2ans1sO/2LlxNfLNVBVXiPAsY15JWiVvhZJKGS5C4uV86BytMR2Kn1U6NSlpXQj
	 qfCw88MUM3gG7QecxliKsAQkcSlddEv5LXr9rNcu+nL/nPvF30Gx+8b9PZFgJlynHs3PA
	 elHrPAw5jPneppbAoeejm4e2bAXKo3ZpPeOpSpisVhoZ646zG53T4vTAWHry+f4PbXQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XsshOqMz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B10E60A262C
	for <linux-renesas-soc@vger.kernel.org>; Mon,  9 Nov 2026 16:00:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B10E60A262C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XsshOqMz
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b7221c0f2cso1683775a12.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 09 Nov 2026 08:00:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794240052; cv=none;
        d=google.com; s=arc-20260327;
        b=ULLwx61+BKvjICZMSInIYyxwZagDNQ1Kga1o1RsbIEEHv4PVAkP1aNPU1aeqoAIybv
         1M8NW8Wyvhr0cSeXfyPGT2AhZo2KvCBvL/rvHBX9FXAnBk6A/Cw1SzOA7UCZg1icVNyY
         z2RZTAu1Sk0yedh++nA02nOcAN/EzQNYJ68gDIu3Rod+FtP1KBft7PqWbLVyeMecddsz
         EXfJccfBx+p+kse5FBHT7V29TJ+46eJ519HYk3uDiqT2kzF3LzS1oXqaajSm83fTYqvC
         VYpEOFOnwTP+FxJDe3SE4ghPQryI0+eBDkT1v5fYbZk9xFfF9Hpggz14m/401uwTHNDY
         A8vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zUAAWlNbR6q9k12Xva7G11dNMgLZ5tfgag11tYRdXFs=;
        fh=lEF5N5phFfeoOpiR3kmBJsfBlwYecGGnMIDkzFQUmL4=;
        b=LaoHC/7WpBf27ao0WWAmOF8MpTYlbhCnHqCnn1/NJ953LMuBBZ/+o2FGNzGGUdjk4d
         /KOovJ6lUWUnBZL8V+ku2/5/Gr6x7QL6ApyATTzlrGQR0rVY6YayvNNLWzx1kNLyualH
         NCAr0YLS4Z2WUrEAy387NkOJ5xBVpLcER69sPNR77jmBTcAxSB+A5cNaQrpVqIjyMnbM
         OC08o0QfzaBvLBEian0FgH2GqcMjT7aUrC+c+PJ9LwJRhTyEul8k1ojtowpSHAM7jYAO
         q9MyIfcZ7YhPx1tAIQuh5opoPoOWxpXWJHdv+LIWzU/9ldYYrjYFchVGKPHD9Bo4wsQg
         PB8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794240052; x=1794844852; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zUAAWlNbR6q9k12Xva7G11dNMgLZ5tfgag11tYRdXFs=;
        b=XsshOqMzA4g7VkUFJSMBdIgw+TyNKoOTeZcdXvA2/JueLosVVFf1C1anFVPFqzsdm/
         +il24/vmlBaJ+7GEebvhk8L6xeucLXfjMgk4BCtasOETmK2ilY0mnGPZJiMUCECbmIOT
         qh5NN0+nRWZcTbaiPUHeRJDKjbLLCNKGkgeHK/ulASwD+SBj0PafYUVdA+gU/Zk9PmDe
         sKkXNPtxtGoHTWYE2OJRyc/+zykR19F3iaUdLi/Zy78CpfTt4Q6And+Wj4tufyBodwVc
         ctKxYkiw3BSI0Tx+qZwpeeuCXN5Fwat8kOF+OWPx7UHHKkU9mMIV0n+rYKpkal3eyCj/
         71Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794240052; x=1794844852;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zUAAWlNbR6q9k12Xva7G11dNMgLZ5tfgag11tYRdXFs=;
        b=JWGsrR6O8uwqzB7odgck6oYVyaOl9s2iP65InGbAvIBQ5ud0FklDqINgVWlm3LG8VJ
         aol+lCEmGp8r3PXWCbTJbDgCmzrf2MQfkzsAOf1RURcCWB4Z9tck/91Zcl98bOo36qxb
         PjzGTK7dRWfd+U1j4IX7GUVL4hrq/sa4v1RqYA4i56Ol6D56RRM0CAwQynHtHbX3Ki90
         KuJz9n6r+35vJUs3OEoV4FMSRskDQpfaDxJIK7YXAfMah8+2UmtZkJowYq5ZI0jk37NA
         TEhFvyqTX8+Ozun0son3FqvUua4GwSFF2mKB7eDL4PQ28vqkiWXk5kC/T3IgHgNH5WVz
         5qtQ==
X-Forwarded-Encrypted: i=1; AL+hErHgKOVbSpGJ+xPIqsheuhktUIBKQu+MQR8JkhTX01upGsWyJjfnn3bmOOXVsccZWAAgnEHDpWKtUZ0Axp7xFQ57OA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9Ro7QthzEKrlDLkO/6lwdxMfFCGnOlJvebnfjZswrrR3FCZoVi
	1I+q54swcPaCVikVw50Y89u1syyYoXulnC5RDe28uPowbyO/zjm2XI07HAeAANiN/K2ke7I8qSJ
	nkte2CDzcvUj6ptVYkzCn3lIe8L8lHKs=
X-Gm-Gg: AYBFou2/DnxePSqLvMldfc825/IYOSLK6LAWWitjSLP3G0gOsGI869I1hy/2OowoNHL
	MgT4G1xg3QwjbvceemZjX2YK7p0/f6YeztUfaaIQWzSriBFYAQvH752bQ8KVxzztGrjyc8K/w0o
	6hWn13tWp0+R6QhJnOD0PDE6NSRE5/VL+3Wg5SiS3WDCFdy/jl1PppiLYP6OJruIrxLHUh5zv94
	2B7okR7geV6EwBZPuMNBip0i0Qi4Mfxx/IcixGuMRco1h7mtS76wBgoAFKpE4Wn3LNEG2yJ1IKF
	cglOTTIfJ54Ozeyc6uUyS0f+b+Z+fDoSvuhOznj1rxsSiE6Yd9HwrFLMqBvxHum8cNfafEtfY1v
	C15z/NLKx4zrWPo6JbyVxHz2+EOTZYZVshOJXhAc8xxTAw2yib94Vc4CfTLc2dykKesGTJWeb+h
	1ScicFpEEa2RPrrkI193c1xSPsPGSFi6giuANAtoLkyibqatqbNqp6Fs3bHA==
X-Received: by 2002:a05:6402:3908:b0:6b5:47d6:a8b0 with SMTP id
 4fb4d7f45d1cf-6b756afd795mr8207a12.37.1794240052060; Mon, 09 Nov 2026
 08:00:52 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261001165201.763882-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CA+V-a8u-3NFryZA_8GN=fR09+fcyvNGLMV-09z-mPXTePxkgvg@mail.gmail.com> <744d20c9-9aa2-4f3b-b42f-cfdd0a17da65@roeck-us.net>
In-Reply-To: <744d20c9-9aa2-4f3b-b42f-cfdd0a17da65@roeck-us.net>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 9 Nov 2026 16:00:25 +0000
X-Gm-Features: AclHuK9DoJ0CyffK9_ibsQ9MndPimemnqbVSvRuC8icXaKh7HkxYXoo5YAyMhM8
Message-ID: <CA+V-a8uHLK4-GFhWQO96yHBDzXYXQ+aggbWfskzXsK_17dAKCw@mail.gmail.com>
Subject: Re: [PATCH v8 0/7] Add syscon support for Renesas WDT driver
To: Guenter Roeck <linux@roeck-us.net>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Brian Masney <bmasney+clk@redhat.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Guenter,

On Mon, Nov 9, 2026 at 3:28=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> w=
rote:
>
> On 11/9/26 04:27, Lad, Prabhakar wrote:
> > Hi all,
> >
> > On Thu, Oct 1, 2026 at 5:52=E2=80=AFPM Prabhakar <prabhakar.csengg@gmai=
l.com> wrote:
> >>
> >> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >>
> >> Hi all,
> >>
> >> This series adds syscon support for the Renesas RZ/T2H and RZ/N2H SoCs=
 in
> >> the WDT driver. The WDTDCR register is part of the CPG/MSSR block for
> >> which the CPG driver registers SYSC regmap. WDT driver now uses this
> >> syscon to access the WDTDCR register.
> >>
> >> These patches were part of two seprate series [0] and [1], out of whic=
h
> >> certain patches have been queued separately, so I have included rest o=
f
> >> the patches into this single series.
> >>
> >> Merge strategy, as the WDT driver now includes renesas.h header file,
> >> the driver patches can go via renesas-soc.
> >>
> >> Note, patches have been rebased on top of next-20260930.
> >>
> >> v7->v8:
> >> - Dropped patch "watchdog: rzv2h: Drop enabling clocks in the
> >>    restart handler" addressing Sashiko's comments
> >>
> >> v6->v7:
> >> - Added a new patch to introduce rzt2h_cpg_wdtdcr_count_start() functi=
on
> >> - Added new patch to drop pm_runtime_resume_and_get() &
> >>    pm_runtime_put_sync() calls while accessing the WDTDCR register.
> >> - Dropped propagating WDTDCR access errors.
> >> - Dropped converting WDTDCR handling to regmap as this would require
> >>    resource address comparison to get WDT index to call
> >>    rzt2h_cpg_wdtdcr_count_start().
> >> - Made use of rzt2h_cpg_wdtdcr_count_start() in restart handler
> >> - Added if regmap is available, use it for WDTDCR access
> >> - Updated commit message
> >>
> >> v5->v6:
> >> - Used pm_runtime_put_sync() in rzv2h_wdt_stop() function.
> >> - rebased on top of next-20260922
> >>
> >> v4->v5:
> >> - patch #1 is new addressing Sashiko's comments to avoid potential dea=
dlock
> >> - patch #4 is new addressing Sashiko's comments
> >> - Dropped checking rzt2h_wdt_wdtdcr_count_start() return value in
> >>    restart path.
> >> - Handled the regmap locking in the driver and introduced nolock
> >>    version to be used in the restart path.
> >> - Added review-by tag.
> >>
> >> [0] https://lore.kernel.org/all/20260817192540.423994-1-prabhakar.maha=
dev-lad.rj@bp.renesas.com/
> >> [1] https://lore.kernel.org/all/20260814191415.2110732-1-prabhakar.mah=
adev-lad.rj@bp.renesas.com/
> >>
> >> Cheers,
> >> Prabhakar
> >>
> >> Lad Prabhakar (7):
> >>    clk: renesas: r9a09g077: Add helper to start WDTDCR counter
> >>    watchdog: rzv2h: Use pm_runtime_put_sync()
> >>    watchdog: rzv2h: Drop WDTRCR_RSTIRQS define
> >>    watchdog: rzv2h: Drop runtime PM handling from WDTDCR init
> >>    watchdog: rzv2h_wdt: Add syscon based WDTDCR access
> >>    arm64: dts: renesas: r9a09g077: Use CPG/MSSR syscon for WDTDCR acce=
ss
> >>    arm64: dts: renesas: r9a09g087: Use CPG/MSSR syscon for WDTDCR acce=
ss
> >>
> > Gentle ping.
> >
>
> No feedback on the first patch of the series. If you let me know which pa=
tches
> don't depend on it, I'll be happy to apply them. AFAICS that would be pat=
ches
> 2-4 ?
>
Yes, that's right. Patches 2-4 can be applied without the dependency patch =
#1.

Cheers,
Prabhakar
