Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f194.google.com ([209.85.217.194]:45511 "EHLO
        mail-ua0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932312AbeFFI6G (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Jun 2018 04:58:06 -0400
MIME-Version: 1.0
In-Reply-To: <20180606085218.5ug5moky75pzlrim@verge.net.au>
References: <1528211115-12334-1-git-send-email-geert+renesas@glider.be> <20180606085218.5ug5moky75pzlrim@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 Jun 2018 10:58:04 +0200
Message-ID: <CAMuHMdWxKaNM21d1_YfX25CkbXzGfw1C-12MjMKNsn=Vn8N6yA@mail.gmail.com>
Subject: Re: [PATCH] soc: renesas: rcar-sysc: Make PM domain initialization
 more robust
To: Simon Horman <horms@verge.net.au>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux PM list <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Wed, Jun 6, 2018 at 10:52 AM, Simon Horman <horms@verge.net.au> wrote:
> On Tue, Jun 05, 2018 at 05:05:15PM +0200, Geert Uytterhoeven wrote:
>> The quirk for R-Car E3 ES1.0 added in commit 086b399965a7ee7e ("soc:
>> renesas: r8a77990-sysc: Add workaround for 3DG-{A,B}") makes the 3DG-A
>> PM domain a subdomain of the 3DG-B PM domain.  However, registering
>> 3DG-A with its parent fails silently, as the 3DG-B PM domain hasn't been
>> registered yet, and such failures are never reported.
>>
>> Fix this by:
>>   1. Splitting PM Domain initialization in two steps, so all PM domains
>>      are registered before any child-parent links are established,
>>   2. Reporting any failures in establishing child-parent relations.
>>
>> Check for and report pm_genpd_init() failures, too, as that function
>> gained a return value in commit 7eb231c337e00735 ("PM / Domains: Convert
>> pm_genpd_init() to return an error code").
>>
>> Fixes: 086b399965a7ee7e ("soc: renesas: r8a77990-sysc: Add workaround for 3DG-{A,B}")
>
> That makes this a fix for v4.18, right?

Correct.

>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> This looks fine to me but I will wait to see if there are other reviews
> before applying.

Let's wait for feedback from Shimoda-san. Perpaps the quirk did rely on
the buggy behavior.

> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
