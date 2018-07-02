Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:34257 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751443AbeGBPfY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Jul 2018 11:35:24 -0400
Received: by mail-wm0-f67.google.com with SMTP id l15-v6so8104612wmc.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 02 Jul 2018 08:35:24 -0700 (PDT)
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a77970: remove
 SH_PFC_PIN_CFG_DRIVE_STRENGTH flag
To: Geert Uytterhoeven <geert@linux-m68k.org>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
References: <20180702080544.22665-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdXV5BOoPCey3xyyzeuLSZeiH0XaaVo9sSzNkFrutf8sOA@mail.gmail.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <03219838-6ed9-0404-10b0-ad5bcdba10f5@cogentembedded.com>
Date: Mon, 2 Jul 2018 18:35:24 +0300
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXV5BOoPCey3xyyzeuLSZeiH0XaaVo9sSzNkFrutf8sOA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 7/2/2018 4:03 PM, Geert Uytterhoeven wrote:

> CC Sergei,
> 
> Thanks for your patch!
> 
> On Mon, Jul 2, 2018 at 10:06 AM Niklas Söderlund
> <niklas.soderlund+renesas@ragnatech.se> wrote:
>> The datasheet do not document any registers to control drive strength,
> 
> does
> 
>> and no drive strength registers are for this reason described for this
>> SoC. The flag indicating that drive strength can be controlled are
> 
> flags
> 
>> however set for some pins in the driver.
>>
>> This leads to a NULL pointer dereference when the sh-pfc core tries to
>> access the struct describing the drive strength registers, for example
>> when reading the sysfs file pinconf-pins.
>>
>> Fix this by removing the SH_PFC_PIN_CFG_DRIVE_STRENGTH from all pins.
>>
>> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> I'll wait a bit for Sergei's response.
> Perhaps his version of the datasheet does document drive strength registers?

    No, I have v1.00 which doesn't tell about drive control on V3M indeed.

MBR, Sergei
