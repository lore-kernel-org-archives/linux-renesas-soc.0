Return-Path: <SRS0=qJci=OX=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 068C7C67839
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 14 Dec 2018 10:15:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CB68F2080F
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 14 Dec 2018 10:15:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB68F2080F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729076AbeLNKP3 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 14 Dec 2018 05:15:29 -0500
Received: from mail-vs1-f68.google.com ([209.85.217.68]:33453 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728269AbeLNKP3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Dec 2018 05:15:29 -0500
Received: by mail-vs1-f68.google.com with SMTP id p74so3063553vsc.0;
        Fri, 14 Dec 2018 02:15:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4Kxxzl240bHwfHlkHEvEpqlLBZyTLpnPYvupEh+6LRw=;
        b=tZ/DdjeOsmlE8M4+nRGke5X/6z3iB8lA6SarQY8ZliRLYIxVIKPnALu9pAl3rgfTAj
         FeCtNIsBX9JGHaOC9PZs72QKuwIO13ardTlLAYukA68YnAzLLtzKREVHGJh+LGKxd7rw
         Pko3jo2SgMlPd4yYgk5AtNFSucJwUnNaVi8PaMYb7Df+pcXvEneSro+CBvEYL4aiFOJh
         B8eRDVIdY2Fka8ofYeHiT5u5meEkfOPaqw8VginOXXeBs5oUmOV1R+DKmxFwvIqmoOi0
         9gDgDHBvN/568GKT+3Lq6bABU1ju/DK20m7AD++NiKczkJ0qPR59zv6QAblnZ31RnOJq
         wa/Q==
X-Gm-Message-State: AA+aEWZyI7icpwBGWcmE4RFdc0fzmf9jdKUDLTVZa55xu+j6jRsn8NOj
        +TkJlAtv5Nn+RQSLafMYMiyefj9W45a2eX/9ytE=
X-Google-Smtp-Source: AFSGD/Vf5RcKvHAyUAnZ4IDLFlEZ4wVLLbCqCg4zlk0NwwzhNqoBTRCpiJdtapOrt7rMxjAZedKPCc03lQHueQZqzY8=
X-Received: by 2002:a67:c202:: with SMTP id i2mr911857vsj.11.1544782528487;
 Fri, 14 Dec 2018 02:15:28 -0800 (PST)
MIME-Version: 1.0
References: <1544732415-6453-1-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1544732415-6453-1-git-send-email-fabrizio.castro@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 14 Dec 2018 11:15:17 +0100
Message-ID: <CAMuHMdVCd_LSGA97GO_exkqzThYW1S9u0atrmk=f=twr39yBPg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pwm: rcar: Add r8a774c0 support
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linux PWM List <linux-pwm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Dec 13, 2018 at 9:20 PM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> Document RZ/G2E (R8A774C0) SoC bindings.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
