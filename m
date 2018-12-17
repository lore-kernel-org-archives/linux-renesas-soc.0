Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3D03C43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 14:59:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B841720874
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 14:59:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387562AbeLQO7L (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 09:59:11 -0500
Received: from mail-vs1-f66.google.com ([209.85.217.66]:35584 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387546AbeLQO7K (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 09:59:10 -0500
Received: by mail-vs1-f66.google.com with SMTP id e7so7873530vsc.2;
        Mon, 17 Dec 2018 06:59:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kqVlcJxPVw3ksV1QHYV8qZDI/W5xD2C4PIRVqJpdrPQ=;
        b=q8zCpofpaj0duS4kEdVrQXBdkAGzLV8C+QZngBc33HJwfWr8xywG8lyk/ok5OT575H
         zf8VVTsb7x7/xK3FWmykQn1eIvE1hTPc1l1Pyhs/2W2rjpvDcgsOW1LTYSm39J+/piV2
         zhoSJ5FKvfj3EsWIo4G2rQjRKGNdBNCQUnTspax3KSX7Rmg0vDLzKhncG0jR7pezzVYt
         xMRvoETYyMghyqHvs0IqI3iwQIvJ61WUtpmteeaKs57gr6bnw4CDFs7uoIG0vjNr4Tvz
         0MslBt9rzPfWe0BFUQ2raKcqYy4jXQOVRGarAlLm1Ddf8G2ggv3D0h9sz/EJ3t7dwoNn
         tZ1A==
X-Gm-Message-State: AA+aEWbo3fN1QpMQwuJjBLJQIsBMDG2sS7a2o4x+zvk9E3LHPsu1kfCe
        V3zFjuz/Qk67VrAueSpW1f0e16I57atcpwlRqzo=
X-Google-Smtp-Source: AFSGD/X8aYJiyZjb3xt7uAHSePmGMVCGiWmM1JToTlO9lzEDui2jLR+XqYAH+e10sn7I+V4LirNKAjBmnk3wp23M3sk=
X-Received: by 2002:a67:d119:: with SMTP id u25mr6112451vsi.63.1545058748804;
 Mon, 17 Dec 2018 06:59:08 -0800 (PST)
MIME-Version: 1.0
References: <20181213182714.26094-1-geert+renesas@glider.be>
 <20181213182714.26094-12-geert+renesas@glider.be> <20181217144618.a6omxq2y4acydp75@verge.net.au>
In-Reply-To: <20181217144618.a6omxq2y4acydp75@verge.net.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 17 Dec 2018 15:58:52 +0100
Message-ID: <CAMuHMdV6rTRGDjuExaDNjSdBrVg3hb=kZB8RsqibZYKZm6HSsQ@mail.gmail.com>
Subject: Re: [PATCH 11/15] pinctrl: sh-pfc: Print actual field width for
 variable-width fields
To:     Simon Horman <horms@verge.net.au>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Simon,

On Mon, Dec 17, 2018 at 3:46 PM Simon Horman <horms@verge.net.au> wrote:
> On Thu, Dec 13, 2018 at 07:27:10PM +0100, Geert Uytterhoeven wrote:
> > The debug code in sh_pfc_write_config_reg() prints the width of the
> > field being modified.
> >
> > However, registers with a variable-width field layout are identified by
> > pinmux_cfg_reg.field_width being zero, hence zeroes are printed instead
> > of the actual field widths.
> >
> > Fix this by printing the Hamming height of the field mask instead, which
> > is correct for both fixed-width and variable-width fields.
>
> s/height/width ?

Nah, weight. Will fix.
https://en.wikipedia.org/wiki/Hamming_weight

> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
