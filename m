Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f66.google.com ([209.85.213.66]:41657 "EHLO
        mail-vk0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731340AbeHWL7f (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 23 Aug 2018 07:59:35 -0400
Received: by mail-vk0-f66.google.com with SMTP id j14-v6so2198747vke.8
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Aug 2018 01:31:02 -0700 (PDT)
MIME-Version: 1.0
References: <1534511968-19634-1-git-send-email-uli+renesas@fpond.eu> <CAMuHMdW8DeYcf1H1Wxi+PpZ-cSrJZ8NGHyt6RWtksqTMSguKCQ@mail.gmail.com>
In-Reply-To: <CAMuHMdW8DeYcf1H1Wxi+PpZ-cSrJZ8NGHyt6RWtksqTMSguKCQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 23 Aug 2018 10:30:50 +0200
Message-ID: <CAMuHMdWYtg9pDan0gKhGFoSeQijzoxVqgwS9CfnDe+Tt5C698A@mail.gmail.com>
Subject: Re: [PATCH 0/5] H3/M3-W cpuidle support
To: uli+renesas@fpond.eu
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>, dien.pham.ry@renesas.com,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Khiem Nguyen <khiem.nguyen.xt@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Uli,

(with Khiem's address fixed (hopefully))

On Thu, Aug 23, 2018 at 10:22 AM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Fri, Aug 17, 2018 at 3:19 PM Ulrich Hecht <uli+renesas@fpond.eu> wrote:
> > This series adds CPU idle support for H3 and M3-W. It's a straight
> > up-port from the BSP.
>
> Thanks for your series!
>
> > The part that disables cpuidle for the CA53 cores on M3ULCB is a bit
> > dodgy. Is it a valid assumption that all M3ULCB boards have an ES1.0
> > SoC?
>
> Alternatively, is this something that can be handled in the kernel using
> soc_device_match()?

Given many Salvator-X boards (incl. mine) also have M3-W ES1.0, and PSCI is
involved, I have to ask: is this a hardware (M3-W ES1.0) or firmware (PSCI)
issue?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
