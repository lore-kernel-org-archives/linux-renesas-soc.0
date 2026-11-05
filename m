Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793898184;
	b=KG7hwLfacPQOFvdhs/HwlwLrOVKbHvp8Tlois/zFRuwOxqW/Rck9793ApmpqOCf0qb/9
	 Uxbs7kQ0yc4Js+HPLb5TE9b2gcNKlX+5eoz0CNHDO5xoL+oCeVoIIEXqaacDzFnqD5sL3
	 wUh3H1kQHLE2WYzOkH/o+vGKRUPzrm4M09AAAZiP/d+ceAHuxOzJUpHK7Filt+ZIXsrOr
	 RiN/Dq6be8Z7H5920NayZhe+8ymkHkFeGYy+v7KZZwq4KT00tlNRRULLOC16/AAZoJq69
	 Vt7c3xMngs/O0KE4vw/P25AG/sqp+t6Qf1d6wjNREJ8Xm16ad3mQmcgfJOo7Keg996Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793898184;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=myxHuKBMV+4xfHAoPcmps6Jo0+mw1I0xl2wkI4iMH50=;
	b=ea+SoGLRB5m9N06rXyIH9GrZnO0Ix+CJLF8g/ysGbI1zNSMGQbWnIENd1Z8djNd1AE4u
	 5s1JRQ2v+Uqah6UOpv/nX8zxN8xp372SeRMwfOQSouiRxL7GM5uTuYE8OuPwxR8XFUwhb
	 L1ekUSuj15LxcLFi4UFOqQ37zLrGATvQt3ZQshaFn6w0cGG7PF6EjD4AVdGVUrp1NAThP
	 9B5jrdol1REJXeiLNElXetX/Gsz20XbWQjcLTjmxLDfc9+KVAoPorDJpN7sJW5Vll/s9s
	 CYuXjrsQovkxSZKmsCUcw1nsXLb1X7kEPGeoBandqlpo7oTl4GzLNacZiQ2rWQqKYmA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Yie/T8br";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870D4606A331
	for <linux-renesas-soc@vger.kernel.org>; Thu,  5 Nov 2026 17:03:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 870D4606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Yie/T8br
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48e46e449e8so1336190f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 05 Nov 2026 09:03:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793898183; cv=none;
        d=google.com; s=arc-20260327;
        b=e0RgYxdXOdpPd9mh8ltXmc0kUALd6mzFfAY7Pu85PkQ2JjuFklpZyvWRN+3RRbmW6G
         vK03TBN9c5AYxV6vP/BZQac/YEAC+PwsVCtyvUNRlZbnIMgJTloLtnbu1N6ME2g0MXIt
         KJOrj16LWpula/ZU2X+NIu47af6AZCan4ka/zwv+kif4zK9+AeNdCvYd/QuKm9q5kqDE
         6UG7ravaUGCPzdTikRnNPRCuDJ5oRW3eO39nBS94yd9/O52BNE73DKu4S8SOcx0rJprv
         DiJRamUynv4IttF9TMFcSTyEPBvSCMgzJxAjTdp0rOcy6YaGMuXDhrCkatMuKsEhKpLy
         aDhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=myxHuKBMV+4xfHAoPcmps6Jo0+mw1I0xl2wkI4iMH50=;
        fh=JzJMqGIZDk/UTlsaVaJd3fWxgHguQnFfv8nfRYopR4I=;
        b=hrZF4toEn6qvADe/bbVL+cU3s9MIINO/cInSMBhp4keP0L/wrk/gf0KmwWHNG2V3rY
         X9n320dRqyEZvHDgvY1Ym3eio1GBAxHqmODsu7mcUQx7jf6qibmO2DCEmCgBTq8VaZFQ
         ZD1msamtgfIf5S9QEI/JvWq8GffNfF4vhkwn8F0d6Jj+NyyIZ1OiuHj5KaLaqv2m/YXQ
         i3NseMBRujiQR0EHYsB0m5NgW8CeFKE+4TDPZX5tcR67Gcd5OPu/zvLeX8u3RK8x/fCU
         ATNNF0fHit0RCWMFPvM9NAMTwc2Gfe1qF/+5h6Lcwf+fz5fsb/tpuQZ6DLwsFbXKbRQe
         pC2Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793898183; x=1794502983; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=myxHuKBMV+4xfHAoPcmps6Jo0+mw1I0xl2wkI4iMH50=;
        b=Yie/T8brMNwD9XMtoCRe4KocbowOal4KvpE8BrlwXg+74uPYL2na7XdS71r0etDevo
         jSuftvcY6zXZMcR3usSsir+uCR+ND9Q1w46SkNB78+f+N7+KcdKzJuhi8+WzqJpqASSD
         SB6VXbUx2EGWa0XiAHI1sFZ9AKfFC9IWFjzOQplInLIKCD8/r7b7x7UQj4S8JO4lVRCM
         ydZXZeoz2/d4hBHQTZerbPRE1YccCiLk7u/+Pm9ywXZRuncEFx0X1PL9zxUFSebD1b8x
         FciIG7UqaMvwQH+NAO6vdLr08VcCyBYh/am2KOMbdoiyIifCKX/+j/u170FM+Rqfr6HG
         NUVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793898183; x=1794502983;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=myxHuKBMV+4xfHAoPcmps6Jo0+mw1I0xl2wkI4iMH50=;
        b=XMwWJPcy5uSJKTBkIZmt/ue3NzDZlYiCqQE6fnT1O7qjt09CoRo8FdSsg+GcFCWEhV
         eD7wb53KR4kKKueGivcWPGRv7bcJjOE17A6HF5lpdXyrwI78tWnE808YMwvmJ/nZc04k
         ipMnU+vVzkHGFLBqD8weh6yKHD6WiJY/Mv4fVUrOcbuCVWxxyBOj16DrTrIPwQtY2UaR
         KgCKVojq0XPUyo0Ajg7BmQh+tTWre0IYBj8vfIwAesEFsC5h+pBxSoApeMQVPj23ZIwM
         UNAT4OOChXibjDHbhLr9nrJyGqqw5bVmqsYpV3ILwf62VqP2mVFlxk/qgYolfdINT5uk
         CKSg==
X-Forwarded-Encrypted: i=1; AKwUvBxXgxX46MsM/QOL8rBV3FUsQj6uPZEKgQoZGc9LZGMWjqonzFbbdJv9qo3D0xWpYaCam1+QIIB3gRq4yQwwPWh1ww==@vger.kernel.org
X-Gm-Message-State: APuU4Z+ZMQAfZMVSfYeMZKTfl5eSX1Au6/VkdVL+E7fh/L26FGr7jcVd
	OydFMfjaIW1VWMdeFcIndY4qJf3Y3Ylxj02nsi+/1l7XpY+JeQYNcGfVSdxWS3FA8lkxN4mJJH7
	3e98IffPh0Qpwqy0CX26wPlfbiYtLk/M=
X-Gm-Gg: AYBFou3UOf10cfcg5YosbERDGHNwnUYsJTPOeO8KsKVE/kKEMWOgYmTZrMScL6rpBsy
	n61LjEJfKFpkVYiFnmfeE36MKZUaO3qFRaHsPPPsBL3xUCJmw3dLtquKsKa16nrzp3eiaASKIrc
	oV0XFaHfVVj/1+JMM4pds+hKvmxi0+CHH30VILpxVBbdO4ByQl/DbMA3qi1R/7Hvyih0+nfqYug
	f2tOEZAT6SNhAVhQiYFBilVzh0FuHjPrtk/h3NXWUP1aHeHOojzmJFll0GV2GRIqBskgJJnA0cd
	FWuUrVmnrvWlSDl++FXu1TdAhN3q9gyqxH9ZOkqm8gG84IqByMvWSJ4me+s9icKMGeAKPT+GQo5
	quDdL3h26qNADM6Nb3/Xj1kUPPyOm2go/hCrNz/gJRag7Q/Cmyb0u95drX2WChL13DXs9AHv1FS
	Lz6pQx5Q5ktbQL/QTEfwOG7A==
X-Received: by 2002:a05:6000:2501:b0:48e:5d33:da5c with SMTP id
 ffacd0b85a97d-49273f500damr506459f8f.1.1793898182689; Thu, 05 Nov 2026
 09:03:02 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260929113921.119489-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260929113921.119489-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdX9bJB-BUqJxvzYbaVuNziux1NhgXvkY6rgvGC6tdYe4w@mail.gmail.com>
 <CA+V-a8tbWcODg8E1qDwXU63ohfSgdeMm6GuEkrg=vyrNLQpbgQ@mail.gmail.com> <CAMuHMdX1j6G+Kd80-6s5PEVkOfG_tS2U8p47929G9kHvD1S-eQ@mail.gmail.com>
In-Reply-To: <CAMuHMdX1j6G+Kd80-6s5PEVkOfG_tS2U8p47929G9kHvD1S-eQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 5 Nov 2026 17:02:36 +0000
X-Gm-Features: AclHuK9B3JW76CB2qKvqEnvosxoUZui94RMsNVjlo-gO8QGB6XF8SpTGr1OOZV0
Message-ID: <CA+V-a8u6G0=wtBxEkjY3rYf-BQv23jJdc-4NE7aePEx_WkOVqA@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: renesas: r9a09g056: Add ADC clocks and reset
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Thu, Nov 5, 2026 at 2:52=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Prabhakar,
>
> On Thu, 5 Nov 2026 at 15:03, Lad, Prabhakar <prabhakar.csengg@gmail.com> =
wrote:
> > On Wed, Nov 4, 2026 at 4:45=E2=80=AFPM Geert Uytterhoeven <geert@linux-=
m68k.org> wrote:
> > > On Tue, 29 Sept 2026 at 13:39, Prabhakar <prabhakar.csengg@gmail.com>=
 wrote:
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >
> > > > Add clocks and reset entries for the ADC controller.
> > > >
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.c=
om>
> > >
> > > Thanks for your patch!
> > >
> > > Similar comments as for "[PATCH 1/2] clk: renesas: r9a09g057: Add ADC
> > > clocks and reset".
> > >
> > Ok, I will apply the same fixes here.
> >
> > > > --- a/drivers/clk/renesas/r9a09g056-cpg.c
> > > > +++ b/drivers/clk/renesas/r9a09g056-cpg.c
> > >
> > > > @@ -539,6 +556,10 @@ static const struct rzv2h_mod_clk r9a09g056_mo=
d_clks[] __initconst =3D {
> > > >                                                 BUS_MSTOP(3, BIT(4)=
)),
> > > >         DEF_MOD("gpu_0_ace_clk",                CLK_PLLDTY_ACPU_DIV=
2, 15, 2, 7, 18,
> > > >                                                 BUS_MSTOP(3, BIT(4)=
)),
> > > > +       DEF_MOD("adc_0_pclk",                   CLK_PLLCM33_ADC_PCL=
K_DIV2, 16, 7, 8, 7,
> > > > +                                               BUS_MSTOP(3, BIT(9)=
)),
> > > > +       DEF_MOD("adc_0_adclk",                  CLK_PLLCM33_ADC_ADC=
LK_GEAR, 16, 8, 8, 8,
> > > > +                                               BUS_MSTOP(3, BIT(9)=
)),
> > Shall I also rename this adc_0 to adc_?
>
> OK, let's match the docs.
>
Ack.

> >
> > > >         DEF_MOD("tsu_0_pclk",                   CLK_QEXTAL, 16, 9, =
8, 9,
> > > >                                                 BUS_MSTOP(5, BIT(2)=
)),
> > > >         DEF_MOD("tsu_1_pclk",                   CLK_QEXTAL, 16, 10,=
 8, 10,
> > > > @@ -634,6 +655,7 @@ static const struct rzv2h_reset r9a09g056_reset=
s[] __initconst =3D {
> > > >         DEF_RST(13, 13, 6, 14),         /* GPU_0_RESETN */
> > > >         DEF_RST(13, 14, 6, 15),         /* GPU_0_AXI_RESETN */
> > > >         DEF_RST(13, 15, 6, 16),         /* GPU_0_ACE_RESETN */
> > > > +       DEF_RST(15, 6, 7, 7),           /* ADC_ADRST_N */
> > ADC_0/1/2_ADRST_N?
> >
and this I'll keep it as is (ADC_ADRST_N)

> > > >         DEF_RST(15, 7, 7, 8),           /* TSU_0_PRESETN */
> > > >         DEF_RST(15, 8, 7, 9),           /* TSU_1_PRESETN */
> > > >  };
> > >
> > > The lists of clock and reset signals (tables 4.4-2 and 4.4-3) claim
> > > there are 3 sets of clocks and resets, one for each ADC instance,
> > > but this does not seem to be reflected in the register bits?
> > >
> > The clock tree in r01uh1072ej0130-rzv2n (additional document).pdf
> > shows single clock is shared by all the three instances.
>
> I take your word on that (I only have the additional doc for RZ/V2H).
>
This has been tested on the V2N EVK connector J3.

Cheers,
Prabhakar
