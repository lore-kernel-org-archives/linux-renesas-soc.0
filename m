Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:33204 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751464AbdEOMrv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 May 2017 08:47:51 -0400
Received: by mail-it0-f68.google.com with SMTP id l145so10978537ita.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 May 2017 05:47:50 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <11510386.Oacl68du7i@avalon>
References: <1494850964-7246-1-git-send-email-geert+renesas@glider.be>
 <1494850964-7246-3-git-send-email-geert+renesas@glider.be> <11510386.Oacl68du7i@avalon>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 15 May 2017 14:47:49 +0200
Message-ID: <CAMuHMdWaJdcf0vJVjoAtg=4J1MaC07bHReE1ZdhP8XMVNsv8bQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: r8a7795: salvator-x: Move HDMI0 to common
 Salvator-X board support
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

On Mon, May 15, 2017 at 2:29 PM, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Monday 15 May 2017 14:22:44 Geert Uytterhoeven wrote:
>> The extensions to the first HDMI device and connector nodes apply to
>> Salvator-X boards equipped with either an R-Car H3 or M3-W SoC.
>> Hence move them from the R-Car H3 specific board file to the common
>> Salvator-X board file.
>>
>> The second HDMI device and connector nodes are left as-is, as R-Car M3-W
>> has only one HDMI output.
>>
>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> I wonder whether this is really worth it, given that the number of HDMI ports
> is different between the two boards. I actually had similar patches in my tree
> and then decided to drop them, as I found that splitting the H3 Salvator-X
> HDMI ports salvator-x.dtsi and r8a7795-salvator-x.dts was getting pretty
> confusing.

I moved them because ES2.0 support required adding one other copy.
When M3-W gets DU/HDMI support, we would need a third copy.

I suppose H3ULCB and M3ULCB will receive DU/HDMI support, too.
H3ULCB is available with H3 ES1.1 and ES2.0, so that means 3 more
copies (instead of 1 in ulcb.dtsi).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
