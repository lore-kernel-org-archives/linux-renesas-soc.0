Return-Path: <SRS0=0nld=RA=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E23EAC43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 25 Feb 2019 09:49:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BA8C320989
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 25 Feb 2019 09:49:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726587AbfBYJtR (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 25 Feb 2019 04:49:17 -0500
Received: from mail-ua1-f68.google.com ([209.85.222.68]:42789 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726493AbfBYJtR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Feb 2019 04:49:17 -0500
Received: by mail-ua1-f68.google.com with SMTP id d21so7728052uap.9;
        Mon, 25 Feb 2019 01:49:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NKfuUCZhb4a2Hng98YnqtIVsa7vGC3q7Lz/aiPFF+wI=;
        b=nHgwVFCBCVyv685xVUSzvfupLSTP+X3G8sd+Mm/EMBpf714bj3uVRXl2pQ+Ry1ZUX5
         hyhV3y1t7uJRiggP1Bpdwk8G6Qq+Dwb/KxwREQV7/eF/Be66uciVMjGOLJqz5xA1gZ96
         VCjlFceU5gF8exE2kaheTVEobQGq6h+0D1031q5k2ZgeUbPgOksaYQRtzqoUaDBy2l7n
         gRGteE9DIfniPrZ+Ndkc2eNn6r/FMkECFJGnjqDkIFF8/W5XaiQ1VuqL6JbB7l6RTSAx
         Ulol4PRzC51EjH6TBfY5WW43rvQQEEpDyaEfOqHwbjr/8qr3vKNo8t++3Rxip+CdBF1Z
         dg/w==
X-Gm-Message-State: AHQUAuZ+m6D1sgHG/kUHN4Z+xMms06ewJGBLCY8WcR+mu7A+FyaZU/Cj
        XKWZFSWEnW5ZEXQUsATWiwf22fkEoI7f4UJOP3U=
X-Google-Smtp-Source: AHgI3IYN31feATPUBQnHJZeelRUmXBJp+4R+4EZ9gpGv1bRDG3z+fW83flVqRruT4afOsAh60OpStpzRz83vg8v5VcU=
X-Received: by 2002:ab0:6419:: with SMTP id x25mr8522719uao.20.1551088155503;
 Mon, 25 Feb 2019 01:49:15 -0800 (PST)
MIME-Version: 1.0
References: <20190225093604.25753-1-horms+renesas@verge.net.au>
In-Reply-To: <20190225093604.25753-1-horms+renesas@verge.net.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 25 Feb 2019 10:49:04 +0100
Message-ID: <CAMuHMdX-U_y7axw9AHYt7Omj5LzE69FTNy6PNUy4TBbxs3CtRA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: salvator: add dummy 2nd port to rcar_sound
To:     Simon Horman <horms+renesas@verge.net.au>, rob+dt@kernel.org,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

CC DT

On Mon, Feb 25, 2019 at 10:37 AM Simon Horman
<horms+renesas@verge.net.au> wrote:
> Add dummy 2nd port node to rcar_sound ports node to satisfy dtc
> recommendation that #address-cells / #size-cells is only needed.
>
> This addresses the following warning:
>
> arch/arm64/boot/dts/renesas/salvator-common.dtsi:703.8-719.4: Warning (graph_child_address): /soc/sound@ec500000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
> arch/arm64/boot/dts/renesas/salvator-common.dtsi:703.8-719.4: Warning (graph_child_address): /soc/sound@ec500000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>
> This change should not have any run-time effect.
>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
>
> ---
> Build tested against renesas-devel-20190214-v5.0-rc6
> ---
>  arch/arm64/boot/dts/renesas/salvator-common.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> index a225c2457274..20b35991bc17 100644
> --- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> +++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> @@ -716,6 +716,15 @@
>                                 capture  = <&ssi1 &src1 &dvc1>;
>                         };
>                 };
> +
> +               /* Dummy node to be overriden by board DT
> +                * Satisfies dtc recommendation that
> +                * #address-cells / #size-cells is only needed
> +                * for graph nodes with multiple child nodes.
> +                */
> +               rsnd_port1: port@1 {
> +                       reg = <1>;
> +               };
>         };
>  };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
