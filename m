Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5225C5326CD
	for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 15:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790176294; cv=none; b=VHBAASRfqwtKhZOXad6UEabKT/WwqxI/Phv5meQQATLlYL3x0KDDRjsNtQWYlwfdFi+GVyNmGsVZEE77miveKBIQb2WciNNDhzLZkT3boyMCllH7fLlIyESagTSWtgVWZ9mZ72EMQX/YNx4/vg1++j9KirqQJ9VRjQevwoHddMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790176294; c=relaxed/simple;
	bh=pZ9PpJiZh12Hwh/7XmEn8qQxKjkEk7eQcjPzfGPj1DY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qJPFpvJs/q5CCAe9deH/V8lcFkG0abqG8xfuPEEHwc9kDVG/AkPsUeLjmIJPvyU16LOp+BvmdGRbXLeebz2JX/+o2KuR+lBO8MZ49bDPVErqEzrc9wLMS3KubbqsCjlr37AnF2ORtcwB73lDxNGJUteEftjTtRUSSZ2qGnQtSns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e7c8c0754so240241241.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 08:11:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790176291; x=1790781091;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+skuiLYw/IgGtWcdd1NJ+Hgm0E875s4yIqfpBxdBYoI=;
        b=WQF/NNoJxagQon70zZqZOdh2C9mA2UWgGchW4ov9Sy1KEk8fl52fw8SYVIjdLClMY7
         5Ewi8bn2otmemQ7vU62ANlkK9Ir54fsOSR4hJ9O3oidwgQJgOe6yze9fylP9RVPKse1i
         k4dgcz6bhElmf4lSvFrdidM+KnxGK92mt0J6YKHveewg7qHUbmz9nrxLzvd8AriBZ1qU
         ZLlxT1iEKOfIDEVI0BLBqHQg2b3qqQovSKcGkbUStBzqS1zmWNP6s14UYuj+w+xOAj8e
         JFiYkl/GcjtBW6h3fkzeaYN1I3lkWALAHQY805OX0uULvUtA3yelwycfvcinZRZyulYR
         1hNQ==
X-Forwarded-Encrypted: i=1; AKwUvBySsmJR+prthRw7+yrMJbmVmGmacq00E/HH/cRLTi78aOn/6iemCCTUP8Wf2h+DCsReC1BBfxbF2zpHimjxKSgFtQ==@vger.kernel.org
X-Gm-Message-State: AFuF++nmBHjzuUnOnvBVrYIHc+UZD2VsP+YXWr8CaJU3jOTKiaMBPefL
	NyhWn07MYJbTmtmcoOMik4Bxi8tdPtR8jrQOmEtRHUs7lurHg+QVJnCJ/GkN4en/rcg=
X-Gm-Gg: AYBFou2sr6zXjaKJ7X3vi3yDm/CfaRzlG26fncP5Yh1nYcVrgpRklkjbx+SU2sRQDoY
	uZSW8bLYxX/MkZU3tPejH8dPQ9qutlTkpDIf6HuFBQ42zpV3keEM/H1TcCYtbblMl8im/Fu7Tgn
	fEOfqgMNZV1tDV4e5TSzvp2/5doVhtEPQevCR4AEB8TOui+So92vmlNd6cm2IKCQO6Lc8NWbYgT
	h0g1cKCzyBhqo5D9876W/iHl+yeR5zaggIZY/We0L/wdJ3CI0llXu9PWiI36mxpYcIERRmM6K4g
	MzmXSOwoZHmz+hs57UAUaOQj1arPGjjWGTVo2CEHWKRxMUcnq2XV2Lyemo0Vfo+8xrBqq8FnplB
	TqWdLpwh20ADh/ZMgZXeVnDabNrfn+QaHQpsCQMT/3bOD8zPOQfZ/Z7EKuCjCGZy6YtzglLJ16j
	m/ekNEKWFvWKG02y/pD6fXBpJHzqTssi3/sGvt2jZLqMvW6E2dRD7cFpm9C9zuDFKh/YlGqDD3/
	ijFfjGESsEn3aSZBs0qlVYNemgUfbpM2Q3xSg/0
X-Received: by 2002:a05:6102:5f0b:b0:7a1:f2b4:dadf with SMTP id ada2fe7eead31-7ac0d13744dmr2375258137.12.1790176290648;
        Wed, 23 Sep 2026 08:11:30 -0700 (PDT)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7abf61931c3sm3812220137.11.2026.09.23.08.11.28
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 08:11:29 -0700 (PDT)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5c9e33d3f52so713396e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 08:11:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxt2gjmD0SLP/t1OgkmI++2dpcYmU8YLIP03lfd8WiZ7FuRzZBvCqPPCCeJtRErn5Re2dTCgubWkS3zGkfxODiWiQ==@vger.kernel.org
X-Received: by 2002:a05:6122:2804:b0:5c7:c898:9817 with SMTP id
 71dfb90a1353d-5c9e3481de1mr6395425e0c.7.1790176288382; Wed, 23 Sep 2026
 08:11:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904-rzg2-sr-boards-v8-0-94c4674927e8@solid-run.com> <20260904-rzg2-sr-boards-v8-11-94c4674927e8@solid-run.com>
In-Reply-To: <20260904-rzg2-sr-boards-v8-11-94c4674927e8@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 17:11:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX4K8GbT-=qUzWTdhq4bayC3ktE1F+X+z2XnXDi9vCAfA@mail.gmail.com>
X-Gm-Features: AclHuK8E9qilobRH7fLrZ_B96xKE8A0mTA3qi9_owW1vdBVZD4FYLc3dsbXINdI
Message-ID: <CAMuHMdX4K8GbT-=qUzWTdhq4bayC3ktE1F+X+z2XnXDi9vCAfA@mail.gmail.com>
Subject: Re: [PATCH v8 11/11] arm64: dts: renesas: add support for solidrun
 rzg2ul som on hb-ripple
To: Josua Mayer <josua@solid-run.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benjamin Bara <benjamin.bara@skidata.com>, 
	Linus Walleij <linusw@kernel.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Jon Nettleton <jon@solid-run.com>, Mikhail Anikin <mikhail.anikin@solid-run.com>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 4 Sept 2026 at 13:56, Josua Mayer <josua@solid-run.com> wrote:
> Add support for the SolidRun RZ/G2UL SoM [1] on HummingBoard Ripple [2].
>
> The SoM features:
> - 100Mbps Ethernet with PHY
> - eMMC
> - 512MB/1GB DDR
> - WiFi + Bluetooth
> - SDHI Mux switching between eMMC and Carrier Board
>
> The HummingBoard Ripple is a reduced version of HummingBoard Pulse,
> featuring:
> - 2x USB-2.0 Type-A connector
> - 1x 100Mbps RJ45 Ethernet
> - micro-HDMI connector (not usable with RZ/G2UL SoM)
> - microSD connector
> - mini-PCI-E connector with SIM slot supporting USB-2.0 interface
> - MIPI-CSI Camera Connector (not described without specific camera)
> - RTC with backup battery
>
> The carrier board is identical between RZ/G2L, RZ/G2LC, RZ/G2UL and
> RZ/V2L SoMs, yet only the RZ/G2LC combination has a product page [2].
>
> RZ/G2UL SoM shares SCIF2 pins between on-SoM Bluetooth and carrier
> board. Provide dt overlay changing pin function from uart to gpio led
> control.
>
> While the variant being supported here is named "Ripple", the overlay
> still carries the "pulse" suffix as it would fit all its variants.
>
> Descriptions for eMMC and microSD are shared with G2L SoM and
> HummingBoard IIoT.
>
> [1] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2ul-som/
> [2] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2lc-base/
>
> Signed-off-by: Josua Mayer <josua@solid-run.com>

I didn't compare with the board schematics, but it LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
