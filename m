Return-Path: <SRS0=aD2s=PZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3088FC43387
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 17 Jan 2019 10:21:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 003A420851
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 17 Jan 2019 10:21:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726917AbfAQKVp (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 17 Jan 2019 05:21:45 -0500
Received: from mail-vk1-f195.google.com ([209.85.221.195]:36265 "EHLO
        mail-vk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727186AbfAQKVp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Jan 2019 05:21:45 -0500
Received: by mail-vk1-f195.google.com with SMTP id 185so2139992vkc.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Jan 2019 02:21:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2WHkQ4icCvT+0PRT2rP4FMXmllmHcuFLTjIyO9Qf7zU=;
        b=TO8OWQEzUxHM0L01XdtEQ1CWEmxbJZKVhXtlEqtrBSG/qvCI/81vTj/0ZbFJn6N7as
         evjwbDRNF1QK1GAiqCptDbImkS+hUbS4dQyRRW/2PwrgNL6N4/jD89PKb2r1iYcqmQFt
         k303APjovblA/bgKjUOH0F2UG/b0jlEJ0BjIDHOqB9kPCXy8wlQkGVzZ/n6oLQci5i0p
         LJTOkR/p+W4myFtlai15/6yyCiHSxENnxVjmRiR5y01a3etK7qlRkNv/sAOgqsKUh8z7
         1Zsd+qt5Wbz2QKgxFUxDu27RmOOA0MNc1M0FLkoalMSTUSb5dynjRAjD7HU0zTHmUykM
         lepA==
X-Gm-Message-State: AJcUukc3g4RK7yGr9kYFAd/OWOPtFTHLF0JH3VidnA+o7e8V8dXBfFqs
        2KghXLrH4LwLIyCzn2RjIXbfylt6Y1fzZNS8fVg=
X-Google-Smtp-Source: ALg8bN4BqCP259WG4oBLbWdwXsT0HkSXPFVeJvZCnfYpvxeViU1BU2kLLv+UFdVVt4LyWlRvGSPt8IyA3lS6AKSM12c=
X-Received: by 2002:a1f:2145:: with SMTP id h66mr5525861vkh.65.1547720504524;
 Thu, 17 Jan 2019 02:21:44 -0800 (PST)
MIME-Version: 1.0
References: <20190117014946.9669-1-laurent.pinchart+renesas@ideasonboard.com> <20190117014946.9669-6-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20190117014946.9669-6-laurent.pinchart+renesas@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 17 Jan 2019 11:21:32 +0100
Message-ID: <CAMuHMdWYgAnxxUud89uGWBePK6UfVt2T=gumMmzs_SF95Ap36Q@mail.gmail.com>
Subject: Re: [PATCH 5/6] arm64: dts: renesas: r8a77990: ebisu: Enable LVDS1 encoder
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On Thu, Jan 17, 2019 at 3:07 AM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> The LVDS1 encoder must supply a pixel clock to the DU for the DPAD
> output when the LVDS0 encoder is used. Enable it despite its output not
> being connected.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> @@ -443,6 +443,8 @@
>  };
>
>  &lvds1 {

Would it make sense to add a comment

    /* Must be enabled to supply a pixel clock to the DU for the DPAD
output when lvds0 is used */

also for D3?

> +       status = "okay";
> +
>         clocks = <&cpg CPG_MOD 727>,
>                  <&x13_clk>,
>                  <&extal_clk>;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
