Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f179.google.com ([209.85.216.179]:36689 "EHLO
        mail-qt0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755541AbeAHHhV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Jan 2018 02:37:21 -0500
MIME-Version: 1.0
In-Reply-To: <20180105224647.42262-3-chris.brandt@renesas.com>
References: <20180105224647.42262-1-chris.brandt@renesas.com> <20180105224647.42262-3-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 8 Jan 2018 08:37:20 +0100
Message-ID: <CAMuHMdUrMebBhhxFZ07O1dk5xkm9EqhRmvhT0yoJdCCG=9pNSQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] dt-bindings: usb: renesas_usbhs: Add support for RZ/A1
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        USB list <linux-usb@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        devicetree@vger.kernel.org,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Chris,

On Fri, Jan 5, 2018 at 11:46 PM, Chris Brandt <chris.brandt@renesas.com> wrote:
> Document support for RZ/A1 SoCs
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v3:
>  * Removed "renesas,usbhs-r7s72100"

Please don't, cfr. my reply to the cover letter.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
