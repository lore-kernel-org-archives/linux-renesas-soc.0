Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f45.google.com ([209.85.215.45]:37410 "EHLO
        mail-lf0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751127AbdHaJki (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 31 Aug 2017 05:40:38 -0400
Received: by mail-lf0-f45.google.com with SMTP id y128so651886lfd.4
        for <linux-renesas-soc@vger.kernel.org>; Thu, 31 Aug 2017 02:40:37 -0700 (PDT)
Subject: Re: [PATCH 1/4] phy: rcar-gen3-usb2: check dr_mode for otg mode
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, kishon@ti.com
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <1504164672-20677-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1504164672-20677-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <3a5b6050-01c6-1f92-7d79-42b74c692e3c@cogentembedded.com>
Date: Thu, 31 Aug 2017 12:40:34 +0300
MIME-Version: 1.0
In-Reply-To: <1504164672-20677-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 8/31/2017 10:31 AM, Yoshihiro Shimoda wrote:

> The previous code assumed a channel has otg capability if a channel
> has interrupt property. But, it is not good because:
>   - Battery charging feature also needs interrupt property.
>   - Some R-Car Gen3 SoCs (e.g. R-Car D3) doesn't have OTG capability.

    Don't.

> So, this patch checks whether usb 2.0 host node has dr_mode property or
> not. If it has 'dr_mode = "otg";', this driver enables otg capability.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
[...]

MBR, Sergei
