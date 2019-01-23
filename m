Return-Path: <SRS0=9OK0=P7=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C568AC282C0
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 23 Jan 2019 15:02:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9B74F20870
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 23 Jan 2019 15:02:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725971AbfAWPCn (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 23 Jan 2019 10:02:43 -0500
Received: from mail-vs1-f65.google.com ([209.85.217.65]:44401 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725862AbfAWPCn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Jan 2019 10:02:43 -0500
Received: by mail-vs1-f65.google.com with SMTP id u11so1441597vsp.11;
        Wed, 23 Jan 2019 07:02:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ss+UimM9JBuWnzMyu41lPiY6/smQ4PSx9Tgu35P0loY=;
        b=TWYYnNzIla4lkxyteI+wZQMHBYtvJhsUimtVQTFjzf88E0Np7SN2/1fUlWoTjbk96Z
         ahY+Czp5h0xqGIfaa0iNUnib5YEDEZbNlm5Vi4g0xdLSDp8D7Jz9Nlr5yYnhsUJTkt5M
         UusT2yPZ6wOF+dgDFVLcVl7yXKBHH091qJFrp6koHbfLoHP6obx7LWgFdHKhxOeej3Au
         bbko1FCAwdvoHbLnUm1eJ4C3KI7VhoFlXVsXCGvxgC9RztZ0dSMm6JXKRhV8VB9aPPYL
         S7F37Z/vdLsh7EtePKYD9NpLatV6/Deb842GintMD3AAIRRaTkutoj0e0Orx8cx2J7fO
         3WkA==
X-Gm-Message-State: AJcUukegHX+jZpWDx34CDgYAGQE+eLmEngez3zqSaSQwcaM3ColQUJek
        wUyeb/yYrG5uJsFPQOIbdqYoK8O3TQ45CnyBPlY=
X-Google-Smtp-Source: ALg8bN59PcimyttPNYJmCOFbqaXaw3t3Mhin2IQreWrAdke0ycSteXgP/nRXHpq+8M3JBawTLwYHkzhOxRsjV/qVauI=
X-Received: by 2002:a67:b60d:: with SMTP id d13mr1011358vsm.152.1548255761618;
 Wed, 23 Jan 2019 07:02:41 -0800 (PST)
MIME-Version: 1.0
References: <20190111124517.2730-1-geert+renesas@glider.be>
In-Reply-To: <20190111124517.2730-1-geert+renesas@glider.be>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 23 Jan 2019 16:02:30 +0100
Message-ID: <CAMuHMdUBghaJ3HZvMuo7p-p+8fPowzgiYwV7DViP2DQRsgK5tw@mail.gmail.com>
Subject: Re: [PATCH/RFC] pinctrl: sh-pfc: r8a7791: Fix VIN1 versioned groups
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Valentine Barshak <valentine.barshak@cogentembedded.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jan 11, 2019 at 1:45 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> The naming of the "b" versions of the VIN1 pin groups is a bit odd, in
> that the "_b" appears in the middle of the names, instead of as a
> suffix.
>
> Increase consistency with other SoCs by making R-Car M2-W and M2-N, and
> RZ/G1M and RZ/G1N, use the recently added optional "version" argument of
> the VIN_DATA_PIN_GROUP() macro.
>
> Note that this breaks backwards compatibility with existing DTBs, but
> there are no upstream users of the "vin1_b_*" names.
>
> Fixes: 8e32c9671f84acd8 ("pinctrl: sh-pfc: r8a7791: Add VIN pins")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Is it worth making this change?
> If yes, should we retain backwards-compatibility using e.g. the patch
> below, increasing kernel size by 380 bytes?
>
> Note that unlike the deprecated "avb_mdc" pin groups on R-Car Gen3, the
> "vin1_b_*" groups never had upstream users, so I'm inclined not to care
> about backwards compatibility.

>         --- a/drivers/pinctrl/sh-pfc/sh_pfc.h
>         +++ b/drivers/pinctrl/sh-pfc/sh_pfc.h
>         @@ -67,6 +67,14 @@ struct sh_pfc_pin_group {
>                         .nr_pins = ARRAY_SIZE(n##__VA_ARGS__##_pins.data##s),   \
>                 }
>
>         +#define VIN_DATA_PIN_GROUP_ALIAS(alias, n, s, ...)                     \
>         +       {                                                               \
>         +               .name = #alias,                                         \

JFTR (everything below "---" is not meant to be included anyway):

        .name = #alias#s,                                       \

>         +               .pins = n##__VA_ARGS__##_pins.data##s,                  \
>         +               .mux = n##__VA_ARGS__##_mux.data##s,                    \
>         +               .nr_pins = ARRAY_SIZE(n##__VA_ARGS__##_pins.data##s),   \
>         +       }
>         +

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
