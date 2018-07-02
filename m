Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:35321 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752562AbeGBPjn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Jul 2018 11:39:43 -0400
Received: by mail-wm0-f68.google.com with SMTP id z137-v6so9228702wmc.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 02 Jul 2018 08:39:42 -0700 (PDT)
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a77970: remove
 SH_PFC_PIN_CFG_DRIVE_STRENGTH flag
To: =?UTF-8?Q?Niklas_S=c3=b6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20180702080544.22665-1-niklas.soderlund+renesas@ragnatech.se>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <733188a3-fb5f-3727-8d2c-6d0987268246@cogentembedded.com>
Date: Mon, 2 Jul 2018 18:39:43 +0300
MIME-Version: 1.0
In-Reply-To: <20180702080544.22665-1-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 7/2/2018 11:05 AM, Niklas Söderlund wrote:

> The datasheet do not document any registers to control drive strength,
> and no drive strength registers are for this reason described for this
> SoC. The flag indicating that drive strength can be controlled are
> however set for some pins in the driver.
> 
> This leads to a NULL pointer dereference when the sh-pfc core tries to
> access the struct describing the drive strength registers, for example
> when reading the sysfs file pinconf-pins.
> 
> Fix this by removing the SH_PFC_PIN_CFG_DRIVE_STRENGTH from all pins.

    Sorry about overlooking this!

> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

[...]

MBR, Sergei
