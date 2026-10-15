Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E203EFFA6
	for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Oct 2026 12:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792067776; cv=none; b=P9VZ9YyOkClk9DzwZOchxZbTMVbpJMoVt07Fz8vbSANCqq9dAaOMjX/3mCrskRx25bFK15JL0yOPtVGjPOVR9yl6e5Q6daVWmXObeB9P1Ij/2MMBgZcocFTzdzhkxZCT6IuL7L1R3TyNw0Ql3DR/IabYQl/ICuyaGH4+jkYvcE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792067776; c=relaxed/simple;
	bh=HhSSj2Jpbd1NjgZWSsCYeRG5hiO72wvs6suPtxQRAvU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PookJiyl6ULEwNQSCjo9qlRqbMuXPsmbgL1yDijYZVP4RWf7jluZnE2poiJDSMdCwzhcsr1oysNHjQFCZq7uxOYh8uysnKhTqKKmL78SA+s4fhcWWgAUmm6yKdZ0w/3Z5wqO/vLo31B56mbz+j0wygsOqsrqXOVtfV9yWkL2YD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ohw/PWHM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ohw/PWHM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D0BB1F000C4
	for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Oct 2026 12:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792067774;
	bh=UTsn5LMiWlp/JSayb2otn1OhoN0igsWzM/RgKJeMZww=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ohw/PWHMAwUiMqw43scdb8VM0PMHukFCIh7Ln2ZWhcEb59s1OgOklkNJBSBx624ha
	 M6qzGVOE+wt3ZbKDcu1sdh53G+tXgi/8N1cwDhtS4x/xm1z8SeHDoUNWzH1gmVxFME
	 OtNnTVWHbxbXabpRuvFmCYREyF+v91UqM4+sRl776qpvZgozBwwQ9ZHAnyoUROJXjP
	 T9htrhJt/7WGUSldBETTPf0BzPj3UHKuZ4DIxcFMzsrEnjQb6N+5wZlXOxfypBP9CP
	 97hCdEDFd+4IriUddB5BtDG6XRvu5fcZ1pbHMw+GNkaOakOukrw/Acw+4cbRzUTpgG
	 7zCc4qZkSf4YQ==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5ba3ec92031so5384107e87.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Oct 2026 05:36:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxhCib0kkRioTIrHTVbpeGLRs3OP9Oe5kD+J2lweNh1ZxYQvfqWbZ6kY4952pruCG3ayh3wM5ilrrS5kT+YOhg6ZQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKZEUyMjOFTJeW6JuYwPj+ObtEz4FPj9hNdPuZXYaWyf1mGuNDd
	m0Sl6ieZ1U1/3SI2FFv6ePmozFomlEkYGo5Wm7v8smIk12gdapBjxH/zDAqoCK4CVFZFPLj2e5A
	mmKh5tRbq9hkSofvyoKEjHh991M2Rg1I=
X-Received: by 2002:a05:6512:438d:b0:5bc:e906:ad3 with SMTP id
 2adb3069b0e04-5bce9060f28mr5549281e87.14.1792067772827; Thu, 15 Oct 2026
 05:36:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012-mali-c55-renesas-dts-v4-0-c410e280bf2d@kernel.org>
 <20261012-mali-c55-renesas-dts-v4-4-c410e280bf2d@kernel.org> <asz8oEtow_lrUU7K@zed>
In-Reply-To: <asz8oEtow_lrUU7K@zed>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 15 Oct 2026 14:36:00 +0200
X-Gmail-Original-Message-ID: <CAD++jLnnSLXeYzxonkfnZA3OxLE9Hssma9fHsL=U=NmVn7ZVOg@mail.gmail.com>
X-Gm-Features: AclHuK-ulodNdbkzNaP_Y4BbHHTacK8pusSXYjUamTyP_Oq91RNTtepybaEU-JQ
Message-ID: <CAD++jLnnSLXeYzxonkfnZA3OxLE9Hssma9fHsL=U=NmVn7ZVOg@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] arm64: dts: renesas: r9a09g057: Add IVC and ISP nodes
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jacopo,

On Mon, Oct 12, 2026 at 5:39=E2=80=AFPM Jacopo Mondi
<jacopo.mondi@ideasonboard.com> wrote:

> How was this patch tested ?

I was using the TPG only so far, a camera module is in the mail.

I do have the RPi camera module 3 but didn't get it to work, this
may explain why...

> > +             ivc: isp-input@16040000 {
> > +                     compatible =3D "renesas,r9a09g057-ivc";
> > +                     reg =3D <0 0x16040000 0 0x10000>;
> > +                     clocks =3D <&cpg CPG_MOD 0xe3>, <&cpg CPG_MOD 0xe=
4>,
> > +                              <&cpg CPG_MOD 0xe5>;
>
> Compared to Dan's original patch I was carrying my tree the first and
> third ids of clock and reset properties in the ivc and isp nodes respecti=
velty
> are swapped

OK

> -                       resets =3D <&cpg 0xd3>, <&cpg 0xd1>, <&cpg 0xd2>;
> +                       resets =3D <&cpg 0xd2>, <&cpg 0xd1>, <&cpg 0xd3>;
>                         reset-names =3D "vresetn", "aresetn", "hresetn";
>                         status =3D "disabled";
>
> Fixes the issue for me

OK

> Why is this an issue it's not 100% clear to me.

Can you try this?

diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-core.c
b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
--- a/drivers/media/platform/arm/mali-c55/mali-c55-core.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
@@ -703,6 +703,12 @@
                return ret;
        }

+       /*
+        * Allow the ISP's 2500-vclk reset recovery time.
+        * 200 us cover the RZ/V2H's documented minimum of 20 MHz.
+        */
+       usleep_range(200, 300);
+
        /* Use "software only" context management. */
        mali_c55_update_bits(mali_c55, MALI_C55_REG_MCU_CONFIG,
                             MALI_C55_REG_MCU_CONFIG_OVERRIDE_MASK, 0x01);

When we now retrieve the reset and assert it, it matters that
we give the hardware time to recover. (If this works I will make
a separate patch.)

> I can't access the "additional documentation" from the Renesas website
> where the clock/reset ids are reported. Could you please check ?

These changes contradicts the manual so we can't change things
like this unless we know more, it'd be too much trial-and-horror.

The manual says:

Video/ISP core
0xe5, isp_sclk
0xd3, isp_sresetn

Register-interface bridge
0xe2, reg_aclk
0xd2, reg_aresetn

Yours,
Linus Walleij
