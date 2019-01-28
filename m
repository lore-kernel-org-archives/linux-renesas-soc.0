Return-Path: <SRS0=lhsG=QE=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF429C282C8
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 28 Jan 2019 09:22:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9B7F921736
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 28 Jan 2019 09:22:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726790AbfA1JV6 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 28 Jan 2019 04:21:58 -0500
Received: from mail-ua1-f65.google.com ([209.85.222.65]:39351 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726682AbfA1JV5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Jan 2019 04:21:57 -0500
Received: by mail-ua1-f65.google.com with SMTP id c12so5355310uas.6;
        Mon, 28 Jan 2019 01:21:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZSmY65IwmK9a1rmT6XvyDiI4WZR6WPXo/Tr9mlGd/J8=;
        b=dB0x5HerIDOBsl11jOlP8D9P7KM+fOikWeqbSo4I9fxK85Mo4aBH4XEsBtmwIOmJo3
         D8VM6TS2S7NKbmYVyAXpQH3r9YhAevhK1nqv66JTGz8neMpZJtpJiTQF8O9pcwg8K2wd
         mlnXZqSgXonRLOHYxaoEmHy0Xo5o8oXp/NHKLP5li0HgwgioHFC5HM1C+xsD/VgrCXZX
         rg/3Ilj/M9XJNlkl2U/uGxgb3/1usBjpow9cZUHlOeD7dpDwR/Cb+7nycK3cxD2EzhwG
         rEbp0vMtAI73ifmjHi1HE9J1bI80hRg4dpmaSzTy8SK4ycSaYhURzhghe0Y2lXRgRUhs
         dIxQ==
X-Gm-Message-State: AJcUukddP7j6VQ72ZiuAYJH1QY9Day806ypd0S5KzAhxUa10IfnQ52pX
        P2LHHTqNWb0gubmtfWyRXO+iHW2ritpL6eqDdAh+9Q==
X-Google-Smtp-Source: ALg8bN5hkzYRE458Pg/m1lFflhpY+7CtIWvYZq3JPDjiHYFOPczbsPL7VGUSy2JFdqwy230F5U/4x+Q1xS5m6vKXblQ=
X-Received: by 2002:a9f:364a:: with SMTP id s10mr8299612uad.78.1548667316359;
 Mon, 28 Jan 2019 01:21:56 -0800 (PST)
MIME-Version: 1.0
References: <fc43bfa2-4312-b52b-a749-e3e43e242a95@cogentembedded.com> <b73763ac-5909-c95e-efa5-9d44fba9b9bf@cogentembedded.com>
In-Reply-To: <b73763ac-5909-c95e-efa5-9d44fba9b9bf@cogentembedded.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 28 Jan 2019 10:21:44 +0100
Message-ID: <CAMuHMdUYH-UzmiMv6LUT=R3gmHSF7LvcaDXszUixtAeXgjTr_Q@mail.gmail.com>
Subject: Re: [PATCH 1/7] sh_eth: rename sh_eth_cpu_data::hw_checksum
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

Thanks for your patch!

On Sun, Jan 27, 2019 at 6:40 PM Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Commit 62e04b7e0e3c ("sh_eth: rename 'sh_eth_cpu_data::hw_crc'") renamed
> the field to 'hw_checksum' for the Ether DMAC "intelligent checksum",
> however some Ether MACs implement a simpler checksumming scheme, so that
> name now seems misleading. Rename that filed to 'csmr' as the "intelligent
> checkmum" is always controlled by the CSMR register.

checksum

> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Apart from that:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- net-next.orig/drivers/net/ethernet/renesas/sh_eth.c
> +++ net-next/drivers/net/ethernet/renesas/sh_eth.c

> @@ -793,7 +793,7 @@ static struct sh_eth_cpu_data r8a77980_d
>         .no_trimd       = 1,
>         .no_ade         = 1,
>         .xdfar_rw       = 1,
> -       .hw_checksum    = 1,
> +       .csmr           = 1,

Interestingly, I cannot find the CSMR register in the R-Car Gen3 docs?
Not introduced by this patch, though.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
