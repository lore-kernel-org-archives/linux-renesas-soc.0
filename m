Return-Path: <SRS0=kB1P=VJ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F2CFC742C2
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 12 Jul 2019 13:54:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2F330208E4
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 12 Jul 2019 13:54:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727204AbfGLNy5 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 12 Jul 2019 09:54:57 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:42558 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726977AbfGLNy5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Jul 2019 09:54:57 -0400
Received: by mail-oi1-f195.google.com with SMTP id s184so7311037oie.9;
        Fri, 12 Jul 2019 06:54:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AonmHwMcZc5rEdlN0ap4vVdG7n/weJ5TGkeMCGggyEg=;
        b=q0QaWphPUcneRcWYAiC+ta5kVi8wWZlR8Gga6+1CbdNQdFl3IUfc0KvcE3vkD47G+b
         2zvLJ91aVoWrMbP0uR9LLNY9vpA0LKDKHr5eH8kS4ImW2zWJBkSXIHyIKAplee9VYj6K
         7R3a1MHIxKvDRTftLgTN3N3lamUKwzB13JsDCLLj0DsvpcvxtmhALp2QDnslcE6pqXBm
         utgoPViDeQpoMU2oeNv7gRYT67JvhiPhkcc0nq7FyTEu+XXBfDDxzEi4u1gZiQhzNMNu
         wmECDhmaUHaIb/5ICW9gGHZwHxxVN5KKxC+uKAEpPpqfZPY0gSmCU3b+zYTFhGjQrSRS
         OfJg==
X-Gm-Message-State: APjAAAV4c6aCIhvDo8UwmECBLGkomkwXK4I/8CAlEbJ/l+cAGdkgRpZS
        LJEJy2caBvXDQ4T1d+s4Km8x523s0pC75ApqwIE=
X-Google-Smtp-Source: APXvYqyqLJ2sVUL9niIjQNttPJq2ZPvdG5/xafmzLozgSm5UdXz4Xk/KX6kBKGQk7d9pANoQgIGc0FlbCIveFZJKD90=
X-Received: by 2002:aca:c4d5:: with SMTP id u204mr5878215oif.131.1562939696439;
 Fri, 12 Jul 2019 06:54:56 -0700 (PDT)
MIME-Version: 1.0
References: <1562333979-28516-1-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1562333979-28516-1-git-send-email-fabrizio.castro@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 12 Jul 2019 15:54:45 +0200
Message-ID: <CAMuHMdUu7YesYt6JgH-hYBCF7s7M7HHBC5OxEmipcpqFBMezrA@mail.gmail.com>
Subject: Re: [PATCH 0/3] Add HDMI audio support to the HiHope RZ/G2[MN]
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>, xu_shunji@hoperun.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Fabrizio,

On Fri, Jul 5, 2019 at 3:39 PM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> this series adds HDMI audio support to the HiHope RZ/G2[MN].
>
> Thanks,
> Fab
>
> Fabrizio Castro (3):
>   arm64: dts: renesas: r8a774a1: Use extended audio dmac register
>   arm64: dts: renesas: r8a774a1: Add SSIU support for sound
>   arm64: dts: renesas: hihope-common: Add HDMI audio support

Thanks, I have applied and queued for v5.4 the first two patches.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
