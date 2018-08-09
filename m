Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f194.google.com ([209.85.217.194]:35440 "EHLO
        mail-ua0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729931AbeHILVY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Aug 2018 07:21:24 -0400
Received: by mail-ua0-f194.google.com with SMTP id q12-v6so5481727ual.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Aug 2018 01:57:33 -0700 (PDT)
MIME-Version: 1.0
References: <TYAPR01MB206446052847E74261A2F116DA250@TYAPR01MB2064.jpnprd01.prod.outlook.com>
In-Reply-To: <TYAPR01MB206446052847E74261A2F116DA250@TYAPR01MB2064.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 9 Aug 2018 10:57:20 +0200
Message-ID: <CAMuHMdVG0hpW+0839esXCnAuYpXL754+8ffzXsXETS=cKBMMYg@mail.gmail.com>
Subject: Re: [V2]Fix RCAR-V3H SoC wrong IPSR9/10 registers
To: adnan.ali@bp.renesas.com
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        dmitry.shifrin@cogentembedded.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Adnan,

On Thu, Aug 9, 2018 at 10:52 AM Adnan Ali <adnan.ali@bp.renesas.com> wrote:
> Please review this V2 patch. This patch belongs to branch from elinux.org for V3H condor.

Still sent as an attachment?
And it is still not applicable to upstream, as the bug is not present
in upstream.

I'm sorry, I can only take patches for upstream.
I do not maintain any source tree at elinux.org (which tree? AFAIK
there's no git repo
at elinux.org?).

Thanks for your understanding!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
