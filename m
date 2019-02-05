Return-Path: <SRS0=SaFT=QM=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58D41C282CB
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  5 Feb 2019 08:54:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 30C582080F
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  5 Feb 2019 08:54:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726854AbfBEIyA (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 5 Feb 2019 03:54:00 -0500
Received: from mail-ua1-f65.google.com ([209.85.222.65]:44879 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725898AbfBEIyA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Feb 2019 03:54:00 -0500
Received: by mail-ua1-f65.google.com with SMTP id d19so865298uaq.11
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 Feb 2019 00:54:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=L4MBknKcBfpZ9hvaRGRYjv3fnH46qhpqKdl4nhgaSvg=;
        b=RZ6m74enUm+RXHE1XvV2Az1pel/6Qi2gRRwIz9+DiXasYdhfdkYmm3gI4Kw5BYl26i
         Tu9AtzgLu1roGbwAk+jCv1Zin0KEQRU14+9k+rLRVYv/0FZsZHrlASwN+XIiUOcKszQV
         2VADL5zH/QZeTYVF9JJDSFndwR7Hibein5I7fDYWctHp2PEEnQWzvLsFkKCiRVgD46GK
         0hTnAGuYrdGJeRCfpVjB0ITSvMnDDidYScm+BFIKJ9BugHxxP9COsjbnnzVHpV4VFRRF
         NSl3NyYK8Ko2Zr0WcteN+sfPqIP5fixcsN1YB9AgtyiPoGN+NNp3hqBHCA1f4g70j99b
         hN9Q==
X-Gm-Message-State: AHQUAuYF62hEKxaT4L21OY436cm2lL/PwcFaA123TleLxv75hpbqBxYu
        vZCzEw6wSvjBbkwvUGiXNmHsbrkV0Cwo7MoTs3g=
X-Google-Smtp-Source: AHgI3IZdti615DEdOo4QmlpwJXz5BC8vP4EeTX6PHBl5LUdZtB6mpAI/RB+h3sv58IViRXL0DAQl6JhUWItmhizFqcI=
X-Received: by 2002:a9f:2726:: with SMTP id a35mr1416078uaa.75.1549356839541;
 Tue, 05 Feb 2019 00:53:59 -0800 (PST)
MIME-Version: 1.0
References: <1548439304-18908-1-git-send-email-ykaneko0929@gmail.com>
In-Reply-To: <1548439304-18908-1-git-send-email-ykaneko0929@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 5 Feb 2019 09:53:48 +0100
Message-ID: <CAMuHMdX5+aeY+Xi5pWrx8uEGm18iP8d2n_48vu3j1S_oWSWOtw@mail.gmail.com>
Subject: Re: [PATCH/RFT v2] pinctrl: sh-pfc: r8a77990: Add DRIF pins, groups
 and functions
To:     Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kaneko-san,

On Fri, Jan 25, 2019 at 7:02 PM Yoshihiro Kaneko <ykaneko0929@gmail.com> wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>
> This patch adds DRIF{0,1,2,3} pins, groups and functions to the R8A77990
> SoC.
>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>
> This patch is based on the sh-pfc branch of Geert Uytterhoeven's
> renesas-drivers tree.
>
> v2 [Yoshihiro Kaneko]
> * As suggested by Geert Uytterhoeven
>   - added DRIF pin groups and pin functions to the automotive section
>     instead of the common section.

Thanks for the update!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in sh-pfc-for-v5.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
