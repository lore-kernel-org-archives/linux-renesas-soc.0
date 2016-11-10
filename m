Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f66.google.com ([209.85.213.66]:34382 "EHLO
        mail-vk0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753182AbcKJD4k (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Nov 2016 22:56:40 -0500
MIME-Version: 1.0
In-Reply-To: <20161109172813.GA1545@katana>
References: <20161106202032.5227-1-wsa+renesas@sang-engineering.com>
 <20161109084406.GA22213@verge.net.au> <20161109172813.GA1545@katana>
From: Magnus Damm <magnus.damm@gmail.com>
Date: Thu, 10 Nov 2016 12:56:38 +0900
Message-ID: <CANqRtoRwSh602rjbHA2qo=XHyimpyyi_T=0sh2A4NOfzzVB+oQ@mail.gmail.com>
Subject: Re: [PATCH v4 00/14] ARM: dts: r8a779x: use demuxer for I2C
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Simon Horman <horms@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux-I2C <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

On Thu, Nov 10, 2016 at 2:28 AM, Wolfram Sang <wsa@the-dreams.de> wrote:
>
>> ARM: dts: lager: use demuxer for IIC3/I2C3
>
> I think the sanest solution is to drop this patch forever. The WARN from
> the regulator core is sparse in describing the problem yet it is
> correct: The regulator is needed, by the CPU! :) And this will probably
> be the smallest problem when trying to demux the bus which is used to
> handle all DVFS operations. Let's stick to IIC3 here, I'd say. Gen3 even
> has this one IIC instance for exactly the DVFS purpose.

I think postponing merge of patches is one thing but I don't think
dropping them forever is a long term solution. I think we should have
a plan how to describe the hardware as-is in DT and work towards
having software support for it.

My hope has always been that it would be possible to switch I2C master
during run time without deregister/register of all the slave devices.
I do realise much work will be needed to make it happen, but from
hardware point of view it must be possible to switch I2C master
transparently between the messages on the bus.

Thanks,

/ magnus
