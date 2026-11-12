Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794495030;
	b=yiPDiUVFTJHP/kPv3JmYWq7iKBK3jGDGKFCGcYUTjs9bAvxyLu+sKxvlLHAqjpE6np+4
	 n6O8IUe+CisgOgJapcACHXiEtdVjIEJxo31y6s7pgE4Xb82Lh0AH/O6mGxs3GbtIZf5R+
	 IlB1zVWiRSFkWd/XCdwBAPXfkAxvCN3i6kJ0e4DbX94p3Z6BGxPnfLxnro8dQl0J3AQmh
	 sGwaVl2yrw5EemC3dje/lrSiEWI97jNIhFEa6gf8pkklLFPG7BOZdK4SDNKGs4ym3egGG
	 SVMpfz1b3El1rYLbgnv4Jc7KoOBTHIsFzg1CI4A8c8IrjgPOwPyRZpTwmUZCUh/mkJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794495030;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=+5BCTHh1J6xXvkZ55mDmFJRrwUlGVc7lU2YIf178GaQ=;
	b=Oh3blPQA698BfkR+NxhQhCrEW/v9Zmx+JMVDHgX4OWzZV564GALIG5dn0OukRfb0Y/vS
	 a361qa3vM4gVnWWSzWMqYfuJYL4LcltktzxivjAulsdcsTOYNpB7nUYnvQKkG6bShmgMr
	 enXNE73zA0qsykNBunLKX+LcjzQt6iypz9xHoFL8yazFS81pIg3WTmfT2JoRdQYmSXADP
	 yevAS+jCLhREbW6iTfXfEng0R46fBG6O1G7wIS1KHOlTqAhzE6Agbwr1JarA3SBbKKiwy
	 3Kgbpve1v+9/wfZ/K2oty+nECpc2ARaVF2Bxh+bTnCb7JjLA+nckd/rrvdhsAogKBrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.217.50
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75415606A332
	for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Nov 2026 14:50:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75415606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-7cc0ccc2fddso1429870137.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Nov 2026 06:50:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794495029; x=1795099829;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+5BCTHh1J6xXvkZ55mDmFJRrwUlGVc7lU2YIf178GaQ=;
        b=tIA6dXnNl4CN2DE+w98REHgN6z/olmx0BYad+0KFjjrzfhXn+6L6UnuRdggOxBZgmB
         O7HWrBO2TAXnH/slW3q/GHthZ5awo3jwV9LwkjiuMxn1gNU9/lAtTFck+1lhOAinbR+d
         DbJxbWH71Yeh+tK+NAdtqPfSKZ+e82s/NwcDePp9eDpLIc/v9YP2ZRu2kb8fegT7fiRn
         VeMcVeP3/h77wfoCD2GBVKfI31kRgDao12owyT9OiVkpGiTkOqSdSRH2w1etP+Px73JW
         zE4lXANCRtvLOtBdsBJfggahbj+NqmumNDs9NWA3WQ4lSbb4TbaRfFGj1t4BmdZAQCGE
         IHpA==
X-Forwarded-Encrypted: i=1; AL+hErE+ocSFEVwQe2Vlz7IX9uEX9xrqXrw+wJGw1aVUbJDnNDEn/wIW7YIoBjZC5N2Ltv/ogmwbfzKy13YRlCiaknvbgg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8/1z8iUdsaRbaIxozJcIrFgHf5gKUM79anCSZpT2SAbGk1XR0I
	8XuNuL+jEpJScE05ACsHdlyJobY0Ge8Mm/OloLi8RVptbJDWflAoR2sY3PzBk5IGq3k=
X-Gm-Gg: AYBFou0Wep3J74p4tjGNPHAwSPR64xi04TQtHl2irdlV4grp3OMmPkpgwA4N7xGpFdA
	jLddp+2aI37qWdGU0spBxQiLV53WbmSFlRdYYZW9PnC6fQGGIpfmOFQIJqL/V8VJ2jd/2Kn3AQL
	E8nfOISOVS+6wDz7o5xue9zakAOomgjC9EmJJlep2Z/n/gnAdGIhr3OVy2FB8VoKNIZRf05zCUG
	eJ2rI9OzsLcdvPKeeuegYz5TYhbh+rR1SykRLPmyWRle0SvbiqSDF6ru8qHsVQoFdsmj+C8YvXn
	94CBtYXFqubw9uinQXayRkjb6g0xuNUCKt13F3dbgh6Em5mqGmYBv17RFF+k672Fi9Y8ja6jkW5
	k3m5ngiamzAZArkJJheA0jWmKwrMy95Y82o8CWrp/xb0nh9VGQoAHGM7YtJgs1qgc9qSe8gxxqK
	ZMagyQ7Cn1avwF7/1BPAG46GHiU8txpzLzq4ojSdJ0aqWKnbkm82AuYVUcmYKslplorD8H99uer
	CkS2ytcTEbHMcN6TkRw2Y6ZQq+VhNgbkhPoN+/KSiDtgAQPjsubsVQgTuMazKqFaGwIfWwbpPOq
	xN4cTiAG8A/UrM6xvfRbK+pnMsLVq/nqo9ARE5NbgTKaqZTeasWckYf5REb7po9PHYo=
X-Received: by 2002:a05:6102:80a4:b0:7cc:21cd:9b46 with SMTP id ada2fe7eead31-7d506129ee8mr2021814137.33.1794495029416;
        Thu, 12 Nov 2026 06:50:29 -0800 (PST)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99c1fffe12dsm5196503241.5.2026.11.12.06.50.26
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 06:50:27 -0800 (PST)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-7777fa8f1ccso1556565137.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Nov 2026 06:50:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEGmUElhpcIIZGKrN0LHh7PKvYfXt7IFww9zA7Ic6gxXKTr2C352i0oLXoD381JDRnI7Ocidj7roxp9BNhCGXH6Ng==@vger.kernel.org
X-Received: by 2002:a05:6102:2925:b0:7d0:5688:f511 with SMTP id
 ada2fe7eead31-7d4fb2b4baemr1940643137.16.1794495026588; Thu, 12 Nov 2026
 06:50:26 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-0-1b2072e8c37e@ideasonboard.com>
 <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-4-1b2072e8c37e@ideasonboard.com>
In-Reply-To: <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-4-1b2072e8c37e@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Nov 2026 15:50:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWw2O1k44Rn03VOFJ_0RJAFZro-bzmzP2gSD+Hc8UbPaA@mail.gmail.com>
X-Gm-Features: AclHuK8sy96nMijWIpulMeqo_3YMpISU_WECBzNl3ZKvutsCseDDYG3iuq5rfEs
Message-ID: <CAMuHMdWw2O1k44Rn03VOFJ_0RJAFZro-bzmzP2gSD+Hc8UbPaA@mail.gmail.com>
Subject: Re: [PATCH v4 04/13] arm64: renesas: r8a78000: Add VSP[BI] nodes
To: Paul Elder <paul.elder+renesas@ideasonboard.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Ulf Hansson <ulfh@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-media@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"

Hi Paul,

On Mon, 9 Nov 2026 at 14:35, Paul Elder
<paul.elder+renesas@ideasonboard.com> wrote:
> From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>
> Add DT nodes for the VSPB and VSPI IP cores in the R-Car X5H SoC.
>
> Use the SGD1 clock as it is likely to be the clock used for data flow.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Paul Elder <paul.elder+renesas@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Tested-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r8a78000.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a78000.dtsi
> @@ -1646,6 +1646,105 @@ fcpvb4: fcp@c503c000 {
>                         resets = <&mdlc_vio 0x106>;
>                 };
>
> +               vspi0: vsp@c5080000 {

> +               vspb0: vsp@c50c0000 {

Do you want to sort the VSPs within the VSP group by unit address, or by
label? This matters especially when also considering the next patch...

For the contents of the nodes (except for the renesas,fcp properties,
as I couldn't find the VSP<->FCP links in the documentation):
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
