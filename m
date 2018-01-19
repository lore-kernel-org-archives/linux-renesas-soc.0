Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f181.google.com ([209.85.216.181]:43163 "EHLO
        mail-qt0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755112AbeASIjZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 Jan 2018 03:39:25 -0500
Received: by mail-qt0-f181.google.com with SMTP id s3so2052217qtb.10
        for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Jan 2018 00:39:25 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20180117161717.14589-4-horms+renesas@verge.net.au>
References: <20180117161717.14589-1-horms+renesas@verge.net.au> <20180117161717.14589-4-horms+renesas@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 19 Jan 2018 09:39:24 +0100
Message-ID: <CAMuHMdV65W0jAH9u3vGyrZrD3VjV_4XotFKdsNx6gVCU8nyJQw@mail.gmail.com>
Subject: Re: [PATCH v2 03/16] ARM: dts: r8a7790: sort subnodes of soc node
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Jan 17, 2018 at 5:17 PM, Simon Horman
<horms+renesas@verge.net.au> wrote:
> Sort the subnodes of the soc node to improve maintainability.
> The sort key is the addresss on the bus with instances of the same
> IP block grouped together.
>
> This patch should not introduce any functional change.
>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

The sort order for the various SCIF variants is still a bit odd:

        scifa0: serial@e6c40000 {
        scifa1: serial@e6c50000 {
        scifa2: serial@e6c60000 {
        scifb0: serial@e6c20000 {
        scifb1: serial@e6c30000 {
        scifb2: serial@e6ce0000 {
        scif0: serial@e6e60000 {
        scif1: serial@e6e68000 {
        scif2: serial@e6e56000 {
        hscif0: serial@e62c0000 {
        hscif1: serial@e62c8000 {

(hscif0 has the lowest address)

But hey, SCIF is special ;-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
