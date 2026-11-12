Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794495299;
	b=ipeJQse2JTPksctB4bReDnTvWLVYSahiQgEup4+PHRyGqdDknIZL4EHmvrZrwmT7IaIT
	 TjoOJoiakEB6wPfamsQPG1LlsBV2cHX/QTviJdgVNU9qhuv65bYi8xIDVDwDSqofh48BL
	 /NUT+CZ393qhrWKNCJpdxuPA8Gr0DXe34TKuG03l8xodMmC1MiwSLXQbZleZbjE9zE6Em
	 ioRCINr4V3QDyN/Fq2QwBRDXHSXaMPuAGkqZkBmAeTrbqS7EBFegewgoD38ELm0kSduDX
	 8r6sCIOXAfIoA4sSDZNsf8pHTGuYpvij9TdbVCpaI0LNUm+fMlNsKIhvf12O+dswfpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794495299;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=DeS1JutKTfuhS5q6pNbvmoX+jSrEwDPcQETf0SHwj/c=;
	b=Qus5gp+/hmx3oAf8Rk8dtC3aS9V4xi/9e0FGjmkz1Aaa37rH2d9uC0cx0ySztjPXcXv/
	 zqHhVrjBz0sBpAYXV5FrBtjBlFTfqVSguEHmCvaaw4T4lvH4ryW8dn0YFTwsnAwzg+Vz0
	 c2x61xTKDfS9qL2wtWBUKP5e933UVkM5re7E5211iBkiDhkQLQqq/n7toovNfS4nhX6BZ
	 he0wUZ0QFKVHmqzlZd9MBYrYSgyNHDTeCJ6tcVrBsPnWjnXQSKfz3Nd+ZjaUTSwIyJYjq
	 bBqXC3fXqNWsYki6/HdeRuLfnflPBtIl1cgy4FwQRA5Rydr0zESL7aiEBKr80GXoY3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.167.174
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E80606A333
	for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Nov 2026 14:54:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83E80606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-4ab8cb2a6e4so2777223b6e.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Nov 2026 06:54:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794495298; x=1795100098;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DeS1JutKTfuhS5q6pNbvmoX+jSrEwDPcQETf0SHwj/c=;
        b=kYbOAY79OW/eGcROxZnd26mwaH4m1r+SI3/9lNG95n0Tk+zaMS9ukGHHx/L9aLReAo
         sr8KRSG6JMHYXhQ0mLbMZlYSk3h0emrMlH8gNWcP57Znyqq+uSP7XPar1zaB6FoJPG8l
         Mp6P3aZKXd4AFsdwNuKzuuFDTqspMEan0BprGNqKkqeclXRGzPoopmeAq6vcJi9JxDH0
         gM2CS5qmypVxR2Pyou1XH3L/AIwZeLDQdCi/Zp9KTlmZ2KXnR9psTr1FxCOG8kjmVeth
         TyKA3ZCrgnhRHyJBZIl+mpGhv2fg/ldcS4qs+pCEh8aw3cuHC9ehy5sIcLqmqypgiIc0
         /uUw==
X-Forwarded-Encrypted: i=1; AL+hErEfT8+qrzxWAonI2qzPTKTFf3ii2Rv9xKyzYWboSCwIplpfh9FeuHrpACNO9YX0Kbl8ZvnbBm71t9CCDtLfl+Z7YA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9zaF6YYmGcU1XV4uGQxCVYj+Peu6D+Syx6xDsDE0ehq/Iafjdg
	sdf533L0IaMc9rI7rUwEmo5a+AqGaz5aZfspCHYkeyKy9HdS/OK6silB0XRQ1eBk2ss=
X-Gm-Gg: AYBFou0cJIdIBQFxg+yLV2lt+X3epaQ7gf/6Zjy7h0X7H1Maha+5hMKZiP1D9kB10Zn
	485BCsIMsdWH/LqPhUhZhkH0yrOy5alend0D24WxAHkRzD+Ks1HmkBYoPRXc3myWB861Hv2Xzlo
	VFJ9pPv5Ep6EDP2pDlJ24vb37L61Eb991vk3wSRn11AzmAxjEbXywhNjtA3TotdXGRbhqYvGMmK
	gzvGl1YjArAb19+6ZjaF1mxEK+h8sYL/U4UGSV2KU5QVlmyrFrlsItdiwlJsqJkX9w6cJ0kTjLF
	n8CI6LmoirtKGF6nP9kbgJf2m/GAa9vIBq+zSJxKXmK3wZyyVq4zuy9SutH/D0mwEmqodW52m1w
	Wgmj7rBkwD/kkZ4vsUxK3WZJE882FoxxdCnf+Q1kKY7y30iI1Yc+fFYVgQkHBDXi46fvTSOs7Tk
	J8Pj14+IKEVNWMPlU3w0iVVzx3+WYP+5W4omiFJc2ep4DhEhwd/c/CkuwiLM2HTHS0cndjxcepd
	pbIYkBfHRKcDeAelhGQunmaugfaXqr3PaeJsNZgjqPS0T/X80B4w5qv7fquC7533FKG5pSgCaaA
	XQPjJdng6bnbMmSxx/ld2MVSnARRi2nrtARD8qlRM6sTyT2KkysrCP9/bNjMWXTzc6E=
X-Received: by 2002:a05:6808:30a4:b0:4e5:c2b4:33a4 with SMTP id 5614622812f47-56b980309bdmr5458331b6e.50.1794495298553;
        Thu, 12 Nov 2026 06:54:58 -0800 (PST)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com. [209.85.160.50])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e2514a550sm97069b6e.15.2026.11.12.06.54.57
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 06:54:57 -0800 (PST)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-48eee44b908so2422436fac.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Nov 2026 06:54:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEDPaU7hm4LsplMJ1b9gdCkJrcwrY22hW7ezfAG/XCjjfA/ha2G90ByhPOzLHzJnYioJds0omyuk5wmy5sv0eM0VA==@vger.kernel.org
X-Received: by 2002:a05:6122:398e:b0:5ce:d56f:efac with SMTP id
 71dfb90a1353d-5ee1c4995fdmr2096272e0c.21.1794494805148; Thu, 12 Nov 2026
 06:46:45 -0800 (PST)
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
 <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-3-1b2072e8c37e@ideasonboard.com>
In-Reply-To: <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-3-1b2072e8c37e@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Nov 2026 15:46:34 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVKr2fGN3k0LYHhoFp3Rp7_=KfTB6tQkGYDof0Em0HVtA@mail.gmail.com>
X-Gm-Features: AclHuK-vYdrIZUHe9zqdC5qY90reiPN1Oa4nwuum4GsEnnZB7I1s1LzmhCydy1o
Message-ID: <CAMuHMdVKr2fGN3k0LYHhoFp3Rp7_=KfTB6tQkGYDof0Em0HVtA@mail.gmail.com>
Subject: Re: [PATCH v4 03/13] arm64: renesas: r8a78000: Add FCPV[BI] nodes
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
> Add DT nodes for the FCPVB and FCPVI IP cores in the R-Car X5H SoC.
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
> @@ -1574,6 +1574,78 @@ mdlc_aon: system-controller@c1338000 {
>                         bootph-all;
>                 };
>
> +               fcpvi0: fcp@c5030000 {

Please preserve sort order:
  1. Sort by unit address,
  2. Keep similar nodes together.

> +               fcpvb0: fcp@c5038000 {

Do you want to sort the FCPs within the FCP group by unit address,
or by label?

For the contents of the nodes:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
