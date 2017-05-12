Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr0-f177.google.com ([209.85.128.177]:35360 "EHLO
        mail-wr0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757897AbdELMHD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 May 2017 08:07:03 -0400
Received: by mail-wr0-f177.google.com with SMTP id z52so43202173wrc.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 May 2017 05:07:02 -0700 (PDT)
Subject: Re: [PATCH] ravb: add wake-on-lan support via magic packet
To: =?UTF-8?Q?Niklas_S=c3=b6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
References: <20170511222735.10706-1-niklas.soderlund+renesas@ragnatech.se>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <45ae8c69-8420-eedd-7f97-ab78fe300949@cogentembedded.com>
Date: Fri, 12 May 2017 15:06:59 +0300
MIME-Version: 1.0
In-Reply-To: <20170511222735.10706-1-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 05/12/2017 01:27 AM, Niklas Söderlund wrote:

> WoL is enabled in the suspend callback by setting MagicPacket detection
> and disabling all interrupts expect MagicPacket. In the resume path the

    Except.

> driver needs to reset the hardware to rearm the WoL logic, this prevents
> the driver from simply restoring the registers and to take advantage of
> that ravb was not suspended to reduce resume time. To reset the
> hardware the driver closes the device, sets it in reset mode and reopens
> the device just like it would do in a normal suspend/resume scenario
> without WoL enabled, but it both closes and opens the device in the
> resume callback since the device needs to be reset for WoL to work.
>
> One quirk needed for WoL is that the module clock needs to be prevented
> from being switched off by Runtime PM. To keep the clock alive the
> suspend callback need to call clk_enable() directly to increase the
> usage count of the clock. Then when Runtime PM decreases the clock usage
> count it won't reach 0 and be switched off.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
[...]

Acked-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

MBR, Sergei
