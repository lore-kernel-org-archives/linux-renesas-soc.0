Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E4A3AAF76
	for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Sep 2026 08:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790325426; cv=none; b=aETmmxSYYM/zHItIdk5wSIKP/cfmlL1wrdLVoFFrePncfztk4aKq1mBJo+z/89xdHto5la0bqRA9JW2opNl+GUSSkva/UxlP+wSMC2/wcYzU4FtGdwWiB8E3pBIkrhDIKdvBn9OtTiPdw9z1pshoRFyKZfAGdzNnN/YHIKuPIsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790325426; c=relaxed/simple;
	bh=ynpwjG+I+W6n5EtE22Z7G3rUSMwbcRn+9MipAwmrRDc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=htJGz8xCenIZoVImKoXprhqQcQCzDOlE0gmIp1yqh/h+35TuBLaQs/QfxctmuNhrs7yWtGzcGAM7XUkzZPREgeSDufitghzefZEX5NFZrjuz8WlDxE50Y9gaFbjhLO+Ih8+rdrjxcPYh+9wk5ID/9ND50EGD+aTFoVklZ1fdlX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e512ee5so176348e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Sep 2026 01:37:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790325419; x=1790930219;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qCNI8jGo1Ov8X30u+i1BBvFQUriwSK3GJhOUtQAjv2Q=;
        b=JG+NXgkvCvKoXpBO8x+FX5euE1mvqAPsMAbW0fn/IB5DE+MShDomHKLJ0o4gRMNZ5W
         jgLCnVX2NCEQ6P1y5Km3P3DFLFZv+C9LEYq9tD0wEBahOhtpKKVW3HB/ebLn1UUxJNgG
         ybik1QYlSfGW9vPUGvzAgpfe2Q7P5rgvazgdfPfyJrd4rKpoYB8VD8ZKecypzFzNkjeZ
         bvYRcI3qEus+NUw9+4M1x88TAdvvAb7wuZ57lNJsqlloKGZu1xHryR5HcdiNzCVuvHz2
         Rl4x68aQmbnALuio/8W0mx26N2Lrkuw0J9xToWyyP6eTfZX+LTzpdfFhq4GhVGSVFMHK
         dpDg==
X-Forwarded-Encrypted: i=1; AKwUvBy9baNTxDCsyPKvu8B6Sz01x+tETd4XH34q2BWZRHeDeUamUbZxZgnpG5F59k6oV3vA0uUFpoVaOI36AZ4v6++A9Q==@vger.kernel.org
X-Gm-Message-State: AFuF++loIawxhYCuYbwlJIV4IUs4jzVLAzKAOkvNepFqdqkN8B67LR4G
	DUuVCpAcCsZ79APfstzkR/IR8h9wwq50mV7GKA3zjrC0XMYjTBoeLGvtaP6nLzCT
X-Gm-Gg: AYBFou2n2VrQHWOb16mx8Wxyzokeel6VfZHDnJaJK7LEVCg2tv/zZl6EGgRYTNdlK3V
	nle3JOGu7g29L7ElPjvt4HLS8XBMaxk+Q8VB6PZC8TWHl+KBr+wgPEnYDte7DSufYj31ZBNr1YP
	JB9eT90L8zLA51iRtWzGd+XWtX7buPW6qmWDWWsvXk4nL4ChOtF9cCBoHlU4NiMBgKStGwX8dHj
	TDLGv/TJm+0k/QCrlX8mn8Fil4ESfRl+B6xiM+ov0ODQ604L5hnTe9ui8bHvLpkct8dTvGG5a3i
	PtJQv5DobeKZB6797adfGM9p4G2OZ2rMtssM6iLddQUYS7qxtGJ7xjmaulN/WX1C3N0YK2Ff8hT
	+RWzDv0p7A6HOeZj3MKYGb4ZWSp1lTGSZGUOxeeNo+UN9w5S25bDfWiw8SNwgylx9gPFIq7TV4O
	qinjr4/ZT8Wk7fL6ihq2dn1Vl+/1jcpVHmWcZ82IthifTT+l2Q47pF+Rd0vHQVDC2/EgdTX/ONX
	/giElxyjjt/CtOpN9GAlH0hIUQeAjHDBwBKt3VeEuYe9GUY
X-Received: by 2002:a05:6122:20a3:b0:5c8:fa1e:9f5b with SMTP id 71dfb90a1353d-5cc94b7ac9emr652053e0c.2.1790325418724;
        Fri, 25 Sep 2026 01:36:58 -0700 (PDT)
Received: from mail-ua2-f18.google.com (mail-ua2-f18.google.com. [74.125.226.210])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5cc656848cdsm1879002e0c.14.2026.09.25.01.36.58
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 01:36:58 -0700 (PDT)
Received: by mail-ua2-f18.google.com with SMTP id a1e0cc1a2514c-97e7c72bfebso183997241.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Sep 2026 01:36:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByiLlLMDH5z2DkRgLjEkbNpc3d73zJvIWZMUWVn6+oR5t6md9H+R3H1udSf6eEYmaEb4xwMuVePLRRyyg0oXaASjQ==@vger.kernel.org
X-Received: by 2002:a05:6102:3f4e:b0:779:5049:87b2 with SMTP id
 ada2fe7eead31-7b1b34d3523mr571652137.0.1790325418233; Fri, 25 Sep 2026
 01:36:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904-rzg2-sr-boards-v8-0-94c4674927e8@solid-run.com>
 <20260904-rzg2-sr-boards-v8-1-94c4674927e8@solid-run.com> <CAMuHMdXtcxyD4Zh+HyM1D43zu8KND-18FiLhi9OXTHZPojRH=A@mail.gmail.com>
 <29a64d27-b19e-41e3-8d2f-768cfa8de2e6@solid-run.com>
In-Reply-To: <29a64d27-b19e-41e3-8d2f-768cfa8de2e6@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 25 Sep 2026 10:36:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVHSdXX_xaNAGGtwpUHH2K4NUaDZVsLPjC+aqL6stKxag@mail.gmail.com>
X-Gm-Features: AclHuK8NKCeC4Y5XQE8QASTp0kSvhUAEgHHcCqI-Lvtiu6JPf2U_mHtpxgJb_YI
Message-ID: <CAMuHMdVHSdXX_xaNAGGtwpUHH2K4NUaDZVsLPjC+aqL6stKxag@mail.gmail.com>
Subject: Re: [PATCH v8 01/11] dt-bindings: soc: renesas: Add various SolidRun
 RZ/G2 based boards
To: Josua Mayer <josua@solid-run.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benjamin Bara <benjamin.bara@skidata.com>, 
	Linus Walleij <linusw@kernel.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Jon Nettleton <jon@solid-run.com>, Mikhail Anikin <mikhail.anikin@solid-run.com>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"

Hi Josua,

On Fri, 25 Sept 2026 at 10:29, Josua Mayer <josua@solid-run.com> wrote:
> On 9/23/2026 3:42 PM, Geert Uytterhoeven wrote:
> > On Fri, 4 Sept 2026 at 13:56, Josua Mayer <josua@solid-run.com> wrote:
> >> Add bindings for various SolidRun boards and System on Module built
> >> around Renesas RZ/G2 family of SoCs:
> >>
> >> - RZ/G2L SoM [1]
> >> - RZ/V2L SoM [2]
> >>    (shares PCB with G2L and has very similar programming model)
> >> - RZ/G2LC SoM [3]
> >> - RZ/G2UL SoM [4]
> >>    (shares PCB with G2LC but programming model differs largely)
> >> - HummingBoard IIoT [5] (RZ/G2L, RZ/V2L, RZ/G2LC)
> >> - HummingBoard Pro [6] (RZ/G2L, RZ/V2L)
> >> - HummingBoard Base (Ripple) [7] (RZ/G2L, RZ/V2L, RZ/G2LC, RZ/G2UL)
> >>
> >> [1] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2l-som/
> >> [2] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-v2l-som/
> >> [3] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2lc-som/
> >> [4] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2ul-som/
> >> [5] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2l-iot-sbc/
> >> [6] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2l-sbc/
> >> [7] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2lc-base/
> >>
> >> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> >> Signed-off-by: Josua Mayer <josua@solid-run.com>
> > Thanks for your patch!
> >
> >> --- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> >> +++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> >> @@ -508,6 +508,14 @@ properties:
> >>                 - renesas,r9a07g043u12 # RZ/G2UL Type-2
> >>             - const: renesas,r9a07g043
> >>
> >> +      - description: SolidRun RZ/G2UL based boards
> >> +        items:
> >> +          - enum:
> >> +              - solidrun,rzg2ul-hummingboard-ripple # SolidRun RZ/G2UL HummingBoard Ripple
> > As RZ/G2UL is pin-compatible with RZ/G2LC,
> The SoM is, the SoC is more complex.
> SolidRun uses the G2L/G2LC package 15x15mm while G2UL is 13x13.

IC.

> You are correct to expect HB-IIoT, however due to the reduced pin count
> and feature set it is not useful and will likely never get supported by SR.

OK (same for RZ/Five ;-)

> > I guess you could have an
> > RZ/G2UL-based HummingBoard IIoT, too?
> >
> >> +          - const: solidrun,rzg2ul-sr-som
> > Is there any special meaning of the "sr" in the middle of this and all
> > other SoM compatible values?
> > If it just means "SolidRun",
>
> It does.
>
> > I think it can be dropped.
>
> The "sr" is merely to avoid name collision with other SoM vendors.

OK, for non-DT situations where there is no vendor-prefix.

> > However,
> > you already have that for various SoMs with non-Renesas SoCs.
>
> Correct.

OK, so keep it for consistency.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
