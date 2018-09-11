Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua1-f68.google.com ([209.85.222.68]:41233 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727034AbeIKTMU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Sep 2018 15:12:20 -0400
MIME-Version: 1.0
References: <fb4eb097-40aa-82df-68c7-9b727c858a8b@cogentembedded.com>
 <a3846f74-78b4-bf4a-9231-961c5b16091c@cogentembedded.com> <20180910092305.4nqdm43ugvuay52o@verge.net.au>
 <298e7c6a-582f-d281-2f9f-003335b21b4a@cogentembedded.com> <20180911133617.cz3hgexltc5qy5f3@verge.net.au>
In-Reply-To: <20180911133617.cz3hgexltc5qy5f3@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Sep 2018 16:12:37 +0200
Message-ID: <CAMuHMdXPUw38nqb112Ve6aNSSFOS86BPmjOGLuhHUkowdWWERA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a779{7|8}0: add TMU support
To: Simon Horman <horms@verge.net.au>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Sep 11, 2018 at 3:36 PM Simon Horman <horms@verge.net.au> wrote:
> On Mon, Sep 10, 2018 at 03:04:56PM +0300, Sergei Shtylyov wrote:
> > On 09/10/2018 12:23 PM, Simon Horman wrote:
> >
> > >> Describe TMUs in the R8A779{7|8}0 device trees.
> > >>
> > >> Based on the original (and large) patches by Vladimir Barinov.
> > >>
> > >> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> > >> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

> Lets go with no 4th IRQ anywhere :)
> Could you send an updated patch?

Please consider my comments on the bindings first:
https://patchwork.kernel.org/patch/10592517/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
