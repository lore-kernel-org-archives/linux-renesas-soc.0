Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:44855 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755662AbeASJ1I (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 Jan 2018 04:27:08 -0500
Date: Fri, 19 Jan 2018 10:26:48 +0100
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH v2 03/16] ARM: dts: r8a7790: sort subnodes of soc node
Message-ID: <20180119092647.iumaljyi5mtwa4gr@verge.net.au>
References: <20180117161717.14589-1-horms+renesas@verge.net.au>
 <20180117161717.14589-4-horms+renesas@verge.net.au>
 <CAMuHMdV65W0jAH9u3vGyrZrD3VjV_4XotFKdsNx6gVCU8nyJQw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdV65W0jAH9u3vGyrZrD3VjV_4XotFKdsNx6gVCU8nyJQw@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Jan 19, 2018 at 09:39:24AM +0100, Geert Uytterhoeven wrote:
> On Wed, Jan 17, 2018 at 5:17 PM, Simon Horman
> <horms+renesas@verge.net.au> wrote:
> > Sort the subnodes of the soc node to improve maintainability.
> > The sort key is the addresss on the bus with instances of the same
> > IP block grouped together.
> >
> > This patch should not introduce any functional change.
> >
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> The sort order for the various SCIF variants is still a bit odd:
> 
>         scifa0: serial@e6c40000 {
>         scifa1: serial@e6c50000 {
>         scifa2: serial@e6c60000 {
>         scifb0: serial@e6c20000 {
>         scifb1: serial@e6c30000 {
>         scifb2: serial@e6ce0000 {
>         scif0: serial@e6e60000 {
>         scif1: serial@e6e68000 {
>         scif2: serial@e6e56000 {
>         hscif0: serial@e62c0000 {
>         hscif1: serial@e62c8000 {
> 
> (hscif0 has the lowest address)
> 
> But hey, SCIF is special ;-)

Right, I decided to keep the SCIF ordering as is.
My preference is to address this later if we come up with a better scheme.
