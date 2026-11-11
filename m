Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794393865;
	b=bUUV6mZsfrktUlmxXn9ZVf7lWRPyGBYFnEjzomVGhvhXBP1Ewwj5BwCNs+qqXcYSBZbe
	 CKnUcu11eOkFSJTWoY14OVrB9Hc05tJoDUTkH840uX2UjzCPcDp8YXY5R7+kXUFqwQcPI
	 I+tED4Az9dv+m3NkqTdepjxhiqi/WTPRBSgTamjrkSKHf/4jZBrW8NgS2vArk2glOESci
	 DXX5SMcPKM86duh+2aN4AO9EdDoRQdZD/lUvrAE8DE0n+lMx7rwFZb4jM8xQKiVuL1i/i
	 VDuMqOB5Wota5Jn8UMyyHuM4TDU+Z/Uk2FZKh//JIYuyJ+9P3d/UYZFasCAZyWKL9+w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794393865;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=XDltiKjGMBTBW0kCAum/jL7npP4ychg3vu8xCXEIE5Y=;
	b=PGaLb8TXvxogM70LgKX/0ySLmUHEKysLFrLxu3obnmfOpITV41c37QrK9R//yVcVUx2m
	 CoEBHGEWOXv55cRdHb1sOtCnx9Z1ao3QaWQqFJBJekyw6vMhKCFDgjM7URDPfZkPylcmZ
	 +kmA3FPSjIRohMUSOPX/r2gF1RFr/orKFffVaL4c/zmVWppYGpMTtBWoBwQVM9mGcD4Va
	 oJijsnNrT388LvcJ4REKS7N/0Gs91y6lHMFNHUY+GYPPOSVLcl/zv1MsnCxjXKXr60Su5
	 BI8HKQaRPtvxrhlGuh2rxJ+ak2fFE17CErVBduvHrt7nC1TaxkEyIWpyBhF6M/oNqBQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Fs8YFliw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0AC1606A31C
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Nov 2026 10:44:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0AC1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Fs8YFliw
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4b4571ff080so34162145e9.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Nov 2026 02:44:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794393863; cv=none;
        d=google.com; s=arc-20260327;
        b=Byw0iohJMenDU8AGhm645lWh7mlw3C/DFzWLruU6GX9U6w2po8NxQpwRYdaP1q1i5L
         Ze/Uyw47aTLcL7yfl3Vf+qNyUAvEO/IpCEe2NcYvS2m0FIOFMLlnAvYdZN47yjTMJ9ne
         VxjKt9yUc5dZwyrLnvNagdCSIUef5BzIHgW+qe4gmCUguMrEzb2iiYZRHgTiAaJBnhPQ
         /G9IQeT0DDFy1a7w7eyre4/EuZSldUqfI7OB44Wdl1Ayruo0waPCxMcZIXy/Y+FpgaTw
         LvfmbA7T1RkZ2uNYokZ1saNyJU1v3iSsvYeEo7kYUedtGGMV8JbpRSyT/llD85YjiuM2
         mnNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XDltiKjGMBTBW0kCAum/jL7npP4ychg3vu8xCXEIE5Y=;
        fh=sqkvoMg/3TRIQ5CSJxmBvXjUF4sR7Rj6Cf8siQsq4/E=;
        b=Ot4sGLgAQp56B1AYHydoUKf7r2tdxbTNac42tA1kqgb6kHM/WwuFrTMl1qXhMTMYWi
         Kyb3nrsvfiIevAZn7KpKxO7SpYAVcBiTHN4XfzV36I+7w80e4p46SbmQAEfRXYtAWPrQ
         ULptt9PIj1q+ff1B6gkA8JcHHNQmYrQt863BBMnuYk8lqYSCQzlerysA2kZwy5T2kExG
         xndOpElLO2yR7+U/NYzBjjKEy0w/iVMDS2Y6fBP6R3QMDVqM6ctz/z70Q8Ly0pgLM2Hu
         j5RBkHh/nqr9quefMYr/2B8kUGij5qIS2SpDdBHRwW/uktMxvL+52Z1gPLfowzx1pwoZ
         1kEA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794393863; x=1794998663; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XDltiKjGMBTBW0kCAum/jL7npP4ychg3vu8xCXEIE5Y=;
        b=Fs8YFliwR0dE34yAPVXf0YnsrVCXForfvJ5syM6fGnqXF0TTrrD5zLHNLZoIj967Wn
         RkAiWlwsQ+st7JAel/3WbkKBe3YGM5XueyFFIrdx2dWshV1w16XKa0uRdcaYj0ENjexd
         RyOynvqSjSfduPmadS6ldC1bPwlAaUW56tFRBvyyJ6zx+maDOCLVHqCZHRotfKppcOvW
         GVtKM1+P/6pCmQOeLmBtcl+lbgnKIWaIjmgPB622r7IrZGKxMfaoTw17fX2o9ZO1ABgp
         /rEM5vemp+9VtVNA75SbpJMAbgJVCWY6lK53nhEfMpprCN1m2ArawIwFpZRa9e5hXbKE
         V29A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794393863; x=1794998663;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XDltiKjGMBTBW0kCAum/jL7npP4ychg3vu8xCXEIE5Y=;
        b=pbHYfLbVGuPAIjfqcMHYxbf0yX9kKUbA3JR8/5GI2mCdp9TkfnhB5ZyVsGdwilSbbM
         0E6Oh0wD/8WspqdIR/IczBsF0QLFRn0Anvi5/SjSrNBsjtTOIMPqNgqahQSg2PE+qbUM
         X+DxnzlanPC9bfZu+gKvaYMnrvFJ1XK+A5Yc7PIq0nuJzYpRR6TwU2UsByVQV1ukGrNT
         dujPBhyexXB0EQUDasDEmwDtAAUpcICy3MiTf09tUBr/wRtjZs34Tg5MiFhW1gdXzPio
         hEP9UerJSADyAA5rFy7lftnOl7fOAHOusV+gTq3NDgNKX6v1rwu54IXoGhrLWbNUSSSO
         dPnA==
X-Forwarded-Encrypted: i=1; AL+hErFGHptrmxOBgA3U3FqECldFELZO6tm509ofcGuBTE3uNV4wKagLNVMIgPwHwuGg22pCYAIgOLIJZsXumakO3mWsLA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+szXQ/KTCit6Utoc4JsXKVrKsb+ve8HwcHNj19osRmtLj/tYL2
	lPo6NDA4o/V/X8hg71vkUeOVIKzee5cUSpHrgE/BUSkyOaFobSB+Nj8sgIZ1KKyGJg4IdzITP8U
	LKKw6emVOGSHsBAVb7acBkmXg7/fkA2M=
X-Gm-Gg: AYBFou1RRD/5CAGTeqxcIZ2NtTYuHZ9kKCscd+3rMkx4nXWUi8juzGhGNSMn3q3k4Vc
	hhut7LtIM/i/uDZyVhpM15dotjYSD9DHHSJDwUag7nL3HhSX3Iw32Q8b/GV4booOInJgpnYgALC
	Hf0MEiv6oR5NwOC3OMUCt1KSeHFyUwxG6/ABdMbfrv/nb+YKRdkZjnkvX8tAr9XknLCxj6ylBPY
	g3AcuJXDX7cp6DWqMC6s2k5xbaOuB3QXgz2SKNqRL5uBOib1aQi0A5l8i+N8ELiXyhVCh6itoBh
	DO6A0dBKR+2O4X1sMh0fs0L97q/HyJ1faODDQF0btd1lh3fComYyfNsAIeZX8pofFtI9qhUhHYd
	XQXJE26ALjRLJVd12m9PMhgEoaRQQV7LorLGEvMm0uCsCuH0btfifJAkGBOStJxW7uCa0LAADdo
	9bn92be7EIVrQL9V0aP2n/auqnIoLONNnL8bhJX3jPf60pPOJl1Xh7ITSxT72ioBBTi1fE16JLH
	249OV4=
X-Received: by 2002:a05:600c:a00d:b0:4a2:1a:a129 with SMTP id
 5b1f17b1804b1-4ba093b7ffcmr37431285e9.35.1794393863111; Wed, 11 Nov 2026
 02:44:23 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261009165710.1320233-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMRc=MdcWS0c9E0V3cJj9B9WMAe0vSs9e2s2EauRH5zFkOng+w@mail.gmail.com>
 <CA+V-a8uVxwP+AFbRYb-weN+EHQ5rFxo7gXPus4muSrMri1QAAA@mail.gmail.com> <CAMRc=McjH1CE9wZpqWVWOa23oQn-Zxsq64akB4FgW=dA28vGTA@mail.gmail.com>
In-Reply-To: <CAMRc=McjH1CE9wZpqWVWOa23oQn-Zxsq64akB4FgW=dA28vGTA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 11 Nov 2026 10:43:56 +0000
X-Gm-Features: AclHuK_vtK80w1Fs6m3xd960NvDg0_oPO4I0vQEHXEfEWlJLombO_D83MeFpWaU
Message-ID: <CA+V-a8uERLULKgthkRu87eqCjNPexNi9sUKz_6SKx-y6WNq-OQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] Add ADC power sequencing support for RZ/V2H(P) and
 RZ/V2N SoCs
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bartosz,

On Thu, Oct 15, 2026 at 1:08=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
>
> On Thu, 15 Oct 2026 13:05:10 +0200, "Lad, Prabhakar"
> <prabhakar.csengg@gmail.com> said:
> > Hi Bartosz,
> >
> > On Thu, Oct 15, 2026 at 10:43=E2=80=AFAM Bartosz Golaszewski <brgl@kern=
el.org> wrote:
> >>
> >> On Fri, 9 Oct 2026 18:57:05 +0200, Prabhakar <prabhakar.csengg@gmail.c=
om> said:
> >> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >> >
> >> > Hi all,
> >> >
> >> > This patch series adds support for ADC power sequencing on the RZ/V2=
H(P)
> >> > and RZ/V2N SoCs. It introduces per-SoC probe functions for the
> >> > renesas-pwrrdy power sequencer driver and ensures that the necessary
> >> > Kconfig options are selected for these SoCs.
> >> >
> >> > Note, the ADC driver and binding patches have been posted separately=
.
> >> >
> >> > Merge strategy:
> >> > option #1:
> >> >  - Once the pwrseq-renesas-pwrrdy driver is merged in only then
> >> >    the sysc driver can be merged via renesas tree.
> >> > option #2:
> >> >  - Merge all the patches via renesas tree.
> >> >
> >>
> >> IIUC there are no build-time dependencies, so the pwrseq and soc parts=
 can be
> >> queued separately?
> >>
> > Yes there are no build-time dependencies, and since renesas-soc is
> > closed for v7.4, the pwrseq patches can go via your tree.
> >
>
> It's rc7 so I prefer to leave it for the next cycle too.
>
Gentle ping (the patches apply cleanly on top of next-20261110)

Cheers,
Prabhakar
