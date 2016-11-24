Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wj0-f195.google.com ([209.85.210.195]:34795 "EHLO
        mail-wj0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S941111AbcKXN0U (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Nov 2016 08:26:20 -0500
MIME-Version: 1.0
In-Reply-To: <1479993552-10518-1-git-send-email-horms+renesas@verge.net.au>
References: <1479993552-10518-1-git-send-email-horms+renesas@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 24 Nov 2016 14:26:12 +0100
Message-ID: <CAMuHMdXwPJ3=jBz3-J7j-gGYtM_Oi7ZDdkq6M0s39aAByzpEhQ@mail.gmail.com>
Subject: Re: [PATCH linux-pwm/for-next] pwm: renesas-tpu: remove support for sh7372
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Thierry Reding <thierry.reding@gmail.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux PWM List <linux-pwm@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Nov 24, 2016 at 2:19 PM, Simon Horman
<horms+renesas@verge.net.au> wrote:
> Remove support for the SH7372 (SH-Mobile AP4) from the renesas-tpu driver.
>
> Commit edf4100906044225 ("ARM: shmobile: sh7372 dtsi: Remove Legacy file")
> removes this SoC from the kernel in v4.1.
>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
