Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-yw0-f195.google.com ([209.85.161.195]:35295 "EHLO
        mail-yw0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755719AbcJXKN6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Oct 2016 06:13:58 -0400
Received: by mail-yw0-f195.google.com with SMTP id t193so8449829ywc.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Oct 2016 03:13:58 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1477135746-7144-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1477135746-7144-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Oct 2016 12:13:57 +0200
Message-ID: <CAMuHMdV2jNwJaqQOZvUSqYWAjxohUWkom6t6v1+GO_TOdjzFSA@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] R-Car M3-W: Add FCP, VSP and DU clocks
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

On Sat, Oct 22, 2016 at 1:29 PM, Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> This patch series adds all the r8a7796 FCP, VSP and DU clocks. This includes
> not only all the clocks required for display, but also the FCPC, FCPF, VSPB
> and VSPI0 clocks to cover all the FCP and VSP instances.
>
> Compared to v2 parent clocks have been updated to the latest information
> received from Renesas and all of them match the latest BSP. Geert, I believe
> the patches are ready to be queued for v4.10.

Thank you, I've updated clk-renesas-for-v4.10.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
