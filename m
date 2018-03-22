Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f43.google.com ([74.125.82.43]:40575 "EHLO
        mail-wm0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752004AbeCVGHv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 22 Mar 2018 02:07:51 -0400
Received: by mail-wm0-f43.google.com with SMTP id t6so13849153wmt.5
        for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Mar 2018 23:07:50 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180321095706.k2esdpa4ap4wv2i4@verge.net.au>
References: <152153226789.8528.13236911976628814785.sendpatchset@little-apple>
 <20180321085133.gwc2khtzgny5wnyp@verge.net.au> <20180321095706.k2esdpa4ap4wv2i4@verge.net.au>
From: Magnus Damm <magnus.damm@gmail.com>
Date: Thu, 22 Mar 2018 15:07:49 +0900
Message-ID: <CANqRtoQjv51xTmqahkiuMcBFWGXGy=dqHDVhRnWyfd6BWTgMPg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77970: Update IPMMU DS1 bit number
To: Simon Horman <horms@verge.net.au>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Wed, Mar 21, 2018 at 6:57 PM, Simon Horman <horms@verge.net.au> wrote:
> On Wed, Mar 21, 2018 at 09:51:33AM +0100, Simon Horman wrote:
>> On Tue, Mar 20, 2018 at 04:51:07PM +0900, Magnus Damm wrote:
>> > From: Magnus Damm <damm+renesas@opensource.se>
>> >
>> > Judging by "R-Car-Gen3-rev0.80" IPMMU IMSSTR register documentation
>> > for [R-Car V3M] the DS1 bit field should be bit 0.
>> >
>> > Update the ipmmu-main property to make it match the data sheet.
>>
>> Thanks, I have confirmed this. Apologies for this error.
>>
>> AFIK this IP block is currently unused, I wonder if it,
>> ipmmu_mm and ipmmu_rt should have status = "disabled" added.
>
> Sorry, I take that back, I now see the nodes used elsewhere in
> the same DT file.

Thanks for your help! My opinion is that for R-Car Gen3 we don't
really need to keep any IPMMU nodes in disabled state in DT. This
since the whitelist code in the IPMMU driver will include software
policy handling to during runtime make sure only desired devices get
enabled.

Cheers,

/ magnus
