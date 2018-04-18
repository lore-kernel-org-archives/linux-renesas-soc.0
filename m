Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:39737 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750824AbeDRUUw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Apr 2018 16:20:52 -0400
Received: by mail-lf0-f65.google.com with SMTP id p142-v6so4495535lfd.6
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Apr 2018 13:20:51 -0700 (PDT)
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a77970: fix pin I/O voltage control
 support
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <21306a59-8f20-ad08-fdc1-bcc6333c01d4@cogentembedded.com>
 <fbb024c5-4451-22ce-8f2a-660ce618c861@cogentembedded.com>
Message-ID: <0690c17c-54a9-8696-8c44-03ea73baf7cc@cogentembedded.com>
Date: Wed, 18 Apr 2018 23:20:49 +0300
MIME-Version: 1.0
In-Reply-To: <fbb024c5-4451-22ce-8f2a-660ce618c861@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 04/18/2018 11:06 PM, Sergei Shtylyov wrote:

> I've included the pin I/O voltage control into the R8A77970 PFC driver but
> it was incomplete because:
> - SH_PFC_PIN_CFG_IO_VOLTAGE pin flags weren't set properly;
> - sh_pfc_soc_info::ioctrl_regs wasn't set at all...
> 
> Fixes: b92ac66a181 ("pinctrl: sh-pfc: Add R8A77970 PFC support")

   Oops, only 11 digits... will repost!

> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
[...]

MBR, Sergei
