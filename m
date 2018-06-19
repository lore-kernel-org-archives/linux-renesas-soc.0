Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr0-f182.google.com ([209.85.128.182]:42557 "EHLO
        mail-wr0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755524AbeFSGoJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Jun 2018 02:44:09 -0400
Received: by mail-wr0-f182.google.com with SMTP id w10-v6so19242523wrk.9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 18 Jun 2018 23:44:08 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <2538185.ecTHDDYmKt@avalon>
References: <1529055605-29942-1-git-send-email-ulrich.hecht+renesas@gmail.com>
 <10848514.jCgBdBqkyy@avalon> <CANqRtoQZTZ_34yzpT0+dpM1gu6gmPP-QAhdwgRXwoWeVOpdeaA@mail.gmail.com>
 <2538185.ecTHDDYmKt@avalon>
From: Magnus Damm <magnus.damm@gmail.com>
Date: Tue, 19 Jun 2018 15:44:07 +0900
Message-ID: <CANqRtoR5FpcMQ7B7SpdTALuTwqtQCR+2mUkhzmfUgMd5CPPChw@mail.gmail.com>
Subject: Re: [RFC] ARM: rmobile: create DT memory nodes for R8A7795 3.0 and newer
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Marek Vasut <marek.vasut@gmail.com>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        shimoda <yoshihiro.shimoda.uh@renesas.com>,
        takuya.sakata.wz@bp.renesas.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

[dropped u-boot list]

On Tue, Jun 19, 2018 at 2:56 PM, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> Hi Magnus,
>
> On Tuesday, 19 June 2018 08:43:31 EEST Magnus Damm wrote:
>> On Tue, Jun 19, 2018 at 11:15 AM, Laurent Pinchart wrote:
>> > On Sunday, 17 June 2018 03:08:02 EEST Marek Vasut wrote:
>> >> On 06/16/2018 05:44 PM, Laurent Pinchart wrote:
>> >>> On Saturday, 16 June 2018 02:42:30 EEST Marek Vasut wrote:
>> >>>> On 06/16/2018 01:21 AM, Laurent Pinchart wrote:
>> >>>>> On Friday, 15 June 2018 15:00:31 EEST Marek Vasut wrote:
>> >>>>>> On 06/15/2018 01:43 PM, Marek Vasut wrote:
>
> [snip]
>
>> >>>>>>> Yet, I have to wonder if ATF doesn't already contain some sort of
>> >>>>>>> standard SMC call to get memory topology. It surprises me that it
>> >>>>>>> wouldn't.
>> >>>>>>
>> >>>>>> In fact, Laurent (CCed) was solving some similar issue with lossy
>> >>>>>> decomp and I think this involved some passing of memory layout
>> >>>>>> information from ATF to U-Boot too, or am I mistaken ?
>> >>>>>
>> >>>>> That's correct, ATF stores information about the memory layout at a
>> >>>>> fixed address in system memory, and U-Boot can read it.
>> >>>>
>> >>>> Well, that sounds good ! Maybe we can avoid adding SMC call altogether
>> >>>> then? :)
>> >>>
>> >>> I'd prefer that, yes.
>> >>>
>> >>> Let's not duplicate the mechanism used to pass FCNL information from
>> >>> ATF to U- Boot, but instead create a data table format that can store
>> >>> all the information we need, in an easily extensible way.
>> >>>
>> >>> To see how the mechanism is implemented for FCNL, search for 47FD7000
>> >>> in the Renesas ATF sources
>> >>> (git://github.com/renesas-rcar/arm-trusted-firmware.git).
>> >>
>> >> For everyone involved, can you explain what FCNL is ? ;-)
>> >
>> > FCNL is Frame Compression Near Lossless. It's a way to reduce memory
>> > bandwidth by transparent compression and decompression of video frames.
>> > Compression is handled by an IP core called FCP, and decompression is
>> > handled by the DRAM controller. ATF programs the DRAM controller with
>> > ranges of memory addresses that will be dynamically decompressed. The
>> > registers containing those ranges are accessible in secure mode only, so
>> > neither U-Boot nor Linux can read them. That's why ATF has to pass the
>> > information to U-Boot, in order to add the ranges as reserved memory in
>> > DT.
>>
>> Thanks for the clarification. I wonder how much of the split between
>> ATF and "the rest" can be adjusted. It smells like just a software
>> architecture policy, my gut feeling is that LIFEC can be programmed to
>> adjust the assignment between secure side and "regular". At least it
>> can do so for a wide range of bus masters. However if this is the case
>> for FCNL remains to be seen.
>>
>> As a side note, for FCNL I personally would prefer a more dynamic
>> solution where we manage physically contiguous ranges from Linux
>> during run time instead of relying of statically setup windows.
>
> So would I, but whether we can be allowed to access those registers from Linux
> isn't my decision :-/

I suspect the physical ranges programmed in the DRAM controller for
decompression purpose may be ranges in higher memory that are aliases
to actual physical memory. So if we would create statically aliased
ranges of the entire physical memory for decompression purpose then
inside Linux we can simply do a translation to these aliases instead
of actual physical memory at map/unmap time. This way you would get
both statically setup tables in ATF and dynamic operation inside
Linux.

Lets discuss this more when we meet tomorrow.

Cheers,

/ magnus
