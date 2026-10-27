Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793126374;
	b=VpTP0RMi6rXRhRDgyvoQqNGQsuAGJ/KQoJVOHQuSCfcQyqy7BiNtrtPGs/4khflFhnBr
	 bmr9ikjNaUwiB5DtsO96/ZcWdFWRiR1heeyU2YTIzkbTKPRKuJ31bKlYZRGNmfytKR+vM
	 8bTmQskLIwDF12nIKDGfVvRktkniNtPpRg2qxEd45abORSukt25c8nFqbxmGDdnYyfIRu
	 j1aHF7BMJSzGN2mbBo3/MNvG+3r3dQ+fA82McHQmxZM8CO1Xxe1twCo8Rcbx6yNs8cbA6
	 wZ/Uf3EskrAvJMNC7tI6W0VQXc6HccKJHAdNmXqLXGPYpvJ8Ct20RJHVKipSLVdN3DQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793126374;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=bskxJSqG6c0o4PNksGKA1/LdyXGJr0htoC5Aj5uMg10=;
	b=SoOPsgXhtDkJUbLVJr8wTUhZFNTDXrkZl6r9WVg9TF+Xe6GFANYLy/Aovzcbf9DUuJ+A
	 F31PmQPzJCuSQNxracctkitoCUrUB91VkB0RFMLNAYOktw1tFEEttA6xldlXIplZc3zni
	 Jxcup1wGu9PEMn6O2ufVcsTEiticrfx6nx3ivX9gxLEGim1UNxGeH9O+j+/XuL7i4EgyE
	 FGX/FfzVZcm4i4RPZtFcy9GQs652n2qtH+zmfyfA9kNB9mbQoXqAHn+lXx67w87hMSYkj
	 jWsDq3CAjSBvdD2DFdw/PDbEOWPqA0PvRjc0lO6QuIwdNn302wCsQllJh3Otf8Q4yfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.217.50
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C85A8606A323
	for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Oct 2026 18:39:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C85A8606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-7cc91ddf447so49973137.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Oct 2026 11:39:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793126373; x=1793731173;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bskxJSqG6c0o4PNksGKA1/LdyXGJr0htoC5Aj5uMg10=;
        b=SQtP4qT/2K+C12pkC7iTDoaxCEfJJVoiecYu9HYvmM0Ucno4psizkbjINcuFmUAsFh
         PvpYub/p0gS2a8ghB0aw8q0kYN0JyChTyjKb79mOAEIBo1Z0JrF6/lM1tzTsMl/JYwCE
         5aQzRIS7BaEuSa17JJLMg01S4DvkWR1d8VQOgRdcI6T9jkGnBImEXMOPwZ0i6e882K9y
         y9fm7rL4XWDOG51ihMvyHb7wyCwc/vviSQE0qvJwCCHrPTX2uBQ9jeFjgXD2oaTPpsV8
         9O09+g7WjgxUc7C8wzxEKYogsPNpumxytI4GvdHEmESZm0AulP0gd/dPK52ZKMbemsS0
         lodw==
X-Forwarded-Encrypted: i=1; AKwUvBwxToMdD9b1khDc/B5C5tovxuJW0eYbxXzsmmescvKyuJkBWyaLC9Yebf1g9wlcSgU4pLc+8NKWt+dVFHwu0r55+g==@vger.kernel.org
X-Gm-Message-State: AFq9FYLu5kyMwHG7irdH2ABv7OWsjSLPBccZkXe1MHhBxkOh3KkV1cGq
	dNCYqFfaRMEvyFACnBjHGi1M38rvL391ImUkWxo2TkkmukDqKnXaSjZbwODpy0du
X-Gm-Gg: AYBFou118Ini65OHDpm0PqzGh6kdtW5spEbIg92k7KViI/gf9r8QEVzcsi7viIzp9NF
	AQM71wOjALR3jci+okSyBEehsCgYyMky2plm9BShqo8xAInMqS8tCx16CcfrPrEEJ5y3+e7bTBT
	NEMWHM7CZcAjcMI7X6rsYl/x0frC7fyjhUwnaQXhzDHY6bRdRhRcR3LrBbCo5ZXK+3pQ05c2NfW
	Bvo8dMTsdl37p3bXMH3ndSiKOOVjokJ0Cq/pHcwqO9+mytPfu5GZ2vhoGqlUtM94eSu7k23OcG0
	tqRSnEGvTYb/vhsgE0/X/2EUNzD0Ty6r21bCUAps6cWn6mYNoOEWS3rM1WAbWpMJgpPaYE+nHUe
	uEm5/d5RxTxOZqkr/IEJYJMuO/Gbx+DF9mw3xK1IQOksp+U3XACreTZKqEr2owUeVcazclUT9f0
	gabRkBJRPNftBXgAgJchOHoT2y/ID2AZhmLpLSYM7J7gCPdasEhjC6nWHlto482o8sQcCEypEi3
	+sl/Rd3EiBXD04ReVObPGRUxoayprtS4g8gEKGTcm+g81b9wgHUt1WFrYCyHTVU6kFMgDzXbXK9
	a+Qjl0TTWP9THtXqy+RJQMcUHpRaQnx8Gq+3Dk8=
X-Received: by 2002:a67:e105:0:b0:7a7:19aa:f0d8 with SMTP id ada2fe7eead31-7d03a6942bfmr55539137.37.1793126372672;
        Tue, 27 Oct 2026 11:39:32 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9912dad26fcsm797556241.11.2026.10.27.11.39.29
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 11:39:29 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-7cc91ddf447so49946137.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Oct 2026 11:39:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwjnIzfV/kYdSq3qrnzu7GpqhZh+6VcEA4aAJi7BVytOscZeC/1/naLkZMWjSPCJSIwBJEZMYknOFVJwPERrNXd5A==@vger.kernel.org
X-Received: by 2002:a05:6102:4422:b0:7b3:7653:5487 with SMTP id
 ada2fe7eead31-7d03a64ef2bmr58613137.32.1793126368843; Tue, 27 Oct 2026
 11:39:28 -0700 (PDT)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261012-mali-c55-renesas-dts-v4-0-c410e280bf2d@kernel.org>
 <20261012-mali-c55-renesas-dts-v4-4-c410e280bf2d@kernel.org>
 <asz8oEtow_lrUU7K@zed> <CAD++jLnnSLXeYzxonkfnZA3OxLE9Hssma9fHsL=U=NmVn7ZVOg@mail.gmail.com>
 <atXol9eFjLKxgTpg@zed> <CAD++jLm5iRKbb6=ZY0r1q_bb-zO3DAe3a7MxdDbpBT3ZU6_z_w@mail.gmail.com>
In-Reply-To: <CAD++jLm5iRKbb6=ZY0r1q_bb-zO3DAe3a7MxdDbpBT3ZU6_z_w@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 27 Oct 2026 19:39:17 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWKH2pPR1-j-AxV2LVy5xeuoymYv4MnXw1KSvAu4F-brw@mail.gmail.com>
X-Gm-Features: AclHuK-ZyTwLWgoRI-o0BtmWvpg5NzrSx71dPROAi-SvxTYl1PL6GLDh7YhiPW8
Message-ID: <CAMuHMdWKH2pPR1-j-AxV2LVy5xeuoymYv4MnXw1KSvAu4F-brw@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] arm64: dts: renesas: r9a09g057: Add IVC and ISP nodes
To: Linus Walleij <linusw@kernel.org>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Daniel Scally <dan.scally@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Tue, 27 Oct 2026 at 19:01, Linus Walleij <linusw@kernel.org> wrote:
> On Mon, Oct 19, 2026 at 12:23=E2=80=AFPM Jacopo Mondi
> <jacopo.mondi@ideasonboard.com> wrote:
>
> > > +       /*
> > > +        * Allow the ISP's 2500-vclk reset recovery time.
> > > +        * 200 us cover the RZ/V2H's documented minimum of 20 MHz.
> > > +        */
> > > +       usleep_range(200, 300);
> > > +
> > >         /* Use "software only" context management. */
> > >         mali_c55_update_bits(mali_c55, MALI_C55_REG_MCU_CONFIG,
> > >                              MALI_C55_REG_MCU_CONFIG_OVERRIDE_MASK, 0=
x01);
> > >
> > > When we now retrieve the reset and assert it, it matters that
> > > we give the hardware time to recover. (If this works I will make
> > > a separate patch.)
> >
> > Unfortunately this doesn't help
>
> Since it is clear that:
>
> 1, The clock and/or reset ordering matters.
>
> 2. The device tree order does not in any way impiy any sequencing
>   or such sematics. (I.e. we can't really change these DTS patches)
>
> 3. The bulk APIs for clocks and resets have unpredictable ordering
>   (clocks will process from left to right and resets in the reverse order=
...)
>
> I have concluded we need to request each clock and reset explicitly
> in the driver and sequence them in code.
>
> I sent a new patch series with two additional patches to explicitly
> order clock and reset enblement.
>
> See if this helps and how it looks... Try dropping the reset patch
> because I suspect that ordering to not be as important as the
> clock ordering but I could be wrong.

The driver uses Runtime PM, but I see no calls to
pm_runtime_resume_and_get()?

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
