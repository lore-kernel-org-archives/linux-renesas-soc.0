Return-Path: <SRS0=w5fC=RE=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5B76C43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  1 Mar 2019 10:29:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 74DFA20851
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  1 Mar 2019 10:29:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727952AbfCAK3e (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 1 Mar 2019 05:29:34 -0500
Received: from mail-ua1-f66.google.com ([209.85.222.66]:37496 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725978AbfCAK3e (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Mar 2019 05:29:34 -0500
Received: by mail-ua1-f66.google.com with SMTP id x1so941391uaj.4;
        Fri, 01 Mar 2019 02:29:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Nshx/TPlXVyaCifZXJWyjZVTAR0+U2NiN6DTx1ieRI0=;
        b=os4pN7ws/iC24nwcbpfLUtX3H+1wVZMZAgKTN4LRAwmhXkjwSwuUVL6seuZ9A8QHLO
         3DQ8BQc20j45vrVeMFDEnKV9c/NfnbnhfDu+gtdB0HiTRecx+YGh16dAJ0D1JkTXAvLL
         VmVqn44oBvNZYhNCkVSVdb9EdoRYqbF1dy/2qYA18uWjB6BLT+RCm4ldrczHPI6P2tZo
         Gs9v5QdkZ65CfnMENGk12pxqtvY+mABoiBb7VupfPh+RRGCwdQFXERydwVTq4YvLxxdO
         4fq2agV6cpjrHmEgaTj7kpX3/1NmjeR+BwlqoW4Qt7+cTFoVfV7vPyq/CIC41YAb7Ejc
         4QDA==
X-Gm-Message-State: APjAAAVsJX70rVDtZxMsJTISPteW8Xif4EHBUsjHGeJyIJQDMYoMFZyG
        qIr/Kyh57J68ezLQ4HDvDMbitQUs81iGBC/XA/otkMCZ
X-Google-Smtp-Source: APXvYqye6JI1j72X5vRYS7+JT/byAeO1fSQqm3YvWtJyqw1d1YrCmaYlmIoS3oByKTtzdelrP1gvd6QRPJUzJm0w6ss=
X-Received: by 2002:a67:fc9a:: with SMTP id x26mr2255623vsp.166.1551436172778;
 Fri, 01 Mar 2019 02:29:32 -0800 (PST)
MIME-Version: 1.0
References: <1550742048-28068-1-git-send-email-biju.das@bp.renesas.com> <1550742048-28068-6-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1550742048-28068-6-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 1 Mar 2019 11:29:21 +0100
Message-ID: <CAMuHMdVs_WRSgxGdsWcnok5mH7n4Je-FfT_Z+repbEVHoYnRug@mail.gmail.com>
Subject: Re: [PATCH 5/5] arm64: dts: renesas: r8a774c0-cat874: add RTC support
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Feb 21, 2019 at 10:46 AM Biju Das <biju.das@bp.renesas.com> wrote:
> This patch adds Epson RX-8571 real time clock support.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
