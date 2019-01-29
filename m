Return-Path: <SRS0=a0xC=QF=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9D30C169C4
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 29 Jan 2019 18:20:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 880A320857
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 29 Jan 2019 18:20:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727925AbfA2SU3 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 29 Jan 2019 13:20:29 -0500
Received: from mail-vs1-f65.google.com ([209.85.217.65]:33316 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727198AbfA2SU3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Jan 2019 13:20:29 -0500
Received: by mail-vs1-f65.google.com with SMTP id p74so12564897vsc.0;
        Tue, 29 Jan 2019 10:20:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Y4FAx5lMzWBRrcYu9kAr9n963PU/e9b1kKx6XHU5AUI=;
        b=IZz0ItIyu0O/DZ/iFTjzagUym33s/bZiC8SIBABXfXaBvnU60BsDyhkAly97tw2WVx
         I8A+QJWdSh/rXGJ+f5pv1CUWHNpsahr1dhuuKBl9fK98YfhK3x6HsydjBgpIIvAeIHp6
         0gb88YgEoUnJuX4vpoMsG4BqV0UV6xz9k3AE80YRSlqxiizrELwmlkIR0LrCoT/4up2E
         WOtWSlY/0pOI5bfBXCS1fA8rnz54vCebyP/Xh6FmV9S1GxCh0xqyNnd2oXbX9u9nsLH7
         fKzR/GEIttjq1duvgzvazis9wyD8KTGFYZ8zm4E5yh6TjZMKuI+65dxiw/r7+9R2OUjj
         UiDg==
X-Gm-Message-State: AJcUukfPkBwZsgUiVJ2ezk6UorWKFibcjHvTeq8W3t9sxjygcvi91CPD
        snXTypEofYXn4oFyYDuXlsLBUj6aApAOgdgWw/TizUA0
X-Google-Smtp-Source: ALg8bN4Dun6DyS/msQnndhSDaksoY4MsHStRbP4DXUxGw/nLipD82jVeUdJJFW3KAMEsflbvM8a7h6DwL7oZPCBBMg0=
X-Received: by 2002:a67:b60d:: with SMTP id d13mr11537183vsm.152.1548786027760;
 Tue, 29 Jan 2019 10:20:27 -0800 (PST)
MIME-Version: 1.0
References: <fc43bfa2-4312-b52b-a749-e3e43e242a95@cogentembedded.com> <e43f07fd-1407-a87a-7fe5-67a522da9e19@cogentembedded.com>
In-Reply-To: <e43f07fd-1407-a87a-7fe5-67a522da9e19@cogentembedded.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 29 Jan 2019 19:20:15 +0100
Message-ID: <CAMuHMdUixqEcD36ReZj4noF5VOCNHS-qH_9herABkiLSVD3R8A@mail.gmail.com>
Subject: Re: [PATCH 4/7] sh_eth: offload RX checksum on R8A7740
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc:     netdev <netdev@vger.kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Sergei,

On Sun, Jan 27, 2019 at 6:41 PM Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> The R-Mobile A1 (R8A7740) SoC manual describes the Ether MAC's RX checksum
> offload the same way as it's implemented in the EtherAVB MAC...
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Thanks for your patch!

Running netperf as described in patch 2/7, perf tells me there's a reduction
for csum_partial from ca. 1.9% to 0.01%, so this feature seems to work.

Hence:
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

However, while effective according to perf results, using ethtool to
enable/disable
the feature prints an error message:

root@armadillo:~# ethtool -K eth0 rx on
Cannot get device udp-fragmentation-offload settings: Operation not supported
Cannot get device udp-fragmentation-offload settings: Operation not supported
root@armadillo:~# ethtool -K eth0 rx off
Cannot get device udp-fragmentation-offload settings: Operation not supported
Cannot get device udp-fragmentation-offload settings: Operation not supported
root@armadillo:~#

Do you have any clue?

Does this needs testing on R-Mobile A1 with VLAN enabled, too, or is that
independent from the underlying sh-eth hardware version?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
