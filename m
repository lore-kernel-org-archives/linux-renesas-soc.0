Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0494CC433EF
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  7 Sep 2021 19:17:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DB49361131
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  7 Sep 2021 19:17:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345741AbhIGTSu (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 7 Sep 2021 15:18:50 -0400
Received: from mail-vk1-f182.google.com ([209.85.221.182]:34334 "EHLO
        mail-vk1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230203AbhIGTSu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Sep 2021 15:18:50 -0400
Received: by mail-vk1-f182.google.com with SMTP id 13so125412vkl.1;
        Tue, 07 Sep 2021 12:17:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HybJMlAw2y2ijeDg8NtpVEMi7UblwoRmrxRA4Rveu7I=;
        b=UHQlzCoWdaEna9A0ew1ImNuxeEQXt7cnuN+uUAfq1k/1N8EENveH1MpbrH04GYO819
         yRTUv8E8jnUdrIEd4oiGs7Jxk2Kd96Km+7fC02GaIWUx2bp5wbRfRHRHHD2jQ6pIUTjj
         PNd209fkEOu3zTdsqBfwkAT8BwMmzzEar5Hdk21Yy1UcAcsCTAHpjBNc2j1VE9ETtQht
         n7AGtxXUQE9me8wGXUxcY/Ox3kqLN3/mckcy59//7xzYns+AKEokjej81OFt1LXhs02l
         jqU1R5f+ftyaUAIr2qzVQPDrioo6U4Em4bqYlp0gGb7T2ElzH1KJ9tvkckcgTU/Ll8Pz
         8VVg==
X-Gm-Message-State: AOAM5334MXtLEVt+22rH5mgk2N/mTN0hXjo3OZFtFopz7g0enQhbFC+O
        ziCfcGdSxnpuYsAetdeJzWgQaywsRjbLWWuJeF7wHn8z
X-Google-Smtp-Source: ABdhPJyIH0Mriu2yKBIMyY3xYIxiPRQzP7kDyByVOL/e44hGiXY917Ry3aMp6jg6SHq1PM2/3dQZEiN5LGPiKBwRQ6U=
X-Received: by 2002:a1f:d247:: with SMTP id j68mr9449607vkg.7.1631042263032;
 Tue, 07 Sep 2021 12:17:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210901233655.1602308-1-kieran.bingham@ideasonboard.com>
 <CAMuHMdXHAfg3_VoeXUBT2-QceLR9KQ3pWjz+5=-wK1QRxK14bw@mail.gmail.com> <YTezLHrRt/YpOlJZ@robh.at.kernel.org>
In-Reply-To: <YTezLHrRt/YpOlJZ@robh.at.kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 7 Sep 2021 21:17:31 +0200
Message-ID: <CAMuHMdXGK=+W=C3c9GV8br9ZvQpAhj4ePiq7m1N8YBo1vzZjvQ@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: display: renesas,du: Provide bindings for r8a779a0
To:     Rob Herring <robh@kernel.org>
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        "open list:DRM DRIVERS FOR RENESAS" <dri-devel@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Rob,

On Tue, Sep 7, 2021 at 8:45 PM Rob Herring <robh@kernel.org> wrote:
> On Mon, Sep 06, 2021 at 10:13:07AM +0200, Geert Uytterhoeven wrote:
> > On Thu, Sep 2, 2021 at 1:39 AM Kieran Bingham
> > <kieran.bingham@ideasonboard.com> wrote:
> > > From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > >
> > > Extend the Renesas DU display bindings to support the r8a779a0 V3U.
> > >
> > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > > ---
> > > v2:
> > >  - Collected Laurent's tag
> > >  - Remove clock-names requirement
> > >  - Specify only a single clock
> >
> > Thanks for the update!
> >
> > > --- a/Documentation/devicetree/bindings/display/renesas,du.yaml
> > > +++ b/Documentation/devicetree/bindings/display/renesas,du.yaml
> > > @@ -39,6 +39,7 @@ properties:
> > >        - renesas,du-r8a77980 # for R-Car V3H compatible DU
> > >        - renesas,du-r8a77990 # for R-Car E3 compatible DU
> > >        - renesas,du-r8a77995 # for R-Car D3 compatible DU
> > > +      - renesas,du-r8a779a0 # for R-Car V3U compatible DU
> > >
> > >    reg:
> > >      maxItems: 1
> > > @@ -773,6 +774,55 @@ allOf:
> > >          - reset-names
> > >          - renesas,vsps
> > >
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            enum:
> > > +              - renesas,du-r8a779a0
> > > +    then:
> > > +      properties:
> > > +        clocks:
> > > +          items:
> > > +            - description: Functional clock
> > > +
> > > +        clock-names:
> > > +          maxItems: 1
> > > +          items:
> > > +            - const: du
> > > +
> > > +        interrupts:
> > > +          maxItems: 2
> > > +
> > > +        resets:
> > > +          maxItems: 1
> > > +
> > > +        reset-names:
> > > +          items:
> > > +            - const: du.0
> >
> > This is now inconsistent with clock-names, which doesn't use a suffix.
>
> But it is consistent with all the other cases of 'reset-names'. The
> problem is 'clock-names' is not consistent and should be 'du.0'.

True.

> Ideally, the if/them schemas should not be defining the names. That
> should be at the top level and the if/them schema just limits the number
> of entries. That's not always possible, but I think is for clocks and
> resets in this case.

It's a bit tricky.
For clocks, there's usually one clock per channel, but not always.
Plus clocks for external inputs, if present.
For resets, there's one reset for a group of channels, with the number
of channels in a group depending on the SoC family.
And then there's the special casing for SoCs where there's a gap in
the channel numbering...

Still wondering if it would be better to have one device node per
channel, and companion links...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
