Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5D16ECAAD8
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 30 Aug 2022 07:32:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230467AbiH3Hcb (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 30 Aug 2022 03:32:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230109AbiH3Hca (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Aug 2022 03:32:30 -0400
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03B6473317
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Aug 2022 00:32:27 -0700 (PDT)
Received: by mail-qk1-f175.google.com with SMTP id h27so7791753qkk.9
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Aug 2022 00:32:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=5g4Yph2Tt8iQbwcPMZpVvWSFWmUzTurP1FUrprPe2lI=;
        b=SSswNsgniJJqE4KRqEpFlViKxfZuSnMdGRcbP3QDRkQ0k0pX1LSUuBRqz9H/1hVkmO
         maI6ln7j9dppZ80GP3et4h9jzGjwhJUa+g0JJFR/Ah7Iz9pvKB0l6HMnPB+e0BeSTDRb
         PHVzv01uV8T1vgZFqenJf5F8R9/srvzsKwJb0h1Jyxa+qk0LxldokvlShUJGxpMQXTDi
         XTeKbbGAfamYRe8rNKFlDhUbt4Wce5KBL8jvuCWf+SD0KBLrcefS2O7mOsyIPKDe/Vp+
         bmwX3u1NzYVSmH7CVFrdic6cGMBDDOEwsCd5WZ1Vai6mWjRCYMYn7p7zot/vCfdx114i
         Nunw==
X-Gm-Message-State: ACgBeo2zitdyDQtlTqrgJeC6zFIQEnrmryLzfxktp2fkWPhWNDYtQnv7
        vs4m/baQNqWyNfku4eSYe9Hn4Otv5wFV8g==
X-Google-Smtp-Source: AA6agR4P+7F7qJKwYZv2FvQ/AJD0O6A4Rtrpu/Is1gY6+bSqJXvacirXM4zd+KCz+opD4c4+DVHw3A==
X-Received: by 2002:a05:620a:a42:b0:6bb:2168:7517 with SMTP id j2-20020a05620a0a4200b006bb21687517mr11112787qka.562.1661844746666;
        Tue, 30 Aug 2022 00:32:26 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id n3-20020a05620a294300b006b97151d2b3sm7855189qkp.67.2022.08.30.00.32.26
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Aug 2022 00:32:26 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-3378303138bso252347427b3.9
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Aug 2022 00:32:26 -0700 (PDT)
X-Received: by 2002:a0d:e895:0:b0:340:ab79:3285 with SMTP id
 r143-20020a0de895000000b00340ab793285mr13046727ywe.358.1661844745991; Tue, 30
 Aug 2022 00:32:25 -0700 (PDT)
MIME-Version: 1.0
References: <8735de626c.wl-kuninori.morimoto.gx@renesas.com> <871qsy625m.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <871qsy625m.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 30 Aug 2022 09:32:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXAqQwBoe6CtMG+CEZUvcHcjm8uO0EcT0gAPrwubsGOwQ@mail.gmail.com>
Message-ID: <CAMuHMdXAqQwBoe6CtMG+CEZUvcHcjm8uO0EcT0gAPrwubsGOwQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] arm64: dts: renesas: add condor-common.dtsi
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Andrey Dolnikov <andrey.dolnikov@cogentembedded.com>,
        Valentine Barshak <valentine.barshak@cogentembedded.com>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Aug 30, 2022 at 1:49 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> We have V3H Condor board, and will have V3H2 Condor-I board.
> This patch adds condor-common.dtsi to share the common settings
> between these boards.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.1.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
