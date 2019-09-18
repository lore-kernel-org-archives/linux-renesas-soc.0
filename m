Return-Path: <SRS0=ePk1=XN=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ACC6C4CEC9
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 18 Sep 2019 13:46:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4E58621907
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 18 Sep 2019 13:46:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iwKkPz4h"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727123AbfIRNqy (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 18 Sep 2019 09:46:54 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:39036 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726382AbfIRNqx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Sep 2019 09:46:53 -0400
Received: by mail-ot1-f67.google.com with SMTP id s22so6371292otr.6;
        Wed, 18 Sep 2019 06:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=K86K4wQeRmkhzk/ZVxl+UBnuYINGMdgSVCbj0NPGyyw=;
        b=iwKkPz4hYgMDmOYK/ydF6o2LvT124Dh2yUbXNBuqZr5C+9jxFaFGp6jNNAkNL/YpFg
         0Td8I8Bzu6W+GNNGIlp9ALgde94d1DCXMSz0k7aUF/EMrbdTRPQsE1/V+VCgEZ3ejOpi
         YMg4zC2g1K1Qca+DQuBig5QHEQTNjb3USQnEdYjUjswBqeZNsrpARIYr8e8cUGlTvAX5
         D/RcuAI6moNOWHqQJvD/9YxcTgzXEomy4PQ4P9Ps30w80+tX3KMTLCJ/He2IEQ0C8yjj
         jSDCQ/BcxbiFewvgSWe4iYtVCPC85edKPx1kpFdzChXIK37Gke581WZlAp0DKk9uPukM
         v4Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=K86K4wQeRmkhzk/ZVxl+UBnuYINGMdgSVCbj0NPGyyw=;
        b=Km7B2EqD535Tv5mWko70jQa6kc7lKr1yP3VFrU1wharI3hxSvhJTyAXtjR1YccWLds
         LF4l6+RmuHoEEIoboWl6Bdv9HPAnHGK1LPYiRsGiDtAmsjRGjzThhLpdvQBT6ZX9mXfW
         h+Nrv+wKogUAGiemK+EBntmVjYOlsubfxqP8xtzaKPVqpG2y688glq7duUu0HIhuXi8l
         aKPl2XALhUY0Q5KeAibu4+GcqICwghqolBxM/LqxXv5lD+0aGtOAEMi1CjTU+QhBqeZi
         sEY2+wOwJLAlthQnBPtn/OtCF1agaVdhW7PGwYNg++VGFRjAY+2GieTZ3GsRSQxmsR4b
         AMCg==
X-Gm-Message-State: APjAAAXB3WgRlEXSWZ72DgzToC1iP7z/w1xxvmWMmO00lDYo7l83xS+L
        5OfoqN8htHi71IQ3iu/8IqtozoQHzbmgIOY7jS4=
X-Google-Smtp-Source: APXvYqysVv1ngGE4cYHa4hKHHvTDLDTFJ9qOh5fbgv2FLNJg1pNKqMtyQrAlv5Nlm3LbqnrdCOpXrWASgCDJlu9Hmow=
X-Received: by 2002:a05:6830:158d:: with SMTP id i13mr2968782otr.67.1568814411166;
 Wed, 18 Sep 2019 06:46:51 -0700 (PDT)
MIME-Version: 1.0
References: <1568721972-24266-1-git-send-email-ykaneko0929@gmail.com> <CAL_JsqLYmLyr9JmMovJYvS98t2n9s4cB7KP-8_yPCPtkXBDyjQ@mail.gmail.com>
In-Reply-To: <CAL_JsqLYmLyr9JmMovJYvS98t2n9s4cB7KP-8_yPCPtkXBDyjQ@mail.gmail.com>
From:   Yoshihiro Kaneko <ykaneko0929@gmail.com>
Date:   Wed, 18 Sep 2019 22:46:40 +0900
Message-ID: <CAH1o70KFkvj_o3KQZuMQ_AAzUq29SuXbY=HNOn3+nqJfS7ec+Q@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: irqchip: renesas-irqc: convert bindings to json-schema
To:     Rob Herring <robh@kernel.org>
Cc:     "open list:MEDIA DRIVERS FOR RENESAS - FCP" 
        <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Rob,

Thank you for your review.
I will fix in v2 the things that you pointed out.

2019=E5=B9=B49=E6=9C=8817=E6=97=A5(=E7=81=AB) 22:12 Rob Herring <robh@kerne=
l.org>:
>
> On Tue, Sep 17, 2019 at 7:06 AM Yoshihiro Kaneko <ykaneko0929@gmail.com> =
wrote:
> >
> > Convert Renesas Interrupt Controller bindings documentation to json-sch=
ema.
> >
> > Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
> > ---
> >  .../bindings/interrupt-controller/renesas,irqc.txt | 48 --------------=
--
> >  .../interrupt-controller/renesas,irqc.yaml         | 64 ++++++++++++++=
++++++++
> >  2 files changed, 64 insertions(+), 48 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/interrupt-control=
ler/renesas,irqc.txt
> >  create mode 100644 Documentation/devicetree/bindings/interrupt-control=
ler/renesas,irqc.yaml
>
> [...]
>
> > diff --git a/Documentation/devicetree/bindings/interrupt-controller/ren=
esas,irqc.yaml b/Documentation/devicetree/bindings/interrupt-controller/ren=
esas,irqc.yaml
> > new file mode 100644
> > index 0000000..f08d368
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,ir=
qc.yaml
> > @@ -0,0 +1,64 @@
>
> License. The default for existing bindings is GPL-2.0-only. If Renesas
> is the only copyright holder, then please license as (GPL-2.0-only OR
> BSD-2-Clause).
>
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/interrupt-controller/renesas,irqc.y=
aml#
> > +$schema: http://devicetree.org/meta-schemas/interrupts.yaml#
> > +
> > +title: DT bindings for the R-Mobile/R-Car/RZ/G interrupt controller
> > +
> > +maintainers:
> > +  - Geert Uytterhoeven <geert+renesas@glider.be>
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - renesas,irqc-r8a73a4        # R-Mobile APE6
> > +          - renesas,irqc-r8a7743        # RZ/G1M
> > +          - renesas,irqc-r8a7744        # RZ/G1N
> > +          - renesas,irqc-r8a7745        # RZ/G1E
> > +          - renesas,irqc-r8a77470       # RZ/G1C
> > +          - renesas,irqc-r8a7790        # R-Car H2
> > +          - renesas,irqc-r8a7791        # R-Car M2-W
> > +          - renesas,irqc-r8a7792        # R-Car V2H
> > +          - renesas,irqc-r8a7793        # R-Car M2-N
> > +          - renesas,irqc-r8a7794        # R-Car E2
> > +          - renesas,intc-ex-r8a774a1    # RZ/G2M
> > +          - renesas,intc-ex-r8a774c0    # RZ/G2E
> > +          - renesas,intc-ex-r8a7795     # R-Car H3
> > +          - renesas,intc-ex-r8a7796     # R-Car M3-W
> > +          - renesas,intc-ex-r8a77965    # R-Car M3-N
> > +          - renesas,intc-ex-r8a77970    # R-Car V3M
> > +          - renesas,intc-ex-r8a77980    # R-Car V3H
> > +          - renesas,intc-ex-r8a77990    # R-Car E3
> > +          - renesas,intc-ex-r8a77995    # R-Car D3
> > +      - const: renesas,irqc
> > +
> > +  '#interrupt-cells':
> > +    # an interrupt index and flags, as defined in interrupts.txt in
> > +    # this directory
> > +    const: 2
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - '#interrupt-cells'
> > +  - clocks
>
> Add:
>
> additionalProperties: false
>
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    #include <dt-bindings/clock/r8a7790-clock.h>
> > +
> > +    irqc0: interrupt-controller@e61c0000 {
> > +        compatible =3D "renesas,irqc-r8a7790", "renesas,irqc";
> > +        #interrupt-cells =3D <2>;
> > +        interrupt-controller;
>
> required?
>
> > +        reg =3D <0 0xe61c0000 0 0x200>;
>
> Not documented.
>
> > +        interrupts =3D <0 0 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <0 1 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <0 2 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <0 3 IRQ_TYPE_LEVEL_HIGH>;
>
> Not documented.
>
> > +        clocks =3D <&mstp4_clks R8A7790_CLK_IRQC>;
> > +    };
> > --
> > 1.9.1
> >
