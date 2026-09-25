Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA7834A3A5
	for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Sep 2026 12:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790339102; cv=pass; b=u0sc5FioJyvFGLvEX80EITpshGQXU3coq4kZBpK98P1ycLs5TqE1UzesdHPTAuNqozo/gOmToC0TaULPH1fjVo9S10JHVu6gJgptSF8Fl3nW5Womfc7c9yX5GfVibR12s/y1rbS8IZ24Be1VZepnCDeHvxU377aGi/VzXTWIuZ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790339102; c=relaxed/simple;
	bh=AjeandOvc4np+YUUmfYR3Inl8IjDw8io05TOIC8sG0g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qRTon08jLpYxam+qJmjAZBxXCXtaYxsLc9fjwHbTL7oU6zAZCqyeIJLvizyCyEUHdj8p+h+q0XcZVfAAYjPiZ3DftMynWoRCNna8AfgOFPweCiKb4fUqtsu0cDEffk/h4fIDZ+9B7FKIq8Dh0wifiRtYPTEhLUDrBqhU2a+BSZM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nInt4BuD; arc=pass smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nInt4BuD"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49e73e541d7so1810045e9.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Sep 2026 05:25:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790339099; cv=none;
        d=google.com; s=arc-20260327;
        b=VUAWtgEq+HV47OX4+3WP2qMaRSs1MEasRnTG1IfTC8THKFf5H5PdB3EqR7BQkfxg0I
         YoLSGtDUwZY+TEc8uZ6S9veBG71/JwAV3+1Wla7Kd60JUflGzDSM/W7m0wCyHgjRgWex
         wgZSo8sdCe/BisS7GC7/UY4z4Caa9gyAs1BRTKi2HTMIotdbDq0QBQYc1ttWb9fCXWUI
         hZjfUibhJTRv3mokJdp+LXRohz5S3Z8F4StiRui4mh6GpaCPH0rnGw+sezSt9w+/3Fws
         kHDpalvz0nN5hiOcVmhoFeS4xqgE9MdN1wKUIWI8MNrx0/scJWqxLN/z9yiuOpmeQRUG
         PhlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=swBF8L3fZZq9/Ax0EVf4imGGqPnHNGl2yhucKb9Vv1Q=;
        fh=mVUoqWBQmG7EN5iifvtJVvh+2oqOt9Z5HXEsse5Wq30=;
        b=l2vA8uqU3a5gVHvryUtHM9DRrhPYUmDxI266rFmicdu4xAZyAxNPTjRXg4tD/o9CtL
         14Byw6iJRAH1M6ok/SwZ3hgTeGjOg+Njet/prFy89FFgJAzsaN8uD3bVuiU7OmNBLAxc
         N/RusNvdEu0x4cX3/LRLjLAIAqM15qnq4v4VLZzwSwu9eME5tA+Ec9ZSY16YmbOatL+P
         7uTqTMLP8esxEfG0Lbn1t5lWx7LnGyh9uAS3gx1o4hzi0qKELOsbQZCE6o5ZAReyLnqj
         BtgRZI3bPQEBX6qXruRuH+Od6yE5HfjPr5bNCLuYY5aYJwsju6pkR2/73e6TP15GEwMu
         acBg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790339099; x=1790943899; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=swBF8L3fZZq9/Ax0EVf4imGGqPnHNGl2yhucKb9Vv1Q=;
        b=nInt4BuDbguzHWyWUZrMC/cEDE7v3fQDUhkqXrdE0Ww+8vrtzwYg31uqtI2WW8lQ2X
         8C9KBTYfLf5JSEZux2lkJCsr6JT90T8k4Q8M6a32dfRuo/eC3K72pJDCfjby4pXGbjNU
         j2CFhftfElRejiNBRcyVjSOghHqeuowEuFaOQOWk1gc5k8nTLWvlAo0iRSeSPZB+J9zn
         ymyfyrxeWrb4rbfsHiZihllhoWj5CkWAP5vB2kF/pJooHz07duHwfwhdTOBLiAqpk1/j
         /yKBi8X8aE5S68JZCb3GzGQNiYbjTyqsD0/UO1wt7JHrQf2OHA207Od6XuTL/Rf4ROGr
         2nrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790339099; x=1790943899;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=swBF8L3fZZq9/Ax0EVf4imGGqPnHNGl2yhucKb9Vv1Q=;
        b=0ugzIvmNd3FTzogUgB+HnFlmxBcbCUwfDCXqR78zYYOhgFYpPuxVz89Jxjj8D1uAOm
         b8K0cVd877wvtqMQk/FEMtfFDEVNuXnevpmYTVgUqf/IVuzr1DKBHDKitUR8v6JpZLTY
         vWCVOQ/1YaVH7ngDVCvAt5HCvERsEHDfWBuLvn2yn2RcLn/2jJbqLSrzqtjbCZ8mqwzT
         a9BU+PZhJBObnBgGmhy9cpSM3F8Qx/WuKzTQP1ahYyCirhdDCDAil7gNvZPY0llLgpiZ
         XoXOwcuubjaMx1w3J9qSlToTYjaMgYnPLtC3nuX/AZLfqggNmhfM0sHGWjCrsq1CBRgI
         8wcQ==
X-Forwarded-Encrypted: i=1; AKwUvBxZuqq+2YwFFAwHx4TDMlrZpweYYGRyVTOQ/FRfXw7t7Ro7bgEZHvLGN0vf9WvykozvDyslaxGAEjMUxCuPT1V6Zw==@vger.kernel.org
X-Gm-Message-State: AFuF++kWn87BR29EQ7lpMu3X/F7WbkzTPH1bzO8uYz20fIN9yRwZpVIR
	oPcn54H071BL/+atGR02g+Eh3luVuqMLgvJN8oL6sGFtpysfxV5OF/fOOJIp1TxJQTn4uJTacqj
	qnsU1TXzdP0vESzaFHbuwZ7mzG7mryb0=
X-Gm-Gg: AYBFou0iD3LvSWg4I/oudiukN2XIwJ3ZgldKlx5XoUSINHNG+UjOS9kEpnd3gcfuqGV
	7jAqyQjZ4xMTFLKdSsL2dUA8Di8gnLeu7gmllRO2oQpslcuDoaISKvurm3fOYwrglfw39hVXZWO
	6vvW8jfEiAql93PAWvsb5nJoVi0x0w8GDzuRFVd64dLnNzg1yMTuKzRvW0SeiWMdPSV4k6hX8vW
	8Mz8zD5trCDEyb2HlStcOm/j4I22zw+QtOL3UN38215r1eOBJBTOMEJ5cZbyJWFmswM7K7+5kxE
	SXqgrEt4fAPOOLvrdTQ2EElqmytyjDXhP7JDSMbjyfuIMO6sdS1kydKLLxRj5FN0hwCUrsCR7sK
	mbl0dB5hGeR3RPakwqfepYV/R4ztH/VFn5wIK4PpvKvsLsLPmTYwLxhn55eCQfCXd0Z7E1Oeu
X-Received: by 2002:a05:600d:6503:20b0:49d:265e:eda6 with SMTP id
 5b1f17b1804b1-49fe66c8092mr78827095e9.2.1790339098331; Fri, 25 Sep 2026
 05:24:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923104054.3324830-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260923104054.3324830-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260923105237.7B87D1F00893@smtp.kernel.org> <CA+V-a8uD16uG8cc9m7NHVZXT5bU64TYfu+_1POuXeioRAy6Z+A@mail.gmail.com>
 <4f5aadf0-8f23-4871-918f-430a0c99900d@roeck-us.net> <TY3PR01MB11346CC8B3C7374C293E0F3EB86802@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <2d32d7f1-f87b-45b3-9ccd-95e9773ca658@roeck-us.net> <TY3PR01MB113461EFFC2B9B39A53ED1D3386802@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8t3HKQ6D8jb_y-XM64BHkWm3vRw6JiTydSp3rqVr9nhdg@mail.gmail.com>
 <CAMuHMdXZwnRtp=f0iOiDqoLVjBTGVYNbbLeP9E3qjTn3RUEkUg@mail.gmail.com> <CA+V-a8tzLEScwpJ1Va-vpEHdJeOjo4v6K8_xTH=aAGZoxFHHbA@mail.gmail.com>
In-Reply-To: <CA+V-a8tzLEScwpJ1Va-vpEHdJeOjo4v6K8_xTH=aAGZoxFHHbA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 25 Sep 2026 13:24:32 +0100
X-Gm-Features: AclHuK9Ao4CN3NpnEGUv9dSS7SJ85FqyguLfAAFth-uEV2_HwHzdX_13d_QZUpA
Message-ID: <CA+V-a8uoYZ80rpmJ4RhOA45FwouJKtFtLznjrXDyiFp6Wne=Kw@mail.gmail.com>
Subject: Re: [PATCH v6 6/8] watchdog: rzv2h: Add syscon support for WDTDCR
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, Guenter Roeck <linux@roeck-us.net>, 
	"linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>, 
	"sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"wsa+renesas" <wsa+renesas@sang-engineering.com>, "robh@kernel.org" <robh@kernel.org>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Fri, Sep 25, 2026 at 10:20=E2=80=AFAM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
>
> Hi Geert,
>
> On Fri, Sep 25, 2026 at 10:09=E2=80=AFAM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
> >
> > Hi Prabhakar,
> >
> > On Fri, 25 Sept 2026 at 11:06, Lad, Prabhakar
> > <prabhakar.csengg@gmail.com> wrote:
> > > On Fri, Sep 25, 2026 at 6:11=E2=80=AFAM Biju Das <biju.das.jz@bp.rene=
sas.com> wrote:
> > > > > From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roec=
k
> > > > > On Fri, Sep 25, 2026 at 04:13:24AM +0000, Biju Das wrote:
> > > > > > Just a question,
> > > > > > For automatic software upgrade, if the reboot using PSCI fails,=
 what
> > > > > > is the fallback for reboot, reset the board?
> > > > >
> > > > > That seems to be a bit theoretic. The reason for having the abili=
ty to register multiple restart handlers
> > > > > is not to have failure fallbacks, but to have fallbacks if prefer=
red restart handlers are not available.
> > > > > If the PSCI restart handler is present, it is expected to work.
> > > > > That is why it has higher priority. The idea is to use the highes=
t priority restart handler, not to try
> > > > > one after another.
> > > > >
> > > > > Sure, the failure fallback works as well, but that doesn't mean t=
hat fallbacks should be provided just to
> > > > > provide fallbacks.
> > > > >
> > > > > If you claim that the PSCI restart handler does not work on this =
system, provide evicence, and we can
> > > > > discuss this further.
> > > >
> > > > I agree normal cases there won't be any failures
> > > >
> > > > I never heard about PSCI restart fails. But have seen a case due to=
 a bug in
> >
> > Oh yes, if PSCI is not really implemented ;-)
> >
> > > > serial driver that made the PSCI restart to fail as it hangs the sy=
stems.
> > > >
> > > > So, if this is the case, a memory corruption can cause the same.
> > > >
> > > > Long back I worked on femto based product(single core), where we ha=
ve normal restart
> > > > and a fallback watchdog restart. But it does not have PSCI system h=
andlers.
> > > > On some cases, we have seen automatic upgrade failed because of fai=
lure in
> > > > normal restart.
> > > >
> > > If you think the PSCI might fail and not restart the machine the othe=
r
> > > alternative would be to export functions to configure WDTDCR using
> > > readl/writel.
> >
> > Well, if PSCI resets fails: that's exactly why you have a watchdog
> > (or two) in the system, right?
> >
> Agreed, To avoid taking the syscon lock from restart context, how
> about exporting helpers from the CPG/MSSR driver to start/stop the
> WDTDCR count using plain readl/writel? Each WDTDCR register belongs to
> a single watchdog instance, so no locking is needed.
>
>   /* include/linux/soc/renesas/renesas.h */
>   int rzt2h_cpg_wdtdcr_count_start(unsigned int wdt_index);
>   int rzt2h_cpg_wdtdcr_count_stop(unsigned int wdt_index);
>
The DT binding patch that adds the renesas,sysc property has now been
merged [0].

While keeping syscon support, I propose adding
rzt2h_cpg_wdtdcr_count_start(), which can be used safely in atomic
contexts. For non-atomic cases, we can continue using syscon.

What do you think?

[0] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tre=
e/Documentation/devicetree/bindings/watchdog/renesas,r9a09g057-wdt.yaml?h=
=3Dnext-20260924#n51

Cheers,
Prabhakar
