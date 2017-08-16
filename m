Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg0-f42.google.com ([74.125.83.42]:33758 "EHLO
        mail-pg0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751082AbdHPFih (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Aug 2017 01:38:37 -0400
Received: by mail-pg0-f42.google.com with SMTP id u5so18438840pgn.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Aug 2017 22:38:37 -0700 (PDT)
Date: Wed, 16 Aug 2017 11:08:34 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Simon Horman <horms+renesas@verge.net.au>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux PM list <linux-pm@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] cpufreq: rcar: Add support for R8A7795 SoC
Message-ID: <20170816053834.GA24299@vireshk-i7>
References: <1501852680-21127-1-git-send-email-horms+renesas@verge.net.au>
 <20170807033705.GE28857@vireshk-i7>
 <CAMuHMdWVYFBOHyBxbOZ7FHu0DHW4vWR9WnxfvwP4yGQGcZf19g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWVYFBOHyBxbOZ7FHu0DHW4vWR9WnxfvwP4yGQGcZf19g@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 14-08-17, 15:36, Geert Uytterhoeven wrote:
> I'm still a bit confused about your original comment when introducing this
> file with the ever-growing table of SoCs:
> 
>     "And for new platforms we may do things differently as they are going
>      to use opp-v2 bindings."
> 
> Hence I was under the impression the growing would be mitigated by new SoCs
> using the opp-v2 bindings instead, and not needing an entry in the table.
> 
> Perhaps I have misunderstood that comment?

Not really.

I have sent two patches to take care of your concerns. Do let me know if you
have any concerns with them.

-- 
viresh
