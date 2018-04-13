Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f46.google.com ([209.85.215.46]:36941 "EHLO
        mail-lf0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750980AbeDMSbw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Apr 2018 14:31:52 -0400
Received: by mail-lf0-f46.google.com with SMTP id m200-v6so13881019lfm.4
        for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Apr 2018 11:31:51 -0700 (PDT)
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a77970: add pin I/O voltage control
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <21306a59-8f20-ad08-fdc1-bcc6333c01d4@cogentembedded.com>
 <1c6cc202-5f20-4304-11ae-79ea0c559457@cogentembedded.com>
Message-ID: <dd2d0622-d39c-6f48-eed4-39fac456638d@cogentembedded.com>
Date: Fri, 13 Apr 2018 21:31:48 +0300
MIME-Version: 1.0
In-Reply-To: <1c6cc202-5f20-4304-11ae-79ea0c559457@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 04/13/2018 09:29 PM, Sergei Shtylyov wrote:

> Add the pin I/O voltage level control to the R8A77980 PFC driver. 
> 
> Loosely based on the original (and large) patch by Vladimir Barinov.
> 
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

   Oops, forgot to mention that the patch was against the 'sj-pfc' branch
of Geert's 'renesas-drivers.git' repo...

[...]

MBR, Sergei
