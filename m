Return-Path: <SRS0=SHeS=PY=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C802C43387
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 16 Jan 2019 18:50:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5B02D2086D
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 16 Jan 2019 18:50:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729545AbfAPSuU (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 16 Jan 2019 13:50:20 -0500
Received: from mail-ua1-f68.google.com ([209.85.222.68]:33142 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729537AbfAPSuT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Jan 2019 13:50:19 -0500
Received: by mail-ua1-f68.google.com with SMTP id t8so2560408uap.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Jan 2019 10:50:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Y4CDtY+26AD2jRfNQyZE039zi0pOb2mOoG/EjXmze+M=;
        b=VxYcXLvHwPquZlqjqpHobJ30LZFGsrcU0GVlm6Ry7JQ6OVjKgxZJqoG3riKGf20xUc
         uAeWqTa+EmOKVyFTkrKVYEfy6jx1avrpvBDVzPbttw/XrA4yroqYS3mnwVtc0JwdUEp+
         h2agHC9CJLcslIqxNR6LcTJ+YXVquddV1JlK3KNcow6IxxveM7f8sNEZ8IbgemxiU09B
         vjCzYIcDbxaLrz90ZzN7Ld5Jgc3/YTyZJ/AWP3n/Wx7AlReIVDg3F9+Bg+1/uDrSI2fT
         H+ljq2dtrtN8fxWfnj9r4a9fDA9A9hD6QqipEFgYZKs4Gi0WLDsM0/63k0G49Kl54Xcx
         nL/g==
X-Gm-Message-State: AJcUukfppHy3oeFjyA17kN6kEffT3wmRQlNTu6FV2JhBJdfgnC1Fpey4
        rCaH+Zd9n9sZQjdSkPUkb6p4NnLTq63qXubJzns=
X-Google-Smtp-Source: ALg8bN7JHwE7pzAEG2pcmA0p0BkXvQdMXvaniMT8Jr9KUEdNsScYLvwFCQRnzSMYC6DjEaMKou8mU2HY1K5Vee2w6r8=
X-Received: by 2002:ab0:1393:: with SMTP id m19mr4209629uae.75.1547664618795;
 Wed, 16 Jan 2019 10:50:18 -0800 (PST)
MIME-Version: 1.0
References: <1547553687-4407-1-git-send-email-ykaneko0929@gmail.com>
In-Reply-To: <1547553687-4407-1-git-send-email-ykaneko0929@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 16 Jan 2019 19:50:06 +0100
Message-ID: <CAMuHMdVmjNagg0c2MVSQ_vibyDcTt1fKgh-190aJPxkzFGkRHw@mail.gmail.com>
Subject: Re: [PATCH/RFT] pinctrl: sh-pfc: r8a77990: Add TMU pins, groups and functions
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

On Tue, Jan 15, 2019 at 1:01 PM Yoshihiro Kaneko <ykaneko0929@gmail.com> wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>
> This patch adds TMU TCLK{1,2} pins, groups and functions to
> the R8A77990 SoC.
>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in sh-pfc-for-v5.1...

Thanks!

> --- a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c

> @@ -3716,7 +3753,7 @@ enum {
>  };
>
>  static const struct {
> -       struct sh_pfc_pin_group common[262];
> +       struct sh_pfc_pin_group common[266];

... with the array limits updated due to the deferred DRIF patch.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
