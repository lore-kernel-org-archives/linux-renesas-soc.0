Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:35818 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752710AbcJRItN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Oct 2016 04:49:13 -0400
Received: by mail-it0-f67.google.com with SMTP id 139so4516424itm.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Oct 2016 01:49:13 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1476740091-7011-2-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1476740091-7011-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <1476740091-7011-2-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Oct 2016 10:49:11 +0200
Message-ID: <CAMuHMdX10bsvQOx76gR_eHfVdn3pEqPG81xjhyoj43BRqWkRxg@mail.gmail.com>
Subject: Re: [PATCH 1/4] arm64: dts: renesas: r8a7796: Add FCPF and FCPV instances
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Oct 17, 2016 at 11:34 PM, Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> The FCPs handle the interface between various IP cores and memory. Add
> the instances related to the FDPs and VSP2s.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
