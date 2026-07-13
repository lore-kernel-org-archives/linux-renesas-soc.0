Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E8A3D9543
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 09:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783933973; cv=none; b=igEpwNBcekMrndaPUuLkk5giBXDuQt1aPjX8DkRBg+/HMw3pDMQbGwRNQXygv8BqL4HYSA1BZMQHm0bgwUv3Fjdyoc/3tarvQfatx2oHf706UYBZb/r8+j+DbuOMgr4AXi9p/yM/zZhf7E6niLTavYDLid4O0xIg6CwFVHCpDOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783933973; c=relaxed/simple;
	bh=KR7ofJS3EykDayBzMtL2mzrr5NE5XcLuA8fzBY6jaNM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UAuXjeG4nKDMz3UOARpi5VJGnnGWJq3yNcXSEZ2Fc4o5C4l2RSM3hCNqEcOAvKS26t+zY/wrT+3jSlicK1v49Ib11TC8md1oyRGPaB2WX5nsAncLERWjpIxjxU89M2vQx+J+GefWmK5VvV3bpJzlSdVwk0VRD1ocZ7XXXwoOdZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5bbc717c52aso928958e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 02:12:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783933970; x=1784538770;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Mdt2ZpMbpiIZVtPHl8mFZke/+oHZ4bhDPI14xdCANR8=;
        b=Zm8xhJvT7nJ5ra9aKDi/C2veHwrRoRdqLp01/zbRsBfAU6C4dyytvm31dvNLuVPCEt
         u6WWVEL9i9O+SjI+BsFFS9LQd/cp/tqK0F7M1gk1bg96V1N5F5BqZXodP08oVP8ggxpk
         jIeFf/3dcsVPlRtQXwBmSuNtdR74uVvlvzmEeLpMvzU56MQ3KhHsllgn3hMBXr9fvj7s
         WWUbrAUJf1e4+vC6cRTct8r/5Q4cT8NJlxyKpH473WcWpDqN2sqO7gqnHzuaS9wj8GrN
         T2p6IzIXr9wyzDHvnqhJq+gXM8bJ/9mZODLOG23g1tbIgSmgCcZcYqCw+jxK1rOIM0M/
         di7w==
X-Forwarded-Encrypted: i=1; AHgh+RrlLdHWYqERkE+7vFkWJs4tW6D/y5rAPpfnJBjkLUR26xa/uPGhTY1JHd31L4y/Xw1KFEjt8Dv0vTVP80qHZS1HtQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxnKdJfUIrdrHGcOl/Tp8Ihp5oEqdRAJ1DXzndvifPduvRSeoc+
	RuKzZONlDxcZQxSQCtvlO4D9XSoo2onC1l+GiPIFgj701Y2c6Zj6jZw5/A0+FO2o
X-Gm-Gg: AfdE7ckk9+7YYp22S+aiPPcnWnSjRDgl56MaLrvudXrNhPD4PGfyPSzIC3LKEdYOKg/
	1/cp7l8IyaKc3ssrv2mGDlzrJF31CkbIErncVPcp9uRnpwckkbHYqQ62h0INYp9Fo3zktFJlTCb
	TIWWsimW0DMSpyY+p80Hgw6Ol79h44tLP7mihp0XMGMNzNSJvVmNw/hCUGo3t5Bm643MD1D9Mo4
	QGMcjPdkzgM/qe9diCBMhBZMtWykOfzS4snEHd8qdm515m4vI7l7IQ/Mo5Pq4XqaHf4ZQFCirBq
	PndaXYaMLh2Vb+hIaumBCQEOw+NAIsfM3b1/TF4U/fwIQ2vSgSNOwWvZAID0QH2SEcdK2tWmSjR
	Cm1/E0RykpDtbArISQ7FeYtIVGo8lstgCEIP5VkreOLKtVwajRQnbeIZ+jc8ICnDtiFBH3a9Uw0
	r7Oy+KbJqovyn26biTAE6jOYcodn5Dv/V9v1c4WW1FP6nMbQrZMg==
X-Received: by 2002:a05:6122:1697:b0:5be:2177:70b3 with SMTP id 71dfb90a1353d-5bfbf299467mr4075702e0c.10.1783933970524;
        Mon, 13 Jul 2026 02:12:50 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bfcd6cb807sm2732836e0c.13.2026.07.13.02.12.50
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 02:12:50 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-745497ac8fcso320344137.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 02:12:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rp7TnF+aIvtzFZginDBuPvLt3+laOTOGLa6ZdjOHA9GButVBRYBdrq9Gr95pEBcETJ/Mq78a1PXnI7MIg4RzgLL+Q==@vger.kernel.org
X-Received: by 2002:a05:6102:c11:b0:631:4cd8:b6aa with SMTP id
 ada2fe7eead31-74533d5836bmr4638111137.13.1783933970193; Mon, 13 Jul 2026
 02:12:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710160450.64967-1-marek.vasut+renesas@mailbox.org> <CAMuHMdUQJ8mzUi0birB5f1KnCMX_QufHTgYB7AW=d3ZoFer+Yg@mail.gmail.com>
In-Reply-To: <CAMuHMdUQJ8mzUi0birB5f1KnCMX_QufHTgYB7AW=d3ZoFer+Yg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 Jul 2026 11:12:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVD=y++zr8sfnf9ZjW8md43ifmuytd-F7PY7r6e2p9Tbw@mail.gmail.com>
X-Gm-Features: AUfX_mwAEKuhdsHoYqlC4vkeXsOmSglqwfwCjvHk1qnz5qkYmbXVC-KIeAr11Bw
Message-ID: <CAMuHMdVD=y++zr8sfnf9ZjW8md43ifmuytd-F7PY7r6e2p9Tbw@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: renesas: ironhide: Describe inline ECC carveouts
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 13 Jul 2026 at 11:11, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Fri, 10 Jul 2026 at 18:05, Marek Vasut
> <marek.vasut+renesas@mailbox.org> wrote:
> > The DBSC5 DRAM controller protects DRAM content using inline ECC.
> > The inline ECC utilizes areas of DRAM for its operation, which are
> > in the DRAM address range, but must not be accessed or modified.
> > Describe the inline ECC carveout areas used by the DBSC5 controller
> > on this hardware as reserved-memory, which must not be accessed.
> > Include DRAM areas which are unprotected by ECC as well, those are
> > parts of the DRAM which directly precede the ECC carveout.
> >
> > In case of high DRAM utilization, unless the inline ECC carveouts
> > are properly reserved, Linux may use and corrupt the memory used
> > by the DBSC5 DRAM controller for inline ECC, which would lead to
> > the system becoming unstable.
> >
> > Fixes: ad142a4ef710 ("arm64: dts: renesas: r8a78000: Add initial Ironhide board support")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>
> > V2: Include the unprotected data areas as well
>
> Thanks for the update!
>
> With the ECC carveouts, Ironhide survives booting with "earlycon
> memtest=17".

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
(also with all offsets set to 0xcccc0000).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
