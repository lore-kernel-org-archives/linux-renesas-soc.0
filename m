Received: from mail-vs2-f42.google.com (mail-vs2-f42.google.com [74.125.227.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133D053B5EE
	for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 15:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790176234; cv=none; b=AlBOXYBCiAhsID6AZV4pxKPCravKHArOyYGYXXYJrkhSuOpuqZoKaUPd1ZAjcIIQp/SAO6Bj7JAyZ38ykJ7DRjXR0LfG1lIjcGY/tEOCGZi7ektSSNJ2ol+JCqBpLLIEv5jorDzNBS8zs3933ZAHEoa+hzK8cwO5oX8g/EbOBiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790176234; c=relaxed/simple;
	bh=EhjWSKImZwoAXYfqAyTmCpINsx0oSO9M/RawkNvcdAI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BPYsoVghvZn8q0eXQS+72reAu0DElnhjLyNowzRiAdesVlvB06PBwcnl6fGOfL+zZhJ9OYzEJASEzR5Gwh8FV8Bp6IGKW09cgCpFdzitXoE5ZSeI9o9iCNI4MYIIwZnShEtBCQrTaiWYeAYd1QlMOxx2+N0fZfdeS/ewQXUwmFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f42.google.com with SMTP id 71dfb90a1353d-5c67e504d59so422370e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 08:10:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790176231; x=1790781031;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sDvgyyoRqIDDfI9/dyDxtj/9kppA0KcEIyfQ/4/NmrM=;
        b=yWTFSLeFhQSB18Ma/ZSG8KTFtHhnYat12dxc7AZWT8kaKUpYvvidLWMMSBjYIoZGQA
         Jdu/mCX9zYgXZScgEDyBiDSSF2ZEZgVZSjg8X4JiXDkLVUhqzPK22LRgswNkZuJ7MCAj
         ggWcpWbfTZ5xgWLTviqhrXy3R72zgfTjOEpFew3yOV4AMvR4UcuR2IyHBnm0/9Rp7Fce
         XmKIjmivcQHrnDJUTySbPaol1yleRu+9RWGRaP46eifda/XDcOgjHho7TBD0krwP8hQq
         PQ/17ocPKcvb1iBKMe9n1lMUwoxVYN3UPd3zdJRzMnDzk1olF6SHkqPkkNiKUlg/IMd1
         x7kw==
X-Forwarded-Encrypted: i=1; AKwUvBzYFFxTmhowic3DKWF1qe/TW8sKEo6DGGC759IGRxdNIT0B4SwXFhtxmDDhX7leCwphhR3wNP1hBkUYAVGQIk+DTQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kgcKWS8dbn7jBcvN4RT6NWRa/gUiVIr45u8Cswd6g/ruMuyGdz
	sD3I19qoMejNrUYOTimI+4H2pyI8CHP6aKogkn0R/lufD4plZhpHToMtIjJvm+9WzMU=
X-Gm-Gg: AYBFou2aU8Cm0eJFOVjANhp/9+4UXJxet7VRtr4aVvD/3TndIgtVIqFG+VxZEsePIcF
	Pj6ZxMjg55XIF6Nepfs0KPDj+VS/NHtj1NdVmJPUtZN0EMAkTAG7T4EmF/p1g/NThSCLRMH6qaU
	QRM5MBEtBUb1/QWSGP7fpCARBr9jDGBkB0mtEDEqHv4sE7WYpH5BeVqSz/dTxG5r+Gb3+jUlED0
	KlGtps2pX0n0qrkD5p8dK4/JugpbRQycV3VXx4JbaeOt1If2FSa7nahEUx6o5T4lCB2VdPFoC+a
	iY2hhGj6qV0L0sszR1vw/HCzeo/LJkccREWzMa1U3Z32gToiuNjDPEH/YwSDza9OS19c9CxWIRv
	ch+YIEt9uWeASRhOEACpD9GVlk/WJu98uFhmTt/zqZae6FGz4EuzKp1cyNaM/adfPIPJ9h6eIzB
	VlwsAQj9ctJhAfONjpbyFmUYkevHBtSJ5WpRYZuuAsQehXe4lgvcTY40GtcTwa4MA7i8mkkAD1N
	cOv5j/uTw9TviwQ6zi89wEmOVHhL7QJLdyrVrFnmoTIFj5D
X-Received: by 2002:a05:6122:1310:b0:5c9:a60b:e5c0 with SMTP id 71dfb90a1353d-5c9f1685223mr3084571e0c.16.1790176230420;
        Wed, 23 Sep 2026 08:10:30 -0700 (PDT)
Received: from mail-ua2-f41.google.com (mail-ua2-f41.google.com. [74.125.226.233])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ca541220c5sm1301993e0c.0.2026.09.23.08.10.27
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 08:10:27 -0700 (PDT)
Received: by mail-ua2-f41.google.com with SMTP id a1e0cc1a2514c-9809f3af20cso341193241.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 08:10:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwjVbk17O5Cw2x6HhCXCqlO1Vptk8M4kMMjksgplVymn8c6IdeYnjKEFShLlQL9Cbd2OPn/adrkHeQnaY2r1gllGw==@vger.kernel.org
X-Received: by 2002:a05:6102:26d3:b0:7a6:accf:72c1 with SMTP id
 ada2fe7eead31-7ac17ff1a5cmr2593444137.0.1790176226764; Wed, 23 Sep 2026
 08:10:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904-rzg2-sr-boards-v8-0-94c4674927e8@solid-run.com> <20260904-rzg2-sr-boards-v8-9-94c4674927e8@solid-run.com>
In-Reply-To: <20260904-rzg2-sr-boards-v8-9-94c4674927e8@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 17:10:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVQ47vaVRKRGvwSY1Sy5B9VADC6YOJ7XMt9ruPZdd+hrg@mail.gmail.com>
X-Gm-Features: AclHuK9nr5QPs8sC-PMKUOwR3cdMhCa7cZVvTQqDSW5Li8NuNQleAMbNnooakSU
Message-ID: <CAMuHMdVQ47vaVRKRGvwSY1Sy5B9VADC6YOJ7XMt9ruPZdd+hrg@mail.gmail.com>
Subject: Re: [PATCH v8 09/11] arm64: dts: renesas: add support for solidrun
 hb-ripple with rzv2l som
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
> Add support for the SolidRun HummingBoard Ripple [2] with RZ/V2L
> SoM [1].
>
> The HummingBoard Ripple is a reduced version of HummingBoard Pulse,
> featuring:
> - 2x USB-2.0 Type-A connector
> - 1x 1Gbps RJ45 Ethernet
> - micro-HDMI connector
> - microSD connector
> - mini-PCI-E connector with SIM slot supporting USB-2.0 interface
> - MIPI-CSI Camera Connector (not described without specific camera)
> - RTC with backup battery
>
> The carrier board is identical between RZ/G2L, RZ/G2LC, RZ/G2UL and
> RZ/V2L SoMs, yet only the RZ/G2LC combination has a product page [2].
>
> The RZ/V2L SoM shares PCB with RZ/G2L, differing only in the SoC itself.
> RZ/V2L is adding a powerful DRP-AI NPU which G2L lacks.
>
> Due to the similarities, all descriptions except SoC are shared with
> RZ/G2L.
>
> [1] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-v2l-som/
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
