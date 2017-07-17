Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f193.google.com ([209.85.223.193]:35116 "EHLO
        mail-io0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751315AbdGQIHf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Jul 2017 04:07:35 -0400
Received: by mail-io0-f193.google.com with SMTP id 84so6941707iop.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Jul 2017 01:07:35 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170713121714.30789-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20170713121714.30789-1-laurent.pinchart+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Jul 2017 10:07:33 +0200
Message-ID: <CAMuHMdUaZZc+WXhmEif6kBgAV7jfREtk78nn67W3=SwvkVxhPg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: salvator-common: Remove extra LVDS
 port label
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Jul 13, 2017 at 2:17 PM, Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> The DU LVDS output is on port 3 on R8A7795 but on port 2 on R8A7796. The
> lvds_connector label thus can't be defined in salvator-common.dtsi,
> common to the two SoCs.
>
> The lvds_connector label is meant for convience to be referenced from
> panel device tree files, such as r8a77xx-aa104xd12-panel.dtsi or
> r8a77xx-aa121td01-panel.dtsi.  As those files are not included in any
> device tree source, and the label never used elsewhere, we can simply
> remove it. Out-of-tree patches that include panel device tree files can
> then add a
>
>         #define lvds_connector du_out_lvds0
>
> before including the panel device tree file.
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
