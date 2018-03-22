Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:48604 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752356AbeCVIAD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 22 Mar 2018 04:00:03 -0400
Date: Thu, 22 Mar 2018 08:59:59 +0100
From: Simon Horman <horms@verge.net.au>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77970: Update IPMMU DS1 bit
 number
Message-ID: <20180322075959.jxyk2fsce6ygklm6@verge.net.au>
References: <152153226789.8528.13236911976628814785.sendpatchset@little-apple>
 <20180321085133.gwc2khtzgny5wnyp@verge.net.au>
 <20180321095706.k2esdpa4ap4wv2i4@verge.net.au>
 <CANqRtoQjv51xTmqahkiuMcBFWGXGy=dqHDVhRnWyfd6BWTgMPg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANqRtoQjv51xTmqahkiuMcBFWGXGy=dqHDVhRnWyfd6BWTgMPg@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Mar 22, 2018 at 03:07:49PM +0900, Magnus Damm wrote:
> Hi Simon,
> 
> On Wed, Mar 21, 2018 at 6:57 PM, Simon Horman <horms@verge.net.au> wrote:
> > On Wed, Mar 21, 2018 at 09:51:33AM +0100, Simon Horman wrote:
> >> On Tue, Mar 20, 2018 at 04:51:07PM +0900, Magnus Damm wrote:
> >> > From: Magnus Damm <damm+renesas@opensource.se>
> >> >
> >> > Judging by "R-Car-Gen3-rev0.80" IPMMU IMSSTR register documentation
> >> > for [R-Car V3M] the DS1 bit field should be bit 0.
> >> >
> >> > Update the ipmmu-main property to make it match the data sheet.
> >>
> >> Thanks, I have confirmed this. Apologies for this error.
> >>
> >> AFIK this IP block is currently unused, I wonder if it,
> >> ipmmu_mm and ipmmu_rt should have status = "disabled" added.
> >
> > Sorry, I take that back, I now see the nodes used elsewhere in
> > the same DT file.
> 
> Thanks for your help! My opinion is that for R-Car Gen3 we don't
> really need to keep any IPMMU nodes in disabled state in DT. This
> since the whitelist code in the IPMMU driver will include software
> policy handling to during runtime make sure only desired devices get
> enabled.

Agreed
