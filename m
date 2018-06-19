Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f66.google.com ([209.85.213.66]:37042 "EHLO
        mail-vk0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750961AbeFSHR0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Jun 2018 03:17:26 -0400
Received: by mail-vk0-f66.google.com with SMTP id w8-v6so11077668vkh.4
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Jun 2018 00:17:26 -0700 (PDT)
MIME-Version: 1.0
References: <1529055605-29942-1-git-send-email-ulrich.hecht+renesas@gmail.com>
 <10848514.jCgBdBqkyy@avalon> <CAMuHMdVM2O0_ygAe=J-7yAGnANDh7ez4M8bst16B5CSe_Sj2Ow@mail.gmail.com>
 <6565802.4mR889inCT@avalon>
In-Reply-To: <6565802.4mR889inCT@avalon>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 19 Jun 2018 09:17:14 +0200
Message-ID: <CAMuHMdXb49KTMHjfrht2H2yZxx5ieiF=OYWtLHVy32_pRPAeLg@mail.gmail.com>
Subject: Re: [RFC] ARM: rmobile: create DT memory nodes for R8A7795 3.0 and newer
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Marek Vasut <marek.vasut@gmail.com>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        U-Boot Mailing List <u-boot@lists.denx.de>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        takuya.sakata.wz@bp.renesas.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

On Tue, Jun 19, 2018 at 9:10 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Tuesday, 19 June 2018 09:58:59 EEST Geert Uytterhoeven wrote:
> > On Tue, Jun 19, 2018 at 4:15 AM Laurent Pinchart wrote:
> > > On Sunday, 17 June 2018 03:08:02 EEST Marek Vasut wrote:
> > >> On 06/16/2018 05:44 PM, Laurent Pinchart wrote:
> > >>> On Saturday, 16 June 2018 02:42:30 EEST Marek Vasut wrote:
> > >>>> On 06/16/2018 01:21 AM, Laurent Pinchart wrote:
> > >>>>> On Friday, 15 June 2018 15:00:31 EEST Marek Vasut wrote:
> > >>>>>> On 06/15/2018 01:43 PM, Marek Vasut wrote:
>
> [snip]
>
> > >>>>>>>>> Obvious design question is -- since you're adding new SMC call
> > >>>>>>>>> anyway, can't the call just return the memory layout table
> > >>>>>>>>> itself, so that it won't be duplicated both in U-Boot and ATF ?
> > >>>>>>>>
> > >>>>>>>> My gut feeling was to go with the smallest interface possible.
> > >>>>>>>
> > >>>>>>> But this doesn't scale. The API here uses some ad-hoc constants to
> > >>>>>>> identify memory layout tables which have to be encoded both in ATF
> > >>>>>>> and U-Boot, both of which must be kept in sync.
> > >>>>>>>
> > >>>>>>> The ATF already has those memory layout tables, it's only a matter
> > >>>>>>> of passing them to U-Boot. If you do just that, the ad-hoc
> > >>>>>>> constants and encoding of tables into U-Boot goes away and in fact
> > >>>>>>> simplifies the design.
> > >>>>>>>
> > >>>>>>> Yet, I have to wonder if ATF doesn't already contain some sort of
> > >>>>>>> standard SMC call to get memory topology. It surprises me that it
> > >>>>>>> wouldn't.
> > >>>>>>
> > >>>>>> In fact, Laurent (CCed) was solving some similar issue with lossy
> > >>>>>> decomp and I think this involved some passing of memory layout
> > >>>>>> information from ATF to U-Boot too, or am I mistaken ?
> > >>>>>
> > >>>>> That's correct, ATF stores information about the memory layout at a
> > >>>>> fixed address in system memory, and U-Boot can read it.
> > >>>>
> > >>>> Well, that sounds good ! Maybe we can avoid adding SMC call
> > >>>> altogether then? :)
> > >>>
> > >>> I'd prefer that, yes.
> > >>>
> > >>> Let's not duplicate the mechanism used to pass FCNL information from
> > >>> ATF to U- Boot, but instead create a data table format that can store
> > >>> all the information we need, in an easily extensible way.
> > >>>
> > >>> To see how the mechanism is implemented for FCNL, search for 47FD7000
> > >>> in the Renesas ATF sources
> > >>> (git://github.com/renesas-rcar/arm-trusted-firmware.git).
> > >>
> > >> For everyone involved, can you explain what FCNL is ? ;-)
> > >
> > > FCNL is Frame Compression Near Lossless. It's a way to reduce memory
> > > bandwidth by transparent compression and decompression of video frames.
> > > Compression is handled by an IP core called FCP, and decompression is
> > > handled by the DRAM controller. ATF programs the DRAM controller with
> > > ranges of memory addresses that will be dynamically decompressed. The
> > > registers containing those ranges are accessible in secure mode only, so
> > > neither U-Boot nor Linux can read them. That's why ATF has to pass the
> > > information to U-Boot, in order to add the ranges as reserved memory in
> > > DT.
> > >
> > >> Any yes, I agree this sounds good. I had a discussion on the U-Boot IRC
> > >> about passing the memory configuration around and the result is
> > >> basically the same -- pass a table from ATF to U-Boot. If there's
> > >> already something, great.
> >
> > Pass a "table"? Or an FDT containing the /memory nodes?
> > The latter allows for easier future extension.
>
> ATF passes a table to U-Boot, and U-Boot then updates the FDT accordingly
> before starting Linux.

I know it passes a table. A table is very easy to parse, but complicates future
extension.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
