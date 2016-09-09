Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f44.google.com ([209.85.215.44]:35333 "EHLO
        mail-lf0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753724AbcIILrm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Sep 2016 07:47:42 -0400
Received: by mail-lf0-f44.google.com with SMTP id l131so42108697lfl.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 09 Sep 2016 04:47:41 -0700 (PDT)
Subject: Re: [PATCH 7/8] clocksource: Kconfig: Modify CMT config support 64bit
To: bd-phuc@jinso.co.jp, daniel.lezcano@linaro.org, tglx@linutronix.de
References: <1473421394-9745-1-git-send-email-bd-phuc@jinso.co.jp>
 <1473421394-9745-8-git-send-email-bd-phuc@jinso.co.jp>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sh@vger.kernel.org, geert+renesas@glider.be,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@vger.kernel.org,
        laurent.pinchart+renesas@ideasonboard.com, magnus.damm@gmail.com,
        horms@verge.net.au, kuninori.morimoto.gx@renesas.com,
        yoshihiro.shimoda.uh@renesas.com, ryusuke.sakato.bx@renesas.com,
        h-inayoshi@jinso.co.jp, cm-hiep@jinso.co.jp, nv-dung@jinso.co.jp
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <9b18bc0e-3447-6ab2-3c28-54e54a19dc6f@cogentembedded.com>
Date: Fri, 9 Sep 2016 14:47:37 +0300
MIME-Version: 1.0
In-Reply-To: <1473421394-9745-8-git-send-email-bd-phuc@jinso.co.jp>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 9/9/2016 2:43 PM, bd-phuc@jinso.co.jp wrote:

> From: Bui Duc Phuc <bd-phuc@jinso.co.jp>
>
> Modify CMT config to support 64bit
>
> Signed-off-by: Bui Duc Phuc <bd-phuc@jinso.co.jp>
> ---
>  drivers/clocksource/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
> index 5677886..62c2bcb 100644
> --- a/drivers/clocksource/Kconfig
> +++ b/drivers/clocksource/Kconfig
> @@ -408,7 +408,7 @@ config SYS_SUPPORTS_EM_STI
>          bool
>
>  config SH_TIMER_CMT
> -	bool "Renesas CMT timer driver" if COMPILE_TEST
> +	bool "Renesas CMT timer driver" if ( ARM64 || COMPILE_TEST )

    Parens not needed and the spaces after/before them even less so.

[...]

MBR, Sergei
