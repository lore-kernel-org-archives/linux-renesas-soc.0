Return-Path: <SRS0=zXAj=RV=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71C64C43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Mar 2019 10:21:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4A7202070D
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Mar 2019 10:21:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727194AbfCRKV2 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 18 Mar 2019 06:21:28 -0400
Received: from mail-vs1-f65.google.com ([209.85.217.65]:46792 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727151AbfCRKV2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Mar 2019 06:21:28 -0400
Received: by mail-vs1-f65.google.com with SMTP id w26so6620986vsk.13;
        Mon, 18 Mar 2019 03:21:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2P0rWQawJDdw/uZMNrXzxuvkuUs88hIWKi3LqK8fSi0=;
        b=WHHCpJY1vJKBH2+C9JsqHWVJSTuNsNnKo7Pjf0LXdp5jj8KE8r5vwv9wMPSQ7viKkg
         yZA0poPX9gQSCbpKeIzkbVW4/idynDJRq4FElqVivXoK8KdTNkl2OcmCw+MvVBN6cQy3
         bVwhjTk2/o/bahOYEFp4MgAv7teSkosUV0WqRrnu4fSXzEYcHnoMYC7gGH5TN72EzQhN
         tZqVndTNUVnTMbYLOp1znjITDec4YpHjATvP9TwROzUwvON0LHAkko0hRneBYbO6Wen7
         A1khPx/K87p4WGs7ieTFgpPqcRKUnxDWfvw6rWvVUSdGnbrmfBppskdN/IaUmdQ3g+Du
         V4Dg==
X-Gm-Message-State: APjAAAUkTdzGbKuV5jjn9KaydFcHbcFfvIkLtf+HjK4lI/8NTocr8CK8
        MvxBmSQVL0xOLRMoXXKOME6h2OtleOpeT+wpsFgz2As9
X-Google-Smtp-Source: APXvYqwq5idNFgPMy69YraOuq260rOAHSzdE4Qz2itGW/QVD8r5LuPEqKrAid587//95oGtCwGnMpPOlyzqqBYjZPQk=
X-Received: by 2002:a67:f843:: with SMTP id b3mr3103825vsp.152.1552904487196;
 Mon, 18 Mar 2019 03:21:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190306232345.23052-1-laurent.pinchart+renesas@ideasonboard.com> <20190306232345.23052-8-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20190306232345.23052-8-laurent.pinchart+renesas@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 18 Mar 2019 11:21:15 +0100
Message-ID: <CAMuHMdWfNk+v9PTMpE43DD8DvrmhZDeAocDReVNOsE=oh4P6uw@mail.gmail.com>
Subject: Re: [PATCH/RFC 07/15] dt-bindings: display: renesas: lvds: Add
 renesas,companion property
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On Thu, Mar 7, 2019 at 12:24 AM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> Add a new optional renesas,companion property to point to the companion
> LVDS encoder. This is used to support dual-link operation where the main
> LVDS encoder splits even-numbered and odd-numbered pixels between the
> two LVDS encoders.

Note that Documentation/devicetree/bindings/usb/generic.txt already
describes a "companion" property without vendor prefix.

> The new property doesn't control the mode of operation, it only
> describes the relationship between the master and companion LVDS
> encoders.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  .../devicetree/bindings/display/bridge/renesas,lvds.txt     | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> index 900a884ad9f5..a720dbb5de69 100644
> --- a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> @@ -45,6 +45,12 @@ OF graph bindings specified in Documentation/devicetree/bindings/graph.txt.
>
>  Each port shall have a single endpoint.
>
> +Optional properties:
> +
> +- renesas,companion : phandle to the companion LVDS encoder. This property is
> +  valid for the first LVDS encoder D3 and E3 SoCs only, and points to the

... on D3 ...

> +  second encoder to be used as a companion in dual-link mode.

Why restrict this to the first LVDS decoder, and not have a backlink in the
other node, like for USB?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
