Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f196.google.com ([209.85.216.196]:35387 "EHLO
        mail-qt0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751845AbeBZPuY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Feb 2018 10:50:24 -0500
MIME-Version: 1.0
In-Reply-To: <9fc53eac-5513-00be-2430-ceb4b6f57e9b@cogentembedded.com>
References: <9fc53eac-5513-00be-2430-ceb4b6f57e9b@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Feb 2018 16:50:22 +0100
Message-ID: <CAMuHMdV+AUaHue8pubFk_vuU9VMbKHjrwXrSOP_KA2k93j5V6A@mail.gmail.com>
Subject: Re: [PATCH net-next] sh_eth: fix TSU init on SH7734/R8A7740
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Sergei,

On Sat, Feb 24, 2018 at 8:41 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> It appears that the single port Ether controllers having TSU (like SH7734/
> R8A7740) need the same kind of treating in sh_eth_tsu_init() as R7S72100
> currently has -- they also don't have the TSU registers related e.g. to
> passing the frames between ports. Add the 'sh_eth_cpu_data::dual_port'
> flag and use it as a new criterion for taking a "short path" in the TSU
> init sequence in order to avoid writing to the non-existant registers...
>
> Fixes: f0e81fecd4f8 ("net: sh_eth: Add support SH7734")
> Fixes: 73a0d907301e ("net: sh_eth: add support R8A7740")
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Thanks for your patch!

Ethernet (nfsroot and WoL) is still working fine on r8a7740/armadillo,
which has a single "gether" port.

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
