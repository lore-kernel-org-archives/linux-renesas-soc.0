Return-Path: <SRS0=nlYi=QS=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74E88C169C4
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 11 Feb 2019 12:18:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4F434218D8
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 11 Feb 2019 12:18:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727139AbfBKMSm (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 11 Feb 2019 07:18:42 -0500
Received: from mail-vk1-f196.google.com ([209.85.221.196]:41677 "EHLO
        mail-vk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726025AbfBKMSm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Feb 2019 07:18:42 -0500
Received: by mail-vk1-f196.google.com with SMTP id t127so2385270vke.8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Feb 2019 04:18:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HxpbVPKX0mm/+8EibOoTUTocTkonJF1quWzNIyJ2Tuo=;
        b=gOHLL8pTjnyXYkSHD+ineYcpDx8dLVqrVw6iaYOUosPePZqvStcWpHK98+R0SUFnfH
         qUKdwEajdlVLPsw5CfAbU1oC09MabWjQKGw+htguAswsn+HZh2CGVGE0MWXa9lmid7Dp
         0CHfsBuMP8popfNDlCTK+3pUzkSHUKCDoMUaaxP363JNrIaMB2cbFx9LpLsZL+PeQRI2
         AAz2vJBSJZbaEt5YWBcnTTP0JcMOvA2HJAaQXhiVrGme0lguH8viP0teB0mltXU3o4Yk
         HdGzFTqWSWu4weCdESQaSmbRCld72OrczALOV3THRiWcyhL+brTkWabc968ZybBe6IEu
         oI3Q==
X-Gm-Message-State: AHQUAua4CliibE5oejqx0Pf4xTQFk0l39egMMB60ECqcGQno6jwhTYrZ
        ghV7hIWz1jRNcIv73JFS3hQ7kW9DdroachmjPRE=
X-Google-Smtp-Source: AHgI3IaL9HP0+JuvAUyTfm83yEuR4odudCUP4YQvLe0W0E8i4U/GQ+esV70Hu4O6BDPkYyXf6tT89EvTyL6rcYOd2xI=
X-Received: by 2002:a1f:a414:: with SMTP id n20mr14931714vke.83.1549887521466;
 Mon, 11 Feb 2019 04:18:41 -0800 (PST)
MIME-Version: 1.0
References: <1549710152-19762-1-git-send-email-ykaneko0929@gmail.com>
In-Reply-To: <1549710152-19762-1-git-send-email-ykaneko0929@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 11 Feb 2019 13:18:27 +0100
Message-ID: <CAMuHMdUyyExdtpQ+ZU59rsPw=LS-YNyAA96L-QErYd847=Ztcw@mail.gmail.com>
Subject: Re: [PATCH/RFT] pinctrl: sh-pfc: r8a77965: Add DRIF pins, groups and functions
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

On Sat, Feb 9, 2019 at 12:02 PM Yoshihiro Kaneko <ykaneko0929@gmail.com> wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>
> This patch adds DRIF{0,1,2,3} pins, groups and functions to the R8A77965
> SoC.
>
> Based on a similar patch of the R8A7796 PFC driver
> by Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>.
>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in sh-pfc-for-v5.1.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
