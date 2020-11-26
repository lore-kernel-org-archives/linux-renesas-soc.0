Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88447C64E7B
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 26 Nov 2020 13:39:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 38CF8221FE
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 26 Nov 2020 13:39:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390576AbgKZNj1 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 26 Nov 2020 08:39:27 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:45963 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390472AbgKZNj0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Nov 2020 08:39:26 -0500
Received: by mail-ot1-f66.google.com with SMTP id k3so1867888otp.12;
        Thu, 26 Nov 2020 05:39:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EBEmuU91pYqLfQ3YGZGbk+yq54IRZktH6WhNjM47s9I=;
        b=tFIHTnEyqYiduRZ3ZvlVAofsOcU39W6Vd8uTy5xn6bH8LSXe0pdA2MNCnIn/QjSvvX
         Y/4OCUKBeWZblQAGz/YvkrnhIiWVy8SkH7DM+d6KJeGo4PBj7ywZTtw6H0KOsk2D//9E
         EduRpv45zqNbs++tJfNwk40yvkghr4Z4lAvr3wDc4NSVIVYLqtqbORULha+7zo4z/O2A
         Yy3bhA8HKUxDd681oy8UyoOPQW54ejWsxMNeBU5QCpcauiUzZGDKWG6EOoS3SM3ouA3e
         WuSmyHrvLiGTtaly2dcv94InuJccNzz09ebj7c6DqSsvAWuC2SdJCO0TEb6w0uktbVZB
         kskQ==
X-Gm-Message-State: AOAM533gGx0EE3nS0/gnXzUTi3vvAAzwkeQCnvdGkjo0Nmk69E2hJgWY
        xI638a+kN3cGXFz8mhlg5LlbcTOQ4K/luutVj+A=
X-Google-Smtp-Source: ABdhPJyQuVrEtrEM865mHm51prMFOdSEfEfHVcshVA+1GyxtMBdVjPX52mxFA8+Xfw/klNI/acrafaOcpwgnBGhU614=
X-Received: by 2002:a9d:686:: with SMTP id 6mr1970874otx.107.1606397965198;
 Thu, 26 Nov 2020 05:39:25 -0800 (PST)
MIME-Version: 1.0
References: <20201126103053.29881-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20201126103053.29881-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20201126103053.29881-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 26 Nov 2020 14:39:14 +0100
Message-ID: <CAMuHMdW_Ov+vqymyqX-GO_8ifNaLAaGLayrpHzvAFD7kn_f0Zw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] ARM: dts: r8a7742-iwg21d-q7-dbcm-ca: Separate out
 ov5640 nodes
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar,

On Thu, Nov 26, 2020 at 11:31 AM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> The camera daughter board can also be connected to 8-bit ov7725 sensors,
> so in preparation for configurable option to choose depending on the
> camera's connected separate out ov5640 nodes in a dtsi file.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

However, I think this can still be improved upon.  As it's a bit difficult
to explain, I'll send an updated version of your series with my
suggestions applied.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
