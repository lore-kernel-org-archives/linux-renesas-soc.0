Return-Path: <SRS0=J+Ha=QO=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02FA9C282C2
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  7 Feb 2019 10:25:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D23DF218FE
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  7 Feb 2019 10:25:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726565AbfBGKZh (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 7 Feb 2019 05:25:37 -0500
Received: from mail-vs1-f65.google.com ([209.85.217.65]:41212 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726186AbfBGKZh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Feb 2019 05:25:37 -0500
Received: by mail-vs1-f65.google.com with SMTP id t17so6342853vsc.8
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 Feb 2019 02:25:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YgvxRCK37Fw2qPCrWnlpycUgmPDHxTX9kNtLO/Vssbg=;
        b=FWjRtgqUPlaFOKu3oXtPaLYP1PHDeiVgzwHdvQwtpdLgUnllL9kB+WHUsyEjMfDmgk
         0fw0wnyWFQOgIIJRvhEIqgyOsWUsbPAkKTyHOj14GeM7sK4zlfdfszSeCoAVdce9cayC
         54YWHqPOJ6SCT7ofDgIGvi8TOQrGNBJks5kUzh4Vti4H7c66Wktcf7HIGT0WKOeQan4J
         8MuxaakCqzgubhRAZed4tozgv3/7IjywioPNvGpqmi/t+KL72VG9lK7IDrO7i0XFdL4y
         QyXxoJvVQQ+3SCXDJFpWgBWDxJdEdLmGpzzbGJEtEiM8WUqHl+psFdDJkp5bcE9EoQIe
         NiYw==
X-Gm-Message-State: AHQUAuZ6/s3AxMJlfXiqBpppKsF8FAqa0ddzaNaJwGM3ig4r5kmABFno
        IeE9qIKrrUAPhov8nHplG3rXWzRl+VFEMIQOV1Y=
X-Google-Smtp-Source: AHgI3IYGabWcO/et4LXEbg0EEZtIU3c3umElatVMMOq/QpB0LjTTSoysLLKI94MxXL1kEQJogju9m2Y0WR2d/x2T2MI=
X-Received: by 2002:a05:6102:24d:: with SMTP id a13mr1895120vsq.63.1549535136184;
 Thu, 07 Feb 2019 02:25:36 -0800 (PST)
MIME-Version: 1.0
References: <20190207091047.22046-1-geert+renesas@glider.be> <20190207101415.llxazy3wi36yjgov@verge.net.au>
In-Reply-To: <20190207101415.llxazy3wi36yjgov@verge.net.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 7 Feb 2019 11:25:24 +0100
Message-ID: <CAMuHMdWD3x8ZJy_8r1yA4QGAerySjwSAPDESEQwgsyPYscWueg@mail.gmail.com>
Subject: Re: [PATCH LOCAL] arm64: dts: renesas: r8a774a1: Add required model
 to dummy board DTS
To:     Simon Horman <horms@verge.net.au>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Simon,

On Thu, Feb 7, 2019 at 11:14 AM Simon Horman <horms@verge.net.au> wrote:
> On Thu, Feb 07, 2019 at 10:10:47AM +0100, Geert Uytterhoeven wrote:
> > make dtbs_check:
> >
> >     arch/arm64/boot/dts/renesas/r8a774a1-dummy.dt.yaml: 'model' is a required property
> >
> > Fixes: caf23540a44f1036 ("arm64: dts: renesas: r8a774a1: Add dummy board DTS")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Thanks, applied to topic/arm64-dummy-boards which is included in devel
> branch of the renesas tree but is not included not the next branch of the
> renesas tree nor targeted at linux-next.

Thanks!

Feel free to squash it into the original, if you think that makes sense.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
